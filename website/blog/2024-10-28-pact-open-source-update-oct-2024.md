---
title: Pact Open Source Update — October 2024
author: Yousaf Nabi
authorURL: https://twitter.com/you54f
tags: [pact, oss, community]
keywords: [pact, oss, community]
date: 2024-10-28
draft: false
hide_table_of_contents: false
---

🕸️ Welcome to the October Pact Blog - hope you've got your 🎃 ready for carving, but for now, sit back and relax as we take you through all the updates in the Pact ecosystem along with events & material you've been sharing across the web this month.

## Pact OSS Updates

### Pact Slack now has over 6 thousand members

We are really proud to say we have just crossed the 6k mark, with 6005 members in our general channel in Pact Slack.

We appreciate many users journeys through Slack are transient, either whilst they are getting started with the Pact ecosystem, or after some help, and encounters may be all but fleeting. It is worth noting that not an insignificant amount of us have had the good fortune of meeting new friends, both in person, and virtually, making professional relationships and providing springboards to new opportunities. Some of the interactions have had positive life-changing impacts, your authors journey included.

We are proud to be able to foster a safe environment, where people are welcome to discuss contract testing with a captive audience, and for every engineer who finds that eureka moment where contract testing, just _clicks_, we know it is improving the API delivery landscape massively and has a net benefit to many interactions we have in our day-to-day life with systems.

If you are proud about the positive impacts Pact has had in your place of work, why not share it with the world? We can provide you a platform, and sharing your engineering mistakes and successes, is a great way to build transparency and trust with your customers, and promote a healthy learning based culture in your organisation.

### Pact Message Workshops

We've recently been working on a suite of Pact Message based examples, to show you how to test asynchronous systems with Pact, by concentrating on the messages sent between systems, rather than the underlying queuing system that transmits them.

We've taken PactFlow's kafka e2e example ([consumer](https://github.com/pactflow/example-consumer-java-kafka)/[provider](https://github.com/pactflow/example-provider-java-kafka)), based on [our common Product domain example](https://docs.pactflow.io/docs/examples#product-catalog-system-httpmessages) and built out a suite of examples, in various Pact client DSL's.

You can find the new workshop over on GitHub [pact-foundation/pact-workshop-message](https://github.com/pact-foundation/pact-workshop-message) where you can see the Pact message concepts demonstrated in the following flavours.

- Pact-JS
- Pact-JVM
- Pact-Net
- Pact-Go
- Pact-Python
- Pact-Rust

We hope to build out a tutorial on the website, and further enhance it by adding synchronous message examples as well in the near future.

### Pact RFCs

We still have two RFC's currently awaiting review, why not take a look and add your review in the spirit of collaboration and open-source. The proposers would really appreciate and value your input.

1. [rfc: configuration and shared files](https://github.com/pact-foundation/roadmap/pull/98) proposed by [`@JP-Ellis`](https://github.com/JP-Ellis)
2. [rfc: Define matching rules for form-urlencoded body](https://github.com/pact-foundation/roadmap/pull/99) by [`@tienvx`](https://github.com/tienvx)

### Pact-Plugins

Have you written a Pact plugin, or used one yet? We've seen a few community members create some, here are some that I've found.

- [pact-avro-plugin](https://github.com/austek/pact-avro-plugin) written in Kotlin
- [pact-avro-plugin](https://github.com/praveen-em/pact-avro-plugin) written in GoLang
- [avro-schema-as-pact-contract-plugin](https://github.com/vootelerotov/avro-schema-as-pact-contract-plugin) written in Kotlin

If you haven't and want to try it out, why not follow our [Pact Plugin course](https://docs.pact.io/plugins/workshops/create-a-plugin/intro), where you will learn the basics and get to build you own Plugin with templates we've provided to help you out.

If you fancy building one in a different language, I've created a suite of examples which you could use as a basis for your own project. Check them out here in my [Pluginopedia](https://github.com/YOU54F/pluginopedia/).

#### Pact-Plugins - Slack

Chat with us in: [#pact-plugins](https://pact-foundation.slack.com/archives/CA2S7E6KC).

### Pact-JS

[James Gauld](https://github.com/lhokktyn) has been working on a couple of fixes in the Pact-JS lifecycle hooks.

- [fix: support async afterEach hook](https://github.com/pact-foundation/pact-js/pull/1242)
- [fix: allow hooks to run only once per interaction](https://github.com/pact-foundation/pact-js/pull/1243)

#### Pact-JS - Slack

Chat with us in: [#pact-js](https://pact-foundation.slack.com/archives/C9VBGLUM9)

### Pact-Python

Pact-Python 2.2.2 was released, which included initial support for matchers in the Pact V3 interface.

Check out the [example test](https://github.com/pact-foundation/pact-python/blob/master/examples/tests/v3/test_match.py), for sample usage.

#### Pact-Python - Slack

Chat to us in: [#pact-python](https://pact-foundation.slack.com/archives/C9VECUP6E).

### Pact-PHP

Tien has been reworking some of the [examples](https://github.com/pact-foundation/pact-php/tree/master/example) in the Pact-PHP repo, and adding more features, with [more Pact generators](https://github.com/pact-foundation/pact-php/pull/678), as defined in the V3/V4 Spec, including [supporting the fromProviderState generator](https://github.com/pact-foundation/pact-php/pull/679) for advanced use-cases.

Why not try them out?

#### Pact-PHP - Slack

Chat to us in: [#pact-php](https://pact-foundation.slack.com/archives/C9W94PXPY).

### Pact Broker

- [Stanislav](https://github.com/stan-is-hate) provided another PR to the Pact Broker ecosystem, this time adding the `--ignore <PACTICIPANT>` flag to the pact-broker cli's `can-i-merge` command in this [PR](https://github.com/pact-foundation/pact_broker-client/pull/174)

- Want to run a Pact Broker in Azure? [Ian Crowl](https://github.com/iancrowl) provided [this addition to the docs](https://github.com/pact-foundation/docs.pact.io/pull/349), which still requires a bit of work,but might be enough to get you started!

#### Pact-Broker - Slack

Chat to us in: [#pact-broker](https://pact-foundation.slack.com/archives/C9VPNUJR2).

### Pact Net

Pact-Net V5 has now been [released](https://github.com/pact-foundation/pact-net/releases/tag/5.0.0). It [contains several fixes and features](https://github.com/pact-foundation/pact-net/milestone/5?closed=1), including leveraging the latest pact ffi 0.4.23

If you want to leverage the Pact V4 Specification, which will allow you to have multiple interaction types in a single Pact file, you should upgrade now, and a great place to start is the [upgrade guide](https://github.com/pact-foundation/pact-net/blob/master/docs/upgrading-to-5.md).

If you prefer learning by example, the workshops have been updated to use the latest Pact V5 release.

- https://github.com/pact-foundation/pact-workshop-dotnet
- https://github.com/pact-foundation/pact-workshop-dotnet-core-v1

As well as the E2E examples

- https://github.com/pactflow/example-consumer-dotnet
- https://github.com/pactflow/example-provider-dotnet

You can check out the PR history, to see the delta for the migration from Pact-Net V4->V5.

#### Pact-Net - Slack

Chat to us in: [#pact-net](https://pact-foundation.slack.com/archives/C9UTHV2AD).

## Community Events

Are you talking about Pact or contract-testing this year at an event? Why not let us know and get yourself featured!

### Lewis Prescott - Reliable End to End Testing with API Contracts using Cypress & PactFlow

[Lewis](https://www.pactman.co.uk/) recently took to the stage at CypressConf to teach users about the fundamentals of contract testing as well as how to implement consumer-driven contract testing with Cypress + Pactflow.

![Lewis Prescott - E2E Testing with Cypress/PactFlow](https://media.licdn.com/dms/image/v2/D4E10AQFJwy1BqypaJw/image-shrink_1280/image-shrink_1280/0/1728763741439?e=1730728800&v=beta&t=3ecpSX4orTGMCjTAADmAO23yFFckhtcRV_Lfvy5sIFs)

### Murat K Ozcan - A triple whammy of contract testing posts

[Murat](https://github.com/muratkeremozcan) penned another post, this time looking at Pact Message. It's backed by examples in GitHub and well worth a read/look.

- [Solving Cross-Execution Issues in Pact Testing with Kafka and Message Queues](https://dev.to/muratkeremozcan/solving-cross-execution-issues-in-pact-testing-with-kafka-and-message-queues-2d2g)

## Thats a wrap

Want to carry on the conversation? Sign up [here](https://slack.pact.io/) to join our Slack community, where you will be amongst over 6k other users. It's a safe place to ask questions, and a great place to share the awesome work you are doing in the Pact ecosystem.

Whatever you are up to, let us know, and we can look to get you featured in the Pact post.

See you next month folks!

Cheers,
Saf
