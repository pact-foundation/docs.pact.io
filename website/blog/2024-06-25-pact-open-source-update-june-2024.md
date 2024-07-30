---
title: Pact Open Source Update — June 2024
author: Yousaf Nabi
authorURL: https://twitter.com/you54f
tags: [pact, oss, community]
keywords: [pact, oss, community]
date: 2024-06-25
draft: false
hide_table_of_contents: false
---

👋 It's June, we've just passed the Summer Solstice, and some of you may be engrossed in footie-fever supporting your favourite team at the Euros ⚽. Good luck!

In this month's update, we will showcase what has been happening across the Pact OSS Ecosystem, letting you know how we got on at GitHub's Merge festival in Berlin, and sharing some of the latest community events coming up this year.

## Pact OSS Updates

## General Updates

## Specific language updates

### Pact-Reference

The Pact Rust core saw a good set of enhancements and fixes this month, with the latest release of pact_ffi 0.4.21.

This is mostly being driven by an increase of usage of the FFI interface, across client libraries which is resulting in issues being raised and fixed. Some of the key highlights include:

- Content Type detection was improved for repeatable behaviour cross-platform. PR [here](https://github.com/pact-foundation/pact-reference/pull/429)
- Merging pacts would result in duplicate interactions, this has now been fixed. PR [here](https://github.com/pact-foundation/pact-reference/pull/437)
- Work on improving the message related FFI interface.
  - Discussion [here](https://github.com/pact-foundation/pact-reference/issues/440), get involved.
    - [feat(ffi): add async message iterator](https://github.com/pact-foundation/pact-reference/pull/442)
    - [feat: add with_generators](https://github.com/pact-foundation/pact-reference/pull/444)
    - [feat: add generate_contents methods](https://github.com/pact-foundation/pact-reference/pull/443)
    - [feat(ffi): add with_metadata](https://github.com/pact-foundation/pact-reference/pull/439)

Check out the release notes [here](https://github.com/pact-foundation/pact-reference/releases/tag/libpact_ffi-v0.4.21)

If you've spotted something, once you've raised an issue, sometimes the best way to try and sort it, is yourself. We are happy to guide through the process, so don't be shy, get involved!

#### Pact-Reference - Slack

Chat with us in: [#pact-rust](https://pact-foundation.slack.com/archives/CA2S7E6KC).

### Pact-Plugins

[Ali Ustek](https://github.com/austek) helped with some maintenance work and updated the [pact-plugin JVM driver to Gradle 8](https://github.com/pact-foundation/pact-plugins/commit/5a8e1df161fe7707146ea06b31588b35e9af2d08). It was a decent bit of work and it's much appreciated as it saves the core maintainers time to focus on other areas.

#### Pact-Plugins - Slack

Have you tried out Pact Plugins yet? What's stopping you?

Chat with us in: [#pact-plugins](https://pact-foundation.slack.com/archives/CA2S7E6KC).

### Pact-Go

Back in April, GoLang recently introduced `v1.22.x` which has affected some of our users, and was raised: [Runtime error occurs with golang 1.22.x](https://github.com/pact-foundation/pact-go/issues/402).

It transpires the error was actually at our end, and was solved by the issues original poster [fix: use the same signature for the same function (#402)](https://github.com/pact-foundation/pact-go/pull/422).

There was some impressive debugging done by the GoLang team which makes for an interesting read. Check it out [here](https://github.com/golang/go/issues/67670).

I'm going to use some of that new found knowledge to help me with my own debugging in the future.

Pact-Go has also been updated to v0.4.21 of the pact_ffi library, bringing smaller binaries, improved content-type detection, and the next pact-go release will be the first to offer native alpine support. Subscribe or star the repo for notifications, otherwise I'll update the post to let you know when it's released.

How are you finding Pact-Go? Let us know in the Slack channel.

#### Pact-Go - Slack

Chat with us in: [#pact-go](https://pact-foundation.slack.com/archives/C9UTHTFFB).

### Pact-JS

Few bits of big news for Pact-JS this month:

- Pact CLI tools (ruby based) have now been moved from `@pact-foundation/pact-core` to `@pact-foundation/pact-cli`. This is to make it easier for users to find the CLI tools, and to make it easier to maintain the codebase. You can find the new CLI tools [here](https://github.com/pact-foundation/pact-js-cli) and read the migration guide [here](https://github.com/pact-foundation/pact-js-core/releases/tag/v15.0.0).
  - This dropped the package size from 353 MB to 164 MB
- Alpine Support is here! Pact-JS now supports Alpine Linux, which is a lightweight Linux distribution that is commonly used in containerized environments. This is a big win for users who are using Alpine Linux in their environments previously having to port applications to a glibc (debian etc) based distro.
  - Pact-JS-Core from [v15.1.0](https://github.com/pact-foundation/pact-js-core/releases/tag/v15.1.0)
  - Pact-Core from from [v13.1.0](https://github.com/pact-foundation/pact-js/releases/tag/v13.1.0)
- Package sizes are now smaller, the pact rust core binaries have been made smaller, so despite adding 2 new platform/arch combos, the package size has further been reduced to 116 MB.
- Content-Type detection is improved via a fix in the pact rust core.
  - Related pact-js-core issue [here](https://github.com/pact-foundation/pact-js-core/issues/447)

:::info
- Add `@pact-foundation/pact-cli` into your `package.json` if you rely on the CLI tools in your project.
- Check your project for any references to `@pact-foundation/pact-core` and update them to `@pact-foundation/pact-cli`.

Let us know how you get on!
:::

#### Pact-JS - Slack

Chat with us in: [#pact-js](https://pact-foundation.slack.com/archives/C9VBGLUM9).

### Pact-Python

We spoke last month where [Val Kolovos](https://github.com/valkolovos) assigned himself to one of the tasks: [Add support and example for a message consumer test using Rust engine](https://github.com/pact-foundation/pact-python/issues/380) and we wished him luck!

We are pleased to say that we now have a V3 and V4 async message consumer test example in the Pact-Python codebase. This is a great step forward for the Pact-Python ecosystem, and we are excited to see how this will help users in the future.

Check out the PR here: [Feat/async message consumer](https://github.com/pact-foundation/pact-python/pull/714)

Thanks Val 💛!

If you want to get involved, don't forget, we have a [Pact Compatibility suite](https://github.com/pact-foundation/pact-compatibility-suite) which is a set of BDD style tests to check compatibility between Pact implementations. There are full implementations in JVM, and Rust, with Tien over in Pact-PHP using it to guide and validate his Pact Rust core based implementation of Pact-PHP.

#### Pact-Python - Slack

Chat to us in: [#pact-python](https://pact-foundation.slack.com/archives/C9VECUP6E).

### Pact-PHP

The v10 Beta2 release is here, which includes the new pact_ffi 0.4.21 release and all the fixes that came along with it.

Check out the release notes [here](https://github.com/pact-foundation/pact-php/releases/tag/10.0.0-beta2)

Anyone can start testing pact-php with pact_ffi code by updating their `composer.json`

`"pact-foundation/pact-php": "10.0.0-beta2"`

This brings a raft of features to the Pact-PHP ecosystem including V4 Pact Specification support, access to the Pact Plugin ecosystem and huge speed benefits over the 9.x Ruby based release.

You can see a full range of examples [here](https://github.com/pact-foundation/pact-php/tree/master/example)

#### Pact-PHP - Slack

Chat to us in: [#pact-php](https://pact-foundation.slack.com/archives/C9W94PXPY).

## Community Events

Are you talking about Pact or contract-testing this year at an event? Why not let us know and get yourself featured!

## GitHub Merge Festival - Berlin

We had a great time at [GitHub's Merge festival in Berlin](https://merge.berlin/)), where we had the opportunity to meet some of you in person. It was great to see the community come together and share their experiences with Pact. We also had the opportunity to listen to some of the GitHub team and other event members, and discuss how we can continue to work together to make the developer experience even better.

If you are close to Berlin but didn't get to this event, don't miss the [WeAreDevelopers World Congress](https://www.wearedevelopers.com/world-congress) on 17-19 July 2024. We won't be there unfortunately, but it's a great event to attend if you are in the area.

![IMG_5893 (1)](https://github.com/pact-foundation/docs.pact.io/assets/19932401/7edfdf11-8f6e-4671-bc89-7d4cc97e510b)

It got pretty busy :)

![IMG_0025](https://github.com/pact-foundation/docs.pact.io/assets/19932401/5369aa19-3432-4ec0-90f0-62ab141a6d70)

## Brighton Java User Group

Bas Dijkstra is continuing his contract testing tour, this time in [Brighton on the 25th July](https://www.meetup.com/brighton-jug/events/299691382/), with the topic 'Solving the integration testing puzzle with contract testing'. If you are in the area, make sure to check it out.

### GopherConUK 2024

[Mark Bradley](https://mark-bradley.net/about/) will be speaking at [GopherConUK 2024](https://www.gophercon.co.uk/schedule),  14th-16th of August. He his topic will be "Using Pact to deploy Microservice with confidence". If you are attending, make sure to check out his talk.

![image](https://github.com/pact-foundation/docs.pact.io/assets/19932401/407ef1cc-1514-4456-ba14-6ead2f98c92e)

You can also check out some of his previous material on the topic of Pact, on his blog site here: [https://mark-bradley.net/tag/pact/](https://mark-bradley.net/tag/pact/).

## Community Videos

Made some cool video content showcasing Pact? Let us know to get featured!

### What is contract testing?

Check out Daniel Knott providing an introduction to contract testing, along with further reading to help aid your journey. Check it out on YouTube [here](https://www.youtube.com/watch?v=38egQLsbgKk). He covers many different testing topics, so this along with it others are certainly worthy of your time.

## Thats a wrap

Want to carry on the conversation? Sign up [here](https://slack.pact.io/) to join our Slack community, where you will be amongst over 5.5k other users. It's a safe place to ask questions, and a great place to share the awesome work you are doing in the Pact ecosystem.

Whatever you are up to, let us know, and we can look to get you featured in the Pact post.

See you next month folks!

Cheers,
Saf
