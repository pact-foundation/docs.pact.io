---
title: Pact Open Source Update — January 2025
author: Yousaf Nabi
authorURL: https://twitter.com/you54f
tags: [pact, oss, community]
keywords: [pact, oss, community]
date: 2025-01-31
draft: false
hide_table_of_contents: false
---

👋 Wahey, it's 2025, it's the end of January and you've tuned in to another Pact blog. We'll take a look at what's been happening in the Pact ecosystem this month, as well as how you can get involved in shaping Pact's roadmap for the next year. We can't do it alone, and we would love to bring in more contributors and maintainers this year. Hopefully you'll be one of them :)

We'll also keep you posted on the updates from the PactFlow team, as they deliver new features for the commercial product, which brings net benefits to the open-source project, and some of the work our PactFlow engineers are doing across the open-source ecosystem.

## Pact OSS Updates

### Linux ARM64 Runners now available for open-source

GitHub announced Linux ARM64 runners available in public preview, which means we can natively run our arm64 builds, eliminating the need for qemu, and actually providing better speeds / efficiency than their x86_64 counterparts.

We've started rolling them out around our different repos. If you spot one that could benefit, why not drop in a PR. Same goes for your other favourite open-source projects.

### Pact 2025 Roadmap Planning

We are looking at 2024 in a retro, and getting together async to think about the future of Pact, and what our roadmap and priorities look like for the year. We've introduced multiple ways for collaborators to get involved, including bi-weekly maintainers meetings.

If you want to check out the discussion, and get involved, why not check out the [issue](https://github.com/pact-foundation/roadmap/discussions/112), and drop us a line

### Pact RFCs

### Pact-Plugins

[Ali Ustek](https://github.com/austek) dropped in a [PR](https://github.com/pact-foundation/pact-plugins/pull/87) to avoid us relying on a popular, but now unmaintained dependency.

#### Pact-Plugins - Slack

Chat with us in: [#pact-plugins](https://pact-foundation.slack.com/archives/CA2S7E6KC).

### Pact-JS

Following on from pact-js-cli and its split platform/architecture npm packages, the same has now been applied to pact-js-core in this [PR](https://github.com/pact-foundation/pact-js-core/pull/605).

It's awaiting review, but I've been tested it out against npm, yarn, yarn pnp and pnpm, and it's pretty solid. You'll benefit from smaller package downloads (the benefits of which will depending on your packager) with all the previous benefits of prebuilt node bindings on your machine, eliminating the need for post install steps and a full compiler set (gcc or msvc toolchain).

#### Pact-JS - Slack

Chat with us in: [#pact-js](https://pact-foundation.slack.com/archives/C9VBGLUM9)

### Pact-Python

Just before the new year turned, [Josh](https://github.com/JP-Ellis) dropped the [release of Pact Python version 2.3.0](https://github.com/pact-foundation/pact-python/releases/tag/v2.3.0). Among the many incremental improvements, the most significant is the [support of functional arguments](https://github.com/pact-foundation/pact-python/pull/890), the ability to map functions to provider states and message descriptions, without the user needing to spin up a separate proxy, or endpoints on their application. This feature provides an improved user experience for providers, and also introduces several breaking changes to the pact.v3 preview.

Read about it [here](https://pact-foundation.github.io/pact-python/blog/2024/12/30/functional-arguments/)

#### Pact-Python - Slack

Chat to us in: [#pact-python](https://pact-foundation.slack.com/archives/C9VECUP6E).

### Pact-PHP

Continuing from [Tiens](https://github.com/tienvx) RFC for adding matching rules for `form/urlencoded bodies`, he has completed the implementation and [added the examples to pact-php](https://github.com/pact-foundation/pact-php/pull/630), rounding off work started this time last year.

Great work chap! We really hope you've enjoyed using pact-php v10. We've loved hearing your feedback about the migration, and the benefits you've seen after using it.

If you haven't yet, what are you waiting for?

#### Pact-PHP - Slack

Chat to us in: [#pact-php](https://pact-foundation.slack.com/archives/C9W94PXPY).

### Pact-Go

[Alpine Linux support is now here](https://github.com/pact-foundation/pact-go/pull/454), despite segfaults during the verification process. We would appreciate any extra eyes, if this feature would be useful to you. you can track my progress [here](https://github.com/pactflow/example-provider-golang/pull/16)

We've also had to drop the minimum version of golang, to 1.22, in this [PR](https://github.com/pact-foundation/pact-go/pull/490)

You can grab these changes in pact-go [v2.2.0](https://github.com/pact-foundation/pact-go/releases/tag/v2.2.0)

#### Pact-Go - Slack

Chat with us in: [#pact-go](https://pact-foundation.slack.com/archives/C9UTHTFFB).

### Pact-Reference

[Marko Justinek](https://github.com/surpher) aka @surpher, Pact Swift's author, has been working on his library again, and found a few issues when migrating it to the latest version of pact_ffi.

- [Matchers: Using time matcher in a query parameter failing verification ](https://github.com/pact-foundation/pact-reference/issues/483)
- [Matchers: Numeric matcher passing test sending String value](https://github.com/pact-foundation/pact-reference/issues/484)
- [Matchers: Include matcher in query parameters failing to match](https://github.com/pact-foundation/pact-reference/issues/485)

These actually weeded out some regressions, which [Ron](https://github.com/rholshausen) has now fixed. Have you spotted something, let us know?

#### Pact-Reference - Slack

Chat with us in: [#pact-rust](https://pact-foundation.slack.com/archives/CA2S7E6KC).

### Pact Broker

We've been pleased to hire a few new members to the PactFlow team over the last year, who you may have seen beginning to drop in pull requests and tweaks to the Pact Broker repo.

- [Steven Holloway / @impurist](https://github.com/impurist)
- [Phanindra Srungavarapu / @pahnin](https://github.com/pahnin)
- [Sauparna Gupta / @Saup21](https://github.com/Saup21)

We'll be introducing our engineers in our posts, over the year, and I can't wait for you to meet them!

Most Ruby applications, have migrated to use Rack 3.x now, however the Pact-Broker has been impeded due to one of its dependencies. This leaves us with an open CVE in the Sinatra library. [Ron](https://github.com/rholshausen) has been working on this by way of a custom adapter. You can track it [here](https://github.com/pact-foundation/pact_broker/issues/742)

One of the biggest challenges with contract-testing at scale, is the discoverability of provider states, in the broker, for any particular provider. I've dropped a [PR](https://github.com/pact-foundation/pact_broker/pull/734) in, which will be reviewed by the team. It will create a new resource that returns a aggregated de-duplicated list of all provider states for a given provider.

Whilst I think there is lots of room for improvement, which we can discuss another time, I think it provides a good start. Why not test it out and let me know your feedback.

#### Pact-Broker - Slack

Chat to us in: [#pact-broker](https://pact-foundation.slack.com/archives/C9VPNUJR2).

## Community Events

Are you talking about Pact or contract-testing this year at an event? Why not let us know and get yourself featured!

## Thats a wrap

Want to carry on the conversation? Sign up [here](https://slack.pact.io/) to join our Slack community, where you will be amongst over 6k other users. It's a safe place to ask questions, and a great place to share the awesome work you are doing in the Pact ecosystem.

Whatever you are up to, let us know, and we can look to get you featured in the Pact post.

See you next month folks!

Cheers,
Saf
