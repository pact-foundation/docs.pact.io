---
title: 1. Get prepared - learn about Pact
sidebar_label: 1. Get prepared - learn about Pact
---

## Recommended reading

Before working through this guide, make sure you have:

* A basic understanding of [consumer-driven contracts](https://martinfowler.com/articles/consumerDrivenContracts.html) and how Pact works — see [How Pact works](/getting_started/how_pact_works) if you need a refresher.
* Read the [Pact Broker Overview](/pact_broker/overview) — this guide assumes you understand what the broker is and why it exists.
* Read [Versioning in the Pact Broker](/getting_started/versioning_in_the_pact_broker) — branch and environment concepts are used throughout.

## Work through the CI/CD workshop first (optional but recommended)

Before configuring Pact in your own environment, it helps to see what a working pipeline looks like. The [Pact CI/CD workshop](https://docs.pactflow.io/docs/workshops/ci-cd/) gives you a hands-on run through of the full pipeline — from writing a consumer test to deploying safely with `can-i-deploy`.

:::note
If you are using your own instance of the open source Pact Broker, it does not support secrets and does not have a UI for managing [webhooks](/pact_broker/webhooks). You will need to use the API or HAL Browser to create webhooks, and your CI token will be stored in plain text in the webhook. See the [Webhooks API reference](/pact_broker/advanced_topics/api_docs/webhooks) for details.
:::
