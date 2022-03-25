---
title: 1. Get prepared - learn about Pact
sidebar_label: 1. Get prepared - learn about Pact
---

Before you read this document, you should:

* have a basic understanding of the concepts of both [consumer driven contracts](https://martinfowler.com/articles/consumerDrivenContracts.html) and Pact,
* have read the [Pact Broker Overview](pact_broker/overview.md)
* have read the section on [versioning in the Pact Broker](getting_started/versioning_in_the_pact_broker.md)
* Do the CI/CD workshop

Before setting up Pact in your own environment, it can help to have an idea of what a working pipeline might look like. 

Completing the [Pact CI/CD workshop](https://docs.pactflow.io/docs/workshops/ci-cd/) will give you a good understanding of how the Pact client libaries interact with the Pact Broker and where these interactions fit into your release pipeline.

> Note that if you are using your own instance of the open source Pact Broker, it does not support secrets, and it does not have a user interface for managing webhooks. You'll need to use the API to create the webhook, and your Travis CI token will have to be stored in plain text in the webhook.