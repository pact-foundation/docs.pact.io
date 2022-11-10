---
title: Introducing the Pact Plugin Framework
author: Alicia Foreman
authorURL: https://www.linkedin.com/in/aliciaforeman/
tags: [pact, oss, community, plugins, launch]
keywords: [pact, oss, community, plugins, launch]
date: 2022-11-10
draft: false
hide_table_of_contents: false
---

## Pact with more power – introducing the Pact Plugin Framework  

Today we share the news that your favourite contract testing framework comes Pact with more power! The new Pact Plugin Framework completes the missing piece to help development teams apply contract testing all their API technologies and use cases.  

:::note
[Register](https://docs.pact.io/events/plugins-framework-launch) for an upcoming webinar to learn more.
:::

## Why we built the Pact Plugin Framework 

Loved by thousands of development teams globally, Pact was originally created to support the rise of RESTful microservices and has since expanded to support asynchronous messaging, becoming the defacto API contract testing solution. 

As architectures have evolved, organisations find that the existing Pact contract testing framework may not support all of their use cases. 

The industry has continued to innovate since Pact was created in 2013, and RESTful microservices are now only one of the key use cases today. According SmartBear’s 2021 State of Quality [report](https://smartbear.com/state-of-software-quality/api/tools/#api-protocols), we are seeing the growth of: 

* Protocols such as Protobufs and GraphQL (80% of organisations run multi-protocol and more than 60% of organisations manage three or more) 
* Transports such as gRPC, Websockets  and MQTT 
* Newer interaction models such as streaming, async or server push 
* Event Driven Architectures and data pipelines  
* Emerging standards such as AsyncAPI and CloudEvent  

## Pact Plugin Framework now live  

The Pact maintainers have been acutely aware of the changing trends – we [blogged](https://pactflow.io/blog/extending-pact-with-plugins/) about the idea for the Pact Plugin Framework in 2021 and have been actively chipping award at the [roadmap item](https://github.com/pactflow/roadmap/issues/33) to enable developers everywhere to use contract testing where they previously couldn’t. 

Hats off to [Ronald Holshausen](https://github.com/uglyog) who undertook the mammoth task of standing up the Framework. With this, development teams now can now harness the power of contract testing where they previously couldn’t, applying it to unique and emerging use cases and technologies - no matter the scale or the language, transport, protocol or content type.  

## How this new capability works  

Pact may have been applied to one team or application using RESTful microservices but another using GraphQL, as been unable to get the [complete benefits of contract testing](https://pactflow.io/blog/what-is-contract-testing/). The Plugin Framework is the answer – developers can build plugins for their custom needs, whether they open source the plugin or keep it closed source for in house only usage.  

For those familiar with Pact, this is a substantial innovation. By having a single generic interface, the Plugin Framework side steps the problems of requiring the input of core maintainers to support a new feature and its constituent concepts that must be built into each client language. 

Read the full use case for the Plugin Framework is explained in detail on the [GitHub issue](https://github.com/pact-foundation/pact-specification/issues/83).

## Getting started

If you’re as excited by this new feature as we are, you can jump right in and give it a try in two ways: 

1. [Build your own plugin](https://docs.pact.io/implementation_guides/pact_plugins/docs/writing-plugin-guide) for any use case you and your team require – visit the guide to writing your own plugin 
1. Try out a pre-made plugin - visit the [implementation guide for GPRC](https://github.com/pactflow/pact-protobuf-plugin)

Plus, on Wed 30 November, we’re hosting two live webinars to present the backstory, introduce the Pact Plugin Framework and answer questions about getting started. [Sign up here](https://docs.pact.io/events/plugins-framework-launch).