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

ROUND UP

### Pactober Workshops

Want to learn more about Pact, how it works, and how you can get hands-on?

Watch one, or the series of workshops over on our YouTube channel.

- :tv: [Pactober Workshop 1 - HTTP Pact](https://www.youtube.com/watch?v=Gx-R2Cn1HZE)
  - https://docs.pact.io/university/introduction/00_1_Intro
- :tv: [Pactober Workshop 2 - Message Pact](https://www.youtube.com/watch?v=81N25-4x27E)
  - https://docs.pact.io/getting_started/how_pact_works#non-http-testing-message-pact
- :tv: [Pactober Workshop 3 - Plugin Pact](https://www.youtube.com/watch?v=0FpzPRSf2VA3)
  - https://docs.pact.io/plugins/quick_start
  - https://github.com/pact-foundation/pact-plugins/tree/main/examples
- :tv: [Pactober Workshop 4 - How Pact is built](https://www.youtube.com/watch?v=QIza-D-f7DI)
  - https://docs.pact.io/diagrams/ecosystem

## OSS Updates

- Pact Rust
- Pact PHP
- Pact Python

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

### Pact-Go

Stanislav Vodetskyi helped deliver both a fix and an enhancement to Pact-Go

- [fix: set install_name to absolute path for libpact_ffi.dylib](https://github.com/pact-foundation/pact-go/pull/350)
- [feat: No color output](https://github.com/pact-foundation/pact-go/pull/341)

Alex also managed to add a change to our v1 (Ruby-backed) pact-go implementation, which will help him out with running multiple pact verifiers in parallel.

- [fix(verifier): acquire HTTP port atomically](https://github.com/pact-foundation/pact-go/pull/344)

Are you using Pact-Go v2? Fancy lending a hand updating the [pact-go workshop](https://github.com/pact-foundation/pact-workshop-go), to use pact-go v2?

Let me know, and I'm sure I can dig up some swag!

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

## Community Events

Are you hosting a Pact event? Let us know and we can feature it in the blog and list it on our events section.

## Thats a wrap

That’s it for this month. Stay safe and carry on coding!

- Yousaf Nabi — Developer Advocate at PactFlow and Community Shepherd at Pact.
