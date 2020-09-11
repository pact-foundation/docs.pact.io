---
title: Pending pacts
---

The "pending pacts" feature allows changed contracts to be verified without failing the provider's build.

You can read about the feature here. [http://blog.pact.io/2020/02/24/how-we-have-fixed-the-biggest-problem-with-the-pact-workflow/](http://blog.pact.io/2020/02/24/how-we-have-fixed-the-biggest-problem-with-the-pact-workflow/)

Note that the pending feature is only applicable to the [provider changed workflow](/pact_nirvana/step_4#d-configure-pact-to-be-verified-when-provider-changes), where the list of pacts to be verified are fetched from the Pact Broker. It does not apply to the [contract changed](/pact_nirvana/step_4#e-configure-pact-to-be-verified-when-contract-changes) workflow where the pact URL is passed to the job via the webhook. This is because the pending status of the pact content is calculated based on the tags that the provider will use to publish the verification results, and the 'contract content changed' webhook cannot know this information.

## How the "pending" property works

The "pending" status of a pact is a _dynamically calculated_ property, determined by the Pact Broker at the time of running the provider verifications. It is based on:

* The distinct content of the contract (also known as the "pact version")
* The branch of the provider, as specified by the provider tags in the verification configuration

It is calculated for each pact version when the "pacts for verification" API is called by the provider test harness. 

When a pact version is considered "pending", then any mismatches during verification _will not_ cause the overall verification task to fail. When a pact is _not_ considered "pending" then mismatches _will_ cause the overall verification task to fail (until the introduction of this feature, this was the default behaviour).

The purpose of the pending flag is to ensure that provider builds are not broken by changes that were introduced by the consumer, but to also ensure that backwards compatiblity is maintained when a change is introduced by a provider. It achieves this by treating the first successful verification of a pact version by a particular branch of the provider as an implicit acceptance of the contract. Thereafter, if verification of that pact version fails, it can only be because the provider has made a backwards incompatible change.

The provider tags are used to determine the pending status because it is common to implement new features of a provider on a feature branch. If the provider tags were not taken in to consideration, a newly passing verification on `feat-x` of the provider could suddenly cause the verification on branch `main` of the provider to fail.

While the provider build may pass, the verification results are still reported (if results publishing is enabled) to the Pact Broker as "failed", as the consumer should not be able to deploy the code that generated this contract.

## To start using the Pending pacts feature

* You need to either be using [pactflow.io](https://pactflow.io?utm_source=ossdocs&utm_campaign=pending_pacts), or have version 2.60.0+ of the OSS Pact Broker.
* You need to be use at least the following version of your Pact library:
  * JVM: 4.1.7
  * JS: 9.11.1
  * Ruby: 1.52.0
  * Go: latest as of September 2020 (version TBC)
  * .Net: latest as of September 2020 (version TBC)
  * Python: latest as of September 2020 (version TBC)
* You need to find the verification documentation for your langage, and set the "enablePending" flag to true.

## FAQ

## How can I try this out?

There is a CI/CD workshop [here](https://docs.pactflow.io/docs/workshops/ci-cd/) that walks you through the steps of setting up a CI/CD pipeline, using Travis CI and a pair of Node applications. The step entitled [Protecting the provider](https://docs.pactflow.io/docs/workshops/ci-cd/workshop/protecting-the-provider/) walks you through an example that you can try out yourself.

### I've enabled the pending feature. Why are my verification results recorded as failed in the Pact Broker, when my provider CI is passing?

This is the way it's meant to work. The pending flag doesn't make the failing verifications pass. It just changes the exit code of the verification task so that the provider build doesn't fail. The failed verification results need to be sent back to the Broker so that the consumer knows that they can't deploy that code yet.

### Why has my master build suddenly failed when a successful verification was published from a branch?

The pending flag is calculated based on the provider tags supplied. You probably haven't configured a provider tag, so the results from the branch and master can't be differentiated.

### I'm so confused by the whole thing!

The API that returns the list of pacts to verify has some built in messaging to explain what is going on that should be displayed to the user. Here is an example from the Ruby implementation.

```
DEBUG: The pact at https://test.pactflow.io/pacts/provider/Bar/consumer/Foo/pact-version/6c4158b13a7f05dadd208a7633b77d1f299ae375 is being verified because it matches the following configured selection criterion: latest pact between a consumer and Bar
DEBUG: This pact is in pending state for this version of Bar because a successful verification result for a version of Bar with tag 'master' has not yet been published. If this verification fails, it will not cause the overall build to fail. Read more at https://pact.io/pending

[test output]

DEBUG: This pact is still in pending state for any version of Bar with tag 'master' as a successful verification result with this tag has not yet been published
```

If you cannot see this debug output, please consult the documentation for your language to see if you can find a way to turn it on. If you can't find that, please hop on to our [Slack workspace](https://slack.pact.io) and ask about it in the appropriate channel for your language. 


