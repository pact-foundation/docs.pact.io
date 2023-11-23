---
title: Pact Open Source Update — November 2023
author: Yousaf Nabi
authorURL: https://twitter.com/you54f
tags: [pact, oss, community]
keywords: [pact, oss, community]
date: 2023-11-22
draft: false
hide_table_of_contents: false
---

Happy November everyone! I'm sure holidays for most are fast approaching, and as it's the season for giving, we'll be sharing all the updates across the Pact community and giving you a heads-up about our latest webinar where you can see all of SmartBears open source tools in action, including yours truly, Pact.

## OSS Updates

- Pact Compatibility Suite
- Pact Reference
- Pact PHP
- Pact Python
- Pact Broker Client
- Pact MSW Adapter

### Pact Compatibility Suite

Tien Vo (Pact-PHP), and Josh Ellis (Pact-Python), have both been working on verifying their Pact client implementations against the new [Pact Compatibility Suite](https://github.com/pact-foundation/pact-compatibility-suite).

It will help root out inconsistencies in implementations and ensure feature parity. If you are interested in checking it out, or contributing, please [jump in](https://github.com/pact-foundation/pact-compatibility-suite). You can retrospectively apply the tests against existing implementations to ascertain their completeness/correctness.

This will be a massive boost to end users, so we would appreciate any help!

### Pact Reference

As Tien as been working through the compatibility suite, he has noted some improvements that can be made to the Pact-FFI, which would otherwise has been found sporadically usually through end-user issues.

- [fix: Fallback to always generate a value to fix 'Could not generate a random TYPE from null'](https://github.com/pact-foundation/pact-reference/pull/335)
- [chore: Add compatability-suite V4 tests to CI](https://github.com/pact-foundation/pact-reference/pull/339)
- [feat: Apply generators to message's contents](https://github.com/pact-foundation/pact-reference/pull/340)
- [feat: Apply generators to message's metadata](https://github.com/pact-foundation/pact-reference/pull/341)
- [feat: Apply generators to message's contents and metadata](https://github.com/pact-foundation/pact-reference/pull/342)
- [feat: Add pactffi_message_with_metadata_v2](https://github.com/pact-foundation/pact-reference/pull/343)
- [refactor: Reuse matching rules and generators processing code](https://github.com/pact-foundation/pact-reference/pull/345)

### Pact-PHP

Tien brings more features to the `ffi` branch of pact-php

- [feat: Support inheritance for body](https://github.com/pact-foundation/pact-php/pull/363)
- [feat: Allow capture verifier output](https://github.com/pact-foundation/pact-php/pull/362)
- [feat: Allow capture mock server mismatches](https://github.com/pact-foundation/pact-php/pull/361)

### Pact Python

Josh implemented the Pact (Consumer) Compatibility Suite (V1) in [this PR](https://github.com/pact-foundation/pact-python/pull/468) utilizing the pact_ffi core, great steps in progress towards full specification compatibility, and that juicy V3 and V4 Pact Spec goodness, you Pythonista's have been waiting for.

### Pact Broker Client

Two new features arrive in the Pact-Broker Client.

1. [`pact-broker publish PACT_DIRS_OR_FILES --auto-detect-version-properties`](https://docs.pact.io/pact_broker/client_cli/readme#publish)
   1. When publishing Pacts, by setting `--auto-detect-version-properties`, you can now automatically detect the repository commit, branch and build URL from known CI environment variables or git CLI.
   2. Supports Buildkite, Circle CI, Travis CI, GitHub Actions, Jenkins, Hudson, AppVeyor, GitLab, CodeShip, Bitbucket and Azure DevOps.
   3. `--auto-detect-version-properties` is aliased to `-r` to ease of use
   4. The recent feature improvement introduces the detection of the `commit` and `buildUrl`, rather than only the branch, greatly simplifying our recommended Pact Nirvana workflows for users
2. [`delete-branch`](https://docs.pact.io/pact_broker/client_cli/readme#delete-branch)
   1. Users now can delete branches from the CLI

### Pact MSW Adapter

Mock Service Worker (MSW) has fast been becoming the industry standard API mocking for JavaScript, we heard that cry, and created a [project](https://github.com/mswjs/msw/issues/572) to help you leverage the contract testing goodness of Pact, with the power of MSW.

At the end of October, Artem, MSW's creator [announced](https://mswjs.io/blog/introducing-msw-2.0) the launch of MSW v2.0, with a raft of changes to improve the life of end-users and plugin authors.

Not long after, [Jakub Riedl](https://github.com/jakubriedl) from CultureAmp, long time friends of Pact, helped bring our adapter in line with MSW v2.0. You can check out the [PR](https://github.com/pactflow/pact-msw-adapter/pull/126) here. This is actually his third contribution to the adapter, which is awesome to see.

Not only that, [Joel Whalen](https://github.com/Joelasaur) has been working on support for GraphQL, in the adapter. Already supported by MSW, this would allow for MSW gql interactions to generate Pact contracts. You can check out his progress [here](https://github.com/pactflow/pact-msw-adapter/pull/125).

I also noted whilst I was npm surfing, a new [pact-msw](https://www.npmjs.com/package/pact-msw) package has been launched, this isn't an officially supported version but it's always great to see people working with Pact in the wild, so it might be worth your time checking it out.

## Maintainer Meets

Want to help shape the future of Pact? Why not join us?

We catch up every week with alternating times for the sessions, to aid with syncing with Europe / Austrailian members

- 9am-9:45am UTC
- 9pm-9:45pm UTC

You can download a calender invite from our DevRel repository, see [Pact Community Meeting.ics](https://github.com/pact-foundation/devrel/blob/master/Pact%20Community%20Meeting.ics)

A google document holds our [agenda](https://docs.google.com/document/d/1v_QWyYEl7rxR5hV0EQAcTFjBbiq5_uzn7_WMMYILRac/edit?usp=sharing) which is openly editable and where anyone can table ideas for discussion.

## Pact in the wild

### Bazel + Pact

[We spoke with Olivier Picaud](https://docs.pact.io/blog/2023/07/28/pact-open-source-update-july-2023#community-corner---olivier-picaud) back in July, about the work he was doing with Bazel & Pact, and why it was so important, personally for him.

We have an update

>Hello,
>
>I have worked to associate Pact within Bazel by providing rules_pact
>The good news is that rules_pact has been accepted to be part of the official [Bazel Central Registry](https://registry.bazel.build/modules/rules_pact)
>
>Happy to share this contribution with you guys and again thanks to help teams to facilitate their testing journey :)
>
>Voilà :)
>
>Olivier

You can check out the GitHub repo [https://github.com/opicaud/rules_pact](https://github.com/opicaud/rules_pact) and a full worked example in [https://github.com/opicaud/monorepo](https://github.com/opicaud/monorepo)

## Community Events

> Are you hosting a Pact event? Let us know and we can feature it in the blog and list it on our events section.

### Show and Tell: Discover the Benefits SmartBear’s Open-Source Tools Bring to the SDLC

On Tuesday Dec 5th 2023 at 10am ET, the [SmartBear Dev-Rel team](https://github.com/SmartBear-DevRel) will be showcasing OpenAPI, Swagger, Stoplight, Pact and SoapUI and how they can be used across your SDLC, along with tips, links and pointers on how to get involved with these open-source tools and communities.

You can register [here](https://bit.ly/49KSSPZ), where if you can't make it, you'll be sent an recording for on-demand viewing.

![Dec 5th OSS Webinar](https://slack-imgs.com/?c=1&o1=ro&url=https%3A%2F%2Fsmartbear.com%2Fsmartbearbrand%2Fmedia%2Fimages%2Fresources%2Fspeakers%2Fapi-os-toolkit-webinar_live_regnow_1200x628.png)

## Community Corner

### Omer Morad introduces Automock

We spoke to Omer Morad [back in June 2022](https://docs.pact.io/blog/2022/06/08/pact-open-source-update-june-2022#nestjs--pact--3), where he introduced NestJS-Pact into the Pact Foundation fold. We caught up with him this week, to find out what he's been up to.

**Welcome Omer, we heard from you around a year ago in one of our community corner updates. I hear you’ve been working on a new open source project, would you like to tell our readers a little about it?**

>I've been working on Automock, an open-source mocking framework. Much of my time has been spent manually mocking for unit tests in dependency injection environments like NestJS. It may cause test suites to become unmanageably large and convoluted. For this reason, I made [Automock](https://github.com/automock/automock). By creating mock objects for class dependencies automatically, it simplifies the unit testing procedure. Compatibility across multiple DI and testing frameworks will make the unit testing process easier by allowing developers to focus on writing test cases rather than manually configuring mock configurations.

Awesome! Thanks for sharing with us, hopefully this [Automock](https://github.com/automock/automock) is useful to others. You can find Omer in our Pact Slack group where you can talk about all things open source.

## Thats a wrap

That’s it for this month. Stay safe and carry on coding!

- Yousaf Nabi — Developer Advocate at PactFlow and Community Shepherd at Pact.
