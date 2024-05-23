---
title: Pact Open Source Update — May 2024
author: Yousaf Nabi
authorURL: https://twitter.com/you54f
tags: [pact, oss, community]
keywords: [pact, oss, community]
date: 2024-05-23
draft: false
hide_table_of_contents: false
---

👋 It's May, and time is flying as we move into the 2nd half of the year. I'll be bringing you the usual updates from the world of Pact in the last month.

## Pact OSS Updates

## General Updates

- Alpine is now supported in the pact-reference core
- The builds are static, and therefore the single binary works across musl or glibc based distros (excluding ffi)
- pact_ffi library comes in both static `*.a` & shared `*.so` variants for musl, depending on the consuming client libraries requirements for ffi interop

| library              | alpine support | version                                                                                                            |
| -------------------- | -------------- | ------------------------------------------------------------------------------------------------------------------ | --- |
| pact_ffi             | ✅             | - `x86_64` `.a` from [0.2.4](https://github.com/pact-foundation/pact-reference/releases/tag/libpact_ffi-v0.2.4)    |
|                      |                | - `aarch64` `.a` from [0.4.15](https://github.com/pact-foundation/pact-reference/releases/tag/libpact_ffi-v0.4.15) |
|                      |                | - `.so` from [0.4.17](https://github.com/pact-foundation/pact-reference/releases/tag/libpact_ffi-v0.4.17)          |     |
| pact_mock_server_cli | ✅             | - [1.0.5](https://github.com/pact-foundation/pact-reference/releases/tag/pact_mock_server_cli-v1.0.5)              |
| pact_verifier_cli    | ✅             | - [1.1.1](https://github.com/pact-foundation/pact-reference/releases/tag/pact_verifier_cli-v1.1.1)                 |
| pact-stub-server     | ✅             | - [0.6.0](https://github.com/pact-foundation/pact-stub-server/releases/tag/v0.6.0)                                 |
| pact-plugin-cli      | ✅             | - [0.1.2](https://github.com/pact-foundation/pact-plugins/releases/tag/pact-plugin-cli-v0.1.2)                     |
| pact-protobuf-plugin | ✅             | - [0.3.15](https://github.com/pactflow/pact-protobuf-plugin/releases/tag/v-0.3.15)                                 |
| pact-csv-plugin      | ✅             | - [0.0.6](https://github.com/pact-foundation/pact-plugins/releases/tag/csv-plugin-0.0.6)                           |

## Specific language updates

### PHP

#### Pact-PHP V10 Beta Release

The v10 Beta release has landed due to an epic amount of work from [Tien Vo Xuan](https://github.com/Tienvx) and [Lewis Cowles](https://github.com/Lewiscowles1986)

Check out the release notes [here](https://github.com/pact-foundation/pact-php/releases/tag/10.0.0-beta1)

Anyone can start testing pact-php with pact_ffi code by updating their `composer.json`

`"pact-foundation/pact-php": "10.0.0-beta1"`

This bring a raft of features to the Pact-PHP ecosystem including V4 Pact Specification support, access to the Pact Plugin ecosystem and huge speed benefits over the 9.x Ruby based release.

You can see a full range of examples [here](https://github.com/pact-foundation/pact-php/tree/master/example)

#### Pact-PHP Alpine Support

You'll also be pleased to know, that the `10.0.0-beta1` is the first of the client libraries to support Alpine! 🎉

#### Pact-PHP - Slack

Chat to us in: [#pact-php](https://pact-foundation.slack.com/archives/C9W94PXPY).

### Pact-Reference

#### Pact-Reference - Pact FFI

`0.4.20` of libpact_ffi was [released](https://github.com/pact-foundation/pact-reference/releases/tag/libpact_ffi-v0.4.20)

This release allows optional query parameter values, as well as fixing a pesky warning that was cluttering users consoles. It also pins our shared library to glibc 2.23 for linux gnu targets (non-musl). This allows users of RHEL8 and other older supported distros to still utilise the pact_ffi library, as well as those on later distributions.

- [`feat: optional query parameter values`](https://github.com/pact-foundation/pact-reference/pull/411)
- [`fix: downgrade JSON parsing from warn to debug in from_integration_json_v2`](https://github.com/pact-foundation/pact-reference/commit/e3dc2658927ce8816769d9df69bf4e6c4feef11f)
- [`chore: build linux x86_64 ffi against glibc 2.23`](https://github.com/pact-foundation/pact-reference/commit/adf6379ad52f904636d7f761923f124df601e293)

#### Pact-Reference - Pact Mock Server

Ron has started a redesign/rewrite for a V2 version of the Pact Reference Mock Server, and would find it easier to support multiple versions with branches it the crate is not in a mono-repo (pact-reference).

Therefore the action was taken to move it from its home in [pact-reference](https://github.com/pact-foundation/pact-reference/tree/master/rust/pact_mock_server) to its own [repository](https://github.com/pact-foundation/pact-core-mock-server)

You can find it here https://github.com/pact-foundation/pact-core-mock-server

- The pact_mock_server code resides [here](https://github.com/pact-foundation/pact-core-mock-server/tree/main/pact_mock_server)
- The pact_mock_server_cli code resides [here](https://github.com/pact-foundation/pact-core-mock-server/tree/main/pact_mock_server_cli)

#### Pact-Reference - Pact Stub Server

A couple of features dropped to

- [Reduce binary size of all executables](https://github.com/pact-foundation/pact-stub-server/pull/64)
- [Build Linux executables statically built with `musl`](https://github.com/pact-foundation/pact-stub-server/pull/63)
- [Add Windows Arm64 Support](https://github.com/pact-foundation/pact-stub-server/pull/63)
- [Publish images to Github Container Registry](https://github.com/pact-foundation/pact-stub-server/issues/61)

#### Pact-Reference - Pact Stub Server - Docker

##### Pact-Reference - Pact Stub Server - Docker - Supported Platforms

Multi-platform images are available, and can be used cross-platform by setting the `platform` flag.

- `--platform=linux/amd64`
- `--platform=linux/arm64`

```console,ignore
  docker run --platform=linux/arm64 -t -p 8080:8080 -v "$(pwd)/pacts/:/app/pacts" pactfoundation/pact-stub-server -p 8080 -d pacts
```

##### Pact-Reference - Pact Stub Server - Docker - Supported Registries

Docker images are published to multiple registries

- [DockerHub Image](https://hub.docker.com/r/pactfoundation/pact-stub-server)
- [GitHub Container Image](https://github.com/pact-foundation/pact-stub-server/pkgs/container/pact-stub-server)

#### Pact-Reference - Pact Stub Server - Supported Platforms

| OS      | Architecture | Supported | Pact Stub Server Version |
| ------- | ------------ | --------- | ------------------------ |
| OSX     | x86_64       | ✅        | All                      |
| Linux   | x86_64       | ✅        | All                      |
| Windows | x86_64       | ✅        | All                      |
| OSX     | arm64        | ✅        | >=0.5.2                  |
| Linux   | arm64        | ✅        | >=0.5.2                  |
| Windows | arm64        | ✅        | >=0.6.0                  |
| Alpine  | x86_64       | ✅        | >=0.6.0                  |
| Alpine  | arm64        | ✅        | >=0.6.0                  |

_Note:_ From v0.6.0, Linux executables are statically built with `musl` and as designed to work against `glibc` (eg, Debian) and `musl` (eg, Alpine) based distos.

#### Pact-Reference - Slack

Chat with us in: [#pact-rust](https://pact-foundation.slack.com/archives/CA2S7E6KC).

### Pact-Plugins

A couple of features dropped to

- [Reduce binary size of all executables](https://github.com/pact-foundation/pact-plugins/pull/59)
- [Build Linux executables statically built with `musl`](https://github.com/pact-foundation/pact-plugins/pull/58)
- [Add Windows Arm64 Support](https://github.com/pact-foundation/pact-plugins/pull/58)

#### Pact-Plugin-CLI - Supported Platforms

| OS      | Architecture | Supported | Pact Plugin CLI Version |
| ------- | ------------ | --------- | ----------------------- |
| OSX     | x86_64       | ✅        | All                     |
| Linux   | x86_64       | ✅        | All                     |
| Windows | x86_64       | ✅        | All                     |
| OSX     | arm64        | ✅        | All                     |
| Linux   | arm64        | ✅        | >=0.0.4                 |
| Windows | arm64        | ✅        | >=0.1.2                 |
| Alpine  | x86_64       | ✅        | >=0.1.2                 |
| Alpine  | arm64        | ✅        | >=0.1.2                 |

_Note:_ From v0.1.2, Linux executables are statically built with `musl` and as designed to work against `glibc` (eg, Debian) and `musl` (eg, Alpine) based distos.

#### Pact-CSV-Plugin - Supported Platforms

| OS      | Architecture | Supported | Pact CSV Plugin Version |
| ------- | ------------ | --------- | ----------------------- |
| OSX     | x86_64       | ✅        | All                     |
| Linux   | x86_64       | ✅        | All                     |
| Windows | x86_64       | ✅        | All                     |
| OSX     | arm64        | ✅        | >=0.0.1                 |
| Linux   | arm64        | ✅        | >=0.0.4                 |
| Windows | arm64        | ✅        | >=0.0.6                 |
| Alpine  | x86_64       | ✅        | >=0.0.6                 |
| Alpine  | arm64        | ✅        | >=0.0.6                 |

_Note:_ From v0.0.6, Linux executables are statically built with `musl` and as designed to work against `glibc` (eg, Debian) and `musl` (eg, Alpine) based distos.

#### Pact-Protobuf-Plugin

A couple of features dropped to

- [Reduce binary size of all executables](https://github.com/pactflow/pact-protobuf-plugin/commit/652fbd4b189517bfce8f8296cc5a2e6b8be8fbb2)
- [Build Linux executables statically built with `musl`](https://github.com/pactflow/pact-protobuf-plugin/commit/99cdd58f7f3b4cd8219c089b8ecdc9bfadfe02d8)
- [Add Windows Arm64 Support](https://github.com/pactflow/pact-protobuf-plugin/commit/99cdd58f7f3b4cd8219c089b8ecdc9bfadfe02d8)

And we saw a community fix from new contributor [Eric Muller](https://github.com/ermul) in this PR

- [fix: respect package namespaces when resolving message descriptors](https://github.com/pactflow/pact-protobuf-plugin/pull/60)

#### Pact-Protobuf-Plugin - Supported Platforms

| OS      | Architecture | Supported | Pact Protobuf Plugin Version |
| ------- | ------------ | --------- | ---------------------------- |
| OSX     | x86_64       | ✅        | All                          |
| Linux   | x86_64       | ✅        | All                          |
| Windows | x86_64       | ✅        | All                          |
| OSX     | arm64        | ✅        | All                          |
| Linux   | arm64        | ✅        | >=0.1.11                     |
| Windows | arm64        | ✅        | >=0.3.15                     |
| Alpine  | x86_64       | ✅        | >=0.1.9                      |
| Alpine  | arm64        | ✅        | >=0.3.15                     |

_Note:_ From v0.3.15, All Linux executables are statically built with `musl` and are designed to work against `glibc` (eg, Debian) and `musl` (eg, Alpine) based distos.

#### Pact-Protobuf-Plugin - Slack

Have you tried out Pact Plugins yet? What's stopping you?

Chat with us in: [#pact-plugins](https://pact-foundation.slack.com/archives/CA2S7E6KC).

### Golang

Pact-go:

[`v2.0.5` is out](https://github.com/pact-foundation/pact-go/releases/tag/v2.0.5) which includes [Janez Justin's](https://github.com/jjustin) change [we spoke about last month](https://docs.pact.io/blog/2024/04/26/pact-open-source-update-april-2024#golang) and updates several dependencies in the project.

Chat with us in: [#pact-go](https://pact-foundation.slack.com/archives/C9UTHTFFB).

### Pact-JS

Pact JS Core saw a few new fixes, which thanks to npm's package resolution and our use of a caret in our dependency of `@pact-foundation/pact-core` in `@pact-foundation/pact`, means you will pull in the latest fixes, without a new release of `@pact-foundation/pact`

- [fix: update standalone to 2.4.4](https://github.com/pact-foundation/pact-js-core/pull/509)
  - This updates to Ruby 3.3.1
- [fix: update pact-ffi to 0.4.20](https://github.com/pact-foundation/pact-js-core/pull/505)
  - This resolves [pact-core@14.3.4: Failed to load native module in Linux-x64 platform (redhat ubi8 minimal)](https://github.com/pact-foundation/pact-js-core/issues/502)
- [fix: node doesn't run .bat files on windows](https://github.com/pact-foundation/pact-js-core/pull/504)
  - This may have caused this issue: [https://github.com/pact-foundation/pact-js-core/issues/506](https://github.com/pact-foundation/pact-js-core/issues/506). Are you affected? Let us know in the issue, or drop us a PR to resolve.

#### Pact-JS - Alpine support

A [pull request](https://github.com/pact-foundation/pact-js-core/pull/507) has gone in to bring alpine/musl support to pact-js-core and pact-js. It will close this [open RFC](https://github.com/pact-foundation/pact-js-core/issues/490).

Please feel free to take a look, drop a review, or a comment to say that this is a feature you would like!

If you'd rather wait until its released, please try it out in your projects and let us know how you get on.

#### Pact-JS - Slack

Chat with us in: [#pact-js](https://pact-foundation.slack.com/archives/C9VBGLUM9).

### Python

Pact-Python:

Pact Pythons core maintainer has been enjoying a well-earned holiday for the last month, and in true open-source style, 2 new contributors arrived, wanting to get involved in extending the Pact Rust FFI support in Pact-Python.

Shout outs go to [David Rettie](https://github.com/qmg-drettie) & [Val Kolovos](https://github.com/valkolovos), who are getting involved. It all started with a question

> hello! I'm interested in putting some time into helping out with the pact V3/ffi tasks. I've been familiarising myself with the codebase and work done so far, I'm wondering if any other contributors or maintainers would like to have a call to help me get on the right track ?

Val dove in head first and naturally came up against a few blockers, questions are always welcome, especially as the help often paves the way for others.

> I'm currently working to implement the v3 message_consumer.feature test. I've made pretty good progress, but I just got stuck on generators. I haven't been able to find anything in any of the other languages, so I was hoping someone here might be able to point me in the right direction.

Val has currently assigned himself to one of the tasks: [Add support and example for a message consumer test using Rust engine](https://github.com/pact-foundation/pact-python/issues/380) and we wish him luck!

If you want to get involved, don't forget, we have a [Pact Compatibility suite](https://github.com/pact-foundation/pact-compatibility-suite) which is a set of BDD style tests to check compatibility between Pact implementations. There are full implementations in JVM, and Rust, with Tien over in Pact-PHP using it to guide and validate his Pact Rust core based implementation of Pact-PHP.

Chat to us in: [#pact-python](https://pact-foundation.slack.com/archives/C9VECUP6E).

## Community Events

### Praveen Erode Mohanasundaram - Contract Testing: The Key to Unlocking E2E Testing Bottlenecks in CI/CD pipelines

Long time Pact advocate and community contributor [Praveen Erode Mohanasundaram](https://www.linkedin.com/in/praveen-em/) spoke at Devoxx UK about Contract Testing: The Key to Unlocking E2E Testing Bottlenecks in CI/CD pipelines.

I'll let Praveen give an overview of his talk

> As organisations embrace microservices architecture to achieve rapid, independent deployments, they often encounter obstacles that impede these benefits. A common challenge is an overreliance on traditional end-to-end testing strategies, which, while providing confidence, can slow deployment, create dependencies, and limit team autonomy.

> Drawing from the transformative journey at Discover Financial Services, where we navigated the challenges of modernising systems into a microservices architecture, this presentation will delve into the hurdles encountered, the pivotal role of contract testing in overcoming these challenges, various contract testing strategies and open source tools, and our evolutionary path towards embracing contract testing. Join me to discover how this approach became the catalyst for removing bottlenecks in our CI/CD pipeline, unlocking the true potential of microservices for unparalleled agility and success

Interested? Well lucky for you, [you can catch the video on YouTube](https://www.youtube.com/watch?v=RSl_JcWKE3M) 📺

### TestGuild - Getting the Most Out of Open Source with Yousaf Nabi

[![TestGuild Yousaf Podcast](https://cdn-bojkm.nitrocdn.com/xNQtoampyRQBytOGuBcersslgKBwHfMI/assets/images/optimized/rev-a0b32fd/testguild.com/wp-content/uploads/2024/05/Yousaf-Nabi-TestGuild_DevOps-Toolchain-without-sponsor-1200x0-c-default.jpg)](https://testguild.com/podcast/performance/p146-yousaf/)

I recently spoke with Joe Colantonio about all things open-source, you can check it out via multiple mediums via the [links](https://testguild.com/podcast/performance/p146-yousaf/) on the TestGuild site, whether you prefer watching a video or listening to a podcast, Joe has got you covered.

## Book updates - Contract Testing in Action

[![Contract Testing In Action book cover](/img/books/cover_contract_testing_in_action_small.png)](https://mng.bz/gv8l)

Another 4 chapters have just dropped for the book Contract Testing in Action on Manning, written by Marie Cruz and Lewis Prescott.

If you are new to Pact, be sure to check it out! :tada:

:::info
🥷 Don't forget!

You can use `CTA45` between April 29 to July 30 to save 45% 🤑

🎥 If you want to give the book some promotion, or offer a quote, reach out to [Marie](https://www.testingwithmarie.com/about), [Lewis](https://www.pactman.co.uk/) or [myself](mailto:you@saf.dev)
:::

## Thats a wrap

Want to carry on the conversation? Sign up [here](https://slack.pact.io/) to join our Slack community, where you will be amongst over 5.5k other users. It's a safe place to ask questions, and a great place to share the awesome work you are doing in the Pact ecosystem.

Whatever you are up to, let us know, and we can look to get you featured in the Pact post.

See you next month folks!

Cheers,
Saf
