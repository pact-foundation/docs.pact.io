---
title: Pact Open Source Update — May 2026
author: Yousaf Nabi
authorURL: https://twitter.com/you54f
tags: [pact, oss, community]
keywords: [pact, oss, community]
date: 2026-05-22
draft: false
hide_table_of_contents: false
---

A year has passed since our last update, and we have seen a lot of activity in the Pact ecosystem, with new features, improvements, and community contributions across the board. In this update, we will take a look at some of the highlights from the past year, including updates to our open source projects, community events, and more.

## Pact & API Specifications

The PactFlow team have been hard at work looking at how to improve our Bi-Directional workflow, in a few ways.

1. Closing the loop on BDCT provider verification, with a bespoke testing tool [Drift](https://pactflow.github.io/drift-docs/docs/tutorials/overview), designed to be a cli-first, spec-driven testing tool, ensuring provider implementations are in line with API specifications, and providing detailed feedback on any discrepancies.
2. Improving the BDCT UI experience, with richer feedback on tested API specification endpoints, either via Drift for provider compliance, or against a pact file, for consumer compliance.
3. Improving the BDCT experience for API specifications
   1. Open source release of [openapi-pact-comparator](https://github.com/pactflow/openapi-pact-comparator), a tool designed to compare OpenAPI specifications against Pact files, providing detailed feedback on any discrepancies, and helping teams ensure their API specifications are in line with their consumer contracts.
   2. Expanding the BDCT experience to support more API specification formats, such as AsyncAPI, ensuring teams can use BDCT regardless of their API specification format, especially in multi-protocol environments. This is being actively worked on, with support for AsyncAPI expected to be released in the coming months.

## Pact & AI

We've launched a set of AI tools to help you get the most out of Pact. These tools include both skills and agents that can assist you in various aspects of contract testing, from generating test cases to analyzing test results. You can find more information about these tools in our AI docs [here](https://docs.pact.io/ai_tools/installation).

Agent skills teach your AI coding assistant — Claude Code, GitHub Copilot, Cursor, Windsurf, and others — how to work with Pact, PactFlow, and Drift. Instead of explaining contract testing concepts every time you start a conversation, the skills give your AI persistent, deep knowledge of consumer test patterns, provider verification, can-i-deploy diagnostics, Drift test authoring, and workspace management.

Big thanks for Kevin Raz, who has been leading the charge on this front, and has done an amazing job in getting these tools out into the wild. We are excited to see how the community will use these tools to enhance their contract testing workflows.

Please be sure to share your feedback on these tools, as we are always looking for ways to improve and make them more useful for our users.

## Pact OSS Updates

### Pact-JS

Pact-JS has seen Pact V4 become the default interface, introducing a new GraphQL wrapper, and several improvements to the API, including better support for asynchronous interactions, improved error handling, and more. We have also seen a lot of community contributions to the project, with new features and improvements being added regularly.

Be sure to checkout the [changelog](https://github.com/pact-foundation/pact-js/blob/master/CHANGELOG.md)

Pact JS CLI saw an [update](https://github.com/pact-foundation/pact-js-cli/releases/tag/v18.0.0) to utilise the new unified [Pact CLI](https://docs.pact.io/implementation_guides/cli/pact-cli), which provides a unified interface for all of our rust based CLI tools, including the Pact Broker CLI.

#### Pact-JS - Slack

Chat with us in: [#pact-js](https://pact-foundation.slack.com/archives/C9VBGLUM9)

### Pact-JVM

Pact-JVM 4.7 has just come out of beta, with lots of new changes, so be sure to update. Ron has been experimenting with Claude Code, so if you have any feature requests or feedback on how to improve the Pact-JVM experience, be sure to let him know.

#### Pact-JVM - Slack

Chat with us in: [#pact-jvm](https://pact-foundation.slack.com/archives/TODO)

### Pact-Python

Pact Python V3 was released in December, which brings another implementation into line with the Pact Rust core, and allows for usage of Pact V3 and V4 features, as well as introducing the pact plugin ecosystem. To find out more about the road to V3, check out the [blog post](https://pact-foundation.github.io/pact-python/blog/2025/12/04/announcing-pact-python-v3/#the-journey-from-idea-to-release).

Are you using Pact Python? We would love to hear about your experience, and any feedback you have on the new release. We are always looking for ways to improve the library, and your feedback is invaluable in helping us do that.

#### Pact-Python - Slack

Chat to us in: [#pact-python](https://pact-foundation.slack.com/archives/C9VECUP6E).

### Pact-PHP

Pact-PHP is going from strength to strength with [v10.2.0](https://github.com/pact-foundation/pact-php/releases/tag/10.2.0) in January, which includes a lot of improvements and bug fixes.

[v11.x](https://github.com/pact-foundation/pact-php/releases) is now in beta, which will default created pact files, to V4 as well as updating the underlying Pact Rust core.

Be sure to check it out if you are a PHP user, and as usual don't forget to share your feedback, as we are always looking for ways to improve the library and make it more useful for our users.

#### Pact-PHP - Slack

Chat to us in: [#pact-php](https://pact-foundation.slack.com/archives/C9W94PXPY).

### Pact-Go

Pact-Go has been ticking along with a maintainence release to support the latest go version and updates to the underlying Pact Rust core. Stan dropped us a [new feature](https://github.com/pact-foundation/pact-go/pull/577) to improve distinguishing failures in the verification flow, separating Pact verification failures from other types of errors, such as network issues or misconfigurations, which should help improve the DX when working with Pact-Go.

#### Pact-Go - Slack

Chat with us in: [#pact-go](https://pact-foundation.slack.com/archives/C9UTHTFFB).

### Pact-Reference

Tien introduced a new XML generator as part of this [RFC](https://github.com/pact-foundation/roadmap/pull/113) which was introduced in the pact-rust core, which itself as been updated to utilised the rewritten pact mock server v2. This trickled down in the FFI library in [v0.5.0](https://github.com/pact-foundation/pact-reference/releases/tag/libpact_ffi-v0.5.0).

Several CLI improvements have been made

- Verifier CLI now includes `--exit-first` and `--last-failed` options to improve the feedback loop when working with large test suites, allowing you to exit on the first failure, or to re-run only the tests that failed in the previous run, which should help improve the DX when working with the Verifier CLI. `--html <PATH>` or `--xslt <PATH>` options, introduce the ability generate rich HTML verification reports from the CLI. The report is generated by first producing an XML report and then transforming it via XSLT into a styled, print-friendly HTML page.
- Pact stub server now contains a watch mode, which allows you to automatically restart the server when changes are made to the pact file, which should help improve the DX when working with the Pact stub server. See this [PR](https://github.com/pact-foundation/pact-stub-server/pull/80) for details

#### Pact-Reference - Slack

Chat with us in: [#pact-rust](https://pact-foundation.slack.com/archives/CA2S7E6KC).

### Pact Broker

The Pact Broker has seen a lot of improvements over the past year, with new features and improvements being added regularly. We have also seen a lot of community contributions to the project, with new features and improvements being added regularly.

- The ability to render async/sync messages and mixed v4 pacts in the UI, which is a big step towards supporting the full range of Pact features in the UI.
- More API endpoints to support
  - provider pacts by consumer branch
  - provider states by branch or environment
- Lots of smaller bug fixes and optimisations to improve the overall performance and reliability of the Pact Broker.

Big thanks to our contributors [Dimitris Dranidis](https://github.com/dranidis) & [Ludovic Tourman](https://github.com/LudovicTOURMAN) and all of the PactFlow engineers working on the codebase.

#### Pact-Broker - Slack

Chat to us in: [#pact-broker](https://pact-foundation.slack.com/archives/C9VPNUJR2).

### Pact-Net

We've seen a couple of PR's to introduce the pact-plugin ecosystem into Pact-Net, with synchronous messages being the first target, to support gRPC.

Massive thanks to [Max Lancaster](https://github.com/max-lancaster)

- [Add Synchronous Plugin Interaction Support](https://github.com/pact-foundation/pact-net/pull/551)
- [Add PactNet.Extensions.Grpc package for grpc plugin support](https://github.com/pact-foundation/pact-net/pull/548)

Be sure to take a look at them and provide feedback if you are a .NET user, as we know you are wanting gRPC support, and this is the first step towards that goal.

#### Pact-Net - Slack

Chat with us in: [#pact-net](https://pact-foundation.slack.com/archives/C9UTHV2AD).

### Pact-Ruby

Pact Ruby v2 has been released which utilises the latest shared Pact Rust core, which allows for usage of Pact V3 and V4 features, as well as introducing the pact plugin ecosystem.

This means that the previous [ruby based ecosystem](https://docs.pact.io/diagrams/ecosystem#ruby-goldberg-machine) is legacy mode, with Pact-Ruby v2 joining the [Rust FFI Consumers ecosystem](https://docs.pact.io/diagrams/ecosystem#rust-ffi-consumers-goldberg-machine)

Additionally the [Pact Broker Client](https://docs.pact.io/pact_broker/client_cli/readme) has been rewritten in Rust, as the [Pact Broker CLI](https://docs.pact.io/implementation_guides/cli/pact-broker-cli), and to further improve the DX, we have rolled all of the rust based CLI's into a single tool, called [Pact CLI](https://docs.pact.io/implementation_guides/cli/pact-cli), which provides a unified interface for all of our rust based CLI tools.

## Community Events

Are you talking about Pact or contract-testing this year at an event? Why not let us know and get yourself featured!

## Community Projects

- Murat Ozcan has been working with AI, and Pact in the open, check out his [video](https://youtu.be/_BYMS4JXR74) of setting up Pact-JS with BMad's test architect and read more below about his endeavours in his own words.

> We just open-sourced a library we've been using internally at SEON for Pact.js contract testing,  thought it might be useful for others here.

> Pact is powerful but the setup boilerplate adds up fast.
> Every team ends up writing the same plumbing.
> The library extracts those patterns into composable utilities.

> What's in it:
>
> - createProviderState / toJsonMap
>   - typed provider state params without the JsonMap conversion headache
> - buildVerifierOptions / buildMessageVerifierOptions
>   - one call to build complete VerifierOptions for HTTP and message verification
> - createRequestFilter
>   - injects auth headers into verification requests without the Express type gymnastics
> - handlePactBrokerUrlAndSelectors
>   - reads env vars and assembles the right consumer version selector strategy automatically
>
> - github: https://github.com/seontechnologies/pactjs-utils
> - npm: https://www.npmjs.com/package/@seontechnologies/pactjs-utils
> - docs: https://seontechnologies.github.io/pactjs-utils/

> The repo also functions as an educational resource, dogfooding the lib, and showcasing vanilla vs lib versions of the same tests.

> P.S. For those moving toward agentic QA: BMad Test Architect now has a pactjs-utils installation option.
> It’s designed to create and self-heal contract tests using these patterns out of the box.
> https://bmad-code-org.github.io/bmad-method-test-architecture-enterprise/

## Thats a wrap

Want to carry on the conversation? Sign up [here](https://slack.pact.io/) to join our Slack community, where you will be amongst over 6k other users. It's a safe place to ask questions, and a great place to share the awesome work you are doing in the Pact ecosystem.

Whatever you are up to, let us know, and we can look to get you featured in the Pact post.

See you next month folks!

Cheers,
Saf
