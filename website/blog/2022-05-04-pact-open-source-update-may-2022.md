---
title: Pact Open Source Update — May 2022
author: Yousaf Nabi
authorURL: https://twitter.com/you54f
tags: [pact, oss, community]
keywords: [pact, oss, community]
date: 2022-05-04
draft: false
hide_table_of_contents: false
---

Welcome to the inaugural Pact Open Source update!

This month PactFlow officially joins the SmartBear family, and with this, the Pact OSS community will be supported by SmartBear. We're excited to join SmartBear and together, expand contract testing to more developers and testers. [Read](https://pactflow.io/blog/pactflow-joins-the-smartbear-family/) more about what this means for you.

The contributor community has been hard at work uplifting key languages to integrate our [Rust shared core](https://github.com/pact-foundation/pact-specification/issues/83?mc_cid=0ede309bca&mc_eid=UNIQID), enabling support for the latest features in the [specification](https://github.com/pact-foundation/pact-specification?mc_cid=0ede309bca&mc_eid=UNIQID), [plugins](https://github.com/pact-foundation/pact-specification/issues/83?mc_cid=0ede309bca&mc_eid=UNIQID) and more.‌
‌‌
‌Thanks to all of the contributors who have made this happen.‌

## Specific language updates

### .NET

Pact-net: Next major release is not far away, with the Pact specification v3 beta stabilising: https://github.com/pact-foundation/pact-net/ (v4.0.0-beta.3).

Chat with us in: [#pact-net](https://pact-foundation.slack.com/archives/C9UTHV2AD)

### Golang

Pact-go: Next major release is not far away, with the Pact specification v3 beta stabilising: https://github.com/pact-foundation/pact-go/tree/2.x.x (v2.0.0-beta.10).

Chat with us in: [#pact-go](https://pact-foundation.slack.com/archives/C9UTHTFFB)

### Node JS

Pact-JS: Pact specification V3 beta now available: https://github.com/pact-foundation/pact-js/tree/feat/v3.0.0/ (v10.0.0-beta.59). Follow the [roadmap progress.](https://github.com/pact-foundation/pact-js/projects/3)

Chat with us in: [#pact-js](https://pact-foundation.slack.com/archives/C9VBGLUM9)

### Swift

Pact-Swift: Pact specification V3 support and provider side verification in Swift: https://github.com/surpher/PactSwift.

Chat with us in: [#pact-swift](https://pact-foundation.slack.com/archives/C9VBGNT4K)

### Scala

Scala-Pact: 🚧 ITV Pact is moving to maintenance mode and will only support up to [Pact specification V2](https://github.com/ITV/scala-pact#latest-version-is-440).

pact4s: The future is [pact4s](https://github.com/jbwheatley/pact4s/), which is a Scala wrapper of Pact JVM and currently supports up to Pact specification V3.

Chat with us in: [#pact4s](https://pact-foundation.slack.com/archives/C02ACMH759Q)

### Python

Pact-Python: Message support was added in 2021 to enable testing of asynchronous integrations such as RabbitMQ or Kafka (https://github.com/pact-foundation/pact-python/pull/194, https://github.com/pact-foundation/pact-python/pull/251).

Chat to us in: [#pact-python](https://pact-foundation.slack.com/archives/C9VECUP6E)

## V4 Pact Specification

Pact specification V4 is here! We worked hard on listening to the community, after the release of v3, 5 years ago. We consolidation many of the requests people made about things that haven't worked quite properly. One of the biggest changes is consolidation the file format to allow for HTTP and message interactions with a single file.

- 📹 See an AMA from 2021 where Ron Holshausen took us through ["What's in store for Pact specification v4.0?"](https://www.youtube.com/watch?v=u7LzZ6Fm1Ok)
- 📙 Read the V4 spec RFC for a full list of changes: https://github.com/pact-foundation/pact-specification/issues/71
- 🚀 Implementations in [Rust](https://github.com/pact-foundation/pact-reference/blob/master/rust/README.md) core and [JVM](https://github.com/pact-foundation/pact-jvm#supported-jdk-and-specification-versions) has been completed
- 🌍 All our Pact specifications are open-source and you can see them all [here](https://github.com/pact-foundation/pact-specification#index)

## Plugins, Protobufs and gRPC (oh my!)

Back in September 2021 Matt introduced us to [The case for contract testing Protobufs, gRPC and Avro](https://pactflow.io/blog/the-case-for-contract-testing-protobufs-grpc-avro/).

We are pleased to announced initial support for testing gRPC interactions via [plugins](https://github.com/pact-foundation/pact-specification/issues/83) has been added to Pact-JVM (for Junit5) and Pact-Rust including the shared core, enabling distribution to other client libraries.

We have released an official [PactFlow Protobuf / gRPC plugin](https://github.com/pactflow/pact-protobuf-plugin) for Pact.

Join the [Developer Preview Program](https://github.com/pactflow/roadmap#developer-preview-programs) for updates, or chat to us in [#protobufs](https://pact-foundation.slack.com/archives/CEQBDD5U4).

## Pactman

Hungry for docs, but don't want to move from your terminal? Type `npx pactman` for a treat 😲

> 🔍 pactman - search the pact docs from your terminal 👩‍💻

![Pactman](https://lh4.googleusercontent.com/Y7mWJH9fXWXGTLZ8KKzFrXGlJwxZhbnXwn0ckAQEQDwWUJKh863KYFdAvQXpFcO8QidK3EyHM0DObLg8oGyznxXFy40RF7LT6z85jqHQwQI6nSZYfPpXw0sNUIGm82i8QxibmzQrec6rMWAWng)

## Get involved

The Pact ecosystem is vast, I will be sharing some posts over the upcoming months, showing the size of the estate, and looking to gain insight from you, the community, as to how we can reduce the signal-to-noise and help reduce the cognitive load required to navigate the [path the Pact Nirvana](https://docs.pact.io/pact_nirvana) in your own organisation.

There are a multitude of ways, and you don't need to be a code wizard to start:

- 📙 [**Docs**](https://docs.pact.io/contributing/docs) - Our documentation is the primary way to communicate to our users, you can help out with small changes like a typo, help rewrite larger pieces, or add new content. Think of it as a open source contract testing wiki, and you are all the curators.
- 🚀 [**Code**](https://docs.pact.io/contributing) - We have implementations across multiple languages, and not all of them are at feature parity. Sometimes you might need that feature, or you've found a bug. Every pact-foundation repository is open-source, and contains a contributing guide to help you get started. Maybe you are building your own Pact tooling, let us know, we would love to shout about it.
- [**Roadmap / Feature Requests**](https://docs.pact.io/roadmap) - The Pact roadmap is available on Canny, where you can see some of the teams current and upcoming priorities in the OSS space. You can request new features, or browse the list and vote/comment on ones you would love to see. See one that particularly resonates? You could help work on it, reach out via [Slack](https://pact-foundation.slack.com/ssb/redirect) and we can help guide you through your contribution.
- [**Recipes**](https://docs.pact.io/recipes) - The community use our tools in a variety of different ways, and solve various challenges that others could benefit. Got something to share? Why not add a new recipe to the site?
- [**Workshops**](https://docs.pact.io/implementation_guides/workshops) - We created a number of workshops, across several languages. Is there a language implementation not covered in the workshop? Maybe you've created or seen some amazing workshops out there in the wild? Add it to the list, or if you are the author, you can discuss bringing your workshop under the Pact-foundation, if you feel all Pact users could benefit
- [**Blogs, Videos & Articles**](https://docs.pact.io/blogs_videos_and_articles) - Articles about contract testing are appearing left, right and centre, I can't keep up. Make sure our reading list doesn't get dry, by adding your favourite content to the list
- [**Events**](https://docs.pact.io/events) - Meetups, in person, it feels like a distant memory, but as the doors start opening again, and dinner is provided, people are beginning to flock outdoors. Have you got a meetup or event planned? Already had one and recorded it? You can add them to the list, and let us and the community know about it on Slack.
- [_Helping those in the community_](https://docs.pact.io/help) - We know many of you in the community love sharing your contract testing knowledge with others, you can see the various places our users land for help, sometimes in GitHub issues, Stack overflow, or Slack. You are welcome to help them out whether you are new to Pact, or a seasoned pro, all questions, opinions and thoughts are welcome.
- _Pact champions_ - Are you like our co-founder Beth Skurrie, who decided that Pact idea was the best thing since sliced bread, and she hasn't stopped yacking on about it since. Want to share your knowledge, and build your social profile in the world of tech with a global platform? Please get in touch with me on [Slack](https://pact-foundation.slack.com/ssb/redirect), we want to support the amazing work you do!
  If you love Pact, and want to help the world worry less about micro-service deployment, why not join us on our journey. Who knows where it might lead.

That's all for now, catch you next month!

- Yousaf Nabi — Developer Advocate at PactFlow and Community Shepherd at Pact.
