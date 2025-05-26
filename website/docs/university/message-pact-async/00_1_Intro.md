---
title: Intro
sidebar_label: Intro
---

:::info
This workshop is also available as a video. [Watch it now](https://www.youtube.com/live/81N25-4x27E?si=NsmQdmhiSd_y9Jo6). 
:::

This workshop is aimed at demonstrating core features and benefits of [consumer driven contracts](https://martinfowler.com/articles/consumerDrivenContracts.html) in relation to message based systems with Pact.

Modern distributed architectures are increasingly integrated in a decoupled, asynchronous fashion. Message queues such as ActiveMQ, RabbitMQ, SNS, SQS, Kafka and Kinesis are common, often integrated via small and frequent numbers of microservices (e.g. lambda). These sorts of interactions are referred to as "message pacts".

There are some minor differences between how Pact works in these cases when compared to the HTTP use case. Pact supports messages by abstracting away the protocol and specific queuing technology (such as Kafka) and focusses on the messages passing between them.

When writing tests, Pact takes the place of the intermediary (MQ/broker etc.) and confirms whether or not the consumer is able to handle a given event, or that the provider will be able to produce the correct message.

This workshop should take 30 minutes to an hour, depending on how deep you want to go into each topic.