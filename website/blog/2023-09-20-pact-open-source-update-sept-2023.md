---
title: Pact Open Source Update — September 2023
author: Yousaf Nabi
authorURL: https://twitter.com/you54f
tags: [pact, oss, community]
keywords: [pact, oss, community]
date: 2023-09-20
draft: false
hide_table_of_contents: false
---

:wave: Hello, its September, and we are a week away from [Pactober](https://pact.io/pactober) - A celebration of 10 years of Pact.

I'll be letting you know what you can look forward to, recapping this month's activities in our repos, and introducing a new starter to the PactFlow, who is living the dream,
getting to work on open-source, as their job. Feel inspired? Join us! We are always hiring.

## Pactober

We've been squirrelling away behind the scenes organising [Pactober's](https://pact.io/pactober) main event on the 10th October and we are pleased to announce
some of our stellar speakers.

Your links for reference

- [Full Schedule](https://pact.io/pactober#schedule_container)
- [Main Event](https://pact.io/birthday)

**Want to attend?**

We will be providing links in Slack, but for all the latest updates, be sure to fill out our [Pactober registration form](https://cucumber.typeform.com/PactoberEoI)

### Speakers

Just some of our fantastic line-up that you will hear from over the month

#### Sam Newman

![](https://samnewman.io/img/me_in_iceland.jpg)

- Event Page - https://pact.io/pactober/2023/sam-newman


#### J.B Rainsberger

![](https://d33wubrfki0l68.cloudfront.net/75a893a87a9cdf5d1aa0569703ed0e7072f8a6a9/d0dde/images/cartoon-headshot-white-background.jpg)

- Event Page - https://pact.io/pactober/2023/jb-rainsberger

#### Seb Rose

![](https://pact.io/assets/img/avatars/SEB-ROSE-square.jpg)

- Event Page - https://pact.io/pactober/2023/seb-rose

#### Bas Dijkstra

![](https://avatars.githubusercontent.com/u/10740451?v=4)

- Event Page - https://pact.io/pactober/2023/fireside-chat

#### Lewis Prescott

![](https://avatars.githubusercontent.com/u/17763998?v=4)

- Event Page - https://pact.io/pactober/2023/fireside-chat

#### Dave Farley

![](https://www.continuous-delivery.co.uk/img/uploads/HomeDave.png)

- Event Page - https://pact.io/pactober/2023/fireside-chat

### Got something to say?

Love Pact as much as Jameshd?

![](https://pact.io/assets/img/events/community2-nov-2020.png)

Why not shout about it, in whatever way suits you and we will be sure to feature it throughout Pactober’s Birthday session.

**Ways you can do this**

- Fill out the [Pactober registration form](https://cucumber.typeform.com/PactoberEoI)
- Catch up with us in [Slack](https://slack.pact.io)
- Find us in GitHub, in our [DevRel repository](https://github.com/pact-foundation/devrel)

### Pactober Builders

During Pactober, we'd love to invite you to help build something on our roadmap, take part in a Bug-Bash or in our Doc-Drive.
 
**_Need some inspiration?_**

We've got plenty of requests on our [Canny roadmap](https://pact.canny.io/feature-requests), and although many are not planned, you can see from the votes, as to how well received it may be from the community. 
 
Alternatively, we can look at outstanding issues and PR's as they can often serve as a good source of inspiration, or things that can easily be sewn up.
 
Finally, don't forget to check out more ways you can help, https://docs.pact.io/contributing  if any of these take your fancy?

You can find your fellow builders over in the [#pactober-builders](https://pact-foundation.slack.com/archives/C05P9A3KY05) channel in Slack.

### Pactober Workshops

We already have a few Pact HTTP based workshops, in a few languages, listed [here](https://docs.pact.io/implementation_guides/workshops#pact-workshops---from-0-to-pact-in-2-hours).

I'll be hosting four sessions throughout Pactober, walking users through the existing workshop, and running some all new ones in the process.

- [Pactober Workshop 1 - CI/CD workshop (HTTP Pact)](https://github.com/pact-foundation/devrel/issues/21)
- [Pactober Workshop 2 - CI/CD workshop (Message Pact)](https://github.com/pact-foundation/devrel/issues/22)
- [Pactober Workshop 3 - CI/CD workshop (Plugin Pact)](https://github.com/pact-foundation/devrel/issues/23)
- [Pactober Workshop 4 - Maintainer/contributor workshop How Pact is built](https://github.com/pact-foundation/devrel/issues/24)

We will need to build out workshops for Message & Plugin Pact, and also our various existing workshops, could do with some love, to utilise the latest features and versions of 
not only Pact but the client language itself.

We would love any support in helping work on these, but if not, and you just fancy participating along with others during the workshops, then feel free to join me!

## OSS Updates

It has been another busy month in the world of Pact, I've pulled out some changes from the community to showcase in our latest round of Open Source updates.

- PactFlow's New Starter, and what it means for you
  - Pact Python
- Pact Rust
- Pact PHP
- Pact Plugins
- Pact Broker
- Pact Broker Client
- Pact JS
- Pact Broker Chart
- Feature requests
  - Dont Massl the Hoff (Massl based authentication)

### PactFlow's New Starter, and what it means for you

>We ❤️ open source. We created Pactflow because we wanted to create a sustainable avenue to work on open source projects, and solve big problems that benefit a global developer community. Instead of the train rides, late nights and weekends where most of our contributions previously originated, this would be our day job.

We [said that](https://pactflow.io/blog/why-build-an-open-source-company/) back in 2021. It would be awesome to work on an open-source project, and get paid for it, as part of your job. For me, its a dream come true. We've wanted to share that opportunity with others,
especially as Pact grows in popularity, and gaining active maintainers is a challenge for many an open-source project, even those much larger than our own. Just look at [Curls contributor graph](https://github.com/curl/curl/graphs/contributors)!

We also are actutely aware that some of our libraries are suffering from bit-rot, languishing whilst each client implementations native language comes out with new features, and additions, that could be utilised, and they are missing core Pact features, implemented in Rust but not delivered in the client library, which causes struggles in documentating a cohesive Pact experience, in your own multi-language/multi-protocol landscapes.

That being said, we are proud to be able to announce a new starter to the PactFlow family, and by default extension, the Pact Family, who will help alleviate some of that burden. Enter Josh.

#### Joshua Ellis

We've been honoured to have [Joshua Ellis](https://jpellis.me/) enter the team, based in Australia, he will be working closely with Beth, Matt and Ron, and comes with a distinguished history, and open source background.

![Joshua Ellis](https://avatars.githubusercontent.com/u/3196162?v=4)

>I have an academic background in theoretical particle physics. I am the developer of the LaTeX package [TikZ-Feynman](https://github.com/JP-Ellis/tikz-feynman) to draw Feynman diagrams, and spent the majority of my PhD creating a Rust library to help solve Boltzmann equations to calculate the evolution of particle number densities during the Big Bang. I also did a one year stint in KPMG’s Data & Cloud team, helping architect and build cloud infrastructure, data pipelines, and helping new recruits get up to speed with DevOps and coding.

>I'm a big fan of [open source software](https://jpellis.me/projects) and collaboration, and love to automate everything and anything; even if it sometimes takes me longer to automate the task than to actually do it :sweat_smile:
Outside of work, my wife and I love finding good food spots in Melbourne. We have a small rescue dog called Cooper (no idea what breed he is), and if I’m not at my computer, you’ll either find me cooking something (perhaps in my smoker), playing piano or trying to learn the cello, or getting a coffee.

**So what will Josh be working on?**

Proficient in Python and Rust, we will see him help bring Pact-Python up to modern standards, and implement Pact V4 functionality, in a production ready manner, rather than my hack it to get something working xD.

> I have recently onboarded with SmartBear, and my focus to begin with will be the Python code. I'm looking forward to working with you all, and improving the Python code!
In particular, I will be building upon the amazing work done in [#367](https://github.com/pact-foundation/pact-python/pull/367) to get pact-python working with the Rust core. As a bit of ground work, I have created two issues above to get my feet wet, before tackling the much larger task of supporting V4 fully.

>In any case, please feel free to message me with any ideas, or just to say hi :blobwave:

Josh has been tackling the build system and examples for starters, check out the progress, and even better, why not drop us a review, he would love the feedback, and gives him a chance to connect with you all.

- [chore: migrate to pyproject.toml and hatch](https://github.com/pact-foundation/pact-python/pull/371)
- [style: add pre-commit hooks and editorconfig](https://github.com/pact-foundation/pact-python/pull/385)
- [Fix existing examples](https://github.com/pact-foundation/pact-python/pull/387)

Long live Python, Long live pact, long live Pact-Python!

Love Pact? Want to join the team? Why not give us a shout!

### Pact Rust

We were meant to have done some rust stuff, but we've been too busy laughing at this [interview with a senior rust developer](https://youtu.be/TGfQu0bQTKc?si=fCdo094aDOupnjrH)


But seriously though, what's been happening?

- [fix: Allow matching string values using content type matching rule](https://github.com/pact-foundation/pact-reference/pull/319)
- [chore: renable aarch64-unknown-linux-gnu](https://github.com/pact-foundation/pact-reference/pull/321)
- [feat: Add ffi function pactffi_with_multipart_file_v2](https://github.com/pact-foundation/pact-reference/pull/323)

### Pact PHP

Tien Vo has been busy again, bringing more features to the `ffi` branch

- [chore: reorganize examples (create separate directory for each example)](https://github.com/pact-foundation/pact-php/pull/331)
- [Use Rust FFI #12: Binary](https://github.com/pact-foundation/pact-php/pull/332)
- [Use Rust FFI #13: Multipart](https://github.com/pact-foundation/pact-php/pull/333)
- [Use Rust FFI #14: Xml example](https://github.com/pact-foundation/pact-php/pull/335)

The last one could do with some eyes, and we would still love to know if you have tested this out. Please let us know in the [#pact-php](https://pact-foundation.slack.com/archives/C9W94PXPY) channel or via GitHub.

### Pact Plugins

Rohit G Krishnan has been trying out the Pact plugin framework, and raised a PR to fix a bug. Find it, fork it, fix it. The beauty of open-source! Thanks a bunch!

- [Fix bug resolving enum across multiple files.](https://github.com/pactflow/pact-protobuf-plugin/pull/31)

### Pact Broker

Beth introduced a branch endpoint, supporting `GET` & `DELETE` in this PR

- [feat: add branch endpoint supporting GET and DELETE](https://github.com/pact-foundation/pact_broker/pull/635)

Expect to see this extend into the Pact Broker client, to let you interrogate the Pact Broker for pacticipants by `branch`

### Pact Broker Client

Utilising the above change, was the Pact Broker client, for provider-contract publishing.

- [feat: publish provider contracts using all in one endpoint](https://github.com/pact-foundation/pact_broker-client/pull/141/files)


Whilst the above PR, and `pactflow` command, is for integrating with closed-source tool PactFlow, please be reminded that this can serve as a useful pointer 
for implementing your own provider driven contract flow, in an open source broker. 

Check out an example repo https://github.com/pactflow/pactflow-jsonschema-example and supporting blog post https://pactflow.io/blog/contract-testing-using-json-schemas-and-open-api-part-2/

With a bit of tinkering, you can agument your workflows with https://github.com/pactflow/swagger-mock-validator, itself a fork of Atlassians [original](https://bitbucket.org/atlassian/swagger-mock-validator)

I've been thinking about how we could potentially create an extendable mechanism, whereby users could provide their own provider schemes, for alternate sources, other than OpenAPI, such as AsyncAPI.

If this floats your boat, why not join us, as a Pactober builder, or just give us a shout.

### Pact-JS

Mat Dodgson delivered a [fix: MessageConsumerPact merge pact file correctly](https://github.com/pact-foundation/pact-js/pull/1111)

### Pact Broker Chart

Love Kubernetes and Helm?

Chris J Burns & Sherif Ayad have got your back.

- [breaking: Upgrades Postgres & Common Chart Dependency](https://github.com/pact-foundation/pact-broker-chart/pull/66)
- [feat: bumped the version of the Pact Broker to 2.112.0-pactbroker2.107.1 (using the new docker tagging naming convention)](https://github.com/pact-foundation/pact-broker-chart/pull/64)

### Dont Massl the Hoff

A feature request landed for [Providing MASSL based auth support](https://pact.canny.io/feature-requests/p/provide-massl-based-auth-support)

>This is to add the support on adding a 'cert' and a 'key', regarding a self-hosted Broker that requires a 'cert' and a 'key'.
This will make the availability to call the 'Pact::VerificationTask' adding the 'cert' and 'key' to interact with the Self-Hosted Broker.

As an example: -

`--cert /path/to/client/cert.pem --key /path/to/client/key.pem`

_NB:-_ - I don't think it will be cli opts, but rather environment variables, to match the existing conventions for [using TLS](https://docs.pact.io/pact_broker/advanced_topics/using-tls)

**PR's**

- https://github.com/pact-foundation/pact-support/pull/99
- https://github.com/pact-foundation/pact-ruby/pull/298
- https://github.com/pact-foundation/pact_broker-client/pull/142

Thanks to [Lluís Xavier Casals Garcia](https://github.com/lluis-jt) for raising and [Gerald Molina](https://github.com/gmolki) for the PR's

## Pact in the wild

### Open edX

[Open edX](https://openedx.org/) is a community-driven, open-source project powering edX.org and thousands of other online education sites around the world.

We couldn't be more proud to see they are using Pact in their projects, and have written a brilliant post for their engineers. You can read it [here](https://openedx.atlassian.net/wiki/spaces/AC/pages/3769663499/Pact+-+Contract+Testing)

It also features [Dawoud Sheraz](https://github.com/dawoudsheraz), who we mentioned earlier in the year about his talk at Python Web Conf. The video is referenced in the above post, but you can watch it [here](https://www.youtube.com/watch?v=nA2Pv00dPgE)

### GitLab

GitLab are using Pact and have written some great [documentation](https://docs.gitlab.com/ee/development/testing_guide/contract/) to support its use in their project.

If you haven't tried about GitLab, why not look at testing it out, you can run the community edition, self hosted, and see the existing Pact tests (and run them) for yourself.

## Community Events

Are you hosting events about Pact? Why not let us know?

We can't wait for you to get involved, whether you attend one of the sessions throughout the month of Pactober, or you decide to host something yourself. Long live Pact and its awesome community!

Dont forget that throughout October, we will be providing links in Slack, but for all the latest updates, be sure to fill out our [Pactober registration form](https://cucumber.typeform.com/PactoberEoI)

## Thats a wrap

That’s it for this month. Stay safe and carry on coding!

- Yousaf Nabi — Developer Advocate at PactFlow and Community Shepherd at Pact.
