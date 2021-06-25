---
title: Pending pacts
---

The "pending pacts" feature allows changed contracts to be verified without failing the provider's build.

## Why is this feature required?

Let's compare an example workflow with and without the "pending" feature enabled. Note that the pending feature is only applicable to the main provider release pipeline, not the provider build that gets triggered by the `contract_content_changed` webhook.

### Without pending pacts

1. Provider is configured to verify the pacts with tags `main` and `production`. Both pacts are currently passing verification from the `main` branch of the provider.
2. Consumer publishes a new pact with tag `main` that has a new, unsupported interaction in it (ideally, this should have been done in a feature branch, but for the sake of this example, we'll assume best practice advice was not followed).
3. Next time the provider build runs, the verification of the `main` pact fails, and the verification task exits with an error. The broken build stops the provider from deploying, even though the verification for the `production` pact passed.
4. The provider team is very annoyed!

### With pending pacts

1. Provider is configured to verify the pacts with tags `main` and `production`, AND the `enablePending` option is set to true. 
2. Consumer publishes a new pact with tag `main` that has a new unsupported interaction in it (as above).
3. Next time the provider build runs, the verification of the `main` pact fails **BUT** because `enablePending` is turned on, the verification task does not exit with an error. This means the pipeline continues and the provider can still deploy to production, because the verification for the `production` pact passed.
4. Provider team is happy!

Note that in both of these examples, the verification result sent back to the Pact Broker for the `main` pact is still a failure, and the consumer cannot be deployed in either example, as the features it requires are not yet supported (this is why a feature branch should have been used, as the consumer's own pipeline will be blocked by `can-i-deploy` reporting that the provider does not yet support the new interaction).

## How the "pending" property works

The "pending" status of a pact is a _dynamically calculated_ property, determined by the Pact Broker at the time of running the provider verifications. It is based on:

* The content of the contract (also known as the "pact version")
* The branch of the provider, as specified by the provider tags in the verification configuration

_A pact content is considered pending if there has not been a successful published verification by the specified branch of the provider._

It is calculated for each pact version when the "pacts for verification" API is called by the provider verification task. 

When a pact version is considered "pending", then any mismatches during verification _will not_ cause the overall verification task to fail. When a pact is _not_ considered "pending" then mismatches _will_ cause the overall verification task to fail (until the introduction of this feature, this was the default behaviour).

The purpose of the pending flag is to ensure that provider builds are not broken by changes that were introduced by the consumer, but to also ensure that backwards compatibility is maintained when a change is introduced by a provider. It achieves this by treating the first successful verification of a pact version by a particular branch of the provider as an implicit acceptance of the contract. Thereafter, if verification of that pact version fails, it can only be because the provider has made a backwards incompatible change.

The provider tags are used to determine the pending status because it is common to implement new features of a provider on a feature branch. If the provider tags were not taken in to consideration, a newly passing verification on `feat-x` of the provider could suddenly cause the verification on branch `main` of the provider to fail.

While the provider build may pass, the verification results are still reported (if results publishing is enabled) to the Pact Broker as "failed", as the consumer should not be able to deploy the code that generated this contract.

### WIP pacts

[Work in progress pacts](/pact_broker/advanced_topics/wip_pacts) always have the pending flag set to true.

## To start using the Pending pacts feature

* You need to either be using [pactflow.io](https://pactflow.io?utm_source=ossdocs&utm_campaign=pending_pacts), or have version 2.60.0+ of the OSS Pact Broker.
* You need to be use at least the following version of your Pact library:
    * JVM: 4.1.7
    * For the following libraries that wrap the [pact-ruby-standalone](https://docs.pact.io/wrapper_implementations), at least version 1.49.3 of the standalone is required.
        * JS: 9.11.1 (not supported by the v3 implementation that uses Rust)
        * Ruby: 1.52.0
        * Go: latest as of September 2020 (v1.4.1)
        * .Net: latest as of September 2020 (version TBC)
        * Python: latest as of September 2020 (version TBC)
* You need to find the verification documentation for your language, and set the "enablePending" flag to true.

## FAQ

## How can I try this out?

There is a CI/CD workshop [here](https://docs.pactflow.io/docs/workshops/ci-cd/) that walks you through the steps of setting up a CI/CD pipeline, using Travis CI and a pair of Node applications. The step entitled [Protecting the provider](https://docs.pactflow.io/docs/workshops/ci-cd/workshop/protecting-the-provider/) walks you through an example that you can try out yourself.

### I've enabled the pending feature. Why are my verification results recorded as failed in the Pact Broker, when my provider CI is passing?

This is the way it's meant to work. The pending flag doesn't make the failing verifications pass. It just changes the exit code of the verification task so that the provider build doesn't fail. The failed verification results need to be sent back to the Broker so that the consumer knows that they can't deploy that code yet.

### Why has my master build suddenly failed when a successful verification was published from a branch?

The pending flag is calculated based on the provider tags supplied. You probably haven't configured a provider tag, so the results from the branch and master can't be differentiated.

### Why is the pending configuration not working for my `contract_content_changed` webhook triggered build?

The pending feature is only applicable to the [provider changed workflow](/pact_nirvana/step_4#d-configure-pact-to-be-verified-when-provider-changes), where the list of pacts to be verified are fetched from the Pact Broker. It does not apply to the [contract changed](/pact_nirvana/step_4#e-configure-pact-to-be-verified-when-contract-changes) workflow where the pact URL is passed to the job via the webhook. This is because the pending status of the pact content is calculated based on the tags that the provider will use to publish the verification results, and the `contract_content_changed` webhook cannot know this information. The webhook triggered build is meant to be an "out of bound" build that does not have any dependencies on it, and it is expected to fail when pacts change.

### I'm so confused by the whole thing!

The API that returns the list of pacts to verify has some built in messaging to explain what is going on that should be displayed to the user. Here is an example from the Ruby implementation.

```
DEBUG: The pact at https://test.pactflow.io/pacts/provider/Bar/consumer/Foo/pact-version/6c4158b13a7f05dadd208a7633b77d1f299ae375 is being verified because it matches the following configured selection criterion: latest pact between a consumer and Bar
DEBUG: This pact is in pending state for this version of Bar because a successful verification result for a version of Bar with tag 'master' has not yet been published. If this verification fails, it will not cause the overall build to fail. Read more at https://pact.io/pending

[test output]

DEBUG: This pact is still in pending state for any version of Bar with tag 'master' as a successful verification result with this tag has not yet been published
```

If you cannot see this debug output, please consult the documentation for your language to see if you can find a way to turn it on. If you can't find that, please hop on to our [Slack workspace](https://slack.pact.io) and ask about it in the appropriate channel for your language. 


