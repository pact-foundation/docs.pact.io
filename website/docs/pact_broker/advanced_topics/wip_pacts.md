---
title: Work In Progress pacts
---

The purpose of the "work in progress" (WIP) pacts feature is to automatically include the pacts that are currently being worked on in the verification step, without the provider team having to change their configuration each time. This allows the consumer team to get feedback on their changed pacts without having to wait on the provider team to make changes to their code.

Before reading any further, please read the page on [pending pacts](/pact_broker/advanced_topics/pending_pacts), as the concept of a pact being in "pending" state is required for understanding WIP pacts.

A "work in progress" pact is a pact that is the latest for its tag \(eg. the pact for the latest consumer version tagged `feat-x`) that does not have any successful verification results.

The term "pending" is a status that is applied to a single pact. The "work in progress pacts" is a collection of pacts that are pending.


When verifying pacts, the verification task can be configured to include all "work in progress" pacts \(as well as the pacts that you specify explicitly, like `master` or `prod`\). This allows any new pacts to be automatically verified without the provider team having to make configuration changes. When using this feature, it is best to also turn on the `pending pacts` feature, so that any failures caused by the WIP pacts do not cause the build to fail.

You can read more about the backstory on this feature [here](http://blog.pact.io/2020/02/24/introducing-wip-pacts/).

## Technical details

To enable the WIP pacts feature, you need to set the `includeWipPactsSince` field to the date from which you want to start using this feature. eg `"2020-10-31"`. The date is required so that you don't suddenly start verifying 100 past feature pacts in your build all of a sudden. You also need to set a `provider version tag`  as this is used in the pending calculations. The provider version tag is recommended to be the name of the git branch for this to work correctly.

The logic for what constitutes a WIP pact is actually quite complex! To make it work as a human would intuitively expect involves many rules. It might be easiest to explain how the pacts are selected by stepping through it procedurally as the code does.

1. Find all the pacts that are the latest for their tag (the "head" pacts). (eg. The latest pact for a version with tag `main` + the latest pact for a version with tag `feat-x` + the latest pact for a version with tag `feat-y` ...)
1. Discard the pacts that have been explictly selected in the consumerVersionSelectors. (eg. usually you'd configure the consumer version selectors with `{"tag": "main", "latest": "true"}`, so discard the latest `main` pact).
1. Discard all the pacts created before the `includeWipPactsSince` date (we don't want to verify every head pact since the dawn of time).
1. Discard all the pacts that already have a successful verification by for the configured provider version tag (ie. branch) already.
1. Discard all the pacts that were published before the first instance of this provider tag (this is so that if you create a brand new provider branch, you don't  get EVERY head pact included in the WIP pacts list).

What is left are the outstanding head pacts - the ones that you're still working on.

## To start using the WIP pacts feature

* You need to either be using [pactflow.io](https://pactflow.io?utm_source=ossdocs&utm_campaign=wip_pacts), or have version 2.60.0+ of the OSS Pact Broker.
* You need to be on the latest version of the Pact client library for JVM, Javascript, Go, Ruby, .Net or Python (pact-python, not pactman)
* You need to find the verification documentation for your langage, and set the "includeWipPactsSince" date to your chosen date (eg. try a week ago). The reason this date is required is that if you included all the pacts that were considered work in progress, you may include many years of outstanding pacts!
