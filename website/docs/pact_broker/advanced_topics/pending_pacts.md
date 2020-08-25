---
title: Pending pacts
---

The "pending pacts" feature allows changed contracts to be verified without failing the provider's build.

You can read about the feature here. [http://blog.pact.io/2020/02/24/how-we-have-fixed-the-biggest-problem-with-the-pact-workflow/](http://blog.pact.io/2020/02/24/how-we-have-fixed-the-biggest-problem-with-the-pact-workflow/)

Note that the pending feature is only applicable to the [provider changed workflow](/pact_nirvana/step_4#d-configure-pact-to-be-verified-when-provider-changes), where the list of pacts to be verified are fetched from the Pact Broker. It does not apply to the [contract changed](/pact_nirvana/step_4#e-configure-pact-to-be-verified-when-contract-changes) workflow where the pact URL is passed to the job via the webhook. This is because the pending status of the pact content is calculated based on the tags that the provider will use to publish the verification results, and the 'contract content changed' webhook cannot know this information.

## How the "pending" property works

The "pending" status of a pact is a _dynamically calculated_ property, determined at the time of running the provider verifications. It is based on:

* The distinct content of the contract (also known as the "pact version")
* The branch of the provider, as specified by the provider tags in the verification configuration

It is calculated for each pact version when the "pacts for verification" API is called by the provider test harness. 

When a pact version is considered "pending", then any mismatches during verification _will not_ cause the overall verification task to fail. When a pact is _not_ considered "pending" then mismatches _will_ cause the overall verification task to fail (until the introduction of this feature, this was the default behaviour).

The purpose of the pending flag is to ensure that provider builds are not broken by changes that were introduced by the consumer, but to also ensure that backwards compatiblity is maintained when a change is introduced by a provider. It achieves this by treating the first successful verification of a pact version by a particular branch of the provider as an implicit acceptance of the contract. Thereafter, if verification of that pact version fails, it can only be because the provider has made a backwards incompatible change.

## To start using the Pending pacts feature

* You need to either be using [pactflow.io](https://pactflow.io?utm_source=ossdocs&utm_campaign=pending_pacts), or have the latest version of the OSS Pact Broker running with the environment variable `PACT_BROKER_FEATURES=pacts_for_verification`
* You need to be on the latest version of the Pact client library for JVM, Javascript, Go, Ruby, .Net or Python (pact-python, not pactman)
* You need to find the verification documentation for your langage, and set the "enablePending" flag to true.
