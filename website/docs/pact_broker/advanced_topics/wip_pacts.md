---
title: Work In Progress pacts
---

The purpose of the "work in progress" (WIP) pacts feature is to get verification results for the pacts that are currently being worked on, without the provider team having to change their configuration each time. This allows the consumer team to get feedback on their changed pacts without having to wait on the provider team to make changes to their code.

Before reading any further, please read the page on [pending pacts](/pact_broker/advanced_topics/pending_pacts), as the concept of a pact being in "pending" state is required for understanding WIP pacts.

A "work in progress" pact is a pact that:

1. is the latest for its branch (as specified by its tags)
2. does not have a successful verification result from the current provider branch (as specified by its tags) - that is, the pact is in "pending" state.
3. was not explicitly specified in the consumer version selectors

The term "pending" is a status that is applied to a single pact. The "work in progress pacts" is a collection of pacts that are pending.

When verifying pacts, the verification task can be configured to include the "work in progress" pacts \(as well as the pacts that you specify explicitly, like `master` or `prod`\). This allows any new pacts to be automatically verified without the provider team having to make configuration changes. When using this feature, it is best to also turn on the `pending pacts` feature, so that any failures caused by the WIP pacts do not cause the build to fail.

You can read more about the backstory on this feature [here](http://blog.pact.io/2020/02/24/introducing-wip-pacts/).

[Watch a video that explains this concept](https://youtu.be/VnOy9Sv9Opo).

## Technical details

To enable the WIP pacts feature, you need to set the `includeWipPactsSince` field to the date from which you want to start using this feature. eg `"2020-10-31"`. The date is required so that you don't suddenly start verifying 100 past feature pacts in your build all of a sudden. You also need to set a `provider version tag` as this is used in the pending calculations. The provider version tag is recommended to be the name of the git branch for this to work correctly.

The logic for what constitutes a WIP pact is actually quite complex! To make it work as a human would intuitively expect involves many rules. It might be easiest to explain how the pacts are selected by stepping through it procedurally as the code does.

1. Find all the pacts that are the latest for their tag (the "head" pacts). (eg. The latest pact for a version with tag `main` + the latest pact for a version with tag `feat-x` + the latest pact for a version with tag `feat-y` ...)
1. Discard the pacts that have been explicitly selected in the consumerVersionSelectors. (eg. usually you'd configure the consumer version selectors with `{"tag": "main", "latest": "true"}`, so discard the latest `main` pact).
1. Discard all the pacts created before the `includeWipPactsSince` date (we don't want to verify every unverified head pact since the dawn of time).
1. Discard all the pacts that have a successful verification by a provider version with a different configured branch before this branch was created (this is so that if you create a brand new provider branch, you don't get EVERY head pact included in the WIP pacts list).
1. Discard all the pacts that have a successful verification by a provider version with the same configured tag (ie. branch) _where the pact content was explicitly specified in the selectors_.
   - The implication of this is that if a WIP pact is verified successfully when it was a WIP pact, this successful verification does not stop it being a WIP pact. It only stops being a WIP pact when the content has been "approved" by having one of the tags that the provider team has chosen to support. If you are using git feature branches with the branch name mapped to a tag, this means that even after a successful verification, the pact will stay WIP until the consumer branch is merged, and that pact content gets tagged with `main`.

What is left are the outstanding head pacts - the ones that you're still working on.

## To start using the WIP pacts feature

- You need to either be using [pactflow.io](https://pactflow.io?utm_source=ossdocs&utm_campaign=wip_pacts), or have version 2.60.0+ of the OSS Pact Broker.
- You need to be on the latest version of the Pact client library for JVM, Javascript, Go, Ruby, .Net or Python (pact-python, not pactman)
- You need to find the verification documentation for your language, and set the "includeWipPactsSince" date to your chosen date (eg. try a week ago). The reason this date is required is that if you included all the pacts that were considered work in progress, you may include many years of outstanding pacts!

## FAQ

### What is the difference betweeen WIP and pending?

"Pending pacts" is a feature for providers, to avoid new consumer expectations breaking the tests and blocking their pipeline. "WIP pacts" is a feature for consumers, to ensure any new contracts are automatically verified by providers without the provider configuration having to be updated.  The two features work together, because we want to ensure 1. that changed pacts get verified 2. without blocking the provider's pipeline.

From a technical perspective, "WIP" (work in progress) pacts are the ones determined by the Broker to be in need of a verification but that aren't explicitly specified in the selectors.

"Pending" is a property of a pact that is being verified, and it exists on both work in progress and explicitly selected pacts. 

For the explicitly selected pacts, the pending flag is calculated dynamically, based on the provider branch (which is represented as a tag). If there are no successful verifications from this branch, then the pact is pending. Once there is a successful verification from that branch, it is no longer pending.

For the WIP pacts, the pending flag is hardcoded to true.
