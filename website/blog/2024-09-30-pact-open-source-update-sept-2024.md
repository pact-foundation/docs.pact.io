---
title: Pact Open Source Update — September 2024
author: Yousaf Nabi
authorURL: https://twitter.com/you54f
tags: [pact, oss, community]
keywords: [pact, oss, community]
date: 2024-09-30
draft: false
hide_table_of_contents: false
---

👋🏽 Welcome to the September Pact Blog, where we'll be covering all the updates in the Pact ecosystem along with events & material you've been sharing across the web.

## Pact OSS Updates

### Pact-Plugins

Back in March, [we mentioned](https://docs.pact.io/blog/2024/07/30/pact-open-source-update-july-2024#pact-go) an issue when leveraging the Pact-Plugin framework with Pact-Go.

I'm pleased to say that the fix in the pact-plugins repo, was [accepted and merged](https://github.com/pact-foundation/pact-plugins/pull/69), to change the loading mechanism for plugins, from Tokio tasks, to System threads.

#### Pact-Plugins - Slack

Chat with us in: [#pact-plugins](https://pact-foundation.slack.com/archives/CA2S7E6KC).

### Pact-JS

Pact-JS-CLI is now smaller, and leaner, with os/arch specific npm packages created for all
supported platforms, thanks to this [PR](https://github.com/pact-foundation/pact-js-cli/pull/14). The resolution for packages should be invisible to the end user, resulting in smaller downloads, and less disk-space being used by redundant files.

Available from V16.x - See the release notes for more [detail](https://github.com/pact-foundation/pact-js-cli/releases/tag/v16.0.0)

:::info TL;DR
    $ npx --package=@pact-foundation/pact-cli -c 'pact-broker version'
    1.76.1
:::

Want to see the same change in pact-js-core? Why not let us know!

#### Pact-JS - Slack

Chat with us in: [#pact-js](https://pact-foundation.slack.com/archives/C9VBGLUM9)

### Pact-Go

The pact-plugin update to switch from tokio tasks, to system threads was accepted, which allowed us to add the [change](https://github.com/pact-foundation/pact-go/pull/451) to Pact-Go, hopefully fixing random panics during plugin based tests, highlighted in this [issue](https://github.com/pact-foundation/pact-go/issues/269).

Initial feedback is really positive. If you had this issue before, and it now appears to be resolved, why not let us know?

CGO or not to CGO? - In an infamous post by Dave Cheney, he mentions [cgo is not go](https://dave.cheney.net/2016/01/18/cgo-is-not-go), and the mandatory requirement of cgo, in pact-go v2 has caused some users issues in initial setup. We have the potential to mitigate this requirement, by leveraging a project called [ebitengine/purego](https://github.com/ebitengine/purego), which describes itself as a library for calling C functions from Go, without Cgo. You can track the [issue](https://github.com/pact-foundation/pact-go/issues/452) and associated pull request, to find out more.

Alpine Linux - We've been trying to get Pact working across alpine, natively, for all of our supported client languages, GoLang included. Follow the progress [here](https://github.com/pact-foundation/pact-go/issues/453). We are blocked at the moment due to some segfaults during the verification process and would appreciate any extra eyes, if this feature enhancement would be useful to you.

#### Pact-Go - Slack

Chat with us in: [#pact-go](https://pact-foundation.slack.com/archives/C9UTHTFFB).

### Pact-Python

Some examples using the Pact-Python V3 interface, have now been included in the repo, thanks to [Amit S](https://github.com/amit828as) in this [PR](https://github.com/pact-foundation/pact-python/pull/783).

[Val Kolovos](https://github.com/valkolovos) is also working on a Matcher proof of concept [here](https://github.com/pact-foundation/pact-python/pull/761) in order to try and complete this open [issue](https://github.com/pact-foundation/pact-python/issues/746) to Implement a `Matcher` interface.

#### Pact-Python - Slack

Chat to us in: [#pact-python](https://pact-foundation.slack.com/archives/C9VECUP6E).

### Pact-PHP

Tien has began some incremental improvements in Pact-PHP V10, now that that v10 is now GA.

Two notable additions include

- [feat: All custom provider headers](https://github.com/pact-foundation/pact-php/pull/627)
- [feat: Add graphql example](https://github.com/pact-foundation/pact-php/pull/634)

These changes are currently on the master branch and unreleased, so will require to use the [`dev-master`](https://packagist.org/packages/pact-foundation/pact-php#dev-master) version if you want to pick them up.

#### Pact-PHP - Slack

Chat to us in: [#pact-php](https://pact-foundation.slack.com/archives/C9W94PXPY).

### Pact Ruby

[@trammel](https://github.com/trammel) submitted a [PR](https://github.com/pact-foundation/pact-ruby/pull/322) to remove webrick from a dependency to a dev-dep over in pact-ruby, however it will need [pact_mock-service](https://github.com/pact-foundation/pact-mock_service) to be updated to use an alternative over webrick, and to be able to drop it as a runtime dependency completely. If anyone fancies attempting this, please let us know.

Webrick suffered a round of CVE's recently, so the Pact ruby ecosystem has been updated (pact-ruby-cli, pact-ruby-standalone, pact-broker).

#### Pact-Ruby - Slack

Chat to us in: [#pact-ruby](https://pact-foundation.slack.com/archives/C9VHVEDE1).

### Pact Broker

:::warning Deprecation notices

- Support for the [`dius/pact-broker` image](https://github.com/DiUS/pact_broker-docker), is no longer provided. Migration notes are provided [here](https://docs.pact.io/pact_broker/docker_images/pactfoundation#migrating-from-the-diuspact-broker-image). See this issue for [background.](https://github.com/pact-foundation/docs.pact.io/issues/242)
- MySQL is [not supported (since 2021)](https://github.com/pact-foundatio/pact_broker?tab=readme-ov-file#rolling-your-own) as a Pact Broker Database with the official recommendation of PostGres for production, and sqlite for testing.
:::

The Pact Broker image was updated to leverage Ruby 3.3.5 in v2.122.0.

#### Pact Broker Chart

[Shane Hull](https://github.com/shanehull) added the ability to set svc annotations, check out his PR [here](https://github.com/pact-foundation/pact-broker-chart/pull/88). It was merged and released this month.

#### Pact-Broker - Slack

Chat to us in: [#pact-broker](https://pact-foundation.slack.com/archives/C9VPNUJR2).

### Pact Net

Pact-Net V5 Beta 3 has now been [released](https://github.com/pact-foundation/pact-net/releases/tag/5.0.0-beta.3). It [contains several fixes and features](https://github.com/pact-foundation/pact-net/milestone/5?closed=1), including leveraging the latest pact ffi 0.4.23

V5 of pact-net is considered to be pretty stable, and is being used in a few production workflows and we expect it to become GA very soon. If you want to leverage the Pact V4 Specification, which will allow you to have multiple interaction types in a single Pact file, you should upgrade now!

#### Pact-Net - Slack

Chat to us in: [#pact-broker](https://pact-foundation.slack.com/archives/C9UTHV2AD).

## Community Events

Are you talking about Pact or contract-testing this year at an event? Why not let us know and get yourself featured!

### Murat K Ozcan - A triple whammy of contract testing posts

[Murat](https://github.com/muratkeremozcan) has recently been taking an adventure in the world of Pact, after picking up Marie & Lewis' [Contract testing in Action book](https://www.manning.com/books/contract-testing-in-action). He has written 3 posts which are well worth a read.

- [My thoughts and notes about Consumer Driven Contract Testing](https://dev.to/muratkeremozcan/my-thoughts-and-notes-about-consumer-driven-contract-testing-11id)
- [Strengthening Pact Contract Testing with TypeScript and Data Abstraction](https://dev.to/muratkeremozcan/-strengthening-pact-contract-testing-with-typescript-and-data-abstraction-16hc)
- [Handling Pact Breaking Changes Dynamically in CI/CD](https://dev.to/muratkeremozcan/handling-pact-breaking-changes-dynamically-in-cicd-3dl4)

## Pact & AI

Generative AI, has become a dining room table topic and you may be wondering how it may impact the world of contract testing.

Both Matt and I take you through a 3-part journey, where we explore the importance of contract testing, the potential of Generative AI, and how PactFlow have turned a concept into reality, harnessing the power of GenAI, Pact best practice, and up to date knowledge of our consumer DSL's in order to allow you to unlock the value potential of contract testing sooner.

- [The Case for Contract Testing: Cutting Through API Integration Complexity](https://pactflow.io/blog/ai-automation-part-1/)
- [Unpacking GenAI’s Role in Contract Testing](https://pactflow.io/blog/ai-automation-part-2/)
- [Bridging Development Gaps with AI-Augmented Contract Testing](https://pactflow.io/blog/ai-automation-part-3/)

## Pact & AsyncAPI

The PactFlow team support a tool, called [swagger-mock-validator](https://github.com/pactflow/swagger-mock-validator), which allows you to compare a Pact file containing HTTP interactions, against an OpenAPI document. Originally created by Atlassian, it opened up broader use-cases than the traditional consumer driven approach with Pact, of replaying the interactions against a running provider, however does not offer as strong a guarantee, as it is reliant on the actual implemented provider, not drifting from the api description that is presented to consumers.

Whilst provider drift, is something that the industry has not fully addressed, (the ability to ensure a provider implementation completely honours its API description), the demand for static comparison tools to compare Pact files, is still there.

There is potential to couple both approaches, using API design documents as central points of truth. Using Pacts powerful DSL to generate consumer contracts. Using static comparison tools to ensure they honour the API description. If they differ, a proposal must be made in the documentation to reflect this. Pact plays a role in the verification of the provider, by replaying the Pact interactions, it mitigates provider drift from the consumer contract perspective, which with a static comparison tool, has been proven to adhere to the API description, eliminating provider drift for the known consumed endpoints in use.

Maybe in the future, we will see Pact being API description aware, in order to verify the implementation adheres to the API description.

However in the interim, one of the most requested comparison features, was Pact vs AsyncAPI.

AsyncAPI, for those who are unaware, is an API description format that covers event-driven systems, which consume or send messages, with a particular content format. The messages themselves may be transmitted over any number of different protocols, described as bindings in the AsyncAPI.

Message Pact, allows for the contract testing of service messages, without being interested in how the messages themselves are transmitted.

A recent introduction to the Pact ecosystem, exposed a plugin mechanism, which allows users to create their own custom content-type matcher & transport capabilities, which allows Pact users to consider content-types and transport capabilities not currently available in Pact, but leveraged in AsyncAPI based descriptions.

In order to try and progress momentum in providing a way to users to leverage AsyncAPI in their Pact journeys, I have created [`pact-asyncapi-comparator`](https://github.com/YOU54F/pact-asyncapi-comparator).

It is currently not released to npm, so you will have to clone and build the project locally.

It will allow for the comparison of `application/json` message content, in a V3 or V4 specification Pact file, against a valid AsyncAPI 2.x/3.x document.

I'd love for message pact users, to give it a go, and if it doesn't cover your use case, let me know in the issues section.

## Thats a wrap

Want to carry on the conversation? Sign up [here](https://slack.pact.io/) to join our Slack community, where you will be amongst over 5.8K other users. It's a safe place to ask questions, and a great place to share the awesome work you are doing in the Pact ecosystem.

Whatever you are up to, let us know, and we can look to get you featured in the Pact post.

See you next month folks!

Cheers,
Saf
