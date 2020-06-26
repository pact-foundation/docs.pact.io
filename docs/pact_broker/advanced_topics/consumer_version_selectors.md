---
title: Consumer Version Selectors
---

## Overview

Consumer version selectors are the (new) way to configure which pacts the provider verifies. Instead of providing a list of tag names (as in the past) a list of selector objects is provided. These allow a much more flexible and powerful approach to specifying which pacts to verify.

## Properties

A consumer version selector has the following properties:

* `tag`: The name of the tag which applies to the pacticipant (application) versions of the pacts you want to verify. Common examples of the tag names used here are `master`, `test` and `prod`.

* `latest`: Whether or not to verify only the pact that belongs to the latest application version. The most common use case is to set this to true. When false, null or ommitted, the pacts that belong to *all* application versions with the specified tag will be verified. This is to support the scenario when an API has many production versions, and hence pacts (eg. a mobile consumer).

* `consumer`: Filter pacts by the specified consumer. When ommitted, all consumer are included. This is generally not needed, as the most common use case is to verify pacts for all consumers. It is useful in the scenario when an API has multiple versions of one particular consumer in production (eg. a mobile consumer) as well as a single version of another consumer (eg. an API consumer). See examples below.

* `fallbackTag`: If a pact for the specified `tag` does not exist, then use this tag as a fallback. This is useful for co-ordinating development between consumer and provider teams when matching branch names are used.

## Deduplication

The Pact Broker API for retriving pacts by selectors deduplicates the pacts based on their *content*. This means that if the same content was published in multiple selected pacts, the verification for that content will only need to run once. This is quite common when there hasn't been a change to a pact for a while, and the same pact content is present in development, test and production pacts.

## Examples

### Verifing the latest development, test and master pacts

This is the most common use case.

<!--DOCUSAURUS_CODE_TABS-->
<!-- Javascript -->

```javascript
const verificationOptions = {
  ...,
  consumerVersionSelectors: [
    {
      tag: "master",
      latest: true
    },
    {
      tag: "test",
      latest: true
    },
    {
      tag: "production",
      latest: true
    }
  ]
}
```

<!--END_DOCUSAURUS_CODE_TABS-->

### Using a fallback tag for coordinated branch development

Dynamically determine the current branch of the provider, see if there is a matching pact for that branch, fallback to the `master` pact if none exists.

<!--DOCUSAURUS_CODE_TABS-->
<!-- Javascript -->
```javascript
const verificationOptions = {
  ...,
  consumerVersionSelectors: [
    {
      tag: process.env.GIT_BRANCH,
      fallbackTag: "master",
      latest: true
    },
    {
      tag: "test",
      latest: true
    },
    {
      tag: "production",
      latest: true
    }
  ]
}
```
<!--END_DOCUSAURUS_CODE_TABS-->

### Verifying a pacts where the consumer is a mobile application

Verify the pacts for the latest `master` and `test` versions, and all `production` versions of "my-mobile-consumer".

<!--DOCUSAURUS_CODE_TABS-->
<!-- Javascript -->
```javascript
const verificationOptions = {
  ...,
  consumerVersionSelectors: [
    {
      tag: "master",
      latest: true
    },
    {
      tag: "test",
      latest: true
    },
    {
      tag: "production"
    }
  ]
}
```
<!--END_DOCUSAURUS_CODE_TABS-->

### Verifying a pacts where one consumer is a mobile application

Verify the latest `production` version of all consumers, and all `production` versions of "my-mobile-consumer". Note that the pacts are [deduplicated](#deduplication), so despite being included by 2 selectors, the verification of the latest production pact for "my-mobile-consumer" will only run once.

<!--DOCUSAURUS_CODE_TABS-->
<!-- Javascript -->

```javascript
const verificationOptions = {
  ...,
  consumerVersionSelectors: [
    {
      tag: "master",
      latest: true
    },
    {
      tag: "test",
      latest: true
    },
    {
      tag: "production",
      latest: true
    },
    {
      tag: "production",
      consumer: "my-mobile-consumer"
    }
  ]
}

```
<!--END_DOCUSAURUS_CODE_TABS-->

### Verifying the overall latest pact for each consumer

This is syntatically possible, but not recommended, as pacts for different branches of the consumer may overwrite each other as the current latest.

<!--DOCUSAURUS_CODE_TABS-->
<!-- Javascript -->

```javascript
const verificationOptions = {
  ...,
  consumerVersionSelectors: [
    {
      latest: true
    }
  ]
}
```
<!--END_DOCUSAURUS_CODE_TABS-->
