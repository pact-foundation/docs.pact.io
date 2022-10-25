---
title: Pact Open Source Update — July 2022
author: Yousaf Nabi
authorURL: https://twitter.com/you54f
tags: [pact, oss, community]
keywords: [pact, oss, community]
date: 2022-07-26
draft: false
hide_table_of_contents: false
---

Welcome to the Pact Open Source July 2022 update!

Hope you have all been enjoying the sun whenever you are in the world, unless like our Pact core team, you live in Australia. Sweaters at the ready.

This month has seen a flurry of activity across the open source space, with many new contributors helping in a multitude of ways, so we will call out some notable mentions.

‌Thanks to all of the contributors who have made this happen, if you haven’t been mentioned here but wish to appear in a later update, feel free to reach out to me on Slack.

## Specific language updates

### Golang

Attention Golang users - the latest 2.x.x is out (2.0.0-beta.13)! :rocket:This is quite a big change from the past release, namely we’ve been thinking about the API design with the introduction of V4 and plugins.

Summary:

- V4 Pact support
- Support for synchronous messages
- Support for plugins (e.g. for gRPC + Protobufs support <https://github.com/pact-foundation/pact-go/tree/2.x.x/examples/grpc>)

A word from our Pactflow co-founder & pact-go maintainer [Matt Fellows](https://github.com/mefellows)

> Because the API is more complex, we’ve used a type state builder pattern to force which options can be used at any point in time, and ensure that pre-requisite methods are called in sequence.
> We are still not 100% happy with the HTTP package layout (and requiring V2/V3/V4 prefixes on a number of types), so there might be another refactor in that space, but mainly we think it would just be the names of types and packages that could change.
> We will tidy up the documentation over the next few days, but look to the examples folder in the short term if you’re wondering what’s changed. Our core maintainer found refactoring the existing examples fairly straightforward, so we hope you do too.

Chat with us in: [#pact-go](https://pact-foundation.slack.com/archives/C9UTHTFFB)

### Node JS

[Pact-JS](https://github.com/pact-foundation/pact-js) - Pact specification V3 beta now supports modifying the request body in the verifier which has been a long standing issue and more work is progressing on stabilizing for General release: <https://github.com/pact-foundation/pact-js/tree/feat/v3.0.0/> (v10.0.0-beta.60). Follow the roadmap progress.

Chat with us in: [#pact-js](https://pact-foundation.slack.com/archives/C9VBGLUM9)

### Rust

Pact FFI 0.3.3 was released <https://github.com/pact-foundation/pact-reference/releases/tag/libpact_ffi-v0.3.3> which brought in [add retries to the provider state change calls](https://github.com/pact-foundation/pact-reference/commit/18118e8280bd1da2d89d0e366d81c6a4628c4911) along with some bug fixes

Chat with us in: [#pact-rust](https://pact-foundation.slack.com/archives/CA2S7E6KC)

### .Net

PactNet 4.1.0 is now released and pushed which [allows publishing verification results for URI sources](https://github.com/pact-foundation/pact-js/pull/875)

See the [upgrade guide](https://github.com/pact-foundation/pact-net/blob/4.0.0/docs/upgrading-to-4.md) for details of the rewrite and how to upgrade from 3.x to 4.x

Chat with us in: [#pact-net](https://pact-foundation.slack.com/archives/C9UTHV2AD)

## Community Corner

You lot were busy this month, despite the sunny climes, don’t forget to nip outdoors!

Just look at all the merged Pull Requests that have come in from the community.

You are all awesome

### Pull Requests – Features/Fixes

Big call out to [Dave Clissold](https://github.com/DaveClissold) who performed the first two PR’s in this list, which resolved one of the most active outstanding [issues](https://github.com/pact-foundation/pact-js/issues/304) in Pact-JS and indeed across the pact-foundation. It was 3 years old, and shows how difficult it can be to get changes in, with ever-changing demands, but you can get involved, and help deliver the features you want now, and we can help guide you along

- <https://github.com/pact-foundation/pact-js/pull/873>
- <https://github.com/pact-foundation/pact-js/pull/875>
- <https://github.com/pact-foundation/pact-go/pull/209>
- <https://github.com/pact-foundation/pact-js/pull/882>
- <https://github.com/pactflow/example-bi-directional-consumer-mountebank/pull/6>
- <https://github.com/pact-foundation/pact_broker/pull/569>

### Pull Requests – Docs

Much respect to Eduardo Lopez for [adding illustrations to our docs](https://github.com/pact-foundation/docs.pact.io/pull/152), to help guide people around the OSS Broker UI, it’s not all about the code, and there is always a need to keep our documentation up to date and consistent. Found a snag, patch it up with a new PR and get some committer kudos. It can be as easy as adding screenshots, and it will make a massive difference

- <https://github.com/pact-foundation/pact-provider-verifier/pull/83>
- <https://github.com/pact-foundation/docs.pact.io/pull/152>
- <https://github.com/pact-foundation/docs.pact.io/pull/151>
- <https://github.com/pact-foundation/pact-jvm/pull/1571>
- <https://github.com/pact-foundation/docs.pact.io/pull/152>
- <https://github.com/pactflow/swagger-mock-validator/pull/6>
- <https://github.com/pact-foundation/docs.pact.io/pull/153>
- <https://github.com/pact-foundation/pact-go/pull/204>
- <https://github.com/pact-foundation/docs.pact.io/pull/154>
- <https://github.com/pact-foundation/pact-net/pull/411>

### Pull Requests – Maintenance Stuff

Shout out to [Artur Neumann](https://github.com/individual-it), for being a pivotal member in supporting the pact-js beta rollout and helping make Matt’s life a little easier.

- <https://github.com/pact-foundation/pact-python/pull/297>
- <https://github.com/pact-foundation/pact-php/pull/263>
- <https://github.com/pact-foundation/pact-js/pull/885>
- <https://github.com/pact-foundation/pact-js/pull/883>

### Community Spotlight – Mike Geeves

We haven’t spoken enough about [Mike Geeves](https://github.com/mikegeeves) from Bearly Compiling :chef kiss: - He has been working on Pact on and off, over the last couple of years, and has been thoroughly confused enough by our examples at times, to want to do something about it!! Mike has helped me during my time joining the Pactflow team and has been great for the occasional rant, and productive conversations that always end up in more work. I don’t think we’ve quite cracked pomodoro.

So why did Mike start tickling Pact?

> I tend to try and come up with ideas, which I can at least PoC enough to demonstrate what I mean, and then see if there's any uptake of the idea to progress, if not bin it, which has led to the slightly bizarre situation where my first ever open source contribution was in Rust for pact-rust, and I cannot code in Rust :joy:

So what are Mike and I up to now? We are looking at our examples with a particular focus on our support for Message Pacts across the different libraries and building up a compatibility matrix with documentation driven from examples. Want to join us on the adventure? Get involved in #documentation over at slack.pact.io

That's all for now, catch you next month!

- Yousaf Nabi — Developer Advocate at Pactflow and Community Shepherd at Pact.
