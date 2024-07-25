---
title: Pact Open Source Update — July 2024
author: Yousaf Nabi
authorURL: https://twitter.com/you54f
tags: [pact, oss, community]
keywords: [pact, oss, community]
date: 2024-07-26
draft: false
hide_table_of_contents: false
---

👋 Hey all, 2024 is racing ahead ⏳, we are now 207 days into the year 😲, as I write this July Pact Post. As usual, I'll be keeping you up to date with all the latest happenings across the Pact Ecosystem.

## Pact OSS Updates

## General Updates

### Pact RFC Process

As you may be aware, there are multiple places where one can [get help or request changes](https://docs.pact.io/help) to the Pact ecosystem, either across the whole ecosystem, or for an individual repositories. Canny, our public roadmap, GitHub project boards on individual repositories, [Slack](https://docs.pact.io/help/how_to_ask_for_help) to name a few.

Some of Pact's maintainers also work together, and as such conversations, discussions and agreements can be made but not consistently communicated, leaving users, for example who don't frequent Slack, or one of our [maintainer sessions](https://github.com/pact-foundation/roadmap/blob/master/README.md#-maintainer-sessions), to feel excluded from conversations.

As such we've decided to deprecate our Canny roadmap and have migrated 95% of the issues to GitHub, in our new [Roadmap](https://github.com/pact-foundation/roadmap/issues) repo, to keep issues close to where the code is.

To try and counter some of the concerns around the decision-making process, we felt a RFC (Request for comments) process would be beneficial to allow for a record of proposed changes and decisions, and provide a central place to users, contributors and maintainers to go.

You can view the first pass at what the RFC process may look like in this proposed [PR](https://github.com/pact-foundation/roadmap/pull/96).

We would love users to participate and help shape the future of Pact you want to see.

## Specific language updates

### Pact-Reference

#### Pact FFI

Another month, another release for libpact_ffi, this time [`0.4.22`](https://github.com/pact-foundation/pact-reference/releases/tag/libpact_ffi-v0.4.22)

It includes some QoL fixes, including correcting pact-plugin shutdown behaviour on Windows, and users being unable to find pacts [#67](https://github.com/pact-foundation/pact-plugins/pull/67), when using a Pact Broker URL which is hosted on a sub path [#420](https://github.com/pact-foundation/pact-reference/issues/420)

For a full list, check out the [release notes](https://github.com/pact-foundation/pact-reference/releases/tag/libpact_ffi-v0.4.22).

:::info
Pact FFI consists of multiple individual Pact rust crates.

Click on the Upgrade pact_* to x.y.z link in the release notes, to take you to the associated changelog.

Click [here](https://docs.pact.io/diagrams/ecosystem#rust-goldberg-machine) a diagrammatic view of the Pact Rust ecosystem, over on our docs site.
:::

#### Pact Mock Server v2.0 is here \o/

[We mentioned in April](https://docs.pact.io/blog/2024/05/23/pact-open-source-update-may-2024#pact-reference---pact-mock-server), that Ron was redesigning Pact Mock Server, as the existing mock server implementation was written in 2017-2019, and contained some esoteric TLS code that was more complex to upgrade to Hyper 1.0 than to rewrite it using newer Hyper 1.0 constructs.

Upgrading to Hyper 1.0 also brought us the following benefits:

- Supports both HTTP 1 and 2 with the same server implementation
- Supports protocol upgrades (leading to supporting things like Web Sockets)
- Middleware support
- No more need for the custom TLS code

Check out the [release log](https://github.com/pact-foundation/pact-core-mock-server/blob/main/pact_mock_server/CHANGELOG.md#200---final-200-release) to find out what went into the rewrite, and watch out for the updated mock server making it's way through the Pact ecosystem shortly.

#### Pact-Reference - Slack

Chat with us in: [#pact-rust](https://pact-foundation.slack.com/archives/CA2S7E6KC).

### Pact-Plugins

It's been nearly 2 years since we introduce the Pact Plugin framework to the world.

We've seen 2 plugins created by Pact maintainers (pact-protobuf-plugin, pact-csv-plugin), 2 created by non-maintainers (pact-avro-plugin, in-house json-rpc plugin) and provided a course to guide you on how to [build your own plugin](https://docs.pact.io/plugins/workshops/create-a-plugin/intro) (pact-matt-plugin).

We know there are some rough edges, and we have been mulling over what the future of Pact-Plugins could look like. We want to start gathering feedback from users, maintainers and plugin authors, even if you tried it out and got stuck. We will see an RFC (request for comments) ticket being raised in the Roadmap soon and we would like to hold some group sessions to discuss, where participants will get to earn some swag for their time, as well as the satisfaction of being able to shape Pact Plugins destiny, whatever that may be!

#### Pact-Plugins - Slack

Have you tried out Pact Plugins yet? What's stopping you?

Chat with us in: [#pact-plugins](https://pact-foundation.slack.com/archives/CA2S7E6KC).

### Pact-Go

Pact-Go [`v2.0.6`](https://github.com/pact-foundation/pact-go/releases/tag/v2.0.6) has been released which updates libpact_ffi to `0.4.21`, go deps, and you'll find an updated [Dockerfile](https://github.com/pact-foundation/pact-go/blob/master/Dockerfile) which is tested in CI, along with newly added MacOS CI runners (both x86_64 & arm64). Windows CI will be added soon, the pact-plugin shutdown fix came out of issues in executing plugins in this [PR](https://github.com/pact-foundation/pact-go/pull/443). Oh and you might have found that if you are using plugins in pact-go, that they aren't shutting down cleanly, [fixed that](https://github.com/pact-foundation/pact-go/pull/435) for you.

I've also been trying to track down a pesky intermittent bug on MacOS/Linux systems whilst using plugins. Some [workarounds](https://github.com/pact-foundation/pact-go/pull/434) were applied directly to pact-go in the above release, however I believe the proper solution is in the pact-plugin driver. I've added a [pull request](https://github.com/pact-foundation/pact-plugins/pull/69) which I hope to get merged soon, and pulled in pact-go.

#### Pact-Go - Slack

Chat with us in: [#pact-go](https://pact-foundation.slack.com/archives/C9UTHTFFB).

### Pact-JS

Pact-JS-Core [`v15.1.1`](https://github.com/pact-foundation/pact-js-core/releases/tag/v15.1.1) has been released which updates libpact_ffi to `0.4.21`.

Pact-JS [`v13.1.1`](https://github.com/pact-foundation/pact-js/releases/tag/v13.1.1) has been released which [fixes #1229 - MatchersV3.reify doesn't extract payload from MatchersV3.nullValue()](https://github.com/pact-foundation/pact-js/issues/1229)

[Pact-JS-CLI](https://www.npmjs.com/package/@pact-foundation/pact-cli) is doing well, we are seeing lots of users switching over going by the ~23.5k downloads since we released it last month. I've put in a [PR](https://github.com/pact-foundation/pact-js-cli/pull/14) for review, which aims to leverage npm's optional dependencies, to support packaging and releasing of os/arch specific npm packages, which are consumed in the main project. This has the benefits of ensuring that only the required binaries for the platform you are running on, are downloaded.

#### Pact-JS - Slack

Chat with us in: [#pact-js](https://pact-foundation.slack.com/archives/C9VBGLUM9).

### Pact-Python

[Val Kolovos](https://github.com/valkolovos) has continued adding features for pact-python.

Check out the PR here: [Feat/async message provider](https://github.com/pact-foundation/pact-python/pull/725) and keep a lookout on the [pact-python blog](https://pact-foundation.github.io/pact-python/blog/) for a dedicated post soon

Thanks Val 💛!

If you want to get involved, don't forget, we have a [Pact Compatibility suite](https://github.com/pact-foundation/pact-compatibility-suite) which is a set of BDD style tests to check compatibility between Pact implementations. There are full implementations in JVM, and Rust, with Tien over in Pact-PHP using it to guide and validate his Pact Rust core based implementation of Pact-PHP.

#### Pact-Python - Slack

Chat to us in: [#pact-python](https://pact-foundation.slack.com/archives/C9VECUP6E).

### PHP

Tien has been enjoying the summer, and a well deserved break after the epic work bringing the pact rust core to pact-php, so put down that 🍸 and give it a try!

Anyone can start testing pact-php with pact_ffi code by updating their `composer.json`

`"pact-foundation/pact-php": "10.0.0-beta2"`

This brings a raft of features to the Pact-PHP ecosystem including V4 Pact Specification support, access to the Pact Plugin ecosystem and huge speed benefits over the 9.x Ruby based release.

You can see a full range of examples [here](https://github.com/pact-foundation/pact-php/tree/master/example)

#### Pact-PHP - Slack

Chat to us in: [#pact-php](https://pact-foundation.slack.com/archives/C9W94PXPY).

## Thats a wrap

Want to carry on the conversation? Sign up [here](https://slack.pact.io/) to join our Slack community, where you will be amongst over 5.7K other users. It's a safe place to ask questions, and a great place to share the awesome work you are doing in the Pact ecosystem.

Whatever you are up to, let us know, and we can look to get you featured in the Pact post.

See you next month folks!

Cheers,
Saf
