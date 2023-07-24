---
title: 6. Platinum - Add can-i-deploy with branch to PR pipelines
sidebar_label: 6. Platinum - Add can-i-deploy with branch to PR pipelines
---

Before we merge a PR, it would be good to know if this change is compatible with the consumers and/or providers the application talks to.

We can answer this question using the **can-i-deploy** feature of Pact.

## The Matrix
The Pact way of managing these dependencies is to use the Pact Matrix - this is the matrix generated when you create a table of all the consumer and provider versions that have been tested against each other using Pact. You can view the Pact Matrix for any pair of applications by opening `/matrix/provider/PROVIDER/consumer/CONSUMER` in your Pact Broker.

<details open>
  <summary>Pact matrix</summary>

![Pact matrix](/img/pact-matrix.png)
</details>

### Pre-verified contracts
One very important thing to note is that a verification is associated with the pact _content_ itself, not with a specific consumer version. This means that if a pact does not change between publications, any previous verifications are automatically applied to the new pact publication, effectively “pre-verifying” it. \(For this reason, it is best not to use any random data in a pact, as this will cause the broker to consider it a new revision of the pact.\) Linking a verification to the pact content rather than to the application version also means that we can do a “cartesian join” of pacts/verifications, resulting in many more "compatible" versions than would otherwise be the case.

The way you check if you are safe to deploy is to determine if there is a row in the matrix that contains the version of the application you’re about to deploy and the version of the other application that already exists in that environment. You can do this with the [`can-i-deploy`](/pact_broker/can_i_deploy/) tool, which will be described in more detail below.

The need for this check increases proportionately with the time that elapses between your pact test execution and your release. If you practice continuous deployment, and you go straight from a test build into a production deployment build, then you can be pretty sure that the version of the other application that is in production probably hasn’t changed in the meantime. If there is a considerable amount of time, however, it is best to do a compatibility check again just before deploying.

For example, if you run a pact verification on Monday that verifies the recommended "master" and "production" pacts, but you don’t deploy the provider artifact until Friday, the version of the consumer that is now in production may have changed.

Alternatively, a pact may have been verified by the “master” version of the provider, but that version of the provider may not yet have been deployed to production. The consumer cannot be deployed to production until the version of the provider that it depends on is in production \(unless it has been specifically written to fail gracefully, which is actually the best approach, but is one that isn’t always followed\).

Another reason that an extra "safe to deploy?" check is required (as well as the verification tests themselves) is that when the [pending feature](/pact_broker/advanced_topics/pending_pacts/) is enabled to ensure that newly changed pacts do not break the provider build, the build will not necessarily be breaking any more to let you know of an incompatibility.

## Can I Deploy?
The `can-i-deploy` tool is a CLI that has been written to query the Matrix to ensure that you are safe to deploy. You can read a detailed description of how it works [here](/pact_broker/can_i_deploy/).

Ultimately, we will want to ask if you can deploy to a particular environment. But a good first step in that direction is to just make sure your change is compatible with what your consumers and providers have currently checked into their main branch.

This is a great step, but it's not fully what we want. It's quite possible that the pact version used by the application checked into the main branch is not the same as the pact version running in production or even staging.  The more frequently you deploy, and the faster you deploy, the less likely this is, but it's definitely a possibility.

This is much more the case for native apps, where you will likely have many old pact versions running on user's mobile devices. Any providers those apps talk to need to be compatible with all those versions.

In these cases, checking to see if your provider is compatible with the consumer version checked into main is not sufficient. We'll talk about how to check against what is actually deployed in a particular environment in the next section.

### Add can-i-deploy to consumer PR pipeline

<details open>
  <summary>Platinum diagram</summary>

![Platinum level diagram](images/platinum.png)
</details>

This step is a bit tricky.

In your consumer PR pipeline, can-i-deploy with the branch of main will check to see if this consumer has been 
verified against the provider that is currently in the provider's main branch.

But if your consumer just generated and published a new version of the pact, this will always fail because the 
provider could not possibly have run verification against a newly changed pact.

You avoid this situation by registering a webhook in the Pact Broker that is triggered by the publication of a 
new pact. This webhook calls a job that runs provider verification for the new Pact.

So to get can-i-deploy working in your consumer PR pipeline, you need to follow these steps:

- Create a separate provider verification CI job that will be called by a webhook.
  - This job takes the following parameters (branch and commit allow multiple webhooks to be specified for deployed/released versions in Step 7)
    - the URL of the changed pact
    - the provider branch
    - the provider commit
- Add the webhook in the broker to call this job
- Add the can-i-deploy build step to the consumer PR validation build job
  - This step should be provided
    - The application name
    - The application version
    - The application branch that we wish to deploy to ( we will change this to the environment in Step 7)
    - You can setup `--retry-while-unknown` to allow this job to poll for verification results published by the triggered provider job.

__Note:__

If you see multiple webhooks being fired, even if the contract hasn't changed, ensure you don't have random data in your contract. See [here](https://docs.pact.io/getting_started/matching#random-data---avoid-it) for why.

### Add a new provider verification job

This job runs provider verification, taking as a parameter the URL of the changed pact along the git commit and version of the provider, to be verified.  You set this up to be called through an API call, or however your particular CI/CD system supports that.

1. Create a new CI job that performs just the provider pact verification step for a given pact URL. Consult the documentation for your chosen language for the syntax of how to configure this - you can find an example [here](/provider/recommended_configuration#verification-triggered-by-a-contract-requiring-verification-published). The job should accept the URL of the changed pact in the HTTP request parameters or body. You can find a library of webhooks that trigger a build in many popular CI systems [here](https://docs.pact.io/pact_broker/webhooks/template_library#using-the-contract_requiring_verification_published-event-recommended), otherwise you'll need to consult the documentation for your CI application to learn how to pass in parameters to a build. Note that this build will fail when a consumer pushes an unsupported change to a contract - that is expected and fine. There should be no downstream dependencies on this build. Its only job is to run the verification for the changed pact and report the results back to the broker.
2. Additional the CI job should accept the following from the webhook, checking out the required build, and if not provided default to the head of the main branch. This will allow us to verify deployed and released versions of the provider in step 7.
   1. The git commit
   2. The git branch

It is useful to allow this build to be manually triggered by passing a pact url to the supporting job, especially during the testing phase.

### Add can-i-deploy webhook to Pact Broker

Once you have the provider verification by url job set up and working, you can integrate it with the Pact Broker by creating a webhook.

1. Configure a [webhook](/pact_broker/webhooks) to kick off the provider verification build when a pact changes, and use [webhook templates](/pact_broker/webhooks/dynamic_variable_sub) to pass the URL of the changed pact to the build along with the provider branch and provider sha (git commit).

After setting up the webhook, add `can-i-deploy` to your consumer job

Note:- If you can't use webhooks to trigger a build for technical or policy reasons, see below for a "webhookless" workflow.

Useful links:

* [Installing a Docker Pact Broker](https://hub.docker.com/r/pactfoundation/pact-broker)
* [Publishing verification results](/pact_broker/advanced_topics/provider_verification_results)
* [Configuring webhooks in the Pact Broker](/pact_broker/webhooks)
* [Adding verification badges to your READMEs](/pact_broker/advanced_topics/provider_verification_badges)
* [Versioning in the Pact Broker](/getting_started/versioning_in_the_pact_broker)

## Alternative "webhookless" workflow

If you can't use webhooks because of networking issues, then you can see an example of an alternative consumer pipeline design in this [example repository](https://github.com/pactflow/example-consumer-webhookless).

## Congrats

You now have a workflow where:

* A pact is published with every consumer build associated with a branch
* The latest version of that pact on any given branch is verified with every provider build
* The verification results are published back to the broker
* Any change to the pact triggers a provider pact verification build.

## Next steps- Allow contracts to change without breaking the builds

One of the complications introduced by the "consumer driven" nature of the workflow is that new interactions are usually added to the contract before the functionality has been implemented in the provider. Using the workflow described above, a provider build will be kicked off when you publish a contract with new interactions in it. This build will \(correctly\) fail during the verification task. This is not ideal, as the failure is expected. To solve this, we need to allow contracts to change without breaking the builds.
