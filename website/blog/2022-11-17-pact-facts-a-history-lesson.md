---
title: Pact Facts - An interactive history lesson
author: Yousaf Nabi
authorURL: https://github.com/you54f
tags: [pact, oss, community, plugins, launch, history, interactive]
keywords: [pact, oss, community, plugins, launch, history, interactive]
date: 2022-11-17
draft: false
hide_table_of_contents: false
---

# Pact facts

Did you know, [Pact](https://pact.io/) is nearly 10 years old!

As the de-facto leader in contract-testing, the eco-system has grown to be vast, just take a look below

[![image](https://user-images.githubusercontent.com/19932401/202264312-ac54ab8c-403d-4e15-9e0b-2f2593923bc5.png)](https://pact.io/)

However today, I am going to take you on a little journey of how it came to be, and show you what is to come.



### TL;DR 

> A lot happens in 10 years. We’ve seen it all here at Pact, from the proliferation of micro services, to ever increasing protocols like [Protobufs](https://developers.google.com/protocol-buffers), [GraphQL](https://graphql.org/), transports such as [gRPC](https://grpc.io/), [Websockets](https://developer.mozilla.org/en-US/docs/Web/API/WebSockets_API) and [MQTT](https://mqtt.org/), [EventDrivenArchitectures](https://en.wikipedia.org/wiki/Event-driven_architecture) and [data pipelines](https://www.youtube.com/watch?v=6kEGUCrBEU0) or emerging standards such as [OpenAPI](https://www.openapis.org/), [AsyncAPI](https://www.asyncapi.com/) and [CloudEvents](https://cloudevents.io/).

> As we launch our Pact Plugin Framework bringing you new possibilities to the Pact eco-system, I’d like to invite you to try an interactive history lesson of Pact, from past, to present and beyond!

> Pact and the Pact-Plugin Framework will unlock the possibility of testing multiple transport and content types. You will see Pact used for gRPC, Protobuf and CSV based messages. Hope it feeds your imagination of the possiblities, it certainly has for me!

- 👉 [Try out gRPC, CSV & Protobuf testing in Go, Rust & Java with Pact Plugins](https://killercoda.com/safdotdev/course/safacoda/grpc_quick_start)

[![image](https://user-images.githubusercontent.com/19932401/202266463-2b715761-039b-46e8-a85d-97fbacf53af0.png)](https://docs.pact.io/implementation_guides/pact_plugins)

If it piques your interest, you should sign up for our [upcoming webinar](https://docs.pact.io/events/plugins-framework-launch) to hear more about our exciting news and what it means for you and the software development community. 

## The birth of Pact Ruby

Pact was originally written by a development team at [realestate.com.au](https://www.realestate.com.au/) in 2013, born out of trying to solve the problem of how to do integration testing for their new Ruby microservices architecture. They threw together a codebase that was to become the first Pact implementation.

`git add . && git commit -m 'Gem skeleton' && git push` by [James Fraser](https://github.com/jfraser)

[![Screenshot 2022-11-16 at 14 16 59](https://user-images.githubusercontent.com/19932401/202204239-f2bfa18e-5ff3-450a-b037-8d0a5cc5387d.png)](https://github.com/pact-foundation/pact-ruby/commit/590f10f67d231838a54fd7cb2bfda50487f9ef6e)

[Ron Holshausen](https://github.com/uglyog) (at the time at [DiUS](https://dius.com.au/), still one of the present day maintainers of [Pact](http://pact.io/), and co-founder of [Pactflow](https://pactflow.io/)), first commit came shortly after. 

[![Screenshot 2022-11-16 at 14 27 47](https://user-images.githubusercontent.com/19932401/202207018-8483082b-df76-4c95-b807-4458dbfdb3ca.png)](https://github.com/pact-foundation/pact-ruby/commit/2113359743a55d0fa8d2bea17848749ec2223d86)


A few months later [Beth Skurrie](https://github.com/bethesque) (then at [DiUS](https://dius.com.au/), still one of the present day maintainers of [Pact](http://pact.io/) and co-founder of [Pactflow](http://pactflow.io/) ), joined one of the teams that was working with the Pact authors' team.

She had recently seen a talk by [J.B.Rainsberger entitled "Integration tests are a scam"](https://blog.thecodewhisperer.com/permalink/integrated-tests-are-a-scam), which promoted the concept of "collaboration" and "contract" tests, so she was immediately interested when she was introduced to Pact.

J. B. has since softed his message, as have we, I think we all mellow as we get older :)

Beth's first commit in [Pact Ruby](https://github.com/pact-foundation/pact-ruby)

[![Screenshot 2022-11-16 at 14 33 02](https://user-images.githubusercontent.com/19932401/202208237-9a56abd1-1723-4e07-9da6-ce00eba0d3ec.png)](https://github.com/pact-foundation/pact-ruby/commits?after=f5621b68e9825efffaedf9b7d6abab55cf6e39f0+314&author=bethesque&since=2013-02-17&until=2013-12-10)

After trying (as most people do) to convince the authors that the provider should be the contract writer, she was soon convinced by [Brent Snook](https://github.com/brentsnook), one of the [original authors](https://github.com/pact-foundation/pact-ruby#related-libraries) of Pact, of the value of consumer driven contracts. At this stage, she realised that what was missing in the current implementation was the ability to run the same request under different conditions, and ["provider states"](https://docs.pact.io/getting_started/provider_states) were born.

## Viva la Pact Broker

[![Screenshot 2022-11-16 at 14 28 48](https://user-images.githubusercontent.com/19932401/202207257-816e19e6-deb3-49d8-bacd-26dd0f647cd3.png)](https://github.com/pact-foundation/pact_broker/commit/71ee9d76255a50bdb6ee4348feb0a6a3adb69899)

### What the heck is a Pact Broker anyway, Saf?

The Pact Broker (as Pact was) being written to solve our own problem, which was trying to coordinate pact versions between projects.

It is an application that allows you to release customer value quickly and confidently by [deploying your services independently](https://www.rea-group.com/blog/enter-the-pact-matrix-or-how-to-decouple-the-release-cycles-of-your-microservices/) and avoiding the bottleneck of integration tests, introducing a pact matrix.

It looks a little like this

![image](https://user-images.githubusercontent.com/19932401/202299953-d72e45a4-2bf9-43e5-bf1d-58586291c6f2.png)

By testing the Pact Matrix, you can be confident to deploy any service at any time, because your standalone CI tests have told you whether or not you are backwards compatible – no “certification environment” needed. And when there are multiple services in a context, this approach scales linearly, not exponentially like the certification environment approach.


### Preaching the message

Soon after, Beth decided that Pact idea was the best thing since sliced bread, and she hasn't stopped yacking on about it since. Hear Beth, [Jon Eaves](https://www.linkedin.com/in/joneaves) from [REA](https://www.realestate.com.au/) and [Evan Bottcher](https://www.linkedin.com/in/evanbottcher/) from [ThoughtWorks](https://www.thoughtworks.com/) [speak at YOW!2014 in this YouTube video](https://www.youtube.com/watch?v=vr8GH93a3dA&ab_channel=SkillsMatter)

Want a bit more of Beth? we told you she couldn't stop yakking

- https://www.youtube.com/watch?v=KwpDu9SuAbI&ab_channel=MicroservicesAU
- https://www.infoq.com/presentations/pact/

Ron began spreading the message, read a blog post from 2014 [here](https://dius.com.au/2014/05/20/simplifying-microservice-testing-with-pacts/)

## The birth of Pact JVM

Pact spread around the codebases in the wider program of work at [realestate.com.au](https://www.realestate.com.au/), until it hit its first Java microservice. realestate.com.au had many JVM projects, so a group of [DiUS](https://dius.com.au/) consultants (including Ron Holshausen again) started the [pact-jvm](https://github.com/pact-foundation/pact-jvm) project on a hack day. 

[![Screenshot 2022-11-16 at 14 37 32](https://user-images.githubusercontent.com/19932401/202209433-9968aae8-f228-413b-a6a4-f9eff679d29d.png)](https://github.com/pact-foundation/pact-jvm/commit/16302462e7b488f42586cec0f7ecbbd5b009f18d)

Ron raised his first issue, https://github.com/pact-foundation/pact-jvm/issues/31, which led to his first PR

[![Screenshot 2022-11-16 at 14 43 27](https://user-images.githubusercontent.com/19932401/202211030-d5e3d42b-ae7f-4f29-b0e9-ed55e8643cf7.png)](https://github.com/pact-foundation/pact-jvm/issues/31)

You can [watch a talk from Ron here](https://www.youtube.com/watch?v=h-79QmIV824&ab_channel=MelbJVM) talking about pact and Pact JVM

Like all grown up frameworks, processes are needed, and a Pact Specification was born.

Beth penned the first [Pact test cases](https://github.com/pact-foundation/pact-specification/commit/62922263682dd1f34f7eb5a3eda1ec78d55d0903), which came to be Pact Specification [v1.0.0](https://github.com/pact-foundation/pact-specification/tree/version-1)

[![Screenshot 2022-11-16 at 14 45 42](https://user-images.githubusercontent.com/19932401/202211650-143567c3-3746-47d0-9fc9-cdfde94e5f7c.png)](https://github.com/pact-foundation/pact-specification/tree/version-1)

It was at this stage that the authors realised that the Rubyisms in the format were going to have to be replaced by a non-language specific format, and the idea of the v2 pact-specification [arose](https://github.com/pact-foundation/pact-specification/commit/aa48aad69573ee544b54f34163a281fb416622db) on Mar 27, 2014 though it would take a while (just over a year) before it became [reality](https://github.com/pact-foundation/pact-specification/commit/613b7bde945c1cd4c392c07a88b7c6cad49e7602).

[![Screenshot 2022-11-16 at 14 53 18](https://user-images.githubusercontent.com/19932401/202213831-34e1ca05-1967-4167-9336-dc0732e42007.png)](https://github.com/pact-foundation/pact-specification/tree/version-2)

Soon it became obvious that Javascript UIs would benefit greatly from using Pact with their backend APIs. 

After tossing around the idea of implementing Pact yet again in another language, a decision was made to wrap the Ruby implementation (which was packaged as a standalone executable) to avoid the maintenance burden and potential of implementation mismatches. This became the pattern that was used for most of the following Pact implementations. Each language implemented a Pact DSL and mock service/verifier client, and called out to the Ruby mock service process/verifier in the background. The original Ruby JSON syntax was often used between the native clients and the mock service, as it was simpler to implement, however, the mock service took care of writing the actual pact in the v2 format.

- https://github.com/pact-foundation/pact-mock_service - Provides a mock service for use with Pact
- https://github.com/pact-foundation/pact-provider-verifier - Cross-platform, generic language, Pact provider verification tool
- https://github.com/pact-foundation/pact-ruby-standalone - A standalone pact command line executable using the ruby pact implementation and Travelling Ruby

## The birth of Pact JS

Three versions of Pact-JS have existed, [Fuying](https://github.com/fuying) created the [first commit](https://github.com/DiUS/pact-consumer-js-dsl/commit/efe41aef8178d06f4b060812712aee355b972b1b) of [DiUS/pact-consumer-js-dsl](https://github.com/DiUS/pact-consumer-js-dsl). A familiar face Beth pops along for her [first commit](https://github.com/DiUS/pact-consumer-js-dsl/commit/73c8145426f6056e68afefbba22ab6e384cd09380).

A few days apart, [DiUS/pactjs0](https://github.com/DiUS/pactjs0) was created, the [first commit](https://github.com/DiUS/pactjs0/commit/2175be79f24467f9808485cf383cd5b3471487f9) by 
Jeff Cann. Ron dropped his [first commit](https://github.com/DiUS/pactjs0/commit/ddf8dcb48c6d9c3344d64972f29ee4bb62edce31) 
ultimately [deprecating it](https://github.com/DiUS/pactjs0/commit/750379851fcdfc52b86aaa2ba8ad547514831173) a little while later.

Enter [Matt Fellows](https://github.com/mefellows), dropping his [first commit](https://github.com/DiUS/pact-consumer-js-dsl/commit/9442f36579a82583dcc1910012344d8195968eda). A man of many talents, Matt is still one of the present day maintainers of [Pact](http://pact.io/), as well as co-founding [Pactflow](http://pactflow.io/).

It's funny, JavaScript is akin to the bus service, you wait for ages and then three turn up at once 🤯. 

Enter the still current Library, Pact-JS. It's [first commit](https://github.com/pact-foundation/pact-js/commit/d69fa087112dd7bd40340c36f13f18e5086c650b) by [Tarcio Saraiva](https://github.com/tarciosaraiva).

A few months later, [Pact-JS became the sole library going forward](https://github.com/pact-foundation/pact-js/commit/e3c8647d3f35080e121c736ef1bdbfb18e9ba99a)

This multi-language capability gave us the ability to start building cross-platform contract testing suites, as demonstrated below with JSON/HTTP interactions in laser focus

[![image](https://user-images.githubusercontent.com/19932401/202264619-7ab4fb38-18f2-43df-8ba0-2f295cce3384.png)](https://docs.pactflow.io/docs/examples/#demos)
 
You can out HTTP based Pact in our interactive tutorial here, in either Java or JavaScript

- 👉 [Try HTTP based Pact in JS](https://killercoda.com/pactflow/scenario/pactflow-getting-started-js)
- 👉 [Try HTTP based Pact in Java](https://killercoda.com/pactflow/scenario/pactflow-getting-started-java)
- 🔗 [or via our CI/CD workshop](https://docs.pactflow.io/docs/workshops/ci-cd)
  - 🔗 [Where you can mix/match our consumer/provider examples across multiple languages and frameworks](https://docs.pactflow.io/docs/examples#demos)

##  Pact proliferates - Lead by example

> Since the implementation of the v2 format, newer features have been added, and the v3 and v4 formats add support for handing multiple provider states, messaging, and 'generators'.

- 🔗 [Version 3.0 (WIP)](https://github.com/pact-foundation/pact-specification/commit/8b52047c25a2a137963650714b941018a70a8194)
- 🔗 [Version 3.0 - It's alive](https://github.com/pact-foundation/pact-specification/commit/4ae9c73a80c7fb826d470cc67d28a3fdc352cfbd)
- 🔗 [Version 4.0 (WIP)](https://github.com/pact-foundation/pact-specification/commit/a0736943ce2f25bf4d5fbfd00e6fe4d95e5fedf0)
- 🔗 [Version 4.0 (Draft)](https://github.com/pact-foundation/pact-specification/commit/8ce13a5785feae4ef1decf9ef2d0b0a792da86f8)
- 🔗 [Version 4.0 - It's alive](https://github.com/pact-foundation/pact-specification/commit/1250a3d8e6c6900bad08dd916d2d18a2bc02aedd)


One of the strengths of Pact is its specification, allowing anybody to create a new language binding in an interoperable way. Whilst this has been great at unifying compatibility, the sprawl of languages makes it hard to add significant new features/behaviour into the framework quickly (e.g. GraphQL or Protobuf support).

Wrapping the Ruby implementation allowed new languages to implement Pact quickly, however, it had its downsides. The standalone package worked by bundling the entire Ruby runtime with the codebase using Travelling Ruby, so it was large **(~9MB)**. The native libraries also had to deal with the mock service process management, which could be fiddly on different platforms. It also made it difficult to run consumer tests in parallel, as each mock service process could only handle one thread at a time. The Ruby implementation was also lagging behind in feature development compared to the JVM, as Beth was spending more time on the Pact Broker.

To provide a single Pact implementation that could be used by all the required languages, the decision was made to create a reference implementation in Rust, that could be wrapped by each client language using FFI. The distributable package will be orders of magnitude smaller, and make it easier to run tests in parallel and avoid the process management issues, we have been slowly moving to our Rust core which solves many of the challenges that bundling Ruby presented.

- 👉 [Try out Pact-JS backed with the Ruby Core](https://killercoda.com/pactflow/scenario/pactflow-getting-started-js)
- 👉 [Try out Pact-JS backed with the Rust Core](https://killercoda.com/pactflow/scenario/pactflow-getting-started-js-v3)

It is worth noting that the "shared core" approach has largely been a successful exercise in this regard. There are many data points, but the implementation of WIP/Pending pacts was released (elapsed, not effort) in just a few weeks for the libraries that wrapped Ruby. In most cases, an update of the Ruby "binaries", mapping flags from the language specific API to dispatch to the underlying Ruby process, a README update and a release was all that was required. In many cases, new functionality is still published with an update to the Ruby binary, which has been automated through a script.

Beth often refers to the Ruby Goldberg machine, in a nod to Rube Goldberg.

[![image](https://user-images.githubusercontent.com/19932401/202261902-fd61e2a4-7df1-4f1a-a795-b0722a8ecc33.png)](https://en.wikipedia.org/wiki/Rube_Goldberg_machine)

We would love your engineering support in bringing efficiencies to our CI/CD processes used in our open source projects, or your artistic skills, if someone fancies drawing a Pact Rube Goldberg machine <3


## Moving beyond HTTP

But, the industry has continued to innovate since Pact was created in 2013, and RESTful microservices are only one of the key use cases these days - protocols such as Protobufs and Graphql, transports such as TCP, UDP and HTTP/2 and interaction modes (e.g. streaming or server initiated) are starting to become the norm. Standards such as AsyncAPI and CloudEvent are also starting to emerge.

![image](https://user-images.githubusercontent.com/19932401/202486099-f5493874-812c-4611-9eb0-1af6076d5217.png)

For example, Pact has been a rather HTTP centric library, and the mixed success in retrofitting "message support" into all languages shows that extensions outside of this boundary aren't trivial, and in some respects are a second class citizen.

The reason is simple: HTTP doesn't change very often, so once a language has implemented a sensible DSL for it and integrated to the core, it's more a matter of fine tuning things. Adding message pact is a paradigm shift relative to HTTP, and requires a whole new developer experience of authoring tests, integrating to the core and so on, for the language author to consider.

You can read more about non-HTTP messaging with Pact 🔗 [here](https://docs.pact.io/getting_started/how_pact_works#non-http-testing-message-pact)




- 👉 [Try out an interactive message based pact demo here](https://killercoda.com/safdotdev/course/safacoda/pact-logical-replication)

> Please note this one is a pet-project work in progress but it does show off message testing in various pact languages (Java, JS, .NET, PHP, Python & Ruby)

![image](https://user-images.githubusercontent.com/19932401/202264821-8f831f38-bacc-4fd0-93c4-363d3eb04b30.png)

## Pact Plugin Philosophy

Being able to mix and match protocol, transport and interaction mode would be helpful in expanding the use cases.

Further, being able to add custom contract testing behaviour for bespoke use cases would be helpful in situations where we can't justify the effort to build into the framework itself (custom protocols in banking such as AS2805 come to mind).

To give some sense of magnitude to the challenge, this table showed some of the Pact deficiencies across popular microservice deployments as of a couple of years ago

[![https://user-images.githubusercontent.com/53900/103729694-1e7e1400-5035-11eb-8d4e-641939791552.png](https://user-images.githubusercontent.com/53900/103729694-1e7e1400-5035-11eb-8d4e-641939791552.png)](https://github.com/pact-foundation/pact-plugins/)

So the pact plug-in eco system was born, a way to allow new transport types, content matchers/generators and more to easily be added to the pact framework, without needing to wait for the core maintainers to roll it out. You can create your own, for public, private or commercial consumption!

[![image](https://user-images.githubusercontent.com/19932401/202266018-6cb62acb-0129-4768-ad1d-2ce53ee03b3f.png)](https://docs.pact.io/implementation_guides/pact_plugins)

## Enough blurb, show me da code

Whilst it may be quite technical for some, others will relish the possibilities this will unlock. If you want something or see a use case, but aren’t quite sure how to put it to reality, try out our demos and give us a shout via 🔗 [canny](https://pact.canny.io/), our feature request board, or 🔗 [slack](http://slack.pact.io/)

To prove how easy it was, and as a nice little nod back to the Grandmother of Pact, Ruby. Your very own devo avo put his money where his mouth is and built his own.

- 👉 [Try out gRPC Testing in Ruby, with Pact Plugins](https://killercoda.com/safdotdev/course/safacoda/grpc_plugins_quick_start)

### Try out our pact plug-in framework here

> This will allow you to see Pact and the Pact-Plugin Framework to test multiple transport and content types. You will see Pact used for gRPC, Protobuf and CSV based messages. Hope it feeds your imagination of the possiblities, it certainly has for me!

- 👉 [Try out gRPC, CSV & Protobuf testing in Go, Rust & Javam with Pact Plugins](https://killercoda.com/safdotdev/course/safacoda/grpc_quick_start)

And to anchor it back to a picture you probably know from our Pact docs, plugins just sit in the middle and help extend the capabalities 

[![image](https://user-images.githubusercontent.com/19932401/202266463-2b715761-039b-46e8-a85d-97fbacf53af0.png)](https://docs.pact.io/implementation_guides/pact_plugins)

**Choose Possibilities, Choose plugins, Choose Pact!**

- Sign up for our webinar to learn more https://docs.pact.io/events/plugins-framework-launch
- Jump into the [Pact Plugin](https://docs.pact.io/implementation_guides/pact_plugins) docs
- Check out the [Pact Protobuf Plugin](https://github.com/pactflow/pact-protobuf-plugin#testing-an-interaction-with-a-single-protobuf-message)
- Find out how you can [Contribute](https://docs.pact.io/contributing)
- [Discuss on Slack](http://slack.pact.io/)
- [Vote for a feature, or add your own](https://pact.canny.io/)

## A thank you to those who got us here

<img src="https://contrib.rocks/image?repo=pact-foundation/pact-plugins&max=10000" />
<img src="https://contrib.rocks/image?repo=pact-foundation/.github&max=10000" />
<img src="https://contrib.rocks/image?repo=pact-foundation/pact_broker-client&max=10000" />
<img src="https://contrib.rocks/image?repo=pact-foundation/docs.pact.io&max=10000" />
<img src="https://contrib.rocks/image?repo=pact-foundation/pact-jvm&max=10000" />
<img src="https://contrib.rocks/image?repo=pact-foundation/pact-workshop-js&max=10000" />
<img src="https://contrib.rocks/image?repo=pact-foundation/pact-js&max=10000" />
<img src="https://contrib.rocks/image?repo=pact-foundation/pact-go&max=10000" />
<img src="https://contrib.rocks/image?repo=pact-foundation/pact-ruby&max=10000" />
<img src="https://contrib.rocks/image?repo=pact-foundation/pact.io&max=10000" />
<img src="https://contrib.rocks/image?repo=pact-foundation/pact-support&max=10000" />
<img src="https://contrib.rocks/image?repo=pact-foundation/pact-reference&max=10000" />
<img src="https://contrib.rocks/image?repo=pact-foundation/karma-pact&max=10000" />
<img src="https://contrib.rocks/image?repo=pact-foundation/pact-net&max=10000" />
<img src="https://contrib.rocks/image?repo=pact-foundation/pact-ruby-cli&max=10000" />
<img src="https://contrib.rocks/image?repo=pact-foundation/pact-js-core&max=10000" />
<img src="https://contrib.rocks/image?repo=pact-foundation/pact-python&max=10000" />
<img src="https://contrib.rocks/image?repo=pact-foundation/pact_broker&max=10000" />
<img src="https://contrib.rocks/image?repo=pact-foundation/pact-broker-docker&max=10000" />
<img src="https://contrib.rocks/image?repo=pact-foundation/pact-stub-server&max=10000" />
<img src="https://contrib.rocks/image?repo=pact-foundation/pact-provider-verifier&max=10000" />
<img src="https://contrib.rocks/image?repo=pact-foundation/nestjs-pact&max=10000" />
<img src="https://contrib.rocks/image?repo=pact-foundation/pact-ruby-e2e-example&max=10000" />
<img src="https://contrib.rocks/image?repo=pact-foundation/pact-js-mocha&max=10000" />
<img src="https://contrib.rocks/image?repo=pact-foundation/pact-php&max=10000" />
<img src="https://contrib.rocks/image?repo=pact-foundation/pact-ruby-standalone&max=10000" />
<img src="https://contrib.rocks/image?repo=pact-foundation/blog.pact.io&max=10000" />
<img src="https://contrib.rocks/image?repo=pact-foundation/pact_broker-serverless&max=10000" />
<img src="https://contrib.rocks/image?repo=pact-foundation/homebrew-pact-ruby-standalone&max=10000" />
<img src="https://contrib.rocks/image?repo=pact-foundation/pact-mock_service&max=10000" />
<img src="https://contrib.rocks/image?repo=pact-foundation/pact-specification&max=10000" />
<img src="https://contrib.rocks/image?repo=pact-foundation/release-gem&max=10000" />
<img src="https://contrib.rocks/image?repo=pact-foundation/jest-pact&max=10000" />
<img src="https://contrib.rocks/image?repo=pact-foundation/pact-workshop-dotnet-core-v1&max=10000" />
<img src="https://contrib.rocks/image?repo=pact-foundation/pact-event-bot&max=10000" />
<img src="https://contrib.rocks/image?repo=pact-foundation/serverless-offline-pact&max=10000" />
<img src="https://contrib.rocks/image?repo=pact-foundation/devrel&max=10000" />
<img src="https://contrib.rocks/image?repo=pact-foundation/pact-mock-service-docker&max=10000" />
<img src="https://contrib.rocks/image?repo=pact-foundation/pact-parser&max=10000" />
<img src="https://contrib.rocks/image?repo=pact-foundation/pact-workshop-jvm-spring&max=10000" />
<img src="https://contrib.rocks/image?repo=pact-foundation/mocha-pact&max=10000" />
<img src="https://contrib.rocks/image?repo=pact-foundation/pact-ruby-standalone-e2e-example&max=10000" />
<img src="https://contrib.rocks/image?repo=pact-foundation/pact-cplusplus&max=10000" />
<img src="https://contrib.rocks/image?repo=pact-foundation/pact-message-ruby&max=10000" />
<img src="https://contrib.rocks/image?repo=pact-foundation/pact-workshop-Maven-Springboot-JUnit5&max=10000" />
<img src="https://contrib.rocks/image?repo=pact-foundation/pact-js-dev-config&max=10000" />
<img src="https://contrib.rocks/image?repo=pact-foundation/pact-workshop-go&max=10000" />
<img src="https://contrib.rocks/image?repo=pact-foundation/pact-js-jasmine&max=10000" />
<img src="https://contrib.rocks/image?repo=pact-foundation/pact-standalone-npm&max=10000" />
<img src="https://contrib.rocks/image?repo=pact-foundation/pact-stub-server-archived&max=10000" />
<img src="https://contrib.rocks/image?repo=pact-foundation/pact-workshop-swift&max=10000" />
<img src="https://contrib.rocks/image?repo=pact-foundation/pactr&max=10000" />
<img src="https://contrib.rocks/image?repo=pact-foundation/cypress-pact&max=10000" />
<img src="https://contrib.rocks/image?repo=pact-foundation/zoo-app&max=10000" />
<img src="https://contrib.rocks/image?repo=pact-foundation/pact-workshop-mobile-swift&max=10000" />
<img src="https://contrib.rocks/image?repo=pact-foundation/pact-workshop-mobile-kotlin&max=10000" />
<img src="https://contrib.rocks/image?repo=pact-foundation/pact-ruby-standalone-windows-test&max=10000" />
<img src="https://contrib.rocks/image?repo=pact-foundation/pact-xml&max=10000" />
<img src="https://contrib.rocks/image?repo=pact-foundation/pact-message-demo&max=10000" />
<img src="https://contrib.rocks/image?repo=pact-foundation/animal-service&max=10000" />
<img src="https://contrib.rocks/image?repo=pact-foundation/community&max=10000" />
<img src="https://contrib.rocks/image?repo=pact-foundation/pact-logo&max=10000" />
<img src="https://contrib.rocks/image?repo=pact-foundation/pact-provider-proxy&max=10000" />
<img src="https://contrib.rocks/image?repo=pact-foundation/pact-provider-verifier-npm&max=10000" />
<img src="https://contrib.rocks/image?repo=pact-foundation/rspec-pact-matchers&max=10000" />
<img src="https://contrib.rocks/image?repo=pact-foundation/pact-mock-service-npm&max=10000" />
<img src="https://contrib.rocks/image?repo=pact-foundation/pact-jwt&max=10000" />
<img src="https://contrib.rocks/image?repo=pact-foundation/grunt-pact&max=10000" />
<img src="https://contrib.rocks/image?repo=pact-foundation/pact-consumer-minitest&max=10000" />