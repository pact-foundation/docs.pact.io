---
title: Provider verification badges
---

_See the the_ [_Badges_](/pact_broker/configuration/features#badges) _section of the configuration page for information about accessing the badges._

If you are publishing [Provider verification results](provider_verification_results.md) to your Pact Broker \(v2.3.0+\), you can also display the verification status in your READMEs using a shiny badge like this one:

[![Pact Status](https://test.pactflow.io/pacticipants/pactflow-example-consumer/branches/master/latest-version/can-i-deploy/to-environment/prod/badge)](https://test.pactflow.io/pacticipants/pactflow-example-consumer/branches/master/latest-version/can-i-deploy/to-environment/production)

For mergability checks for branches, use the can-i-merge badge. For deployability checks for environments, use the can-i-deploy badge.

## Can I Deploy badge

[![Can I Deploy Status](/img/can-i-deploy-badge.svg)](https://test.pactflow.io)

### Using branches and environments

Requires version 2.94+ of the Pact Broker

Returns a status badge that can be displayed in a README file that indicates whether the latest version of a pacticipant from a particular branch can be deployed to the specified environment.

[![Can I Deploy BRANCH to ENVIRONMENT](https://test.pactflow.io/pacticipants/pactflow-example-consumer/branches/master/latest-version/can-i-deploy/to-environment/prod/badge)](https://test.pactflow.io/pacticipants/pactflow-example-consumer/branches/master/latest-version/can-i-deploy/to-environment/production)

```text
[![Can I Deploy BRANCH to ENVIRONMENT](https://your-broker/pacticipants/PACTICIPANT/branches/BRANCH/latest-version/can-i-deploy/to-environment/ENVIRONMENT/badge)](https://your-broker/hal-browser/browser.html#https://your-broker/pacticipants/PACTICIPANT/branches/BRANCH/latest-version/can-i-deploy/to-environment/ENVIRONMENT)
```

To set a custom label for the badge, set the `label` query parameter. eg `?label=my+custom+label+here`.

### Using tags

Requires version 2.62+ of the Pact Broker.

Returns a status badge that can be displayed in a README file that indicates whether the latest version of a pacticipant with a specified tag can be deployed to the specified environment as identified by a tag.

[![Can I deploy Foo status](https://test.pactflow.io/pacticipants/pactflow-example-consumer/latest-version/prod/can-i-deploy/to/production/badge)](https://test.pactflow.io/pacticipants/pactflow-example-consumer/latest-version/prod/can-i-deploy/to/production)

```text
[![Can I deploy Foo status](https://your-broker/pacticipants/PACTICIPANT/latest-version/TAG/can-i-deploy/to/ENVIRIONMENT_TAG/badge)](https://your-broker/pacticipants/PACTICIPANT/latest-version/TAG/can-i-deploy/to/ENVIRIONMENT_TAG)
```

[![Can I deploy Foo status](https://test.pactflow.io/pacticipants/pactflow-example-consumer/latest-version/prod/can-i-deploy/to/production/badge?label=my+custom+label+here)](https://test.pactflow.io/pacticipants/pactflow-example-consumer/latest-version/prod/can-i-deploy/to/production)

To set a custom label for the badge, set the `label` query parameter. eg `?label=my+custom+label+here`.

## Can I Merge badge

[![Can I Merge Status](/img/can-i-merge-badge.svg)](https://test.pactflow.io)

Requires version 2.111.0+ of the Pact Broker

Returns a status badge that can be displayed in a README file that indicates whether the latest version associated with main branch of the specified pacticipant is compatible with the configured main branch of each of the pacticipants with which it is integrated.

[![Can I Merge](https://test.pactflow.io/pacticipants/pactflow-example-consumer/main-branch/can-i-merge/badge)](https://test.pactflow.io/pacticipants/pactflow-example-consumer/main-branch/can-i-merge/badge)

```text
[![Can I Merge](https://test.pactflow.io/pacticipants/pactflow-example-consumer/main-branch/can-i-merge/badge)](https://your-broker/hal-browser/browser.html#https://your-broker/pacticipants/PACTICIPANT/main-branch/can-i-merge/badge)
```

To set a custom label for the badge, set the `label` query parameter. eg `?label=my+custom+label+here`.

## Specific consumer/provider badge

### Quick start

To get your badge, open the HTML version of your `/latest`, `/latest/TAG` or `/latest-untagged` pact in the Pact Broker by copy/pasting its URL into your browser location bar. Your badge will be shown in the top right of the page. When you click on it, a text box will appear with the markdown to include in your README.

### Advanced usage

#### Without tags, or with only Consumer tags.

The URL of the badge is the URL of the latest pact with `/badge.svg` appended, and it works for the `/latest/TAG` and `/latest-untagged` pact URLs as well

* Latest pact badge: `https://your-broker/pacts/provider/PROVIDER/consumer/CONSUMER/latest/badge.svg`
* Latest tagged pact badge: `https://your-broker/pacts/provider/PROVIDER/consumer/CONSUMER/latest/TAG/badge.svg`
* Latest un-tagged pact badge: `https://your-broker/pacts/provider/PROVIDER/consumer/CONSUMER/latest-untagged/badge.svg`\)

The markdown to include in your README is as follows:

[![Foo/Bar Pact Status](https://test.pactflow.io/pacts/provider/ProductService/consumer/pactflow-example-consumer/latest/badge.svg)](https://test.pactflow.io/pacts/provider/ProductService/consumer/pactflow-example-consumer/latest)

```text
[![Foo/Bar Pact Status](https://your-broker/pacts/provider/PROVIDER/consumer/CONSUMER/latest/badge.svg)](https://your-broker)
```

For example:

```text
[![Foo/Bar Pact Status](https://test.pactflow.io/pacts/provider/ProductService/consumer/pactflow-example-consumer/latest/badge.svg)](https://test.pactflow.io/pacts/provider/ProductService/consumer/pactflow-example-consumer/latest)
```

#### With consumer and provider tags

_Available in version v2.13.0+ of the Pact Broker gem._

If you are using tags for both the consumer and provider versions \(this is recommended by the way!\) the badge URL will be a little different. The format is:

`/matrix/provider/PROVIDER/latest/PROVIDER_TAG/consumer/CONSUMER/latest/CONSUMER_TAG/badge`

### Options

[![Pact Status](https://test.pactflow.io/pacts/provider/ProductService/consumer/pactflow-example-consumer/latest/badge.svg)](https://test.pactflow.io/pacts/provider/ProductService/consumer/pactflow-example-consumer/latest)

If your consumer and provider name make your badge too long to be aesthetically pleasing, you can shorten it in the following ways.

* Show just the consumer or provider name by adding `?label=consumer` or `?label=provider` to the end of the URL.

  [![Pact Status](https://test.pactflow.io/pacts/provider/ProductService/consumer/pactflow-example-consumer/latest/badge.svg?label=consumer)](https://test.pactflow.io/pacts/provider/ProductService/consumer/pactflow-example-consumer/latest)

* Use the pacticipant's initials by adding `?initials=true`

  [![Pact Status](https://test.pactflow.io/pacts/provider/ProductService/consumer/pactflow-example-consumer/latest/badge.svg?initials=true)](https://test.pactflow.io/pacts/provider/ProductService/consumer/pactflow-example-consumer/latest)

* Use both the `label` and the `initials` params to show only the initials of the consumer or provider.

  [![Pact Status](https://test.pactflow.io/pacts/provider/ProductService/consumer/pactflow-example-consumer/latest/badge.svg?initials=true&label=consumer)](https://test.pactflow.io/pacts/provider/ProductService/consumer/pactflow-example-consumer/latest)

