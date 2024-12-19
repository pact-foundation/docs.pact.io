---
title: 🔗 End of year wrap up 2024
author: Yousaf Nabi
authorURL: https://github.com/you54f
tags: [pact, oss, community, plugins, 2024, history,wrapup,almanac]
keywords: [pact, oss, community, plugins, 2024, history,wrapup,almanac]
date: 2024-12-19
draft: false
hide_table_of_contents: false
---

## Pact Almanac 2024

Grab your hoverboard, and get prepared for another trip back to the future, with our round up of this years Pactivities in our seasonal Pact Almanac.

![image](https://user-images.githubusercontent.com/19932401/207968429-dad9294a-2221-41cb-b387-6acd7c0bba4f.png)

We had a raft of code features, patches, fixes and new projects added to the Pact-Foundation over the year. If you haven't read our monthly blog posts, you can read a round-up of the most significant changes from each month in there. Check out the side-bar to the left to view the older posts.

I've mainly focused on video content this time round, where you can find multiple advocates of Pact, spreading the word of not just how to do contract testing, but the why. I hope you'll enjoy them, be sure to like and comment on the videos, whether it's to show your appreciation or you just fancy a debate.

Oh, and if you are the debating type, why not join us in a fireside chat next year?

Anyhow, let see what each month has in store for us.

### January

🧑‍💻 Tien Vo started by year by continuing and productionising the migration of Pact-PHP over to the Rust core. We saw the first community created [pact_compatibility_suite examples](https://docs.pact.io/blog/2024/02/19/pact-open-source-update-feb-2024#php) land this month, and Tien has worked diligently all year, in implementing not only new features to Pact-PHP, but contributions to the Pact ecosystem as a whole, from an [RFC](https://github.com/pact-foundation/roadmap/pull/99) for `form-urlencoded` matching ability, to several changes in the Pact-Rust core and Pact-Plugin ecosystem. It has seen great feedback from users, including Steve Taylor.

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
- 🧑‍💻 A plan was set out to provide better platform support for Linux, in terms of distro compatability, musl and arm64.
  - [Yo dawg, I heard you like Alpine](https://docs.pact.io/blog/2024/02/19/pact-open-source-update-feb-2024#yo-dawg-i-heard-you-like-alpine)
  - [You and whose ARMy?](https://docs.pact.io/blog/2024/02/19/pact-open-source-update-feb-2024#who-and-whose-army)

Community hero of the month: [Stanislav Vodetskyi](https://docs.pact.io/blog/2024/02/19/pact-open-source-update-feb-2024#community-shout-outs) for all the improvements in the Pact-Go project, and learning Rust on the fly to aid himself and the Pact community by proxy.


### Mar

Community hero of the month: [Dany Marques](https://github.com/pact-foundation/pact-js-core/pull/494) for his tenacity in tracking down an obscure bug in the npm ecosystem, and creating upstream fixes, as well as resolving his issue in the interim in the pact-js project.

### Apr

- 🧑‍💻 [Josh Ellis](https://github.com/JP-Ellis) was thrilled to announce the release of Pact Python v2.2, a significant milestone that not only improves upon the existing features but also offers an exclusive preview into the future of contract testing with Python. He posted about it over at pact-pythons new doc site, in its [inaugural blog post](https://pact-foundation.github.io/pact-python/blog/2024/04/11/a-sneak-peek-into-the-pact-python-future/) from maintainer Josh Ellis.

We've often wondered when a book dedicated to contract testing would appear on the scene. We even had this statement on the books section of our site

> We're not aware of any books currently dedicated to contract testing, but here are some that talk about Pact and contract testing as part of a broader microservices development and testing strategy

However good news everybody 🎺 the first one was launched back in April.

![contract testing in action](https://mng.bz/gv8l)

Community hero(es) of the month: Marie Cruz and Lewis Prescott, for being awesome but also releasing Contract Testing in Action 📕 under the MEAP (Manning Early Access Program), the first book dedicated to contract testing.

### May

Community hero of the month: [Praveen Erode Mohanasundaram](https://www.linkedin.com/in/praveen-em/) - A Long time Pact advocate and community contributor who spoke at Devoxx UK about Contract Testing: The Key to Unlocking E2E Testing Bottlenecks in CI/CD pipeline, you can [catch the video on YouTube](https://www.youtube.com/watch?v=RSl_JcWKE3M) 📺

### June

Community hero of the month: [Mark Bradley](https://mark-bradley.net/about/) who announced he would be speaking GopherConUK 2024 in August. He his topic will be "Using Pact to deploy Microservice with confidence". He has previously posted videos and guides on how to get started with Pact in PHP and Go.

### July

Community hero of the month: [Val Kolovos](https://github.com/valkolovos) for continuing adding features to pact-python's v3 interface with the rust core, such as async messaging and matchers.


### Aug

- 🧑‍💻 Bas Djistrka from [OnTestAutomation](https://www.ontestautomation.com/) launched a new course, [Practical contract testing with Pact](https://ontestautomation.teachable.com/p/practical-contract-testing-with-pact)

Community hero of the month: [Augusto Colombelli](https://github.com/augustocolombelli) for his blog post Contract Tests — APIs Guided by Consumers, which you can read over on Medium [here](https://medium.com/@augustocolombelli/contract-tests-apis-guided-by-consumers-caf8f2460e7c).

### Sept

Community hero of the month: [Murat K Ozcan](https://github.com/muratkeremozcan) has recently been taking an adventure in the world of Pact, after picking up Marie & Lewis' Contract testing in Action book. He has written 3 posts which are well worth a [read](https://docs.pact.io/blog/2024/09/30/pact-open-source-update-sept-2024#murat-k-ozcan---a-triple-whammy-of-contract-testing-posts).

### Oct

Community hero of the month: [Lewis Prescott](https://www.pactman.co.uk/) for taking to the stage at CypressConf to teach users about the fundamentals of contract testing as well as how to implement consumer-driven contract testing with Cypress + Pactflow.

### Nov



### Dec

Community hero of the month: [Ruth](https://github.com/huehnerlady) - A long time pact-jvm user, Ruth has been in contact with the team over several issues in her Pact setup, and has provided some of the best reproducible examples I've come across. Glad to see Pact doing so well for you in your organisation, maybe next year we can get you to do a guest blog post. No pressure, but that also applies to my readers. It could be you here, in our wrap up for 2025!

### See you next year folks

Thanks for everyone's efforts in using, promoting, and preaching about Pact to everyone you know, now its our time to repay the favour.

If you've done something great, and want to share it, [get it listed](https://docs.pact.io/contributing) - the site is open source and you can edit any page, we want to give you a platform to help amplify your voice!

Maybe there is time to get one last video/blog or PR in before crimbo! No, only joking, that’s a wrap for this year's Pact Open Source Almanac, pop your feet up, enjoy your puds and hope to see your name in the book next year.
