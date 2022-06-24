---
title: Publishing and retrieving pacts
---

## Publishing

### Publish using CLI tools

The recommended way to publish pacts is to use the [CLI tools](/pact_broker/client_cli):

```text
pact-broker publish /path/to/pacts/consumer-provider.json --consumer-app-version 1.0.0 --branch main --broker-base-url https://test.pactflow.io --broker-token SomeToken
```

### Publish using HTTP Requests

While we recommend using the CLI wherever possible, you can publish directly to the API. The documentation for the endpoint is [here](https://github.com/pact-foundation/pact_broker/blob/master/lib/pact_broker/doc/views/index/publish-contracts.markdown).

Please read about [Pacticipant version numbers](pacticipant_version_numbers.md) to ensure you are using the correct format.

## Retrieving

Pacts are generally retrieved for verification by specifying [consumer version selectors](/pact_broker/advanced_topics/consumer_version_selectors), or via a URL passed to a provider verification build via a [webhook](/pact_broker/webhooks). You should not need to manually construct a pact URL in the recommended workflows, however, the documentation below is kept for posterity.

### Latest pact for a provider and consumer

If you are using an older broker, note that the "latest" pact may be determined by inspecting the consumer version number of the pact according to semantic versioning rules, not by the timestamp.

The following URL will return the latest pact between a specified consumer and provider. Keep reading however, as it is not necessarily the URL you should use for retrieving the pact to verify.

```text
http://your-pact-broker/pacts/provider/PROVIDER/consumer/CONSUMER/latest
```

The `latest` endpoint returns the latest pact, _regardless of tags_. If you want to [use tagging](/pact_broker/tags) to enable you to effectively make "feature branch pacts" \(RECOMMENDED!\), then you should use one of the following two URLs to retrieve the "latest" pact for verification.

To retrieve the latest pact for a given tag \(eg.`master`, `prod` or `feature-x`\), use:

```text
http://your-pact-broker/pacts/provider/PROVIDER/consumer/CONSUMER/latest/TAG
```

To retrieve the latest pact without any tags, use:

```text
http://your-pact-broker/pacts/provider/PROVIDER/consumer/CONSUMER/latest-untagged
```

### Latest pacts for a provider

```text
http://your-pact-broker/pacts/provider/PROVIDER/latest
```

### All latest pacts

```text
http://your-pact-broker/pacts/latest
```

Use the built in HAL Browser at `/hal-browser/browser.html` to explore more endpoints in the pact broker.

