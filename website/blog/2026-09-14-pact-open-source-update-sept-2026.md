---
title: Pact Open Source Update - Sept 2026
author: Yousaf Nabi
authorURL: https://twitter.com/you54f
tags: [pact, oss, community]
keywords: [pact, oss, community]
date: 2026-09-14
draft: false
hide_table_of_contents: false
---

# Pact Open Source Update - September 2026

👋 Hello again folks. Hope you've enjoyed the summmer, it's been one of the busier stretches we've had in a while, so let's get straight into it and get you caught up on everything that's landed across Pact and Swagger Contract Testing (aka PactFlow) since the last update.

## Pact & API Specifications

Back in May I told you AsyncAPI support in PactFlow & Drift was "expected in the coming months." We meant it. 🎉

- **AsyncAPI is here** - Drift now supports both AsyncAPI 2.x and 3.0.x specification files, for both synchronous and asynchronous request/reply style APIs, alongside new Kafka and AWS SQS/SNS transport plugins. There's also a **Protobuf data format plugin** for encoding outgoing Protobuf messages in async-inject test cases, and a raft of fixes around message polling, attribute mapping and correlation handling for the queue-based transports.
- Drift also picked up **decision references in the verification bundle output**, so you can trace exactly which part of the AsyncAPI spec a given pass/fail verdict came from - genuinely useful when you're trying to explain to a sceptical teammate why a test failed.
- And in a "didn't see that coming but very glad it did" moment, Drift now has support for testing **Model Context Protocol (MCP) servers**. If you're building MCP servers as part of your agentic tooling, you can now bring the same spec-driven verification approach to them.
- AsyncAPI support has also landed in **Bi-Directional Contract Testing (BDCT)** on the SaaS/on-prem side, extending the OpenAPI-based workflow to asynchronous and synchronous event-driven APIs, and BDCT itself picked up support for `if-then-else` JSON schema keywords and `allOf` merge fixes along the way.

If you want to see it all in one place, the [Drift docs](https://pactflow.github.io/drift-docs/docs/tutorials/overview) and the [Swagger Contract Testing release notes](https://support.smartbear.com/swagger/contract-testing/docs/en/release-notes.html) are both worth a proper read, not just a skim - there's a lot in there.

## Pact & AI

The AI/MCP story has kept moving too. PactFlow's MCP server has expanded steadily over the summer - you can now review Pact tests, run `can-i-deploy` for both Swagger Contract Testing and the open source Pact Broker, and query the compatibility matrix, all through MCP. AI preferences, skills and custom agents got a dedicated page in the UI back in June, so it's a lot easier to see what's available and how to get started.

Kevin Raz has continued pushing the agent skills work forward too - if you haven't tried the Pact/PactFlow/Drift skills with Claude Code, Copilot, Cursor or Windsurf yet, now's a good time. They've had a few rounds of refinement since the summer and are noticeably better at not confidently making things up about consumer test patterns.

## Pact OSS Updates

### Pact-JS

Pact-JS has had three releases since May. [v16.5.0](https://github.com/pact-foundation/pact-js/releases/tag/v16.5.0) added HTTP response status code matching support and XML support to the PactV4 interface, plus a fix for the Apollo/node-fetch v3 compatibility regression. [v17.0.0](https://github.com/pact-foundation/pact-js/releases/tag/v17.0.0) is the bigger one - it's a breaking change release dropping Node 20 in favour of testing against Node 26, along with an ESM import fix. That was quickly followed by [v17.0.1](https://github.com/pact-foundation/pact-js/releases/tag/v17.0.1), which fixes `beforeEach`/`afterEach` verifier hooks so they run once per interaction without desyncing when a hook itself fails - a subtle but nasty one to debug if you'd hit it.

Be sure to check out the [changelog](https://github.com/pact-foundation/pact-js/blob/master/CHANGELOG.md) for the full detail.

#### Pact-JS - Slack

Chat with us in: [#pact-js](https://pact-foundation.slack.com/archives/C9VBGLUM9)

### Pact-JVM

Pact-JVM has been one of the busiest repos this cycle, largely off the back of the ongoing **V2 plugin interface** work. [4.7.1](https://github.com/pact-foundation/pact-jvm/releases/tag/4_7_1) added a Kotlin consumer DSL and the ability to capture external references on interactions. [4.7.2](https://github.com/pact-foundation/pact-jvm/releases/tag/4_7_2) is a big one under the hood - a V2 matching engine implementation ported across from the Rust core, multipart/form-data support, and a batch of parity fixes against the Rust reference engine. [4.7.3](https://github.com/pact-foundation/pact-jvm/releases/tag/4_7_3) and [4.7.4](https://github.com/pact-foundation/pact-jvm/releases/tag/4_7_4) continued the V2 plugin theme - plugin observability improvements (test run correlation), host-provided core content matcher/generator capabilities, and matching rules/generators sourced from plugins. [4.7.5](https://github.com/pact-foundation/pact-jvm/releases/tag/4_7_5) rounds it off with a fix to allow Gradle pact file verification without a broker.

Big thanks to Ron ([rholshausen](https://github.com/rholshausen)) for driving this - the V2 plugin architecture has clearly been the main event across the Rust core and JVM this summer, and it's starting to show real shape now.

#### Pact-JVM - Slack

Chat with us in: [#pact-jvm](https://pact-foundation.slack.com/archives/TODO)

### Pact-Python

Pact-Python has had a proper feature summer. [3.3.0](https://github.com/pact-foundation/pact-python/releases/tag/pact-python%2F3.3.0) introduced XML matching via a new `pact.xml` module - builder functions for constructing XML request/response bodies with embedded Pact matchers, including support for repeating elements and namespace attributes. [3.4.0](https://github.com/pact-foundation/pact-python/releases/tag/pact-python%2F3.4.0) added the external reference DSL to match, and the FFI/CLI packages have kept pace, with `pact-python-cli` bumping the bundled Rust CLI to 0.10.2.

Nice example of the `pact.xml` usage, straight from the release notes:

```python
from pact import match, xml

response = xml.body(
    xml.element(
        "user",
        xml.element("id", match.int(123)),
        xml.element("name", match.str("Alice")),
    )
)
interaction.with_body(response, content_type="application/xml")
```

Great work as ever from [JP-Ellis](https://github.com/JP-Ellis), with contributions from a few newer names too - welcome to [@adityagiri3600](https://github.com/adityagiri3600), [@benaduo](https://github.com/benaduo) and [@Nikhil172913832](https://github.com/Nikhil172913832) if this is your first time seeing your name here.

#### Pact-Python - Slack

Chat to us in: [#pact-python](https://pact-foundation.slack.com/archives/C9VECUP6E)

### Pact-PHP

Pact-PHP's V11 line is progressing through alpha. [11.0.0-alpha1](https://github.com/pact-foundation/pact-php/releases/tag/11.0.0-alpha1) sets the default Pact specification version to 4, makes properties readonly, and lands the XML generators support that's been simmering since the RFC. [11.0.0-alpha2](https://github.com/pact-foundation/pact-php/releases/tag/11.0.0-alpha2) followed up with the FFI library bump to 0.5.3, a stub server update to 0.7.0, and a batch of compatibility suite work (sync messages, Behat attribute refactors).

Big thanks to [Tien](https://github.com/tienvx) for continuing to push this through, and a welcome to [Kevin Raz](https://github.com/kevinrvaz) for his first contribution to the repo (docs updates for the Docusaurus upgrade) - glad to see him popping up across more of the ecosystem.

#### Pact-PHP - Slack

Chat to us in: [#pact-php](https://pact-foundation.slack.com/archives/C9W94PXPY)

### Pact-Go

Pact-Go has ticked along nicely. Stan's verifier error sentinel work that I mentioned back in May actually shipped in [v2.5.0](https://github.com/pact-foundation/pact-go/releases/tag/v2.5.0) - `errors.Is` discrimination between `ErrVerifierFailed` and `ErrVerifierFailedToRun` is now exposed, and [v2.5.1](https://github.com/pact-foundation/pact-go/releases/tag/v2.5.1) added docs clarifying the two are mutually exclusive. Before that, [v2.4.3](https://github.com/pact-foundation/pact-go/releases/tag/v2.4.3) fixed a build failure on Go 1.24+ and upgraded the goreleaser config, alongside the usual steady drip of grpc/protobuf dependency bumps.

#### Pact-Go - Slack

Chat with us in: [#pact-go](https://pact-foundation.slack.com/archives/C9UTHTFFB)

### Pact-Reference (Rust core)

The story here all summer has been the **V2 plugin interface**. The plugin driver has moved through several betas, and we now have host-provided matching and generation capabilities registered as core plugin capabilities, meaning plugins can lean on Pact's own matchers/generators instead of reimplementing them. Alongside that, plugin observability got a proper upgrade - test run ID correlation and an FFI log sink, so you can actually trace what a plugin did during a test run instead of squinting at scattered logs. You can see this land across [libpact_matching v2.0.6 through v2.0.8](https://github.com/pact-foundation/pact-reference/releases), [pact_verifier 1.4.1 through 1.4.3](https://github.com/pact-foundation/pact-reference/releases/tag/pact_verifier-v1.4.3), and [pact_verifier_cli 1.3.3](https://github.com/pact-foundation/pact-reference/releases/tag/pact_verifier_cli-v1.3.3), which adds V2 plugin support to the CLI itself.

As always, a reminder that Pact FFI is made up of several individual crates - click through the release notes to find the associated changelog for each.

#### Pact-Reference - Slack

Chat with us in: [#pact-rust](https://pact-foundation.slack.com/archives/CA2S7E6KC)

### Pact Broker

The Broker has had three releases since May. [v2.119.0](https://github.com/pact-foundation/pact_broker/releases/tag/v2.119.0) added support for customising webhook requests and optimised WIP query performance to prevent timeouts on large datasets - if you've got a big broker instance, that one's worth grabbing. [v2.120.0](https://github.com/pact-foundation/pact_broker/blob/master/CHANGELOG.md) is the meatier release: released environments are now exposed on both the version API and the branch/tag version list endpoints, branches now sort by most recently updated first, and - probably the headline feature - a proper **stale branch lifecycle with automated cleanup** has landed, including a configurable deletion limit on the clean task. If you've ever had a broker instance quietly filling up with abandoned feature branches, this is for you. v2.121.0 followed a few weeks back, mostly consolidating the release tooling (the project's moved its changelog generation over to git-cliff).

Big thanks to the PactFlow engineering team working on this, as ever.

#### Pact-Broker - Slack

Chat to us in: [#pact-broker](https://pact-foundation.slack.com/archives/C9VPNUJR2)

### Pact-Net

Quieter news here I'm afraid - [Max Lancaster's](https://github.com/max-lancaster) synchronous plugin interaction support ([#551](https://github.com/pact-foundation/pact-net/pull/551)) and the accompanying `PactNet.Extensions.Grpc` package ([#548](https://github.com/pact-foundation/pact-net/pull/548)) that I flagged in May are both still open and awaiting review. If you're a .NET user who's been waiting on gRPC support, now's a great time to jump into those PRs and add your voice - reviews genuinely help unstick things like this.

#### Pact-Net - Slack

Chat with us in: [#pact-net](https://pact-foundation.slack.com/archives/C9UTHV2AD)

### Pact-Ruby

The headline: **Pact-Ruby v2.0.0 is out**. The `pact/v2` namespace that's been living as a preview since v1.67.0 has now moved to the `pact` namespace proper, meaning Ruby users get first-class access to the Rust core, V3/V4 spec support and the plugin ecosystem without reaching for a namespaced import. If you were on the v1.67.x `pact/v2` preview, the migration to v2 should be close to a non-event.

#### Pact-Ruby - Slack

Chat to us in: [#pact-ruby](https://pact-foundation.slack.com/archives/C9VHVEDE1)

### Pact CLI / Pact Broker CLI

The Rust-based `pact-broker-cli` has shipped a steady run of point releases over the summer (0.8.0 through [0.8.6](https://github.com/pact-foundation/pact-broker-cli/releases/tag/v0.8.6)), with the latest fixing header parsing and payload handling in `create-webhook`. The unified [Pact CLI](https://docs.pact.io/implementation_guides/cli/pact-cli) has kept pace too, bundling in the latest `pact-broker-cli` releases as they land - thanks to [Saup21](https://github.com/Saup21) for a first contribution here, bumping things through to 0.7.0 before the run of 0.8.x releases.

If you haven't looked at the unified CLI yet, it's worth a look - one binary for the mock server, stub server, provider verifier, broker client and plugin CLI, rather than juggling several.

## Swagger Contract Testing

For Swagger Contract Testing (PactFlow) customers, it's been a genuinely full release cadence since May. Rather than list every point release, here are the highlights, but the [full release notes](https://support.smartbear.com/swagger/contract-testing/docs/en/release-notes.html) are worth a proper read if any of this is relevant to your setup:

- **AsyncAPI in BDCT** ([16 July](https://support.smartbear.com/swagger/contract-testing/docs/en/release-notes.html#july-16--2026)) - Bi-Directional Contract Testing now supports AsyncAPI definitions, extending BDCT beyond REST into asynchronous and synchronous event-driven APIs.
- **Drift's AsyncAPI/Kafka/AWS transport rollout** (14–28 August) - initial AsyncAPI support, Kafka and SQS/SNS transport plugins, a Protobuf data format plugin, decision references in verification bundles, and finally MCP server testing support. This is the same work I covered above in the Pact & API Specifications section, but worth flagging again here since it's shipped as part of the commercial product's Drift offering.
- **Network diagram improvements** ([13 August](https://support.smartbear.com/swagger/contract-testing/docs/en/release-notes.html#august-13--2026)) - indirect providers and indirect consumers are now represented, plus the ability to filter application versions by environment and see released environments in the versions list.
- **Automatic branch cleanup for all SaaS tenants** ([19 June](https://support.smartbear.com/swagger/contract-testing/docs/en/release-notes.html#june-19--2026)) - this is the SaaS-side equivalent of the stale branch lifecycle work landing in the open source Broker, reducing clutter from abandoned branches automatically.
- **Team details surfaced more widely** (July) - team ownership now shows on the Application Version page and via the `/pacticipants` endpoint, so you can see at a glance who owns what.
- A long list of smaller fixes throughout - OpenAPI `allOf` comparison edge cases, `if-then-else` JSON schema keyword support in BDCT, verification matrix severity display bugs, and various UI polish.

## Community Events

Are you talking about Pact or contract-testing this year at an event? Why not let us know and get yourself featured! It's been a quiet few months on submissions, so if you've got a talk, blog post or war story to share, now's the time - drop into Slack or open a PR on the [docs site](https://docs.pact.io/contributing).

### APIDays London - 2026

If you are in London for the conference, why not drop in for my talk - "If an API falls over in the forest, but no-one is using it, does it make a sound?", or drop in at the SmartBear booth for a chat, and some swag!

## Community Projects

If you're building something on top of Pact - a plugin, a helper library, an integration - I'd genuinely love to hear about it. We had a great run of community shout-outs earlier in the year (Murat's pactjs-utils library, Fernando's microservices testing examples, to name a couple) and I know there's more of that quietly happening out there. Don't be shy.

## Thats a wrap

Want to carry on the conversation? Sign up [here](https://slack.pact.io/) to join our Slack community, where you'll be amongst thousands of other users. It's a safe place to ask questions, and a great place to share the awesome work you're doing in the Pact ecosystem.

Whatever you're up to, let us know, and we can look to get you featured in the Pact post.

Apologies again for the radio silence over summer - normal service (monthly-ish) resuming from here. See you next month folks!

Cheers,
Saf

**Tags:**

- [pact](https://docs.pact.io/blog/tags/pact)
- [oss](https://docs.pact.io/blog/tags/oss)
- [community](https://docs.pact.io/blog/tags/community)
- [pactflow](https://docs.pact.io/blog/tags/pactflow)
