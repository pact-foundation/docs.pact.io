---
title: Pact Open Source Update — August 2024
author: Yousaf Nabi
authorURL: https://twitter.com/you54f
tags: [pact, oss, community]
keywords: [pact, oss, community]
date: 2024-08-29
draft: false
hide_table_of_contents: false
---

👋🏽 Welcome to the August Pact Blog, where we'll be covering all the updates in the Pact ecosystem along with events & material you've been sharing across the web.

## Pact OSS Updates

## General Updates

### Pact RFC Process

We mentioned an RFC process being introduced into the Pact ecosystem, last month, I'm pleased to say the [PR](https://github.com/pact-foundation/roadmap/pull/96) has been merged, so I would invite users to begin to raise new RFC's where appropriate as we would love users to participate and help shape the future of Pact you want to see.

## Specific language updates

### Pact-Reference

[Max Campman](https://github.com/MaxCampman) dropped a PR [here](https://github.com/pact-foundation/pact-reference/pull/459) to allow non-object matchers for array-contains.

Whilst Ron performed few fixes and incorporated the v2 Pact mock server into the Pact reference libraries

- [feat(pact_consumer): Upgrade pact_mock_server to the new 2.0.0 version](https://github.com/pact-foundation/pact-reference/commit/111a18cd4ef93b0a9337f5a3c31d22b5949fa6a3)
- [fix(pact_models): ProviderStateGenerator name was not correct](https://github.com/pact-foundation/pact-reference/commit/8387b9e18022351a4d3b996100d9f3bfff4589f8)
- [fix(pact_verifier): Provider state values should be passed to any plugins under a providerState key](https://github.com/pact-foundation/pact-reference/commit/80b7bb5815c25a5c11254166b6b56484151e951a)
- [fix(pact_models): Provider state values may be passed in under a "providerState" key](https://github.com/pact-foundation/pact-reference/commit/50fc022cabb0f93a8cca1be5d8f13695db43bd5d)
- [fix(pact_verifier): Plugin feature was not enabled in the verifier](https://github.com/pact-foundation/pact-reference/commit/ae7d2a9ce95f2df9613788508308c247f2c3c9b3)
- [fix(plugins): Plugin config needs to have seperate values for HTTP request and response parts](https://github.com/pact-foundation/pact-reference/commit/e6f8ae463dda126051c997d39774e1b57dccf21d)

If you are a user of the Pact FFI library, we're hoping to see a new version released very soon with all of the above changes included.

#### Pact Mock Server

[v2.0.1](https://github.com/pact-foundation/pact-core-mock-server/releases/tag/libpact_mock_server-v2.0.1) was released, which defaults the Pact spec version to the version from the Pact if not overridden.

#### Pact-Reference - Slack

Chat with us in: [#pact-rust](https://pact-foundation.slack.com/archives/CA2S7E6KC).

### Pact-Plugins

[v0.5.0](https://github.com/pactflow/pact-protobuf-plugin/releases/tag/v-0.5.0) of the pact-protobuf-plugin was released and contains the following features:

* Supports injecting provider state values into message fields and gRPC metadata
  * An example of usage is provided [here](https://github.com/pact-foundation/pact-plugins/tree/main/examples/gRPC/provider-states)

* [Better use of package names in resolving messages](https://github.com/pactflow/pact-protobuf-plugin/pull/70) (Thanks to [@stan-is-hate](https://github.com/stan-is-hate) for this mammoth effect and offer thanks to [Eric Muller](https://github.com/ermul) who also took time to review.).

 :::warning Compatibility note
 The plugin is backwards compatible (with a caveat for message provider), but not forwards compatible, therefore it is advised that users update usage to the 0.5.0 or [greater](https://github.com/pactflow/pact-protobuf-plugin/releases/tag/v-0.5.0)
 :::

[v0.5.1](https://github.com/pactflow/pact-protobuf-plugin/releases/tag/v-0.5.1) of the pact-protobuf-plugin was released and fixes handling of `google.Structs` correctly as raised in this [issue](https://github.com/pactflow/pact-protobuf-plugin/issues/71).

An example of usage is provided [here](https://github.com/pact-foundation/pact-plugins/tree/main/examples/protobuf/test_google_struct)

[v0.5.2](https://github.com/pactflow/pact-protobuf-plugin/releases/tag/v-0.5.2) of the pact-protobuf-plugin was released and fixes fixes HTTP Protobuf interactions can have a message defined for both the request and response parts.

Ron also added some examples in both JVM and Rust, for tests which use HTTP and gRPC transports in the same test. You can find them [here](https://github.com/pact-foundation/pact-plugins/tree/main/examples/gRPC/http-plus-grpc)

#### Pact-Plugins - Slack

Have you tried out Pact Plugins yet? What's stopping you?

Chat with us in: [#pact-plugins](https://pact-foundation.slack.com/archives/CA2S7E6KC).

### Pact-Go

Pact-Go [`v2.0.7`](https://github.com/pact-foundation/pact-go/releases/tag/v2.0.7) has been released which updates libpact_ffi to `0.4.22` & adds Windows CI coverage.

#### Pact-Go - Slack

Chat with us in: [#pact-go](https://pact-foundation.slack.com/archives/C9UTHTFFB).

### Pact-Python

[Val Kolovos](https://github.com/valkolovos) has continued adding features for pact-python, after the [blog post](https://pact-foundation.github.io/pact-python/blog/2024/07/26/asynchronous-message-support/) announcing async message support in pact-python using the new rust core, he is now working on introducing [matchers](https://github.com/pact-foundation/pact-python/pull/761).

If you want to get involved, don't forget, we have a [Pact Compatibility suite](https://github.com/pact-foundation/pact-compatibility-suite) which is a set of BDD style tests to check compatibility between Pact implementations. There are full implementations in JVM, and Rust, with Tien over in Pact-PHP using it to guide and validate his Pact Rust core based implementation of Pact-PHP.

#### Pact-Python - Slack

Chat to us in: [#pact-python](https://pact-foundation.slack.com/archives/C9VECUP6E).

### Pact-PHP

[Artur Neumann](https://github.com/individual-it) dropped in a [documentation PR](https://github.com/pact-foundation/pact-php/pull/620), to help users test multiple interactions, in a single test, thanks!

#### Pact-PHP - Slack

Chat to us in: [#pact-php](https://pact-foundation.slack.com/archives/C9W94PXPY).

### Pact Ruby

Want to see V3 & V4 Pact Specification support in Pact-Ruby?

So do we!

There are two ways we can achieve this.

1. Utilise the Pact Rust FFI
2. Implement V3 & V4 spec support in Ruby

The latter option is less preferable, as by reusing the Rust FFI across all of our Pact client libraries, we aim to provide a consistent set of functions and experiences for users. However this may present a paradigm change to existing Ruby users, who had the benefit of using the Pact Core built in Ruby natively, whereas other language users relied on the Pact Ruby Gems being distributed in a standalone mechanism.

We are tracking work across three tickets

- [V3 Spec](https://github.com/pact-foundation/pact-ruby/issues/318)
- [V4 Spec](https://github.com/pact-foundation/pact-ruby/issues/319)
- [Pact Rust FFI Integration](https://github.com/pact-foundation/pact-ruby/issues/317)

Please feel free to have the issues and see if you can help!

Chat to us in: [#pact-ruby](https://pact-foundation.slack.com/archives/C9VHVEDE1).

### Pact-Compatibility-Suite

A Set of BDD style tests to check compatibility between Pact implementations has been created in the [pact-compatibility-suite](https://github.com/pact-foundation/pact-compatibility-suite)

Current examples

- [pact-rust](https://github.com/pact-foundation/pact-reference/tree/master/compatibility-suite)
- [pact-jvm](https://github.com/pact-foundation/pact-jvm/tree/master/compatibility-suite)
- [pact-php](https://github.com/pact-foundation/pact-php/tree/master/compatibility-suite)
- [pact-python](https://github.com/pact-foundation/pact-python/tree/master/tests/v3/compatibility_suite)
- [pact-ruby-ffi](https://github.com/YOU54F/pact-ruby-ffi/tree/main/compatibility-suite)

In order to validate pact-go, pact-js & pact-ruby and it's adherence to the pact-specification, it would be good to begin to implement the following tickets.

- [Verify Pact-Go against pact-compatibility-suite](https://github.com/pact-foundation/pact-go/issues/449)
- [Verify Pact-JS against pact-compatibility-suite](https://github.com/pact-foundation/pact-js/issues/1235)
- [Verify Pact-Ruby against pact-compatibility-suite](https://github.com/pact-foundation/pact-ruby/issues/321)

Anyone is welcome to start implementing these, we are beginning to see contributors to pact-pythons v3/v4 implementation, so why not join in?

## Community Events

Are you talking about Pact or contract-testing this year at an event? Why not let us know and get yourself featured!

### Mark Bradley - GopherConUK 2024 (Talk)

[Mark Bradley](https://mark-bradley.net/about/) spoke at [GopherConUK 2024](https://www.gophercon.co.uk/schedule) about "Using Pact to deploy Microservice with confidence". Thanks Mark, we will be reaching out to send you some swag!

![Mark at GopherConUK](https://pbs.twimg.com/media/GVHzUEbWEAAFB4n?format=jpg&name=small)

### Augusto Colombelli - Contract Tests — APIs Guided by Consumers (Blog)

[Augusto Colombelli](https://github.com/augustocolombelli) dropped in a [PR](https://github.com/pact-foundation/docs.pact.io/pull/336) to list his latest blog __Contract Tests — APIs Guided by Consumers__, which you can read over on Medium [here](https://medium.com/@augustocolombelli/contract-tests-apis-guided-by-consumers-caf8f2460e7c).

### Bas Djistrka - Practical contract testing with Pact (Course)

Bas Djistraka from [OnTestAutomation](https://www.ontestautomation.com/) has just published details on his newest course, Practical contract testing with Pact. I'll let Bas describe it in his own words.

> Contract testing is an approach that addresses the challenges of large-scale integration and E2E testing in distributed systems. It is not a new technique, in fact, it has been around for several years now, but unfortunately there aren't many good introductions, examples and use cases that clearly show the added value of contract testing, and how it can help speed up integration testing.
>
> This course is designed to change that. Through hours of videos, quizzes and hands-on programming exercises, you will learn everything you need to know about contract testing, Pact and the tools in the Pact ecosystem.

You can take a look at the https://ontestautomation.teachable.com/p/practical-contract-testing-with-pact to find out more and sign up.

:::info Discounts inside
Bas has kindly provided a discount code `PACTFLOW-IO` which will take 15% off the price, it's valid until the end of the year, so what are you waiting for?
:::

## Thats a wrap

Want to carry on the conversation? Sign up [here](https://slack.pact.io/) to join our Slack community, where you will be amongst over 5.8K other users. It's a safe place to ask questions, and a great place to share the awesome work you are doing in the Pact ecosystem.

Whatever you are up to, let us know, and we can look to get you featured in the Pact post.

See you next month folks!

Cheers,
Saf
