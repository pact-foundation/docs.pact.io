---
title: Introducing WIP Pacts
author: Beth Skurrie
authorURL: https://twitter.com/bethskurrie
tags: [pact]
keywords: [pact]
date: 2020-02-24
draft: false
hide_table_of_contents: true
---

# The problem

When following the "consumer driven" workflow, often the contract will change to express the desired functionality before the implementation exists in the provider. This means that when the changed pact is verified against the provider, the verification step fails, and until recently, this meant that the provider's build would also fail. (This has been fixed with the release of the [pending pacts][pending-pacts] feature.) The recommended approach to avoid breaking the provider's build is to use "tags" to distinguish between the "safe" contracts and the changed contracts (tags are metadata that get applied to the application version resource in the Pact Broker that can be used to identify which branch or stage the version belongs to eg. `master`, `feat/foo` or `prod`). By making changes to the pact on a branch of the consumer (eg `feat/foo`) and publishing it with a matching tag, a provider that was configured to verify `master` pacts would not have its build broken.

For the consumer to get a verification result for the `feat/foo` pact, however, manual action was required from the provider team. They would need to add the `feat/foo` pact to the list of pacts to verify, generally on a feature branch of their own to avoid breaking the master build. There was no automated workflow to include the newly changed pacts in the provider's list of pacts to verify.

# The solution
To solve this problem, we've introduced the concept of "WIP" (work in progress) pacts. "WIP pacts" is built on top of the recently released [pending pacts][pending-pacts] feature which allows changed pacts to be verified without failing the build. Previously, during a verification step, only the pacts for the configured tags (eg `master` and `prod`) would be verified. With the WIP pacts feature enabled, *all pacts that are the latest for their tag that have not yet been successfully verified* will now also be automatically verified - in pending mode. This allows consumers to get feedback on whether or not their changed pacts are valid, without the provider team having to take action, and without breaking the provider build.

Let's walk through an example. Imagine FooApp and BarAPI have a pact. BarAPI is configured to verify the `master` and `prod` pacts for FooApp during its verification step. When it publishes the verification results, its own application version is tagged with the branch name. We'll just consider the builds that run on the BarAPI `master` branch for now.

FooApp creates a branch called `feat/x`, makes a change to the contract, and then publishes it with the `feat/x` tag. When the BarAPI build executes, it runs the verification task for the configured `master` and `prod` pacts as normal, but it also now verifies the `feat/x` pact *in pending mode*, and publishes the results back to the broker. Publishing the failed results allows the consumer team gets the feedback for `feat/x` pact, and the fact that it runs in pending mode means that even though the `feat/x` pact fails verification, the BarAPI build remains green.

A few days later, the BarAPI team implements the changes required for the `feat/x` pact. During the BarAPI CI build, `master`, `prod` and `feat/x` pacts are verified and the results published, but this time, the verification of the `feat/x` pact passes. The Pact Broker now knows that the `master` branch of the provider supports the `feat/x` contract, and from then on *it ceases to be a WIP pact* for `master` BarAPI versions. The next time the BarAPI build runs, it will not include the `feat/x` pact.

Now the action is on the consumer team to merge the `feat/x` branch into their own `master` branch. Using [webhooks that update the Git commit status][git-status] or posting to a Slack channel is a good way to notify the consumer team that their pact is now green.

# A note for advanced Pact Broker users

As noted in the blog on the [pending pacts][pending-pacts] feature, the pending status is calculated based on the tags that will be applied to the provider version when the verification results are published. This means that a pact that has been successfully verified by the `feat/bar` branch of your provider, but not `master`, will still be included in the "work in progress" pacts for `master` builds, but not for `feat/bar` builds.

# How do I start using WIP pacts?

Head to https://docs.pact.io/wip for information on how to setup your Pact Broker (it is enabled by default on https://pactflow.io)

To start getting the benefit of this new and improved workflow, you will need to upgrade to the latest version of the Pact Broker and your Pact testing libraries. Consult the documentation for your language to find out how to enable the WIP pacts feature.


[pending-pacts]: http://blog.pact.io/2020/02/24/how-we-have-fixed-the-biggest-problem-with-the-pact-workflow/
[git-status]: http://blog.pact.io/2018/07/16/publishing-pact-verification-statuses-to-github/
[join-slack]: https://slack.pact.io
