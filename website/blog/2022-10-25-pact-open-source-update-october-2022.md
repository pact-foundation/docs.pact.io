---
title: Pact Open Source Update — October 2022
author: Yousaf Nabi
authorURL: https://twitter.com/you54f
tags: [pact, oss, community]
keywords: [pact, oss, community]
date: 2022-10-25
draft: false
hide_table_of_contents: false
---

Welcome to the October Pact Open Source update! I’ve got some great things to share this month – new PRs, some awesome community members writing and talking about contract testing, plus a sneak peak of our upcoming Pact Plugin Framework launch! Let’s get into it.

## Summary of the good stuff

### Merged PRs

It's been a busy couple of months, and the PRs have been coming thick
and fast. Here's a roundup of the top merged PRs.

- **Pact-JS**
  - [ARM64 Support](https://github.com/pact-foundation/pact-js-core/pull/404)
  - [V4 Error handling logic](https://github.com/pact-foundation/pact-js/pull/942)
  - [fix: Fix issue where MatchersV3.string() with no arguments would not correctly match strings](https://github.com/pact-foundation/pact-js/pull/946)
- **Pact-PHP**
  - [Support matchers in path](https://github.com/pact-foundation/pact-php/pull/264)
  - [Unlock amphp/cache](https://github.com/pact-foundation/pact-php/pull/275)
- **Pact-JVM**
  - [Fix issue with consumer version selector method being protected](https://github.com/pact-foundation/pact-jvm/pull/1605)
  - [Use Thread Context ClassLoader to find test resources](https://github.com/pact-foundation/pact-jvm/pull/1607)
  - [Bump version of Kotlin Result to work around build failures](https://github.com/pact-foundation/pact-jvm/pull/1606)
- **Pact-Reference**
  - [fix(verifier): fix typos in the implementation of Display on the PactSource enum](https://github.com/pact-foundation/pact-reference/pull/218)
  - [fix(pact_verifier_cli): stop using deprecated clap::parser::matches::arg_matches::ArgMatches::values_of_lossy](https://github.com/pact-foundation/pact-reference/pull/219)

### PRs awaiting review

You don't have to start writing code to get involved. There's always a
raft of open pull requests eagerly awaiting review. You can check out
the full list
[here](https://github.com/pulls?q=is%3Aopen+is%3Apr+org%3Apact-foundation+archived%3Afalse+),
but I've pulled out some of the juiciest ones, which will make a big
impact when they land. Any help on these would be greatly appreciated!

- **Pact PHP**
  - [Upgrade to RustFFI](https://github.com/pact-foundation/pact-php/pull/270)
- **Pact Support/Pact Ruby**
  - [feat(generators): Add ProviderState generator & others](https://github.com/pact-foundation/pact-ruby/pull/273)
  - [feat(generators): add generators to a consumer contract request](https://github.com/pact-foundation/pact-support/pull/97)
- **NestJS-Pact**
  - [Upgrade to NestJS V10](https://github.com/pact-foundation/nestjs-pact/pull/17)
- **Pact Python**
  - [Message pact matchers - feat: adds matchers to content](https://github.com/pact-foundation/pact-python/pull/313)
- **Pact JVM**
  - [Make the Gradle Plugin compatible with Gradle Configuration Cache](https://github.com/pact-foundation/pact-jvm/pull/1627)
  - [Kotlin extension to build Json dsl based on required constructor fields](https://github.com/pact-foundation/pact-jvm/pull/1628/files)
- **Pact-Net**
  - [feat: Enable Generator type ProviderState](https://github.com/pact-foundation/pact-net/pull/380)

### Updates to documentation and learning materials

The following documentation is now live, or updated on the site:

- **Pact-Specification**
  - All about the spec. Learn the history,
    philosophy, implementation support, migration notes, and more.
  - See it [👉 here](https://docs.pact.io/implementation_guides/pact_specification)
- **Pact-Plugins**
  - The Pact plugins docs are now syncing from their
    readme, and displayed alongside our other Pact tooling. (Join us for
    the official launch next month.)
  - See it [👉 here](https://docs.pact.io/implementation_guides/pact_plugins)
- **Webhook template library**
  - Updated to use the new contract requiring verification published event. We'd love your help to add
    new ones to the list!
  - See them [👉 here](https://docs.pact.io/pact_broker/webhooks/template_library)
- **Branch support in Client libraries**
  - The list has been updated to show the latest state of play.
  - See it [👉 here](https://docs.pact.io/pact_broker/branches\#support)
- **Community Repos**
  - We've got a new showcase for Pact based repos in
    the wild. List yours here.
  - See them [👉 here](https://docs.pact.io/community_repos)
- **New articles**
  - Check them out [👉 here](https://docs.pact.io/blogs_videos_and_articles)
- **New workflow recommendations**
  - A large scale migration of the docs, to use our new recommended configuration
  - See it in action in the updated CI/CD workshop [👉 here](https://docs.pactflow.io/docs/workshops/ci-cd/)

## Community corner - member shout outs

**Paulo Gonçalves**

We know it can be difficult to visualise the path to Pact Nirvana, the
recommend CI/CD setup for your Pact integrations. Contributors have been
adding their valuable experiences from lessons learnt in the field.

**[Paulo Gonçalves](https://twitter.com/paulorgoncalves)** did just that in this
[repository](https://github.com/PauloGoncalvesBH/contract-test-nirvana).
It exemplifies the best implementations of contract testing, reaching
Pact Nirvana and having control via pipeline and pact-broker in a
completely reliable way. This provides security to deploy quickly,
safely, and more frequently.

*Please give the repository a star* ⭐ as this is a great motivator for
*Paulo to continue to create quality software content, which is 100%
free to use!*

PLUS extra kudos to Paulo, who delivered a [contract testing workshop entirely in Spanish](https://www.youtube.com/watch?v=1c2JmM9dafA) for
our Spanish-speaking friends!

### **Eric Deandrea and Holly Cummins**

Many thanks to **[Eric Deandrea](https://twitter.com/edeandrea) and [Holly Cummins](https://twitter.com/holly_cummins),** who co-delivered a fantastic, funny talk at Devoxx Belgium on "[How to avoid common pitfalls with modern microservices testing](https://www.youtube.com/watch?v=vYwkDPrzqV8)". I enjoyed watching this, and think challenging mental models is a wonderful way to break down an often complex and misunderstood subject

Holly has been particularly active whilst she worked in the IBM Garage,
so it's wonderful to see her delivering fantastic talks.

### **Liran Tal**

A talented Developer Advocate, **[Liran Tal](https://twitter.com/liran_tal)** at Synk is a long-time
friend of the Pact Open Source Foundation. He often tours the conference
circuit in his easily recognizable green hat.

Liran created the incredible [**Comprehensive Guide to Contract Testing
APIs in a Service Oriented
Architecture**](https://lirantal.medium.com/a-comprehensive-guide-to-contract-testing-apis-in-a-service-oriented-architecture-5695ccf9ac5a)"**.**
He's also the author of
[awesome-contract-testing](https://github.com/lirantal/awesome-contract-testing)
because, as you already know, contract testing is AWESOME! 👌
And because we love videos, I recommend his talk [Consumer-Driven
Contract: A better approach for API
Testing](https://www.youtube.com/watch?v=zfGKX5iKSis) from APIdays
Barcelona.

*Thank you to all our community members. The effort you put into our
community is appreciated!*

## Become a contributor

As the Pact Community Shepherd, I'm dedicated to making it as easy as
possible to get involved in the Pact Open Source Project.

There's no minimum time commitment, but we highly value regular,
committed contributions, as these make the Pact OSS vibrant and healthy.

Not sure where to start?

With the impending official launch of the **Pact Plugins Framework,**
we're on the lookout for enthusiasts who want to build their own profile
and be a part of the future of Pact. We're looking for individual
people or teams interested in extending Pact by [creating a
plugin](https://docs.pact.io/implementation_guides/pact_plugins/docs/writing-plugin-guide)

- such as Avro or GraphQL content type or a Websockets transport.

If this sounds like something you'd like to know more about, join us
next month to learn about the Plugin Framework and how you can get
involved.

Whether you've participated before or are ready to take the first
plunge, the team and I are here to support you! Need extra convincing? I
wrote about why participating in OSS projects is awesome, for DevPro
Journal!

You can also read our [Pact Open contributing
page](https://docs.pact.io/contributing) to learn about the different
ways to get involved in Open Source, no matter what role or skillset you
hold.

That's all for now. Catch you on Slack!

- Yousaf Nabi -- Developer Advocate at Pactflow and Community
    Shepherd at Pact.
