---
title: Pact Open Source Update — April 2024
author: Yousaf Nabi
authorURL: https://twitter.com/you54f
tags: [pact, oss, community]
keywords: [pact, oss, community]
date: 2024-04-26
draft: false
hide_table_of_contents: false
---

👋 Hello and welcome to the April update from the world of Pact. We've got a varied selection as always, but my personal favorite is all about a 📖.

Read on to find out, as I'm not going to spoil the surprise. 🙊

## Pact OSS Updates

## General Updates

GitHub Actions [recently](https://github.blog/changelog/2024-01-30-github-actions-macos-14-sonoma-is-now-available/) switched `macos-latest` runners to `macos-14` which is MacOS Sonoma running on an `arm64` (apple silicon) processor over its predecessor `x86_64` (intel).

Hopefully that hasn't given you much grief, but it certainly has had an impact on some of our workflows which we've needed to rectify.

`macos-11` will be deprecated some time in June, and users should prepare for a time where only `arm64` macos machines are available on GitHub actions, and ensure use of [Rosetta](https://developer.apple.com/documentation/apple-silicon/about-the-rosetta-translation-environment) for any `x86_64` invocations.

## Specific language updates

### PHP

Pact-PHP:

Tien Vo has been continuing the trend with many more pull requests against the Pact-PHP project, preparing for the launch of Pact-PHP v10.x

Pact-PHP v10.x is now mainlined on the `master` branch, and Pact-PHP v9.x has moved to the `release/9.x` branch.

We've just synced the latest docs from the repo, to the website, so you can find Pact-PHP's new docs [here](https://docs.pact.io/implementation_guides/php/readme)

You can find the full list of April's merged pull-requests [here](https://github.com/pact-foundation/pact-php/pulls?q=is%3Apr+merged%3A2024-04-01..2024-04-26+is%3Aclosed). I've elected not to list them, as the current number is 37! 🚀

Why not help us make it 38!

Chat to us in: [#pact-php](https://pact-foundation.slack.com/archives/C9W94PXPY).

### Pact-Reference

Pact-Reference:

We've seen a raft of features and fixes land this month in Pact-Reference. Mainly driven by Tien Vo (Pact-PHP) & Josh Ellis (Pact-Python) during their work in implementing the pact-ffi in their respective languages, and trying to implement the full Pact compatibility suite. We also as usual have users working with the pact-reference project raising issues and proposing fixes via PR's. We are grateful for all the feedback, and contributions to the project.

Features & Fixes:

- [feat: Optional Query Parameter Values](https://github.com/pact-foundation/pact-reference/pull/411)
- [feat: Match headers with ArrayContains and EachValue matchers](https://github.com/pact-foundation/pact-reference/pull/396)
- [feat: Match query with ArrayContains and EachValue matchers](https://github.com/pact-foundation/pact-reference/pull/394)
- [feat: composing matching rules](https://github.com/pact-foundation/pact-reference/pull/405)
- [fix: Parse user-agent as single value headers](https://github.com/pact-foundation/pact-reference/pull/410)

Chat with us in: [#pact-rust](https://pact-foundation.slack.com/archives/CA2S7E6KC).

### Pact-Plugins

Pact-Plugins:

#### Pact Plugin Driver

- Ron found an issue in the Rust plugin driver, which was causing slow-down issues on Windows machines. The upshot of his findings, is that plugin based tests on Windows _should_ run quicker. You can check out the commit [here](https://github.com/pact-foundation/pact-plugins/commit/d9e441e967c7fb53dbe0992b2787dc21fbd67c7e). If you are using the Pact-FFI, I think you'll need to wait for a release beyond `libpact_ffi-v0.4.19` to be cable to consume these.

#### Pact-Protobuf-Plugin

- A range of fixes were released in `v0.3.14` of the `pact-protobuf-plugin` off the back of this raised [issue](https://github.com/pactflow/pact-protobuf-plugin/issues/53). For the full list of changes, see the [changelog](https://github.com/pactflow/pact-protobuf-plugin/blob/main/CHANGELOG.md#0314---bugfix-release)

Have you tried out Pact Plugins yet? What's stopping you?

Chat with us in: [#pact-plugins](https://pact-foundation.slack.com/archives/CA2S7E6KC).

### .NET

Pact-net:

- Last month we spoke about releasing musl variants on the Pact FFI library. We saw our first community contribution, in consuming these in a Pact client project, in this [issue](https://github.com/pact-foundation/pact-net/issues/496) and respective [PR](https://github.com/pact-foundation/pact-net/pull/497). This is exciting to see. I'd love to see linux Aarch64 support for musl and non-musl variants. Fancy dropping in a PR?
- The Road to Pact Plugins.
  - If you are waiting eagerly for access to the Pact Plugin framework within Pact-Net, why not comment on the [open RFC](https://github.com/pact-foundation/pact-net/issues/492) where you can register your interest in using it, or potentially contributing to it's implementation.
- The Road to Pact-Net V5.
  - Are you using Pact-Net V5 Beta? Drop us some feedback and let us know how you are getting on. It's really invaluable in helping us decide when to promote from a beta to a release-candidate.

Chat with us in: [#pact-net](https://pact-foundation.slack.com/archives/C9UTHV2AD).

### Golang

Pact-go:

GoLang recently introduced `v1.22.x` which seems to have introduced some defects for the GoLang community, causing segfaults on linux x86_64 machines. This affected some of our users, and was raised [here](https://github.com/pact-foundation/pact-go/issues/402)

#### TL;DR

Linux x86_64 users

- Using GoLang `1.22.x` ?
  - Resolution: disable `-race`
- Need to use `-race`?
  - Resolution: downgrade to `1.21.x`

Features:

- [Janez Justin](https://github.com/jjustin) removed `go-getter` in this [PR](https://github.com/pact-foundation/pact-go/pull/392) in favour of utilising the stdlib's `net/http` and `compress/gzip` to download the pact_ffi dependencies for the project. This helped him resolve an indirect vulnnerablity in Pact-Go and has the additional benefit of greatly reducing the size of the dependency tree. Thanks Janez!
- Still stuck on Pact-Go v1.x? You can now publish pacts with the `branch` property set, thanks to this [PR](https://github.com/pact-foundation/pact-go/pull/374)
  - _Note:_ If you are using Pact-Go v2.x, you will utilise the pact-cli tools for publishing pacts, which already supports the branch parameter.

Fixes:

- The main Pact documentation website has been updated to include the new Pact-Go V2 package and documentation. It seems we missed our doc's sync job when promoting V2 from it's beta state. Not to fear though, thanks to a community report for identifying, it has now been rectified and you can find the new documentation here.
  - https://docs.pact.io/implementation_guides/go


Chat with us in: [#pact-go](https://pact-foundation.slack.com/archives/C9UTHTFFB).

### Pact-JS


Features:

- [feat: support matching numbers, bool in query strings](https://github.com/pact-foundation/pact-js/pull/1211)

Fixes:

- [fix: broken eachLike V3 documentation](https://github.com/pact-foundation/pact-js/pull/1209)
- [fix: updated deprecated eachLike V3 description](https://github.com/pact-foundation/pact-js/pull/1208)

Chat with us in: [#pact-js](https://pact-foundation.slack.com/archives/C9VBGLUM9).

### Python

Pact-Python:

🎺 Pythonista’s rejoice.

We are thrilled to announce the release of [Pact Python v2.2](https://github.com/pact-foundation/pact-python/releases/tag/v2.2.0), a significant milestone that not only improves upon the existing features but also offers an exclusive preview into the future of contract testing with Python.

Be sure to read about at pact-pythons new doc site, in its [inaugural blog post](https://pact-foundation.github.io/pact-python/blog/2024/04/11/a-sneak-peek-into-the-pact-python-future/) from maintainer [Josh Ellis](https://github.com/JP-Ellis).

Chat to us in: [#pact-python](https://pact-foundation.slack.com/archives/C9VECUP6E).

## Community Events

### Solving the integration testing puzzle with contract-based testing


Bas Dijkstra is an independent test automation consultant and trainer, who has been active in the test automation field for some 16 years now, and has worked on software testing and automation solutions across a wide range of programming languages, frameworks and technology stacks.

![Bas](https://media.licdn.com/dms/image/C4E03AQEVgM60TCWeJQ/profile-displayphoto-shrink_200_200/0/1635001164013?e=2147483647&v=beta&t=9dMTpnJRzzeRxGrXKWk4Svcdp5tL-3ayYSWb9t0-R9I)

He recently delivery a talk about contract testing with Pact.NET, which you can watch [here](https://www.youtube.com/watch?v=kbVTuyWui-0).

I'll hand over to Bas in his own words, to describe what's in store.

>Setting up and running integration and end-to-end tests in distributed software systems is hard. Making sure that all components are deployed, with the right version, in the right state, with the right data is a challenging task for many teams.

>Contract-based testing is an approach that tries to address this problem and simplify and speed up integration testing for distributed software systems.

>In this talk and recorded demo, you'll learn about the basic principles behind contract-based testing, the questions it tries to answer, and the three different approaches to contract-based testing. You will also see contract-based testing in action, using the well-known Pact.Net library for C#. To wrap up the talk, we will also talk about how to adopt contract-based testing in your team and organization, and some of the potential pitfalls that should be addressed along the way.


If you want to get in touch, please use the contact form on his [site](https://www.ontestautomation.com/about/), or send Bas an email at bas@ontestautomation.com.

## Hot new reads

We've often wondered when a book dedicated to contract testing would appear on the scene. We even had this statement on the [books section](https://docs.pact.io/books) of our site

> We're not aware of any books currently dedicated to contract testing, but here are some that talk about Pact and contract testing as part of a broader microservices development and testing strategy

However good news everybody 🎺

### Contract Testing In Action

[![Contract Testing In Action book cover](/img/books/cover_contract_testing_in_action_small.png)](https://mng.bz/gv8l)

We are pleased to announce that Contract testing experts Marie Cruz and Lewis Prescott, have put pen to paper, and have just released the Contract Testing in Action 📕 under the MEAP (Manning Early Access Program).

> Contract Testing in Action is a hands-on guide to contract testing for microservices applications and other systems of loosely-coupled components. After learning the basics of contract design and implementation, you’ll dive into constructing your own contract testing framework. You’ll explore the leading contract testing tools, including Pact, PactFlow, and GitHub Actions. Plus, you’ll set up consumer-driven contract testing for REST and GraphQL APIs and learn to integrate contract testing into a CI/CD pipeline. Finally, you’ll delve into provider-driven contract testing, which simplifies adoption by utilizing your existing stack and practices.

What does early access mean for you?

1. You get a book dedicated to Contract Testing, written by industry leading experts.
2. You get the chance to offer direct feedback, into the chapters as they progress. You can join the discussion forum [here](https://livebook.manning.com/forum?product=cruz2).
   1. This allows you to stamp your mark on the world of contract testing.
3. If you love the book, we would love the following:
   1. Quotes that could be used in the book
   2. Social Media promotion

How can you get your hands on a copy?

Check out [Contract Testing in Actions page](https://mng.bz/gv8l) on Manning's site.

:::info
🥷 Want a discount?

You can use `CTA45` between April 29 to July 30 to save 45% 🤑

🎥 If you want to give the book some promotion, or offer a quote, reach out to [Marie](https://www.testingwithmarie.com/about), [Lewis](https://www.pactman.co.uk/) or [myself](you@saf.dev)
:::

## Thats a wrap

Want to carry on the conversation? Sign up [here](https://slack.pact.io/) to join our Slack community, where you will be amongst over 5k other users. It's a safe place to ask questions, and a great place to share the awesome work you are doing in the Pact ecosystem.

Whatever you are up to, let us know, and we can look to get you featured in the Pact post.

See you next month folks!

Cheers,
Saf
