---
title: Pact Open Source Update — July 2023
author: Yousaf Nabi
authorURL: https://twitter.com/you54f
tags: [pact, oss, community]
keywords: [pact, oss, community]
date: 2023-07-28
draft: false
hide_table_of_contents: false
---

:wave: Hello, its July, it's scorching so I hope you've got an ice cream to accompany you this episode or maybe a brolly if you are stuck in a rain-shower!

For the keener of our readers, you may note we missed our June episode. I was on holiday ( a rare treat! ) which was spent mainly away from the keyboard,
with the exception of a little flurry in pact-python.

Never fear, a double-dose of Pact Open Source updates are here!

## OSS Updates

It has been a busy two months in the world of Pact, read on for updates on

- Pact Docs
- Pact Reference
- Pact Net
- Pact Go
- Pact JS
- Jest Pact
- NestJS Pact
- Pact Broker
- Pact Python
- Pact PHP
- Pact in the community

### Pact Docs

The [path to Pact Nirvana guide](https://docs.pact.io/pact_nirvana) is now updated to cover

- Branches
- Recording Deployments
- `can-i-deploy --to-environment`
- `contract_requiring_verification_published` webhook
- New diagrams courtesy of MermaidJS

Want to see `can-i-merge` functionality incorporated into the broker? Vote on [this feature request](https://pact.canny.io/feature-requests/p/add-can-i-merge-functionality)

### Pact-Reference

A raft of bug-fixes and features have been applied across the pact-reference project.

Features

- [Cargo Features to slim down transitive dependencies for simpler cases #290](https://github.com/pact-foundation/pact-reference/issues/290)
- [Allow StringPattern for simple text response](https://github.com/pact-foundation/pact-reference/issues/291)
- [Add crate feature for JUnit report output](https://github.com/pact-foundation/pact-reference/commit/b9e034b2f3a04e4aabcd623c2dbfdccbfe98a1eb)
- [pact_mock_server_cli osx aarch64](https://github.com/pact-foundation/pact-reference/pull/266)
- [Add application/x-www-form-urlencoded to the known content types](https://github.com/pact-foundation/pact-reference/commit/7dd8938476ec00dce4f7ce81e6d44ba42ef04e13)
- [Add method to DocPath to return a lower-case copy of the path](https://github.com/pact-foundation/pact-reference/commit/52d6bfaba4e6d7cf65dbedef40c05eb129bd35f7)

Fixes

- [Can't receive list of active servers](https://github.com/pact-foundation/pact-reference/issues/274)
- [Java SimpleDateFormat format limitation](https://github.com/pact-foundation/pact-reference/issues/279)
- [Rust: JSON post request results in Request-Mismatch with default values #282](https://github.com/pact-foundation/pact-reference/issues/282)
- [Matching expressions don't support escaping characters in strings #283](https://github.com/pact-foundation/pact-reference/issues/283)
- [rust pact_consumer doc: how to trigger generation of pact files?](https://github.com/pact-foundation/pact-reference/issues/294)
- [How do you pass an Integration JSON object for eachValue matcher?](https://github.com/pact-foundation/pact-reference/issues/299)
- [multi-valued headers are incorrectly verified](https://github.com/pact-foundation/pact-reference/issues/300)
- [MatchingRule::from_json should support integration format](https://github.com/pact-foundation/pact-reference/commit/4b4e71059d2cf0fb9fb9ea2a485e5bf69b145d24)
- [Header matching rules should be looked up in a case-insenstive way](https://github.com/pact-foundation/pact-reference/commit/445ea1ee11a0b1fa55e6557759d21874cc9ccefc)

Latest Releases

- [libpact_ffi-v0.4.6](https://github.com/pact-foundation/pact-reference/releases/tag/libpact_ffi-v0.4.6)
- [libpact_models-v1.1.8](https://github.com/pact-foundation/pact-reference/releases/tag/libpact_models-v1.1.8)
- [pact_consumer-v1.0.3](https://github.com/pact-foundation/pact-reference/releases/tag/pact_consumer-v1.0.3)
- [pact_verifier-v1.0.1](https://github.com/pact-foundation/pact-reference/releases/tag/pact_verifier-v1.0.1)
- [pact_verifier_cli-v1.0.0](https://github.com/pact-foundation/pact-reference/releases/tag/pact_verifier_cli-v1.0.0)
- [libpact_mock_server-v1.2.1](https://github.com/pact-foundation/pact-reference/releases/tag/libpact_mock_server-v1.2.1)
- [pact_mock_server_cli-v1.0.3](https://github.com/pact-foundation/pact-reference/releases/tag/pact_mock_server_cli-v1.0.3)
- [libpact_matching-v1.1.3](https://github.com/pact-foundation/pact-reference/releases/tag/libpact_matching-v1.1.3)

### Pact-Net

The PactNet 5.0 RFC is complete with PactNet [5.0.0.beta.1](https://github.com/pact-foundation/pact-net/releases/tag/5.0.0-beta.1) now released.

This bring in the ability to generate V4 Specification Pact's using the same API as V3 sync and async pacts and utilise combined pact files for both http and message based interactions. This removes the limitation requiring services which comprise of both http and message-based interactions to be named differently.

See the [migration guide for upgrading to PactNet 5.x](https://github.com/pact-foundation/pact-net/blob/master/docs/upgrading-to-5.md)

### Pact-Go

Pact-Go V2 has officially been released, following an extended beta period. We are very grateful to our many early users who provided invaluable feedback.

You can check out the full release notes [here](https://github.com/pact-foundation/pact-go/releases/tag/v2.0.0)

and for those migrating from v1, you can check out the migration guide [here](https://github.com/pact-foundation/pact-go/blob/master/MIGRATION.md)

This update replaces the pact-ruby core, with the pact-rust core, utilized through the pact_ffi library, bringing support for V3 and V4 Pact specifications and the ability to load pact-plugins to extend the capabilities of pact-go.

- Supported platforms.
  - Linux x86_64 / arm64
  - MacOS x86_64 / arm64
  - Windows x86_64

Please note that Alpine Linux is not supported at this time.

#### New Features

- [support binary bodies in async plugin messages #302](https://github.com/pact-foundation/pact-go/pull/302) fixes [ContentType being set as application/json for protobuf messages #265](https://github.com/pact-foundation/pact-go/issues/265)

### Pact-JS

JavaScripters/TypeScripters/Nodemads

We listened to our community, who struggled with requiring python to install pact-js in order to get at that lovely rust pact-core functionality in pact-js v10 & v11 and pact-js-core v13

You can now find they both come fully charged with batteries included, meaning that supported platforms can use pact js v12 and pact-js-core v14 with `--ignore-scripts true` and no additional install time build requirements

- Supported platforms.
  - Linux x86_64 / arm64
  - MacOS x86_64 / arm64
  - Windows x86_64
- [Migration notes](https://github.com/pact-foundation/pact-js/blob/master/MIGRATION.md#11xx---12xx)
- Troubleshooting
  - [Failed to find native build](https://github.com/pact-foundation/pact-js/blob/master/docs/troubleshooting.md#failed-to-find-native-build)
  - [Failed to find node:path](https://github.com/pact-foundation/pact-js/blob/master/docs/troubleshooting.md#enoent-no-such-file-or-directory-open-nodepath)
  
In addition, the new releases now support versions of Node 16 and greater, CI testing has been dropped for earlier versions, and we explicitly set the `engines` value in the `package.json` of both `pact-js` and `pact-js-core` to honour this restriction. We would advise updating your projects to an in support LTS version, (Node 18 LTS is probably most sensible at this point and node 16 is due to EOL on 11th Sept 2023)

- [Pact-JS v12 Release Notes](https://github.com/pact-foundation/pact-js/releases/tag/v12.0.0)
- [Pact-JS-Core v14 Release Notes](https://github.com/pact-foundation/pact-js-core/releases/tag/v14.0.0)

#### New Features

- Support for eachKey and eachValue matchers has been added to pact-js via [pull #1303](https://github.com/pact-foundation/pact-js/pull/1103) which closes [issue #952](https://github.com/pact-foundation/pact-js/issues/952)

### Jest-Pact

[Updated to reference peer-dep of pact-js 12.x](https://github.com/pact-foundation/jest-pact/pull/242)

### NestJs-Pact

[Updated to reference peer-dep of pact-js 11.x and nest-js 10.x](https://github.com/pact-foundation/nestjs-pact/pull/47)

### Pact-Broker

Pagination support was added via [pull #622](https://github.com/pact-foundation/pact_broker/pull/622)

You can find the current documentation and supported endpoints [here](https://github.com/pact-foundation/pact_broker/blob/master/docs/api/PAGINATION.md)

A few performance enhancements were made at the same time.

- [add contract_data_updated_at to integrations table to speed up dashboard query](https://github.com/pact-foundation/pact_broker/pull/617)
- [add method to automatically determine the model associations required to be eager loaded for a decorator](https://github.com/pact-foundation/pact_broker/pull/621)
- [add schema for pagination query parameters](https://github.com/pact-foundation/pact_broker/pull/620)

### Pact-Python

Pact-Python 2.0.0 has been released

- What does it contain?
  - ARM64 for both Linux & MacOS is now natively supported by Pact Python
  - Linux Support for x86 platforms (32-bit) has been dropped
  - The ruby standalone now runs the latest ruby 3.2.2 (big bump  - from a deprecated Ruby 2.4)
  - Plus a few other fixes and enhancements from the community and maintainers.
- [Release notes](https://github.com/pact-foundation/pact-python/releases/tag/v2.0.0)
- [PyPi Release](https://pypi.org/project/pact-python/2.0.0/)

Whats next for Pact-Python?

- [Dropping support for Python 3.6](https://github.com/pact-foundation/pact-python/issues/350)
- [Support for pact verification by URI](https://github.com/pact-foundation/pact-python/pull/356)
- [Pact FFI in Pact-Python](https://github.com/pact-foundation/pact-python/pulls)

### Pact-PHP

Pact-PHP 9.0.0 has been released

- What does it contain?
  - ARM64 for both Linux & MacOS is now natively supported by Pact PHP
  - Linux Support for x86 platforms (32-bit) has been dropped
  - The ruby standalone now runs the latest ruby 3.2.2 (big bump from a deprecated Ruby 2.4)
  - Plus a few other fixes and enhancements from the community and maintainers.
  - The CI Pipeline has dependabot hooked up, to ensure our dependencies stay up to date
  - Release documentation has been added to aid future maintainers
  - Support for PHP 7.4 has been dropped. You should be on 8 by now though, surely
- [Release Notes](https://github.com/pact-foundation/pact-php/releases/tag/9.0.0)
- [Packagist Release](https://packagist.org/packages/pact-foundation/pact-php#9.0.0)

Whats next for Pact-PHP?

Oh Hi FFI :blobwave:

[#262 Pact FFI in Pact PHP](https://github.com/pact-foundation/pact-php/issues/262)

### Pact in the community

#### Pact-graph-network

We [mentioned](https://docs.pact.io/blog/2022/11/17/pact-2022-end-of-year-wrapup#dec) Guillaume Camus's pact-graph-network tool back in December. It's just [been updated](https://github.com/ManoManoTech/pact-graph-network/releases/tag/v0.8.0) to support multiple target architectures, and [now supports authentication mechanisms](https://github.com/ManoManoTech/pact-graph-network#usage) whether you have a basic auth protected Pact Broker, or a Bearer token protected PactFlow Broker.

So what are waiting for? Go forth and generate some broker charts, and why not share us your graphs via https://twitter.com/@pact_up or pact-slack.

## Hello Jo

I imagine you've heard of [Cucumber](https://cucumber.io/), the testing tool, not the veggie, If not, Cucumber is a tool for running automated acceptance tests guided by a technique called BDD (Behaviour-Driven Development), written in plain language called Gherkin. It has strong overlaps with our principles of contract testing and the Pact DSL, and is often part of a development teams tool-set alongside Pact for developing robust, quality systems. The similarities don't end there, it also has a thriving community which has been spearheaded by Jo Laing, in [GitHub](https://github.com/cucumber), [Slack](https://cucumber.io/docs/community/get-in-touch/) and in [many events](https://cucumber.io/resources/) across the globe.

I have the pleasure of inviting her to join me in my role as community shepherd, and know she will be helping to bring some organisation to the fold, including things like maintainer sessions and training, she has worked on the [Cucumber school](https://cucumber.io/school/) which is an incredible free resource to help those learn about BDD, I would :heart: a Pact School - if such a thing would float users boats.

## Community Corner - Olivier Picaud

Autonomy within development teams is really valuable, tied with standardisation and goverance in an organisation, it can empower your teams. However it isn't all roses, it can also lead to fragmented tooling across the landscape, especially when developing microservice-based architectures in the dream of multiple protocols and languages all working in harmony. The landscape is always moving quickly but we are going to shine the spotlight on how open-source, both in terms of its tools, its users and contributors are helping to push things forward.

gRPC makes it easier to build high-performance microservices by providing generated service entrypoints in a variety of different languages. Bazel complements these efforts with a capable and fast polyglot build environment. Pact now offers the ability to test gRPC
services via its extensible plugin mechanism, and it complements both gRPC and Bazel well, affording engineers the confidence to build applications in a stable repeatable manner, all whilst gaining that rich feedback from contract-testing.

We caught up with [Olivier Picaud](https://github.com/opicaud), who felt the draw, and utilised the power of open-source not only to power his journey of learning, but to share his progress, so that others can follow along. You can find his pull request showcasing his work [here](https://github.com/pact-foundation/pact-reference/pull/255)

<div><img src="https://avatars.githubusercontent.com/u/1059698?v=4" alt="Olivier Picaud" width="150" heigh="150" /></div>
<br/>

>To learn monorepos, i put in place some grpc microservices using pact to validate interactions.
>Also, to facilitate the monorepo building, i am using Bazel and so i "bazelify" protobuf-plugin and pact-reference to get a >pact_verifier_cli and protobuf-plugin compiled from source --> Today, local consumer/provider testing is working well.

>From Docker (and then from Kubernetes) i am trying to use the image you provide https://hub.docker.com/r/you54f/pact_verifier_cli, with the addition of protobuf-plugin from Bazel :) (still currently in dev)

>See here:

>- https://github.com/opicaud/pact-reference (fork)
>- https://github.com/opicaud/pact-protobuf-plugin (fork)
>- https://github.com/opicaud/monorepo

>What I learned and still learning is :

>- improving cohesion of teams by pulling them in a monorepo structure
>- improving local development and determinism by providing one tool and the necessary toolchains for different platforms coming with the monorepo --> pact-reference and pact-protobuf-plugin was "bazelifed" for this purpose
>- optimizing test strategy (and notably with pact-grpc) to provide enough confidence to just run health checks when products are deployed.
providing an unique pipeline to build / test / release and deploy using gitops magic monorepo's components in less than 10 minutes to accelerate feedback (incremental builds are amazed for this purpose)
>- I am currently migrating to bazel 6.0 because they use a new way of dealing with dependencies and then i will need to realign my fork to your master to pull out few updates that you made guys :) and then continuing to provide an end-to-end flow (i do not have an cli for instance to "play" with the entire product)

>It's also very nice to participate to the community, i've participate to few others bazel-project by testing PR, providing feedback and red tests :)

Thanks Oliver for taking the time to share with us. It's exciting to hear about pull requests dropping in other areas outside of Pact as part of this effort. I hope this empowers others to take on journeys of discovery through code, through collaboration, as that is how our open source ecosystem in enriched.

Are you using Bazel in your organisation? Are you building tooling on top of pact-reference? Why not let us know! We could bring it into the codebase as part of an external builds directory as suggested by [Ron](https://github.com/pact-foundation/pact-reference/pull/255#issuecomment-1467264412) so don't by shy!

## Pactober

__Celebrating Pact's 10 Year Milestone__

2023 marks 10 years of Pact Open Source. To celebrate, during the month of October – which we’ve coined Pactober – we’re facilitating community events across the globe to celebrate and acknowledge the journey and look forward to the future of Pact.

Be sure to bookmark our [Pactober event page](https://pact.io/pactober) where you can register to keep up to date, or to join us in hosting an event. We want to bring you all in to the celebrations, and help bring more contributors to the Pact family and help it live for another
10 years and beyond

## Thats a wrap

That’s it for this month. Stay safe and carry on coding!

- Yousaf Nabi — Developer Advocate at PactFlow and Community Shepherd at Pact.
