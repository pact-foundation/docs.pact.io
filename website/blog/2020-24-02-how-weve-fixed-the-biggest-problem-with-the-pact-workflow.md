---
title: How we've fixed the biggest problem with the Pact workflow
author: Beth Skurrie
authorURL: https://twitter.com/bethskurrie
tags: [pact]
keywords: [pact]
date: 2020-24-03
draft: false
hide_table_of_contents: true
---


### tl&semi;dr
Changes to the contract made by the consumer teams can no longer break the provider builds. Hooray!

Read on for the longer version...
# The problem

Pact is a consumer driven contract testing tool that allows you to test your integration points without dependencies. The consumer is tested with a mock provider, and a contract ("pact") is generated from the tests. The contract is taken over to the provider and then "verified" to make sure that the real provider and the mock provider behave the same way.

During the verification step, each request from the contract is replayed against a running test instance of the provider, and the responses are compared to the expected responses. If they match, the verification is successful. If they do not match, the verification has failed, and the provider build fails.

In the context of an existing contract, there are two reasons that the pact verification step can fail when it was previously passing.

1. The provider has changed.
2. The contract (consumer expectations) has changed.

In scenario 1, we actually want the provider build to fail, as this is the purpose of contract testing - it prevents breaking changes being made by the provider for existing consumers.

In scenario 2 however, when the contract has changed, the failure of the provider build is an undesirable consequence of the workflow. The contract may have changed due to the teams following the "consumer driven" nature of the process whereby the expectations come before the implementation (TDD for services); there may be an issue with the provider state data; or there may just be incorrect expectations about existing behaviour.

The fact that the provider build can be broken by new or incorrect expectations in the contract (which is effectively written by the consumer team) is one of the biggest problems people have with Pact. It leads to contention between teams, and in some cases, stops teams using Pact at all.

One solution could be to run all pact verification builds in such a way as to ignore any failures that might occur, but then we'd miss being alerted to potentially breaking changes by the provider, which defeats the purpose of using contracts in the first place.

What we want is a way to get feedback on changed contracts without breaking the provider build, but for the build to correctly identify and fail when a provider is making a breaking change.
# The solution
The Pact team is extremely happy to introduce the new "pending pacts" feature.

Those familiar with automated testing frameworks have probably come across the term "pending" tests. These are tests that have a particular flag on them that causes them (depending on the framework) to either be skipped, or if executed, to not fail the build. In the case of Pact, we want the feedback we get from execution, so rather than a "pending pact" being one which will be skipped, it is one which can be verified without its failure causing the overall verification task to fail.

So how does the Pact verification tool know if a pact is in "pending" state or not? This is where the Pact Broker comes in. The Pact Broker is a service that sits between the consumer and provider builds, and allows the contracts and verification results to be exchanged between the consumer and provider teams. The Pact Broker can identify when a contract with new content has been published, and when it is retrieved for verification by the provider's Pact library, it flags it as "pending". The Pact library executes the verification, ensuring that the status of the overall task is not affected by any failures.  At the end of the verification process, the outcome of the verification is published back to the Pact Broker. Once the pact has been successfully verified it ceases to be "pending". This means that any subsequent verification failures for a pact with identical content will cause the provider build to fail, as the failure can now only be due to a change in the provider code.
# How do I start using pending pacts?

Head to https://docs.pact.io/pending for information on how to setup your Pact Broker to enable this feature (it is enabled by default on https://pactflow.io).

To start getting the benefit of this new and improved workflow, you will need to upgrade to the latest version of the Pact Broker and your Pact testing libraries. Consult the documentation for your language to find out how to enable the `pending` feature.

If you're on a consumer team, and have, until now, relied on the provider team to alert you to verification failures, you'll want to make sure that you're getting this information via another channel now. We recommend that you use [can-i-deploy][can-i-deploy] to make sure that you aren't deploying with a broken contract, and that you set up [webhooks][webhooks] to ensure you're made aware of the verification outcomes of your contracts as soon as possible (eg. posting to a team's [Slack][slack] channel, or updating a [Github commit status][github].)

### A note for advanced Pact Broker users

If you're not using tags in the Pact Broker you can skip this section! But take the time you've saved reading the next paragraph, and spend it reading up on [tags][tags] because if you're not using them, you're probably not getting the full benefit out of your Pact Broker.

Tag users - the "pending" status is calculated using the provider version tag(s) that will be published with your verification results. The provider tags are sent to the Pact Broker when retriving the list of pacts to verify, and are used to determine the pending status for each pact returned. For example, once you have successfully verified a pact with a version of the provider tagged as `feat-x`, then pacts with the same content will be non-pending for any subsequent verifications by a `feat-x` version. However, the same pact could still be in "pending" state for the `master`.

Why is this important? It means that if you're using a feature branch tagged `feat-x` on your provider to implement a new interaction, the pact will remain pending on your `master` branch even after it passes verification on the `feat-x` branch. It will only become non-pending on `master` once the feature branch has been merged in, and the pact has passed verification on the merged code.
# Conclusion
We're pretty excited about this new workflow, and we hope it will help make your experience testing with Pact a smoother and happier one. Let us know how you find it on the [Pact Foundation Slack][pact-foundation-slack] (join [here][join]).

[tags]: https://docs.pact.io/best_practices/pact_nirvana#5-allow-contracts-to-change-without-breaking-your-builds
[webhooks]: https://docs.pact.io/pact_broker/advanced_topics/webhooks
[github]: http://blog.pact.io/2018/07/16/publishing-pact-verification-statuses-to-github/
[slack]: https://github.com/pact-foundation/pact_broker/wiki/Webhook-template-library#slack---post-notification
[pact-foundation-slack]: https://pact-foundation.slack.com
[join]: https://slack.pact.io
[can-i-deploy]: https://docs.pact.io/pact_broker/can_i_deploy
