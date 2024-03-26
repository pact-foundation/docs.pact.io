---
title: Pact Open Source Update — June 2022
author: Yousaf Nabi
authorURL: https://twitter.com/you54f
tags: [pact, oss, community]
keywords: [pact, oss, community]
date: 2022-06-08
draft: false
hide_table_of_contents: false
---

Welcome to the Pact Open Source June 2022 update!

This month has seen a flurry of activity across the open source space, with many new contributors helping in a multitude of ways, so we will call out some notable mentions.

‌Thanks to all of the contributors who have made this happen, if you haven’t been mentioned here but wish to appear in a later update, feel free to reach out to me on Slack.

## Specific language updates

### .Net

PactNet 4.0.0 is now released and pushed, [have a look](https://www.nuget.org/packages/PactNet/).

See the [upgrade guide](https://github.com/pact-foundation/pact-net/blob/4.0.0/docs/upgrading-to-4.md) for details of the rewrite and how to upgrade from 3.x to 4.x

Some words from our amazing maintainer [Adam Rodger](https://github.com/adamrodger):

> **Release Announcement**
> Now that we've been in beta for a good while I think we're ready for a proper release of PactNet 4.0.0. I think we've ironed out any teething issues now, so thank you to all those that have participated in the beta and raised issues for me to fix.
> I've got the current latest beta running in production at my employer and everything appears to be working OK. Of course there will be more features and things to add in the future, but I think the core functionality is all there and the API can be considered stable.
> Adam released PactNet 4.0.0 on 6 June and is now enjoying a well-deserved holiday. Thank you, Adam.

Chat with us in: [#pact-net](https://pact-foundation.slack.com/archives/C9UTHV2AD)

### NestJS + Pact = ❤️

[Omer Morad](https://github.com/omermorad), our friend in, Tel Aviv, Israel, is a backend-oriented developer, OOP flavored, in a distributed systems world and also a Web artisan, TypeScripter, open-source enthusiast, and guitar player.

He recently brought in https://github.com/pact-foundation/nestjs-pact to the pact-foundation and we would love to get it featured on the [awesome-nestjs repo](https://github.com/jmcdo29/testing-nestjs/issues/1676).

Are you using NestJS + Pact? Want to help build out an example? Chat with us in: [#pact-nestjs](https://pact-foundation.slack.com/archives/C03ELGE8UMB)

## Pull Requests

1. Pact-Reference - [Allow BrokerWithDynamicConfiguration to publish results](https://github.com/pact-foundation/pact-reference/pull/194) by [Kageru](https://github.com/kageru)

2. Pact-JVM – [Support for providerVersionBranch option to replace providerVersionTag](https://github.com/pact-foundation/pact-jvm/issues/1555) with thanks to [Ben Pilgrim](https://github.com/TGNThump) & [Praveen Erode Mohanasundaram](https://github.com/praveen-em)

3. Pact-JVM – [Rejeeshg](https://github.com/pact-foundation/pact-jvm/pulls?q=is%3Apr+is%3Aclosed++author%3Arejeeshg) for updating builds to resolve vulnerabilities. Dependabot or similar would be great here to save the manual effort! PR’s welcome :)

4. Pact-PHP / Pact-Ruby / All the things – Shout out to [Lewis Cowles](https://github.com/Lewiscowles1986) and [Jonathon Padfield](https://github.com/trammel).

Lewis has been working hard on [improving alpine support](https://github.com/pact-foundation/pact-ruby-standalone/pull/73), [fixing the pact-php build](https://github.com/pact-foundation/pact-php/pull/249) after a URL change and created a number of issues against the pact-php repo to help the maintainer. Lewis said:

> [This one](https://github.com/pact-foundation/pact-php/pull/253) introduces scheduled builds so that if a maintainer gets "life happen" then you can still as an org know if that package is failing, and get visibility before a customer comes to you. It's a thing I use if I want to show something so that I know it should always be build-able.

And thanks [Jonathon](https://github.com/trammel) for [updating pact-ruby-standalone to use travelling ruby 2.4](https://github.com/pact-foundation/pact-ruby-standalone/pull/75), we are testing this out now and hope to roll this out across all the libraries soon.

## Bi-Directional Adapters

### WireMock & .Net

Using WireMock & .Net and want to benefit from Bi-Directional Contract Testing?

🔥 Now you can generate Pact 🔗 contracts from your WireMock Server, check it out [here](https://github.com/WireMock-Net/WireMock.Net/wiki/Pact).

Thanks [Stef Heyenrath](https://www.linkedin.com/in/ACoAAAClHlsBdpo1lJc1LiT8eM46fN2RNMYfVVo) 😍 for the his work in the community!

### Pact-MSW Adapter

[Pact-MSW-Adapter](https://github.com/pactflow/pact-msw-adapter) now has new features and a [quick start guide](https://docs.pactflow.io/docs/bi-directional-contract-testing/tools/msw), an international effort with contributors from the UK, Argentina, Spain and Canada. Shouts go out to:

1. [Kiko Ruiz Llorret](https://github.com/kikoruiz) for [request query support](https://github.com/pactflow/pact-msw-adapter/pull/46)
2. [Nicholas Simons](https://github.com/simonn01) for [post request support](https://github.com/pactflow/pact-msw-adapter/pull/42)
3. And we cannot forget [Juan Cruz](https://github.com/IJuanI) for being an early trailblazer and improving the developer experience vastly

### Create your own adapters to use in Bi-Directional Contract Testing

Inspired by our list of tools, but don’t see your [favourite](https://docs.pactflow.io/docs/bi-directional-contract-testing/tools)? Create your own! Here's how:

1. [Convert](https://docs.pactflow.io/docs/bi-directional-contract-testing/contracts/pact#converting-mocks-into-a-pact-compatible-format) your mock format to a supported Pact specification format - we recommend v2 at the moment - [see a jsonschema to test against](https://bitbucket.org/atlassian/pact-json-schema/src/master/schemas/v2/schema.json)
2. Create an example - see our [existing supported tools and demos](https://docs.pactflow.io/#bi-directional)
3. [Submit a PR](https://github.com/pactflow/docs.pactflow.io/) to to get listed

## Our awesome community

Developer Relations at Pact-Foundation now has a new home @ https://github.com/pact-foundation/devrel

We recently hooked up [Orbit.love](https://orbit.love/), to give us a bit of a glance across our open source estate, and we were able to pull out well over 2k different contributions from just the top 15 in the leaderboard excluding PactFlow’s co-founders!

Particular shout-out to Timothy Jones, who has been on an epic crusade to empower those around him with words of contract testing wisdom and delightful development life-hacks. The Pact world wouldn’t be the same without you all, and we appreciate every contribution big or small.

![Pact contributors](https://s3-ap-southeast-2.amazonaws.com/content-prod-529546285894/2022/06/Pact-Orbit-June-2022.png)

> Pact contributors

Community is everything for us. And that’s why we have big plans to dive into the various initiatives and determine how we can acknowledge and support members and the community as a whole for their time and dedication. Without each of you ❤️ Pact would not be the leading open source cross-language distributed contract testing framework! Like us, you should be so proud that you’re helping free the world from the burden of microservice spawl and deployment headaches.

## Other ways to get involved with Pact

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
