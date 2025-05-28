---
title: Pact Open Source Update — May 2025
author: Yousaf Nabi
authorURL: https://twitter.com/you54f
tags: [pact, oss, community]
keywords: [pact, oss, community]
date: 2025-05-28
draft: false
hide_table_of_contents: false
---

It's May and we are back with another update of all things Pact.

We've had a bit of a sabbatical from writing blog posts over the last couple of months, but not to fear, I am back with lots of goodies to share, including completed RFC's, community contributions a plenty and some tooling enhancements to make your contract testing lives easier.

## Pact & AI

I have been quite quiet on the AI front, which is unlike me for several reasons, not least that I studied Artificial Intelligence & Cybernetics at university.

We had several requests through our dayjob at SmartBear & PactFlow to improve on the current state of the AI offerings, especially with regards to how they handle the generation of Pact tests which relate to your codebase, use recommended guidelines from the Pact team as to how best structure the tests, and ideally be scaffolded from the same templates in your codebase to ensure consistency.

For those of you reading, who happen to be PactFlow customers, you may have already seen or be using the AI Augmented contract testing feature, which is part of SmartBear's API Hub.

If you haven't be sure to checkout the [website](https://pactflow.io/ai/), or the [docs](https://docs.pactflow.io/docs/ai).

In a nutshell

PactFlow AI includes a suite of features to improve the efficiency and quality of your contract tests:

- Generating Pact tests using various combinations of OpenAPI descriptions, code, or request-response pairs
- Customizable prompts and test templates to tailor output to your specific needs
- Seamless integration with PactFlow's Role-based Access Controls feature, enabling you to enforce and manage organizational policies
- Code review (upcoming), enabling you to evaluate the quality of existing Pact tests and suggest best-practice improvements

PactFlow AI is available as a CLI and supports the following programming languages:

- Java and Kotlin
- TypeScript / JavaScript
- .NET
- Golang
- PHP
- Swift
- Python (coming soon)

This is all part of a larger offering from SmartBears HaloAI product which is permeating all aspects of the tooling we built, to support you throughout your SDLC, whether you are at the design stage, transferring human ideas, to OpenAPI descriptions, or enabling rapid API and UI testing tooling with minimal maintaining effort, affording you time to ensure you are building the right thing, right.

## Pact OSS Updates

### Pact RFCs

XML Generates are here, as [Tien](https://github.com/tienvx) Vo's RFC and associated changes were merged into their respective repos.

Keep an eye out for the examples in pact-php, coming soon. See below links to details, to follow along, or help provide a review.

- [rfc: Implement generators for XML text and attribute](https://github.com/pact-foundation/roadmap/pull/113)
  - [feat: Implement generators for XML pact-reference](https://github.com/pact-foundation/pact-reference/pull/486)
  - [feat: Use new XML generator pact-reference](https://github.com/pact-foundation/pact-reference/pull/487)
  - [chore: Add example for xml generators pact-php](https://github.com/pact-foundation/pact-php/pull/720)

If you have a change you want to see in the Pact Foundation, why not drop us a shout, or compile your first RFC.

### Pact-JS

[Pulak Deyashi](https://github.com/pulak777) has been on a roll, dropping in some fixes around example values in V3 date/time matchers, in this [PR](https://github.com/pact-foundation/pact-js/pull/1405), he followed it up with [additional tests](https://github.com/pact-foundation/pact-reference/pull/489) in the pact core, which is much appreciated.

He also dropped in a [small typo change](https://github.com/pact-foundation/pact-js-cli/pull/60) in our pact-js-cli repo.

All contributions are welcomed, small or big, like this one, from [Val Kolovos](https://github.com/valkolovos) introducing Async messages in the V4 Pact format to Pact-JS

- [feat: V4 Asynchronous Messages (issue #1186)](https://github.com/pact-foundation/pact-js/pull/1482)

#### Pact-JS - Slack

Chat with us in: [#pact-js](https://pact-foundation.slack.com/archives/C9VBGLUM9)

### Pact-JVM

[Ruud Welling](https://github.com/WellingR) dropped a fix in to ensure provider state is injected when verifying sync message pacts.

#### Pact-JVM - Slack

Chat with us in: [#pact-jvm](https://pact-foundation.slack.com/archives/TODO)

### Pact-Python

[Josh Ellis](https://github.com/JP-Ellis) introduced changes to the handling of functional arguments to be much more flexible, allowing for default arguments. You can see the PR for more information [here](https://github.com/pact-foundation/pact-python/pull/1035)

#### Pact-Python - Slack

Chat to us in: [#pact-python](https://pact-foundation.slack.com/archives/C9VECUP6E).

### Pact-PHP

[Tien](https://github.com/tienvx) has been working on some QoL improvements which have now been merged.

- [chore(deps): Update stub server for better performance](https://github.com/pact-foundation/pact-php/pull/730)
- [docs: Add common issues related to loadding ffi to troubleshooting document](https://github.com/pact-foundation/pact-php/pull/729)
- [refactor: Replace roadrunner by php's gRPC server](https://github.com/pact-foundation/pact-php/pull/728)

#### Pact-PHP - Slack

Chat to us in: [#pact-php](https://pact-foundation.slack.com/archives/C9W94PXPY).

### Pact-Go

#### Pact-Go - Slack

Chat with us in: [#pact-go](https://pact-foundation.slack.com/archives/C9UTHTFFB).

### Pact-Reference

[Tien](https://github.com/tienvx) delivered the following changes to bring XML generators to Pact.

- [feat: Implement generators for XML pact-reference](https://github.com/pact-foundation/pact-reference/pull/486)
- [feat: Use new XML generator pact-reference](https://github.com/pact-foundation/pact-reference/pull/487)

#### Pact-Reference - Slack

Chat with us in: [#pact-rust](https://pact-foundation.slack.com/archives/CA2S7E6KC).

### Pact-Stub-Server

- [Stefan Ansing](https://github.com/sansing) improved the performance of the pact-stub-server by optimising the memory allocations in this [PR](https://github.com/pact-foundation/pact-stub-server/pull/77)
- [Ron](https://github.com/rholshausen) also ensured the `insecure_tls` flag works correctly when fetching pacts from a Pact Broker which addresses this [issue](https://github.com/pact-foundation/pact-stub-server/issues/75), however it is worth noting that the recommended method is you make your certificates available to your Pact Broker and client libraries/tooling.

### Pact Broker

The Broker saw a fair few features delivered over the last few months

- [feat: add deployed-environments to pacticipant response and tag versions](https://github.com/pact-foundation/pact_broker/pull/804)
- [feat: show deployed-environments in branch versions response](https://github.com/pact-foundation/pact_broker/pull/803)
- [feat: add tag_versions endpoint](https://github.com/pact-foundation/pact_broker/pull/802)
- [feat: added deployed-environments to `/pacticipants/$name/versions and /pacticipants/$name`](https://github.com/pact-foundation/pact_broker/pull/801)
- [feat: aggregate provider states by consumers](https://github.com/pact-foundation/pact_broker/pull/790)
- [chore(ci): test maintained version of postgres](https://github.com/pact-foundation/pact_broker/pull/792)
- [fix: refactored the query to filter out duplicate integration rows](https://github.com/pact-foundation/pact_broker/pull/806)

We also had one just land today, to allow for the schema configuration to be changed from its current, of the public schema, which according to release notes, is not recommend in postgres 15+

- [chore: Allow schema configuration](https://github.com/pact-foundation/pact_broker/pull/809) which addresses a request to [Add Support for Specifying Database Schema via Environment Variable](https://github.com/pact-foundation/pact_broker/issues/726).

#### Pact-Broker - Slack

Chat to us in: [#pact-broker](https://pact-foundation.slack.com/archives/C9VPNUJR2).

### Pact-Net

[Adam Rodgers](https://github.com/adamrodger) has two draft PR's in play

- [feat!: Make the messaging provider handle scenario requests async](https://github.com/pact-foundation/pact-net/pull/537)
- [feat!: Invoke async message scenario factories on request](https://github.com/pact-foundation/pact-net/pull/536)

[Levan Nozadze](https://github.com/levanoz) has also dropped in a pull request, to close down a highly requested feature

- [feat(verifier): Added support of set_no_pacts_is_error feature](https://github.com/pact-foundation/pact-net/pull/541)

#### Pact-Net - Slack

Chat with us in: [#pact-net](https://pact-foundation.slack.com/archives/C9UTHV2AD).

### Pact-Ruby

[Renaud Martinet](https://github.com/karouf) was having some issues with cross-compat testing with Pact-JVM with release v1.66.0 of pact-ruby.

Check out his expect troubleshooting and reproduction, and if you want to add a review, it would be most welcome.

- [Fix expected body when using generators](https://github.com/pact-foundation/pact-ruby/pull/353)

## Community Events

Are you talking about Pact or contract-testing this year at an event? Why not let us know and get yourself featured!

### APIDays New York - 2025

I delivered a talk at APIDays New York titled Graceful service evolution, driven by open standards, guided by contracts. I'll add a video link when it gets published :)

> A look at contract testing over the ages, as a means for graceful service evolution, and how it neatly intersects with the exponential explosion of use of API’s and uptake of OpenAPI as a defining standard. We will explore what a single source of truth looks like, and how perspectives change depending on your viewpoint. We’ll learning how to tackle challenges, such as versioning, managing breaking changes, provider drift (spec out of sync with implementation), consumer drift ( a view of the used surface area of your API ), helping you combat Hyrum’s law and provide you real world ways to build API’s now with leading open source tools such as Spectral, Pact & Swagger that will last well into the future.

## Community Projects

We saw [Fernando Teixeira](https://github.com/teixeira-fernando) bring two things to our attention

> I have been working with Pact for some years, and I noticed that many people still don't understand why they need it. That's why I wanted to have a presentation that focused more on the 'Why' and discuss in more details some of the challenges that it helps to solve.

- A talk presented at TestWarez last year, in which Fernando explains some of the challenges that Pact wants to solve in terms of microservices testing.
  - Check it out at [TestWarez - Mastering Microservices Testing with an Effective Testing Strategy](https://www.youtube.com/watch?v=ua8v0n2jltU)
- An [Ecommerce Microservices Testing Example](https://github.com/teixeira-fernando/EcommerceApp) designed to explore QA strategies for microservices with Synchronous and Asynchronous communication. Includes examples of message-based and HTTP contracts.

## Thats a wrap

Want to carry on the conversation? Sign up [here](https://slack.pact.io/) to join our Slack community, where you will be amongst over 6k other users. It's a safe place to ask questions, and a great place to share the awesome work you are doing in the Pact ecosystem.

Whatever you are up to, let us know, and we can look to get you featured in the Pact post.

See you next month folks!

Cheers,
Saf
