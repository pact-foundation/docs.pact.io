---
title: 🔗 End of year wrap up 2024
author: Yousaf Nabi
authorURL: https://github.com/you54f
tags: [pact, oss, community, plugins, 2024, history, wrapup, almanac]
keywords: [pact, oss, community, plugins, 2024, history, wrapup, almanac]
date: 2024-12-19
draft: false
hide_table_of_contents: false
---

## Pact Almanac 2024

Grab your hoverboard, and get prepared for another trip back to the future, with our round up of this years Pactivities in our seasonal Pact Almanac.

![image](https://user-images.githubusercontent.com/19932401/207968429-dad9294a-2221-41cb-b387-6acd7c0bba4f.png)

This year we've seen the migration to the Pact Rust core, featuring V4 spec good including combined interactions and plugins, begin to take fruition in most of the major client libraries, and improvements and consistencies across of tooling, documentation and examples. We know there is much more to do, as always, and we've been pleased to see an increasing amount of contributions, across a wide array of repositories in the pact-foundation. We've seen an RFC process created, to help democratise large scale decisions which affect the Pact eco-system, and I would invite you all to get involved in some way, shape or form.

If you haven't read our monthly blog posts, you can read a round-up of the most significant changes from each month in there. Check out the side-bar to the left to view the older posts.

I've mainly focused on community heroes this time round, where you can find multiple advocates of Pact, spreading the word of not just how to do contract testing, but the why. You'll hear about the worlds first dedicated book to contract-testing. I hope you'll enjoy them, be sure to like and comment on the videos, whether it's to show your appreciation or you just fancy a debate.

I'll also pull out a stand-out change from each month either by the team or one of our many contributors.

Anyhow, let see what each month has in store for us.

### Jan

🧑‍💻 [Tien Vo](https://github.com/tienvx) started by year by continuing and productionising the migration of Pact-PHP over to the Rust core. We saw the first community created [pact_compatibility_suite examples](https://docs.pact.io/blog/2024/02/19/pact-open-source-update-feb-2024#php) land this month, and Tien has worked diligently all year, in implementing not only new features to Pact-PHP, but contributions to the Pact ecosystem as a whole, from an [RFC](https://github.com/pact-foundation/roadmap/pull/99) for `form-urlencoded` matching ability, to several changes in the Pact-Rust core and Pact-Plugin ecosystem. It has seen great feedback from users, including Steve Taylor.

> Not an issue as such, just want to say I love it. (I'm using 10-alpha3)
>
> It's so much faster and simpler, and I'm looking forward to using some of the newer Pact specification features.
>
> My API tests came across easily without much fuss.

Pact-PHP v10, was made generally available in September, in this [release](https://github.com/pact-foundation/pact-php/releases/tag/10.0.0).

Well done Tien! Your hard work has paid off and is very much appreciated by the community.

### Feb

- 🧑‍💻 February saw more libraries progress towards the Rust core and Pact V4 Spec goodness.
  - Pact-Net v5 Beta was [released](https://docs.pact.io/blog/2024/02/19/pact-open-source-update-feb-2024#net) for V4 Pact compat support and mixed interactions
  - [Pact-JS v12.2.0 GA'd](https://docs.pact.io/blog/2024/02/19/pact-open-source-update-feb-2024#node-js) the PactV4 interface for plugin support
  - Pact-Python's v3 interface was progressing with another implementation of the [pact_compatibility_suite](https://docs.pact.io/blog/2024/02/19/pact-open-source-update-feb-2024#python).
- 🧑‍💻 A plan was set out to provide better platform support for Linux, in terms of distro compatibility, musl and arm64.
  - [Yo dawg, I heard you like Alpine](https://docs.pact.io/blog/2024/02/19/pact-open-source-update-feb-2024#yo-dawg-i-heard-you-like-alpine)
  - [You and whose ARMy?](https://docs.pact.io/blog/2024/02/19/pact-open-source-update-feb-2024#who-and-whose-army)

Community hero of the month: [Stanislav Vodetskyi](https://docs.pact.io/blog/2024/02/19/pact-open-source-update-feb-2024#community-shout-outs) for all the improvements in the Pact-Go project, and learning Rust on the fly to aid himself and the Pact community by proxy.

### Mar

- 🧑‍💻 Multi-arch images were finally produced for Docker, enabling arm64 users on Linux, or most likely with new Apple silicon based Macs
  - [pact rust core projects](https://docs.pact.io/blog/2024/03/26/pact-open-source-update-mar-2024#pact-reference)
    - pact-ref-verifier
    - pact-ref-mock-server
    - pact-stub-server
  - [pact-broker](https://docs.pact.io/blog/2024/03/26/pact-open-source-update-mar-2024#pact-broker)
  - [pact-cli](https://docs.pact.io/blog/2024/03/26/pact-open-source-update-mar-2024#pact-ruby-cli)

Community hero of the month: [Dany Marques](https://github.com/pact-foundation/pact-js-core/pull/494) for his tenacity in tracking down an obscure bug in the npm ecosystem, and creating upstream fixes, as well as resolving his issue in the interim in the pact-js project.

### Apr

- 🧑‍💻 [Josh Ellis](https://github.com/JP-Ellis) was thrilled to announce the release of Pact Python v2.2, a significant milestone that not only improves upon the existing features but also offers an exclusive preview into the future of contract testing with Python. He posted about it over at pact-pythons new doc site, in its [inaugural blog post](https://pact-foundation.github.io/pact-python/blog/2024/04/11/a-sneak-peek-into-the-pact-python-future/) from maintainer Josh Ellis.

We've often wondered when a book dedicated to contract testing would appear on the scene. We even had this statement on the books section of our site

> We're not aware of any books currently dedicated to contract testing, but here are some that talk about Pact and contract testing as part of a broader microservices development and testing strategy

However good news everybody 🎺 the first one was announced back in April.

![contract testing in action](http://localhost:3000/assets/images/cover_contract_testing_in_action_small-4884770267dd86a21c15ce58db4af0ba.png)

Community hero(es) of the month: Marie Cruz and Lewis Prescott, for being awesome but also releasing Contract Testing in Action 📕 under the MEAP (Manning Early Access Program), the first book dedicated to contract testing.

### May

- 🧑‍💻 Alpine was finally supported for CLI's and the FFI shared library, and alongside it, changes were made to reduce the size of the Pact libraries, so whilst I began to add Alpine support into the client libraries, existing users got the benefits of quicker downloads. You can read about it [here](https://docs.pact.io/blog/2024/05/23/pact-open-source-update-may-2024#general-updates)
- 🧑‍💻 Ron started a redesign/rewrite for a V2 version of the Pact Reference Mock Server

Community hero of the month: [Praveen Erode Mohanasundaram](https://www.linkedin.com/in/praveen-em/) - A Long time Pact advocate and community contributor who spoke at Devoxx UK about Contract Testing: The Key to Unlocking E2E Testing Bottlenecks in CI/CD pipeline, you can [catch the video on YouTube](https://www.youtube.com/watch?v=RSl_JcWKE3M) 📺

### June

- 🧑‍💻 The Pact reference project saw the closure of a couple of long-standing issues which affected cross-platform compatibility and repeated test runs, these unblocked the Pact-Net V5 released, and drove additional changes in Pact-JS. Read more [here](https://docs.pact.io/blog/2024/06/25/pact-open-source-update-june-2024#pact-reference)
- 🧑‍💻 Pact-JS saw the splitting of the ruby cli, from the main package, and the birth of the new `@pact-foundation/pact-cli` package. This meant we could deliver native Alpine support to the Pact JS project, including the shared libraries in the project, and due to the package size reductions, the resultant package which contained a pre-built binary for every supported platforms, is now smaller than previously, despite the addition of musl x86_64/arm64 shared libs.

Community hero of the month: [Mark Bradley](https://mark-bradley.net/about/) who announced he would be speaking GopherConUK 2024 in August. He his topic will be "Using Pact to deploy Microservice with confidence". He has previously posted videos and guides on how to get started with Pact in PHP and Go.

### July

As you may be aware, there are multiple places where one can get help or request changes to the Pact ecosystem, either across the whole ecosystem, or for an individual repositories. Canny, our public roadmap, GitHub project boards on individual repositories, Slack to name a few.

Some of Pact's maintainers also work together, and as such conversations, discussions and agreements can be made but not consistently communicated, leaving users, for example who don't frequent Slack, or one of our maintainer sessions, to feel excluded from conversations.

As such we decided to deprecate our Canny roadmap and have migrated the issues to GitHub, in our [Roadmap repo](https://github.com/pact-foundation/roadmap), to keep issues close to where the code is.

To try and counter some of the concerns around the decision-making process, we felt a RFC (Request for comments) process would be beneficial to allow for a record of proposed changes and decisions, and provide a central place to users, contributors and maintainers to go.

- You can read about the accepted process [here](https://github.com/pact-foundation/roadmap/blob/master/rfc/0000-rfc-process.md)

You can get involved via GitHub, but we also catch once every two weeks in our Maintainer meets.

- 10am-10:45am UTC (11am GMT / 8pm AEST)

You can download a calender invite from our [repo](https://github.com/pact-foundation/roadmap?tab=readme-ov-file#-maintainer-sessions)

A google document holds our agenda which is openly editable and where anyone can table ideas for discussion.

- 🧑‍💻 Pact Mock Server v2.0 is here \o/

We mentioned in April, that Ron was redesigning Pact Mock Server, as the existing mock server implementation was written in 2017-2019, and contained some esoteric TLS code that was more complex to upgrade to Hyper 1.0 than to rewrite it using newer Hyper 1.0 constructs.

Upgrading to Hyper 1.0 also brought us the following benefits:

- Supports both HTTP 1 and 2 with the same server implementation
- Supports protocol upgrades (leading to supporting things like Web Sockets)
- Middleware support
- No more need for the custom TLS code

Check out [the release log](https://github.com/pact-foundation/pact-core-mock-server/blob/main/pact_mock_server/CHANGELOG.md#200---final-200-release) to find out what went into the rewrite, and watch out for the updated mock server making it's way through the Pact ecosystem shortly.

- 🧑‍💻 It's been nearly 2 years since we introduce the Pact Plugin framework to the world.

We've seen 2 plugins created by Pact maintainers (pact-protobuf-plugin, pact-csv-plugin), 2 created by non-maintainers (pact-avro-plugin, in-house json-rpc plugin) and provided a course to guide you on how to build your own plugin (pact-matt-plugin).

We know there are some rough edges, and we have been mulling over what the future of Pact-Plugins could look like. We want to start gathering feedback from users, maintainers and plugin authors, even if you tried it out and got stuck. We will see an RFC (request for comments) ticket being raised in the Roadmap soon and we would like to hold some group sessions to discuss, where participants will get to earn some swag for their time, as well as the satisfaction of being able to shape Pact Plugins destiny, whatever that may be!

Community hero of the month: [Val Kolovos](https://github.com/valkolovos) for continuing adding features to pact-python's v3 interface with the rust core, such as async messaging and matchers. Read about it [here](https://docs.pact.io/blog/2024/07/30/pact-open-source-update-july-2024#pact-python)

### Aug

- 🧑‍💻 The RFC process is approved. Bring on the changes.
- 🧑‍💻 Bas Djistrka from [OnTestAutomation](https://www.ontestautomation.com/) launched a new course, [Practical contract testing with Pact](https://ontestautomation.teachable.com/p/practical-contract-testing-with-pact)
- 🧑‍💻 Pact compatibility suite, I've mentioned it a couple of times, so what actually is it?

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

Community hero of the month: [Augusto Colombelli](https://github.com/augustocolombelli) for his blog post Contract Tests — APIs Guided by Consumers, which you can read over on Medium [here](https://medium.com/@augustocolombelli/contract-tests-apis-guided-by-consumers-caf8f2460e7c).

### Sept

- 🧑‍💻 We saw our first two RFC's raised. Sweet!
  - [rfc: configuration and shared files](https://github.com/pact-foundation/roadmap/pull/98) proposed by [`@JP-Ellis`](https://github.com/JP-Ellis)
  - [rfc: Define matching rules for form-urlencoded body](https://github.com/pact-foundation/roadmap/pull/99) by [`@tienvx`](https://github.com/tienvx)
- 🧑‍💻 Ruby was not to be left out from the Pact Rust core, goodness. my pact-ffi ruby wrapper gem saw its first real world user. Read about it in more detail [here](https://docs.pact.io/blog/2024/09/30/pact-open-source-update-sept-2024#sbmt-pact---pact-v3v4--plugin-support)

Community hero of the month: [Murat K Ozcan](https://github.com/muratkeremozcan) has recently been taking an adventure in the world of Pact, after picking up Marie & Lewis' Contract testing in Action book. He has written 3 posts which are well worth a [read](https://docs.pact.io/blog/2024/09/30/pact-open-source-update-sept-2024#murat-k-ozcan---a-triple-whammy-of-contract-testing-posts).

### Oct

- 🧑‍💻 Pact-Net V5 is launched! Read about it [here](https://docs.pact.io/blog/2024/10/28/pact-open-source-update-oct-2024#pact-net)
- 🧑‍💻 A suite of message pact workshops were created to help users get started. See it [here](https://docs.pact.io/blog/2024/10/28/pact-open-source-update-oct-2024#pact-message-workshops)
- 🎉 Pact Slack now has over 6 thousand members!

We were really proud to say we have just crossed the 6k mark, with 6005 members in our general channel in Pact Slack.

We appreciate many users journeys through Slack are transient, either whilst they are getting started with the Pact ecosystem, or after some help, and encounters may be all but fleeting. It is worth noting that not an insignificant amount of us have had the good fortune of meeting new friends, both in person, and virtually, making professional relationships and providing springboards to new opportunities. Some of the interactions have had positive life-changing impacts, your authors journey included.

We are proud to be able to foster a safe environment, where people are welcome to discuss contract testing with a captive audience, and for every engineer who finds that eureka moment where contract testing, just clicks, we know it is improving the API delivery landscape massively and has a net benefit to many interactions we have in our day-to-day life with systems.

If you are proud about the positive impacts Pact has had in your place of work, why not share it with the world? We can provide you a platform, and sharing your engineering mistakes and successes, is a great way to build transparency and trust with your customers, and promote a healthy learning based culture in your organisation.

Community hero of the month: [Lewis Prescott](https://www.pactman.co.uk/) for taking to the stage at CypressConf to teach users about the fundamentals of contract testing as well as how to implement consumer-driven contract testing with Cypress + Pactflow.

### Nov

- 🧑‍💻 We've saw a few improvements in the pact-ruby project
  - V3 & V4 Generators thanks to [Steve Taylor](www.github.com/slt)
  - Pact-provider-verifier now works with Rack 3, after we decided to fork rack-reverse-proxy in order to provide backwards compat with Rack 2 but allow for forwards compat with Rack 3+
  - Tweaks to Pact contract generation and verification, after ruby json 2.8.0 changes the way that JSON.pretty_generate renders empty collections such as arrays or objects. This allowed us to ensure that contracts generated with pre and post json 2.8.x behave in the same way.

I mentioned back in August, about the `sbmt-pact` project, which afforded users the ability to leverage the Pact V3 & V4 specification in Ruby.

I've spent a bit of time with the project, to see what changes I would need to make, to allow the functionality to slot into Pact-Ruby and allow for the minimum changeset, for existing pact-ruby users. I'm pleased to say that I've got pretty far and have documented in this issue TODO: link to sbmt-pact issue.

I've tested this out in real-world Ruby projects.

- Pact-Broker:
  - `sbmt-pact` can verify existing v2 pacts generated by the Pact-Ruby core, and v2/v3/v4 pacts generated by the Pact-Rust core.
- Pact_Broker-client
  - `sbmt-pact` can create v2/v3/v4 pacts

Community hero of the month: Ben Brugman & Ashley Gautama - For reaching Pact Nirvana, at their organisation, across many many teams. Read his celebratory post [here](https://www.linkedin.com/posts/bernardusbrugman_last-week-was-a-good-week-for-ashley-gautama-activity-7244006332339556352-XThO)

### Dec

- 🧑‍💻 A set of new proposals for discussion in the Pact Plugin ecosystem. Wondering what plugins are? Read the [quick start](https://docs.pact.io/plugins/quick_start)

| Proposal                                                                                                                                           | State | Discussion                                                     |
| -------------------------------------------------------------------------------------------------------------------------------------------------- | ----- | -------------------------------------------------------------- |
| [V2 Plugin Interface](https://github.com/pact-foundation/pact-plugins/blob/main/docs/proposals/001_V2_Plugin_Interface.md)                         | Draft | https://github.com/pact-foundation/pact-plugins/discussions/83 |
| [Support script language plugins](https://github.com/pact-foundation/pact-plugins/blob/main/docs/proposals/002_Support_script_language_plugins.md) | Draft | https://github.com/pact-foundation/pact-plugins/discussions/84 |
| [Support WASM plugins](https://github.com/pact-foundation/pact-plugins/blob/main/docs/proposals/003_Support_WASM_plugins.md)                       | Draft | https://github.com/pact-foundation/pact-plugins/discussions/85 |

Community hero of the month: [Ruth](https://github.com/huehnerlady) - A long time pact-jvm user, Ruth has been in contact with the team over several issues in her Pact setup, and has provided some of the best reproducible examples I've come across. Glad to see Pact doing so well for you in your organisation, maybe next year we can get you to do a guest blog post. No pressure, but that also applies to my readers. It could be you here, in our wrap up for 2025!

### See you next year folks

Thanks for everyone's efforts in using, promoting, and preaching about Pact to everyone you know, now its our time to repay the favour.

If you've done something great, and want to share it, [get it listed](https://docs.pact.io/contributing) - the site is open source and you can edit any page, we want to give you a platform to help amplify your voice!

Maybe there is time to get one last video/blog or PR in before crimbo! No, only joking, that’s a wrap for this year's Pact Open Source Almanac, pop your feet up, enjoy your puds and hope to see your name in the book next year.
