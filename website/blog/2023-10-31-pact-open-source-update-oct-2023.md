---
title: Pact Open Source Update — October 2023
author: Yousaf Nabi
authorURL: https://twitter.com/you54f
tags: [pact, oss, community]
keywords: [pact, oss, community]
date: 2023-10-31
draft: false
hide_table_of_contents: false
---

:ghost: Happy Halloween all! This month you can look forward to our round up of all things [Pactober](https://pact.io/pactober) that happened this month to celebrate 10 years of Pact and the usual open-source updates from across the Pact ecosystem.

## Pactober

Your 🗺️ to the months events.

- :tv: : [Improving Software Quality with Contract Testing and Pact with Seb Rose](https://www.youtube.com/watch?v=5vAV1lTGJyE)
- :tv: : [Opening Keynote - Testing The Boundaries - Sam Newman](https://www.youtube.com/live/s1LOP4Ak5SA?t=2497&feature=shared)
- :tv: : [Fireside chat Featuring Bas Dijkstra, Lewis Prescott & Dave Farley](https://www.youtube.com/live/s1LOP4Ak5SA?t=6450&feature=shared)
- :tv: : [Hello from the Pact Core Team with Beth Skurrie, Ron Holshousen & Matt Fellows](https://www.youtube.com/live/s1LOP4Ak5SA?t=577&feature=shared)
- :tv: : [Pact Updates - Matt Fellows](https://www.youtube.com/live/s1LOP4Ak5SA?t=10794&feature=shared)
- :tv: : [Pact Blog - Yousaf Nabi](https://www.youtube.com/live/s1LOP4Ak5SA?t=12695&feature=shared)
- :tv: : [Pact PHP - Tien Vo](https://www.youtube.com/live/s1LOP4Ak5SA?feature=shared&t=13090)
- :tv: : [Pact Python - Joshua Ellis](https://www.youtube.com/live/s1LOP4Ak5SA?feature=shared&t=12762)
- :tv: : [Pact TAU Course - Rafaela Avezedo](https://www.youtube.com/watch?v=s1LOP4Ak5SA&t=13400s)
- :tv: : [Keynote - Beware the Integrated Tests Scam: A Retrospective And An Apology - J.B. Rainsberger](https://www.youtube.com/live/s1LOP4Ak5SA?t=14230&feature=shared)

### Pactober Workshops

Want to learn more about Pact, how it works, and how you can get hands-on?

Watch one, or the series of workshops over on our YouTube channel & check out the supporting material

- :tv: [Pactober Workshop 1 - HTTP Pact](https://www.youtube.com/watch?v=Gx-R2Cn1HZE)
  - [Workshop Course](https://docs.pact.io/university/introduction/00_1_Intro)
    - Flavours:
      - [JS](https://github.com/pact-foundation/pact-workshop-js)
      - [GoLang](https://github.com/pact-foundation/pact-workshop-go)
      - [.NET](https://github.com/pactflow/pact-workshop-dotnet-core-v1)
      - [JVM - Gradle/JUnit4/SpringBoot](https://github.com/pact-foundation/pact-workshop-jvm-spring)
      - [JVM - Maven/JUnit5/SpringBoot](https://github.com/pact-foundation/pact-workshop-Maven-Springboot-JUnit5)
      - [Ruby](https://github.com/DiUS/pact-workshop-ruby-v2)
      - [Android](https://github.com/DiUS/pact-workshop-android)
- :tv: [Pactober Workshop 2 - Message Pact](https://www.youtube.com/watch?v=81N25-4x27E)
  - [Ron's intro to Message Pact - Part 1](https://dius.com.au/2017/09/22/contract-testing-serverless-and-asynchronous-applications/)
  - [Ron's intro to Message Pact - Part 2](https://dius.com.au/2018/10/01/contract-testing-serverless-and-asynchronous-applications---part-2/)
  - [Pact Specification V3 introducing Message Pact](https://github.com/pact-foundation/pact-specification/tree/version-3?tab=readme-ov-file#version-30)
  - [How Message Pact Works](https://docs.pact.io/getting_started/how_pact_works#non-http-testing-message-pact)
  - [Pact V4 Interaction Types](https://github.com/pact-foundation/pact-specification/tree/version-4?tab=readme-ov-file#interactions)
  - [Example SNS Consumer using Message Pact](https://github.com/pactflow/example-consumer-js-sns) (JS)
  - [Example SNS Provider using Message Pact](https://github.com/pactflow/example-provider-js-sns) (JS)
- :tv: [Pactober Workshop 3 - Plugin Pact](https://www.youtube.com/watch?v=0FpzPRSf2VA3)
  - [Pact Plugins Repo](https://github.com/pact-foundation/pact-plugins)
  - [Pact Plugins Overview](https://docs.pact.io/plugins/quick_start)
  - [Pact Plugins Examples](https://github.com/pact-foundation/pact-plugins/tree/main/examples)
  - [Pact Plugins Matching Rules](https://docs.pact.io/implementation_guides/pact_plugins/docs/matching-rule-definition-expressions)
  - [Pact V4 Interaction Types](https://github.com/pact-foundation/pact-specification/tree/version-4?tab=readme-ov-file#interactions)
  - [Pact Protobuf Plugin](https://github.com/pactflow/pact-protobuf-plugin) built by PactFlow, well Ron :joy:
  - [Pact Avro Plugin](https://github.com/austek/pact-avro-plugin) built by [Ali Ustek](https://github.com/austek/pact-avro-plugin/commits?author=austek)
  - [Create your own Pact Plugin workshop](https://docs.pact.io/plugins/workshops/create-a-plugin/intro)
- :tv: [Pactober Workshop 4 - How Pact is built](https://www.youtube.com/watch?v=QIza-D-f7DI)
  - [Pact Specification](https://github.com/pact-foundation/pact-specification)
  - [Pact Feature Support](https://docs.pact.io/roadmap/feature_support)
  - [Pact Ecosystem](https://docs.pact.io/diagrams/ecosystem)
  - [Pact Language Guides](https://docs.pact.io/implementation_guides/cli)
  - [Pact Compatibility Suite](https://github.com/pact-foundation/pact-compatibility-suite)
  - [FFI Wiki](https://en.wikipedia.org/wiki/Foreign_function_interface)
  - [FFI OmniBus](https://jakegoulding.com/rust-ffi-omnibus/)
  - [C DataTypes Wiki](https://en.wikipedia.org/wiki/C_data_types)
  - [Pact FFI Online Docs](https://docs.rs/pact_ffi/latest/pact_ffi/) via Docs.rs:
  - [Pact FFI Code](https://github.com/pact-foundation/pact-reference/tree/master/rust/pact_ffi)
  - [Pact FFI Releases](https://github.com/pact-foundation/pact-reference/tags) (Look for `libpact_ffi-v<release version>`)

## OSS Updates

- Pact Rust
- Pact PHP
- Pact Python
- Pact Go
- Pact Mock Service
- Pact Broker

### Pact PHP

Tien Vo showcased the work he has been doing in Pact-PHP during our Pactober birthday bash, you can check it out :tv: [here](https://www.youtube.com/live/s1LOP4Ak5SA?feature=shared&t=13090).

![](https://github-production-user-asset-6210df.s3.amazonaws.com/19932401/279366995-2f20edc4-4c4d-48aa-bcb0-028920f1ce1e.png)

However if you just want to jump into the code, Tien has published a new release [`10.0.0-alpha3`](https://github.com/pact-foundation/pact-php/releases/tag/10.0.0-alpha3)

You can find lots of examples in the `ffi` branch showcasing the new functionality.

Check out the [merged pull requests](https://github.com/pact-foundation/pact-php/pulls?q=is%3Apr+is%3Aclosed), for all the latest work to date, and the [open pull requests](https://github.com/pact-foundation/pact-php/pulls?q=is%3Aopen+is%3Apr) for anything you can help review!

### Pact Python

Joshua Ellis said Hello World to the Pact community during our Pactober birthday bash, you can check it out :tv: [here](https://www.youtube.com/live/s1LOP4Ak5SA?feature=shared&t=12762).

He has also been super busy in the world of Pact-Python where we've seen a hive of activity.

Josh published his first release, [`v2.1.0`](https://github.com/pact-foundation/pact-python/releases/tag/v2.1.0) which is the first to include pre-built wheels published to GitHub.

This release also drops support for Python 3.6 and 3.7, allowing for improvements to the build-system that will keep Pact-Python healthy and maintainable long into the future.

Josh is now working on implementing the FFI feature set, in order to deliver v3 and v4 Pact functionality to the Pact-Python project, which can be tracked in the following [issue](https://github.com/pact-foundation/pact-python/issues/396)

If you want to get involved, why not reach out via the GitHub repo, or via [#Pact-Python](https://pact-foundation.slack.com/archives/C9VECUP6E) Slack channel.

You'll also notice new issue templates, and labelling across the project, which should hopefully make the triaging process slicker for everyone. Please feel free to try it out and give us feedback, good, bad or ugly!

### Pact Go

Stanislav Vodetskyi helped deliver both a fix and an enhancement to Pact-Go

- [fix: set install_name to absolute path for libpact_ffi.dylib](https://github.com/pact-foundation/pact-go/pull/350)
- [feat: No color output](https://github.com/pact-foundation/pact-go/pull/341)

Alex also managed to add a change to our v1 (Ruby-backed) pact-go implementation, which will help him out with running multiple pact verifiers in parallel.

- [fix(verifier) acquire HTTP port atomically](https://github.com/pact-foundation/pact-go/pull/344)

Are you using Pact-Go v2? Fancy lending a hand updating the [pact-go workshop](https://github.com/pact-foundation/pact-workshop-go), to use pact-go v2?

Let me know, and I'm sure I can dig up some swag!

### Pact Mock Service

As our Pact ruby ecosystem progressed onto Ruby 3.x, it allowed Pact-mock_service to be updated to provide compatibility with Rack 3.

This was kindly provided by provided in this [PR](https://github.com/pact-foundation/pact-mock_service/pull/146) via Adam Forsyth.

### Pact Broker

Ben Brugman made his [first PR ever](https://github.com/pact-foundation/pact-broker-docker/pull/154) :hooray: - This one upgraded Supercronic, which is a core dependency in our Pact Broker Docker image.

## Pact in the wild

### Sngular OSS presents PactBuilderDSL for Java users

PactBuilderDSL is a Java library that automates the generation of DSL for bodies in contract definition.

> Do you struggle with writing the body validations for contract testing? If you're working with Java... I'm pretty sure you do.

It's pretty common to have huge methods with very similar code to generate them.

This is a need the Sngular team have detected many times not only in the community but also with our clients.

If all this is familiar to you, and you're interested in learning more, watch their talk on :tv: [PactBuilderDSL](https://pact.io/pactober/workshop/watch/pact-jvm-dsl).

**Itching to see the code?** You can see it in their GitHub repo [sngular/pact-annotation-processor](https://github.com/sngular/pact-annotation-processor) and published to the [Maven repository](https://mvnrepository.com/artifact/com.sngular/pact-annotation-processor/1.0.0).

### How we reached Pact Nirvana

Nathan Deamer, long time friend and Pact advocate, works over at [GoCity](https://gocity.com/) where he looks after a team of incredible engineers.

We remember Barry Irvine's post from February about his [adventures with Pact & Android](https://medium.com/go-city/pact-contract-testing-in-android-ff7e996d0910).

Nathan shows us Pact through a wider lense at GoCity, as he shows us how they reached Pact Nirvana. It's a great read and motivating if you are on your own Pact journey yourself.

Check it out [here](https://medium.com/go-city/how-we-reached-pact-nirvana-diamond-level-5d55e5c388d0)

## Community Corner - Jo Laing

If you have tuned in you the Pactober events, you'll probably be bored of my voice, so how about hearing from the lovely Jo Laing, your Pact community manager.

**Hello Jo, without further ado, you’ve been getting to know the Pact community this year, how’s it all been going?**

> I can’t deny on being a little apprehensive having come from managing the Cucumber community group where I am super comfortable and familiar, so it was a relief when I realised this community was actually a very similar space and I even recognised some of the member names from the Cucumber community which has helped me join some dots between Cucumber/BDD and Pact/Contract Testing (win, win). Having the support of the amazing team at Pact has been a big bonus too. I’ve also had to face my fear of GitHub and am happy to say it’s honestly not as bad as I thought 😉

**Can you tell us anything about what’s coming up for the Pact community?**

> We’ve started hosting a weekly maintainers community meeting (Check out the open agenda [here](https://docs.google.com/document/d/1v_QWyYEl7rxR5hV0EQAcTFjBbiq5_uzn7_WMMYILRac/edit)) which a few maintainers attend. I’d love to see more attendee’s at those meetings and foster those relationships to build a healthy core maintainer group. 
> 
> GitHub triage is the next big focus for the group. Pact has many repositories so we need to do some housekeeping and get a process in place for managing those.
> 
> Looking forward to 2024, there will also be a focus on improving and sharing the educational material we have around Pact and contract testing to help guide people who are interested/starting out.
> 
> I’d also love to host more Fireside Chat type sessions too, as the session we held at Pactober was just getting juicy when we had to call time. Reach out to me if this appeals to you.

**We worked together to deliver the Pactober event this month 🙌 what were your highlights from the event?**

> Oh so many! Jamming with you on the organisation of the event was fun! I really enjoyed the freedom we had to manage the whole event end to end.  Meeting the speakers was awesome too, what a lovely bunch of people. I’d like to give a big thanks and shout out to everyone from the community involved who helped deliver the event.

> I’m excited to see what we can all collaborate on in the future.

**Your role changed this year to Open Source Community Manager at SmartBear and you now have three open source communities to shepherd – how is that shaping up?**

> Yes, I’ve been set quite a challenge here! Alongside the Cucumber and Pact open source communities, I’ve also been tasked with trying to establish a new community group for another of SmartBear's open source tools, Swagger. Now the Pactober event is mostly wrapped up, I have more time to focus on the planning and setting up of whatever works for this group - so lots of outreach, asking, listening and experimenting with our Swagger users in order to shape up the right community setting.
> _So much to do!_

So much to do indeed Jo, thank you for taking the time to share with the readers! Couldn't have done this event without you, and looking forward to helping share some of the support, in your journey with the Swagger community and beyond.

## Community Events

Are you hosting a Pact event? Let us know and we can feature it in the blog and list it on our events section.

## Thats a wrap

That’s it for this month. Stay safe and carry on coding!

- Yousaf Nabi — Developer Advocate at PactFlow and Community Shepherd at Pact.
