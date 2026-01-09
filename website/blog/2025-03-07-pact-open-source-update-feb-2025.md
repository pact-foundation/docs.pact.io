---
title: Pact Open Source Update — February 2025
author: Yousaf Nabi
authorURL: https://twitter.com/you54f
tags: [pact, oss, community]
keywords: [pact, oss, community]
date: 2025-03-07
draft: false
hide_table_of_contents: false
---

Hope you enjoyed our shortest month of the year, so short that I didn't manage to get my February blog post out until the first week of March! Whoops. Anyway, I'm pleased as the sun is shining, we've had some decent progress in the Pact ecosystem and we've had some surprises start arriving on contributors doorsteps. So let's not waste time and get straight into your monthly Pact updates.

## Pact OSS Updates

### Pact RFCs

We have an open RFC, that we would love input on, please take a look if you have time.

- [rfc: Implement generators for XML text and attribute](https://github.com/pact-foundation/roadmap/pull/113)
  - [feat: Implement generators for XML pact-reference](https://github.com/pact-foundation/pact-reference/pull/486)
  - [feat: Use new XML generator pact-reference](https://github.com/pact-foundation/pact-reference/pull/487)
  - [chore: Add example for xml generators pact-php](https://github.com/pact-foundation/pact-php/pull/720)

### Pact-JS

[pact-js v14 has been released](https://github.com/pact-foundation/pact-js/releases/tag/v14.0.0), this now includes the libpact_ffi & pact-js-core node bindings published as separate npm packages.

You'll benefit from smaller package downloads (the benefits of which will depend on your packager) with all the previous benefits of prebuilt node bindings on your machine, eliminating the need for post install steps and a full compiler set (gcc or msvc toolchain).

these are segmented by `${os}-{arch}-{libc}`

users should not need to require these automatically, npm should determine the required optional dependency to download at install time.

supported_platforms

    "@pact-foundation/pact-core-darwin-arm64": "16.0.0",
    "@pact-foundation/pact-core-darwin-x64": "16.0.0",
    "@pact-foundation/pact-core-linux-arm64-glibc": "16.0.0",
    "@pact-foundation/pact-core-linux-arm64-musl": "16.0.0",
    "@pact-foundation/pact-core-linux-x64-glibc": "16.0.0",
    "@pact-foundation/pact-core-linux-x64-musl": "16.0.0",
    "@pact-foundation/pact-core-windows-x64": "16.0.0"

#### Pact-JS - Slack

Chat with us in: [#pact-js](https://pact-foundation.slack.com/archives/C9VBGLUM9)

### Pact-Python

Hope you've tried the Pact Python V3 interface.

Some of our users have been, and in doing so strike up the potential for new feature enhancements and improvements like this one.

- [Async state and message handler](https://github.com/pact-foundation/pact-python/issues/1005)

If not, why not try it out today?

#### Pact-Python - Slack

Chat to us in: [#pact-python](https://pact-foundation.slack.com/archives/C9VECUP6E).

### Pact-PHP

See the [RFC](#pact-rfcs) section above, to find out how [Tien](https://github.com/tienvx) is trying to introduce XML generators to the Pact core.

#### Pact-PHP - Slack

Chat to us in: [#pact-php](https://pact-foundation.slack.com/archives/C9W94PXPY).

### Pact-Go

pact-go [v2.3.0](https://github.com/pact-foundation/pact-go/releases/tag/v2.3.0) has been released.

It contains a [change to support the correct reporting of the pact-go client library version](https://github.com/pact-foundation/pact-go/pull/501), during contract creation and verification. This has been paired with a Pact Broker change, to support display of the verifier tool detail.

We've will again be dropping the minimum version of golang, to 1.23, in this [PR](https://github.com/pact-foundation/pact-go/pull/504)

#### Pact-Go - Slack

Chat with us in: [#pact-go](https://pact-foundation.slack.com/archives/C9UTHTFFB).

### Pact-Reference

Don't forgot to check out some of the latest proposals for the Pact-Plugin framework

| Proposal                                                                                                                                           | State | Discussion                                                     |
| -------------------------------------------------------------------------------------------------------------------------------------------------- | ----- | -------------------------------------------------------------- |
| [V2 Plugin Interface](https://github.com/pact-foundation/pact-plugins/blob/main/docs/proposals/proposal_001_V2_Plugin_Interface.md)                         | Draft | https://github.com/pact-foundation/pact-plugins/discussions/83 |
| [Support script language plugins](https://github.com/pact-foundation/pact-plugins/blob/main/docs/proposals/proposal_002_Support_script_language_plugins.md) | Draft | https://github.com/pact-foundation/pact-plugins/discussions/84 |
| [Support WASM plugins](https://github.com/pact-foundation/pact-plugins/blob/main/docs/proposals/proposal_003_Support_WASM_plugins.md)                       | Draft | https://github.com/pact-foundation/pact-plugins/discussions/85 |

#### Pact-Reference - Slack

Chat with us in: [#pact-rust](https://pact-foundation.slack.com/archives/CA2S7E6KC).

### Pact Broker

#### Rack 3 upgrade is complete

We've now completed the Rack 3 upgrade work, which allows us to upgrade some existing dependencies and close off a CVE.

You can find it in [v2.113.2](https://github.com/pact-foundation/pact_broker/releases/tag/v2.113.2) or later

#### Provider State Discovery endpoint

One of the biggest challenges with contract-testing at scale, is the discoverability of provider states, in the broker, for any particular provider.

We now have a new resource that returns a aggregated de-duplicated list of all provider states for a given provider, released as [v2.113.0](https://github.com/pact-foundation/pact_broker/releases/tag/v2.113.0) as part of https://github.com/pact-foundation/pact_broker/pull/734.

##### How do I use it?

Make a GET request to `/pacts/provider/{provider}/provider-states`

> This resource returns a aggregated de-duplicated list of all provider states for a given provider.

- Provider states are collected from the latest pact on the main branch for any dependant consumers.
- Params will be shown, if provided in the provider state.

Example Response

```json
{
  "providerStates": [
    {
      "name": "an error occurs retrieving an alligator"
    },
    {
      "name": "there is an alligator named Mary"
    },
    {
      "name": "there is not an alligator named Mary"
    }
  ]
}
```

#### Extended Verification Results

The new Pact Core written in Rust supports publishing information about the client language that executed the Pact verification code, however this information wasn't stored in the Pact Broker, which mean users of the Pact Core, across multiple client language implementations couldn't distinguish which client framework, and client framework version was used.

This has now been resolved in this [PR](https://github.com/pact-foundation/pact_broker/pull/778) and released as [v2.114.0](https://github.com/pact-foundation/pact_broker/releases/tag/v2.114.0)

An example payload to the verification endpoint would look as pew below

```json
{
  "providerApplicationVersion": "1",
  "success": true,
  "buildUrl": "http://build-url",
  "testResults": [],
  "verifiedBy": {
    "implementation": "Pact-Rust",
    "version": "1.0.0",
    "clientLanguage": {
      "testFramework": "TEST",
      "name": "TESTER",
      "version": "1.2.3"
    }
  }
}
```

and you will be able to view this in your HAL Browser, or via an API call

<img width="659" alt="Screenshot 2025-02-12 at 15 58 01" src="https://github.com/user-attachments/assets/0715ec8a-6285-4546-bc6d-ea293dd37db3" />

#### Pact-Broker - Slack

Chat to us in: [#pact-broker](https://pact-foundation.slack.com/archives/C9VPNUJR2).

## Community Events

Are you talking about Pact or contract-testing this year at an event? Why not let us know and get yourself featured!

### Pact Nirvana

The North Star of Pact implementations, [Pact Nirvana](https://docs.pact.io/pact_nirvana) is an awesome place to be.

So much so, that [Ben Brugman](https://www.linkedin.com/in/bernardusbrugman/) and [Ashley Gautama](https://www.linkedin.com/in/ashleygautama/) reached out and said not only had they reached Pact Nirvana, but wanted to celebrate with some Pact swag.

Jo Laing and myself put our creative heads together, and as the first packages have begun to arrive, we can now share what we created with you all.

![Image](https://github.com/user-attachments/assets/35b1ef8d-0a04-4843-806c-923f903a317b)
![Image](https://github.com/user-attachments/assets/3e178ac8-cc2d-47bc-a52a-4fb25c3d3959)
![Image](https://github.com/user-attachments/assets/1572e3c1-011f-400d-9abd-c6e8a5847a66)
![Image](https://github.com/user-attachments/assets/acc436f6-f3f5-4d14-901d-29d549a7bafe)

## Thats a wrap

Want to carry on the conversation? Sign up [here](https://slack.pact.io/) to join our Slack community, where you will be amongst over 6k other users. It's a safe place to ask questions, and a great place to share the awesome work you are doing in the Pact ecosystem.

Whatever you are up to, let us know, and we can look to get you featured in the Pact post.

See you next month folks!

Cheers,
Saf
