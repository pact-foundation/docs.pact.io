---
title: Consumer Version Selectors
---

Consumer version selectors are the (new) way to configure which pacts the provider verifies. Instead of providing a list of tag names, as in the past, a list of `consumer version selectors` is provided which allow a much more flexible and powerful approach to specifying which pacts to verify.

A consumer version selector has the following properties:

* `tag`: the name of the tag which applies to the pacticipant (application) versions of the pacts you want to verify.

* `latest`: whether or not to verify only the pact that belongs to the latest application version. The most common use case is to set this to true. When false, null or ommitted, the pacts that belong to all application versions with the specified tag will be verified. This is to support the scenario when an API has many production versions, and hence pacts (eg. a mobile consumer).

* `consumer`: filter pacts by the specified consumer. This is generally not needed, as the most common use case is to verify pacts for all consumers. It is useful in the scenario when an API has multiple versions of one particular consumer in production (eg. a mobile consumer) as well as a single version of another consumer (eg. an API consumer). This allows a selector with `{ "consumer": "mobile-consumer", "tag": "prod"}` to be configured for the mobile consumer, and `{ "consumer": "api-consumer", "tag": "prod", "latest": true}` for the API consumer.

* `fallbackTag`: If a pact for the specified `tag` does not exist, then use this tag as a fallback. This is useful for co-ordinating development between consumer and provider teams when matching branch names are used.
