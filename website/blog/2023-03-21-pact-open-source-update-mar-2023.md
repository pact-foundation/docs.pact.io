---
title: Pact Open Source Update — Mar 2023
author: Yousaf Nabi
authorURL: https://twitter.com/you54f
tags: [pact, oss, community]
keywords: [pact, oss, community]
date: 2023-03-21
draft: false
hide_table_of_contents: false
---

Welcome all, Yousaf here, your Pact Community Shepherd. This month I’ll be sharing all the good things happening in the world of Pact.  

So sit back, relax, and join me for some contract testing in the wild. Hear from community experts and some of the latest initiatives in the Pact ecosystem.

## Another month, another milestone

In case you missed it, Pact is 10 this year. In our last POST, we celebrated Pact coming into existence with the first implementation on February 19, 2013.

As we roll into April, we celebrate [Ron Holhousen](https://github.com/uglyog)’s (Pact-JVM/Rust core maintainer + PactFlow co-founder) first commit on April 3, 2013.

[![Rons first Pact commit](https://user-images.githubusercontent.com/19932401/202207018-8483082b-df76-4c95-b807-4458dbfdb3ca.png)](https://github.com/pact-foundation/pact-ruby/commit/2113359743a55d0fa8d2bea17848749ec2223d86)

We are glad you stuck around, Ron, to help drive the Pact V3 & V4 Specification, the Rust core, and the Pact Plugin Framework, amongst others.

You can check out a young Ron in the early days spreading the news about Pact-JVM at [this Melbourne meetup](https://www.youtube.com/watch?v=h-79QmIV824) and Ron back in 2021 priming
the community on [what was in store for Pact V4 and beyond](https://www.youtube.com/live/u7LzZ6Fm1Ok?feature=share&t=121).

So while we are talking about memorable moments, it’s not all about looking into the past. We’d love to celebrate all the achievements to date, with the people that helped make it,
and where Pact is going in the future. We’ve been planning ideas for our Pact 10th birthday, and we’d love to share our overall aims.

- **Contributor engagement**: a thriving open source community is one that provides value to contributors and users of the software, alike. This milestone is an opportunity for us to share with the
    world the great aspects of Pact and to attract and excite new contributors and friends to the ecosystem  
- **Awareness**: contract testing is becoming well adopted across the software development landscape but there’s still a way to go – our hope with this milestone event is to further grow awareness of contract testing  
- **Celebration**: and of course, we want to celebrate 10 years of Pact in a fun way! It’s so important to us that we acknowledge the founders, maintainers, contributors, and community who have put in time and
    energy to make Pact what it is today

We would like to invite our own community to be a part of it – as a participant or to lend a hand to host a local event/meet up or speak on a specific topic. If you are interested, please get in
touch at yousaf.nabi@smartbear.com or find me on Pact Slack.

**Missed our last one?** You can catch up with our last community event [here](https://www.youtube.com/watch?v=wkld_wRsTDE).

## Events for your calendar

![Python Web Conf](https://2023.pythonwebconf.com/python-web-conference-2023/@@images/logo_image)

- **March 13 – 17 – Online**: [Syed Muhammad Dawoud Sheraz Ali](https://2023.pythonwebconf.com/speakers/syed-muhammad-dawoud-he-him) (Software Engineer - Arbisoft) spoke at [Python Web Conf 2023](https://2023.pythonwebconf.com/)
    with his talk, “Why you should contract test your microservices.” - He covered the need for contract testing and how Pact can help in that. We’ll keep an eye out for the video and share on our community videos page.

![DevBcn](https://www.devbcn.com/static/media/logo.c3beed00a94a2de3f6bc.png)

- **July 3 – 5 – Barcelona, Spain**: Join [Eric Deandra](https://developers.redhat.com/author/eric-deandrea) (Senior Principal Developer Advocate, Red Hat) and [Holly Cummins](https://hollycummins.com/)
    (Senior Principal Software Engineer, Red Hat) as they demonstrate, through a test-driven development approach, how the combination of Pact contract testing and Quarkus developer joy can help
    prevent your microservices from breaking in production. You can check out more details on the Barcelona Developers conference [here](https://www.devbcn.com/talk/423678).

**Are you running an event featuring Pact this year?** Let us know, and we can help promote it. If you want to build your brand profile, get in touch at yousaf.nabi@smartbear.com or find me on Pact Slack.

## Eye candy – community content to tune into  

### EdinburghJS February ’23 Meetup – Testing services with Pact

I grew up in Edinburgh, and I know the folks there are very active in agile meetups, so it was awesome to see Pact make an appearance at EdinburghJS:

- EdinburghJS February ’23 Meetup – Testing services with Pact – watch [here](https://www.youtube.com/watch?v=9JU3s-Np-No)

### Quarkus Insights #117: Contract Testing with Pact and Quarkus

If you can’t wait for Holly and Eric’s conference talk in July, you can get a piece of their wisdom showcasing Pact and Quarkus, this time in a live insight session:

- Quarkus Insights #117: Contract Testing with Pact and Quarkus – watch [here](https://www.youtube.com/watch?v=d9CSY8HuZ9U)

### Contract Testing of HTTP Services using Pact.NET

The team at Execute Automation show .NET users how to get started with Pact  

- Contract Testing of HTTP Services using Pact.NET – watch [here](https://www.youtube.com/watch?v=lgDPevyq5ZI)
  
### Pact theory, frontend, and backend application

This three-part Pact chronicle covering Pact theory, frontend, and backend application from [Kirill Ushakov](https://www.linkedin.com/in/kirill-ushakov-431001149/) is a must-watch for Pact newbies:

- Consumer Driven Contract Testing with Pact – Theory – watch [here](https://www.youtube.com/watch?v=j0xe2dfAI-I)
- Consumer Driven Contract Testing with Pact – Frontend – watch [here](https://www.youtube.com/watch?v=VmluCw6a6IE)
- Consumer Driven Contract Testing with Pact – Backend – watch [here](https://www.youtube.com/watch?v=V-OV6lRwhYA)

## Consumer-driven contract testing using Pact with Java

[Helmut Siegel](https://www.linkedin.com/in/helmut-siegel/) introduces Java and Pact in this 12 minute video

- Consumer-driven contract testing using Pact – watch [here](https://www.youtube.com/watch?v=BgBVd9Qo8xQ)

## Hot reads – I spy, with my API

[![Matt Post](https://nordicapis.com/wp-content/uploads/Plugging-Into-the-Future-of-API-Contract-Testing-With-Pact-1024x576.png)](https://nordicapis.com/plugging-into-the-future-of-api-contract-testing-with-pact/)

Matt Fellows wrote a piece for NordicAPI about the future of API contract testing and how the Pact Plugin Framework (which we [launched](https://docs.pact.io/blog/2022/11/11/pact-plugin-framework-launch)
late 2022) is there to support practitioners build with confidence. Read it [here](https://nordicapis.com/plugging-into-the-future-of-api-contract-testing-with-pact/).

[![Frank Post](https://aijourn.com/wp-content/uploads/2023/03/Screenshot-2023-03-01-at-16.56.32-780x464.png)](https://nordicapis.com/plugging-into-the-future-of-api-contract-testing-with-pact/)

We’ve all seen ChatGPT in the news, as it has become a living room conversation piece. Frank Kilcommins explores what AI means for the future of APIs in this
[blog](https://nordicapis.com/plugging-into-the-future-of-api-contract-testing-with-pact/).

## Pact community corner

This month, I caught up with Tien Vo, who has been helping bring the Rust core to Pact-PHP, about why Pact caught his eye, what brought him to contributing, and how we can help him out!

**What brought you to using Pact in the first place?**

> I heard about Pact from my ex-employer. AFAIK they are still not using Pact. I was introduced to microservices architecture long ago. Till today, it is complex to me. Too many techniques, too many tools need to be learned. But I think I need to find the answer for this question first: how to prevent someone from changing the code in a provider, and it breaks the consumers.

> I tried to learn Pact via Pact-PHP, but I think it’s quite old at that time (only support v2, while other projects migrated to v3 and supported FFI). So I think I will contribute to Pact-PHP and hope I can learn something while doing that.

**We see you’ve been doing some PRs in the pact-php project. How have you found the experience?**

>I have a confession to make: I don’t have real experience working with Pact/contract testing before working with pact-php. All I know are theories I read from Pact’s documents and YouTube/posts. 
>That’s why I am starting a personal project so I can test new pact-php code and get some experience from it.

**Is there anything that the community could do to help you?**

> I hope someone with real experience on pact/contract testing can test the new pact-php code early to find some problems with it.

**Do you have any advice for those wanting to get involved in open source?**

> I think patience is very important while working/using any open source projects. We mostly contribute using our free time. So don’t expect a bug to be fixed soon, a question will be answered soon, so a PR will be reviewed and merged soon.

**When you’re not behind a computer, what are you doing?**

> I hope a day has 48 hours so I can sit on the computer more. So many things that I need to learn. The more I learn, the less I think I know. Just kidding, I hope I have more time to play with my kid, relax, and watch films on Netflix.

Thanks, Tien, the community is really grateful for your time and efforts. If you want to help Tien and the Pact-PHP community out, why not [take a look at some of the PRs](https://github.com/pact-foundation/pact-php/pulls/tienvx).

While we love people jumping into the code, if you are new to Pact, we would always recommend running through some starter material first:

- Understand some key terms on our [terminology](https://docs.pact.io/getting_started/terminology) page
- Run through [our CI/CD workshop](https://docs.pactflow.io/docs/workshops/ci-cd/)
- Run through a [Pact workshop in your favored language](https://docs.pact.io/implementation_guides/workshops#pact-workshops---from-0-to-pact-in-2-hours), which cover most concepts Pact supports.

If you’re more familiar with Pact, and don’t see a [workshop in your favored language](https://docs.pact.io/implementation_guides/workshops#pact-workshops---from-0-to-pact-in-2-hours), why not help us create one
following the other workshops as a guide. 

It’s a great way to share your skills back to the community. A PHP workshop may have helped get Tien up to speed far more quickly. [Visit our how to contribute page](https://docs.pact.io/contributing) to learn more
or contact us via Pact Slack.

## OSS Updates

We are pleased to have just launched a SmartBear DevRel OSS metrics repository.  

You can check out Pact & PactFlow’s [entry](https://github.com/SmartBear-DevRel/open-source-metrics#pact--pactflow-projects-combined), which currently shows

- Stars
- Forks
- PR Opened & Merged (split by community and maintainers)
- Issue & discussion Participation
- Slack activity

We are very proud of our thriving community and want to make sure we keep giving back to you in valuable ways. Feel free to let us know what you think.

### Pact V4 Support

We’ve just raised two new cards on the PactFlow roadmap to help support V3/V4 Pact specification & Plugin support to both [Pact-Python](https://github.com/pactflow/roadmap/issues/92) and 
[Pact-Net](https://github.com/pactflow/roadmap/issues/93) as we understand that unblocking Python and .NET users to be able to utilize our newest feature-set will be invaluable, especially 
as many of you operate with multiple languages in your microservice stacks.

### Pact-Rust

Pact FFI v0.4.0 was released, adding FFI functions for plugin authors to parse Pact JSON and get matching rule.

### Pact Protobufs

**gRPC metadata is now supported in v0.3.0+**

A big thanks to early users of the plugin, who have provided invaluable feedback:

- [Jason Taylor](https://github.com/jasonltaylor)
- Satish Sundararajan
- [Riley Martine](https://github.com/rmartine-ias)
- [Ali Ustek](https://github.com/austek)

Amongst others!

**If you’ve tried out any of our Pact Plugins, or built your own**: Let us know!

**If you haven’t, try out building your own plugin**: here’s a [workshop](https://docs.pact.io/plugins/workshops/create-a-plugin/intro) to get you started.

**The community is after plugins too!**: See the [Pact Roadmap filtered by plugins](https://pact.canny.io/search?search=plugin) for ideas.

### Pact-JS

[Timothy Jones](https://github.com/TimothyJones) is again providing quality-of-life improvements for TypeScript users. We really appreciate your work, and those who take the time to provide great bug reports and root-cause identification (and sometimes fixes) as this greatly aids us as maintainers, who have a large estate to cover.

**We do have an ask of our users**. We updated Pact-JS to the latest Rust core, and it still includes the Ruby binaries so that users can programmatically use the Pact-CLI tools. We are considering removing them, but it would have an impact, depending on your workflow.  

> Many users are using this API for pact publishing, and it is re-exported by Pact-JS. There should be a discussion on whether it is acceptable to remove the programmatic use of Pact before merging.

If we find a lot of users are, it might be worth considering backing the existing broker API with the Rust implementation instead of removing it. **We would love your thoughts in [this discussion](https://github.com/pact-foundation/pact-js-core/pull/435)**.

Our **current recommendation** for publishing pacts is to **use the Pact CLI tools directly**, as these will get the latest updates and not have to wait for a Pact client library to incorporate the changes.

### Pact-Python

[Serghei Lakovlev](https://github.com/sergeyklay) recently joined the pact-python community and has dropped [a raft of PRs](https://github.com/pact-foundation/pact-python/pulls/sergeyklay) to help bring pact-python up to speed.
We would love to get our fellow **#pythonistas** across these, so if you can offer any support from a review or testing perspective, join us in our pact-python Slack channel, or see
[our pinned call out](https://github.com/pact-foundation/pact-python/issues/88) for maintainers and support of the v3 Pact specification to register your interest

You can check out his Python [consumer](https://github.com/sergeyklay/consumer-pact-example) and provider [examples](https://github.com/sergeyklay/provider-pact-example), which are listed on [our community projects page](https://docs.pact.io/community_repos).

![Serghei Example Project](https://raw.githubusercontent.com/sergeyklay/provider-pact-example/main/cdc-example.png)

**Have you built a sample project and want to share with the community?** You can [edit the page](https://docs.pact.io/community_repos) and add your own.

## SmartBear Supported

You _might_ have seen the label `smartbear-supported`  or a comment that looks like this cropping up across our open source repos and be wondering what it means.

![Screenshot 2023-03-20 at 15 04 05](https://user-images.githubusercontent.com/19932401/226381471-15093c51-420a-4ff6-9688-ceb4d3173d6a.png)

![SB Supported Comment](https://docs.pact.io/img/help-smartbear-supported-jira-example.png)

Last year, PactFlow was acquired last year by SmartBear.  

We wrote about what that meant for the OSS Pact Framework then ([read it here](https://docs.pact.io/blog/2022/04/06/pactflow-joins-smartbear)).

SmartBear wants to be true to that promise and part of that is allowing our engineers time to spend in the open source during their work hours. We want to foster an environment where open source contributions are welcomed, valued, and rewarded, and as we know Pact is integral to the future success of PactFlow. It is also part of its inherent heart, we know that we need to spend time defining our full feature set, and spending SmartBear supported time in bringing those languages to parity. This will benefit our complete user base, whether you choose to use your own Pact Broker, or one provided by PactFlow.

You can read more about what SmartBear supported means for Pact on our newly published [page](https://docs.pact.io/help/smartbear).

## It’s better with friends

We would love to give a big shout out to our friends at [Sngular](https://www.sngular.com/), who have partnered with PactFlow since the early days and have helped clients implement Pact, PactFlow, and quality engineeering at scale.  

Particular praise goes to [Francisco Moreno Sanz](https://www.linkedin.com/in/franciscomorenosanz/), [Juan Monzón Fabregat](https://www.linkedin.com/in/juanmonzonfabregat/), [Alejandro Pena Lorenzo](https://www.linkedin.com/in/alejandropenalorenzo/) & [Alma Miller](https://www.linkedin.com/in/milleralma/).

We are proud to let you know that they have been recognized as the Best Newcomer partner by SmartBear. Read more about it and Sngular [here](https://www.sngular.com/sngular-recognized-as-best-newcomer-partner-by-smartbear/).

![Sngular Award](https://user-images.githubusercontent.com/19932401/226378915-6da3370a-7d2f-4f85-ab3d-10169f3a1f35.png)

Some great contributions so far:

- Blog: [Contract testing workflows](https://www.sngular.com/contract-testing-workflows/)
- Blog: [Getting started with bi-directional contract testing](https://www.sngular.com/the-easy-way-to-get-started-with-bi-directional-contract-testing/)
- Blog series: [PactFlow road to enterprise adoption](https://www.sngular.com/road-to-pactflow-enterprise/)  
- Case study: [Reducing the cost of manual testing with contract testing & app modernization](https://www.sngular.com/sngular-pactflow-reducing-the-cost-of-testing-in-app-modernization/)  
- Docs: [Workshop for PactFlow contract testing organisation scale](https://docs.pactflow.io/docs/workshops/org_scale/)

That’s it for this month. Stay safe and carry on coding!

- Yousaf Nabi — Developer Advocate at PactFlow and Community Shepherd at Pact.
