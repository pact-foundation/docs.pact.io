---
title: New "contract requiring verification published" webhook event released
author: Beth Skurrie
authorURL: http://twitter.com/bethesque
tags: [webhooks]
keywords: [webhooks]
date: 2021-10-11
draft: false
hide_table_of_contents: true
---

:::info tl&semi;dr

The `contract_requiring_verification_published` webhook event is a new and improved version of the `contract_content_changed` event to use when triggering provider verification builds.
:::

Webhooks in the Pact Broker can be triggered when certain predefined [events](/pact_broker/webhooks/#events) occur. They are primarily used to obtain provider verification results for a pact when a new version is published with changed expectations.  Historically, a webhook using the `contract_content_changed` event was used to trigger a build of the provider that verified just the changed pact, the URL of which would be passed through to the build using [webhook template parameters](/pact_broker/webhooks/#template-parameters).

A new and improved webhook event, `contract_requiring_verification_published` is now supported. It will be triggered if a pact is published with content that does not have a verification result from the main branch of the provider, or any of the deployed or released versions of the provider. The provider versions will be de-duplicated, and the webhook will then trigger once for each provider version. The provider version that needs to run the verification will be available in the webhook parameters as `${pactbroker.providerVersionNumber}`. The triggered provider build must then check out the specified version of the provider codebase, and verify the changed pact, which will also be passed through via the `${pactbroker.pactUrl}` parameter.

The `contract_requiring_verification_published` webhook has a number of advantages over the existing `contract_content_changed` webhook.

* It makes it easy to obtain verification results from the test and production versions of your provider, allowing consumer versions with changed contracts that are already supported by the production provider to be deployed straight away.
* It only triggers if there is a verification result missing for one of the critical provider versions, reducing the number of unnessary builds triggered.

Read more about the new event in the docs [here](/pact_broker/webhooks#using-webhooks-with-the-contract_requiring_verification_published-event) to start using it.