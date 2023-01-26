---
title: Webhooks
---

## Introduction

Webhooks allow you to trigger an HTTP request when a pact is changed, a pact is published, or a verification is published. The most common use case for webhooks is to trigger a provider build every time a pact changes, and to trigger a consumer build every time a verification is published.

Webhooks can be used in conjunction with the [can-i-deploy](/pact_broker/can_i_deploy) tool \(a CLI that allows you to easily check the verification status of your pacts\), to allow you to fully automate the CI/CD process for all the applications that use the Pact Broker, ensuring both sides of the contract are fulfilled before deploying.

## New to Pact?

If you're reading this page and you're not sure what you're doing, what you probably need to do is to create a webhook that triggers a provider verification build when a pact is published with new content. How this works is described below in the [When the consumer makes a change](#when-the-consumer-makes-a-change) section. If you are using PactFlow, you can create a webhook through the UI. If you are using the OSS Pact Broker, using the [create-webhook](https://docs.pact.io/pact_broker/client_cli/readme#create-webhook) command from the Pact Broker CLI is the easiest approach. You'll find a library of commonly used webhook templates for many of the popular CI systems [here](/pact_broker/webhooks/template_library).

## Events

### The 'contract content changed' event

This event is generally used to trigger a build of the provider when a pact changes. It has been superseeded by the `contract_requiring_verification_published` event from version 2.82.0.

The broker uses the following logic to determine if a pact has changed:

* If the relevant consumer version has any tags, then for each tag, check if the content is different from the previous latest version for that tag. It is 'changed' if any of the checks are true. One side effect of this is that brand new tags will trigger a pact changed event, even if the content is the same as a previous version.
* If the relevant consumer version has no tags, then check if the content has changed since the previous latest version.

### The 'contract requiring verification published' event

This event is supported from version 2.82.0 of the Pact Broker. It is a much smarter implementation of the `contract_content_changed` event, designed specifically for the recommended [Pact webhook workflow](/pact_nirvana/step_6). It triggers once for each of the following provider versions that are missing a verification result for the newly published pact:

* the latest version from the provider's [main branch](/pact_broker/branches#pacticipant-main-branch-property)
* any version currently [deployed to an environment](/pact_broker/recording_deployments_and_releases)

The provider versions are de-duplicated by version number, so that if the same provider version is the head, and/or deployed to multiple environments, the webhook will only trigger once for each provider version. The template parameter `${pactbroker.providerVersionDescriptions}` will contain a description of which branch/stages that particular provider version number pertains to. eg. "latest from main branch, deployed in test"

See [below](#using-webhooks-with-the-contract_requiring_verification_published-event) for more information on the usage of this event.

### The 'contract published' event

This is triggered every time a pact is published, regardless of whether it has changed or not.

### The 'provider verification published' event

This is triggered every time a verification is published.

### The 'provider verification succeeded' event

This is triggered every time a verification is published with a successful status.

### The 'provider verification failed' event

This is triggered every time a verification is published with a failed status.

## Template parameters

You can use template parameters in the request URL, body and headers to pass through metadata about the event. The most common use of this feature is to pass though the URL of the pact that has changed to the provider verification build. See [this list](https://github.com/pact-foundation/pact_broker/blob/master/lib/pact_broker/doc/views/webhooks.markdown#dynamic-variable-substitution) of available parameters.

## Using webhooks with the 'contract_requiring_verification_published' event

Using this webhook event allows the changed pact to be tested against the head of the providers main branch and any deployed or released versions of the provider, in the same way as the consumer version selectors can be configured to allow the head of the consumers main branch and any deployed or released versions of the pact to be tested against a version of the provider.

We can take a look at the following example with two environments `Test` and `Prod` and both the consumers, and providers `HEAD` of their main branches.

|               | Provider Head | Provider Test | Provider Prod |
| --------------| ------------- | ------------- | ------------- |
| **Consumer Head** | `*` `%` `$`   | `$`           | `$`           |
| **Consumer Test** | `*`           |               |               |
| **Consumer Prod** | `*`           |               |               |

`*` When the provider changes, these combinations are tested in the provider's release pipeline via the consumer version selectors

`%` When the consumer (pact) changes, this combination is tested via the provider verification triggered by the `contract_content_changed` webhook. Note that it is missing the test and prod combinations.

`$` When the consumer (pact) changes, these combinations are tested via the provider verifications triggered by the `contract_requiring_verification_published` webhook. Note that it is the exact inverse of the combinations tested by in the provider's release pipeline.

Use of this webhook requires that:

* the provider's [main branch](/pact_broker/branches#pacticipant-main-branch-property) is configured
* verification results are [published with the branch property](/pact_broker/branches#configuring-the-branch-when-publishing-verification-results) or you are [tagging with the branch name and have automatic branch creation turned on](/pact_broker/branches#automatic-branch-creation-from-first-tag) (even if you use trunk based development, and only ever use one branch)
* the exact commit of a provider version can be determined from the version number used to publish the verification results (ie. it either _is_ the commit, or _contains_ the commit as per the Pact Broker [version number guidelines](/getting_started/versioning_in_the_pact_broker#guidelines))
* any deployments and releases are recorded using the [`record-deployment` and `record-release` commands](/pact_broker/recording_deployments_and_releases).

A webhook using the `contract_requiring_verification_published` should be configured to pass through the `${pactbroker.pactUrl}` and `${pactbroker.providerVersionNumber}` and `${pactbroker.providerVersionBranch}` to the provider verification build. The Broker then will trigger the execution of the provider version of the _main branch_, and also the provider version for every _environment_ it has been deployed to, but we need to let our CI application know what versions to build. That's why the parameters `${pactbroker.providerVersionNumber}` and `${pactbroker.providerVersionBranch}` are needed.

The build should ensure that the commit and branch that is specified by the `${pactbroker.providerVersionNumber}` and `${pactbroker.providerVersionBranch}` is checked out (as a commit can belong to more than one branch, some CI systems require that the branch is set as well as the commit - this helps to ensure that the verification results are published with the right branch too). If the provider version number _is_ the commit then this can generally be achieved by specifying the commit in the API call to the CI application that triggers the build.

eg. For Travis CI:

```
{
  "request": {
    "message": "Verify changed pact for ${pactbroker.consumerName} version ${pactbroker.consumerVersionNumber} branch ${pactbroker.consumerVersionBranch} by ${pactbroker.providerVersionNumber} (${pactbroker.providerVersionDescriptions})",
    "branch":"${pactbroker.providerVersionBranch}",
    "sha": "${pactbroker.providerVersionNumber}",
    "config": {
      "env": {
        "global": [
          "PACT_URL=${pactbroker.pactUrl}"
        ]
      }
    }
  }
}
```

If the provider version number is not the commit, then the build will need to manually check out the correct version of the provider before running the verification step.

The `contract_requiring_verification_published` event is an improvement over the `contract_content_changed` event in the following ways:

* It more easily allows verification results to be returned for deployed versions of the provider, allowing `can-i-deploy` for the consumer to pass more often in the siutation where previously it would have failed due to a missing verification result.
* It won't trigger a build unnecessarily if new tags are applied to existing content.
* It won't trigger a build unnecessarily for any of the target provider versions that already have a verification result with the pact content.
* It de-duplicates the target provider versions, so if the same version is the head, and/or deployed to multiple environments, only one verification job will be run per provider version.

### Migrating from the `contract_content_changed` event

* Update your webhook events to use the `contract_requiring_verification_published` instead of the `contract_content_changed` event.
* Update the webhook body to pass in the `${pactbroker.providerVersionNumber}` as the commit and `${pactbroker.providerVersionBranch}` as the branch, according to your CI's build triggering API.
* Ensure the build is checking out the expected commit of the provider before verifying the changed pact.

## Example CI/CD and webhook configuration

![](https://raw.githubusercontent.com/wiki/pact-foundation/pact_broker/images/webhook_end_to_end.png)

Note that if the pact content has not changed, it is "pre verified", and the provider verification portion of this diagram can be skipped.

![](https://raw.githubusercontent.com/wiki/pact-foundation/pact_broker/images/webhook_end_to_end_skip.png)

**What to do if your Pact Broker webhooks can't contact your CI because it is in a private network**

If your consumer and provider builds are both within the same private network, or you share access to each other's repositories, you can achieve a similar result by either embedding the pact verification part of the provider's build into the consumer's pipeline, or having the consumer builds trigger the provider verification build directly. To speed up your builds, you can ensure that you only run this verification step when the pact has _changed_ (rather than on every build), by using [`can-i-deploy`](/pact_broker/can_i_deploy) to determine if the step is necessary. eg `pact-broker can-i-deploy --pacticipant <CONSUMER> --version <CONSUMER_VERSION> --pacticipant <PROVIDER> --latest <TAG_NAME_OF_MAIN_LINE_OF_DEVELOPMENT>`. Note however that duplicate results in the Pact Broker are expected and not an issue - this is simply a speed optimisation.

### Consumer CI

* `Consumer test job` - runs unit tests, runs pact tests, publishes pact. Triggers `Consumer pact check job`
* `Consumer pact check job` - this is the point where you decide if you can deploy the consumer straight away, or if you need to wait for the pact to be verified. It checks the status of the pacts using `can-i-deploy`. If `can-i-deploy` is successful, this job triggers `Consumer deploy`. If it is unsuccessful, it should fail the job to provide visibility of the status of your pacts in the build pipeline. Having this as a separate job rather than bundling it in with the test or deploy jobs means that the reason for a "failure" is obvious at a glance. If you have set up a webhook to trigger the provider verification on pact changes, then you can make can-i-deploy wait for a result before continuing using the `--retry-while-unknown` parameter.
* `Consumer deploy job` - deploys consumer

### Provider CI

#### When the provider makes a change

* `Provider test job` - your normal provider pipeline. Runs unit tests, runs pact verification tests, publishes verification results. Typically, the pacts with `master`/`dev`/`test` and the `prod` tags would be verified during this job.
* `Provider pact check job` - this is the point where you decide if you can deploy the application. It checks the status of the pacts using `can-i-deploy`. If `can-i-deploy` is successful, this job triggers `Provider deploy`. If it is unsuccessful, it should fail the job to provide visibility of the status of your pacts in the build pipeline. Having this as a separate job rather than bundling it in with the test or deploy jobs means that the reason for a "failure" is obvious at a glance.
* `Provider deploy job` - deploys provider

You can see an example project with a Github Workflow set up as described [here](https://github.com/pactflow/example-provider/blob/master/.github/workflows/build.yml).

#### When the consumer makes a change

* `Changed pact verification job` - triggered by the ['contract_requiring_verification_published'](#using-webhooks-with-the-contract_requiring_verification_published-event) (preferrable) or 'contract_content_changed' webhook, this job verifies only the changed pact, and publishes the verification results back to the broker. This pact verification job configuration will be different to the one configured as part of the main provider pipeline, and should accept the URL of the changed pact as a configurable parameter. To do this, you must use webhook [template parameters](/pact_broker/webhooks/dynamic_variable_sub) to pass the URL of the changed pact through to the CI, which can then pass it in to the verification task. See the pact verification configuration documentation for your language.

You can see an example project with a [`verify-contract-requiring-verification` Github Workflow](https://github.com/pactflow/example-provider/blob/master/.github/workflows/contract_requiring_verification_published.yml).

You can see an example `create-webhook` [command for triggering the `contract-requiring-verification-published`](https://github.com/pactflow/example-provider/blob/master/Makefile#L86-L99)

### Pact Broker

* `contract_requiring_verification_published` or `contract_content_changed` webhook - triggers `Pact verification job`. Note that this webhook will only be triggered if the content of the pact has changed. If it hasn't changed, then the new publication of the pact will inherit the verification from the previous publication and be "pre-verified" \(or "pre-failed"\).

## Related resources

* [Debugging webhooks](/pact_broker/webhooks/debugging_webhooks)
* [Webhook API documentation](/pact_broker/api/webhooks) - note that there is not yet a UI for creating webhooks. If you're interested in creating one, contact us on the Pact Broker [slack](https://slack.pact.io) channel.
* [Webhook template parameters](/pact_broker/webhooks/dynamic_variable_sub)
* [can-i-deploy documentation](https://github.com/pact-foundation/pact_broker-client#can-i-deploy) - Documentation for the Pact Broker `can-i-deploy` CLI, which allows you to retrieve the verification results and determine whether your application is safe to deploy.
* [Webhook template library](/pact_broker/webhooks/template_library) - a library of useful webhook templates
