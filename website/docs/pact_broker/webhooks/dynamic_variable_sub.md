---
title: Dynamic variable substitution
---

## Dynamic variable substitution

Webhooks support Dynamic variable substitution with placeholders so you can support contextual information for your builds and notifications.

The following variables may be used in the request path, parameters or body, and will be replaced with their appropriate values at runtime.

* `${pactbroker.consumerName}`: the consumer name
* `${pactbroker.providerName}`: the provider name
* `${pactbroker.consumerVersionNumber}`: the version number of the most recent consumer version associated with the pact content.
* `${pactbroker.providerVersionNumber}`: the provider version number for the verification result
* `${pactbroker.consumerVersionTags}`: the list of tag names for the most recent consumer version associated with the pact content, separated by ", ".
* `${pactbroker.providerVersionTags}`: the list of tag names for the provider version associated with the verification result, separated by ", ".
* `${pactbroker.consumerVersionBranch}`: the name of the branch for most recent consumer version associated with the pact content.
* `${pactbroker.providerVersionBranch}`: the name of the branch for the provider version associated with the verification result.
* `${pactbroker.consumerLabels}`: the list of labels for the consumer associated with the pact content, separated by ", ".
* `${pactbroker.providerLabels}`: the list of labels for the provider associated with the pact content, separated by ", ".
* `${pactbroker.githubVerificationStatus}`: the verification status using the correct keywords for posting to the the [Github commit status API](https://developer.github.com/v3/repos/statuses).
* `${pactbroker.bitbucketVerificationStatus}`: the verification status using the correct keywords for posting to the the [Bitbucket commit status API](https://developer.atlassian.com/server/bitbucket/how-tos/updating-build-status-for-commits/).
* `${pactbroker.pactUrl}`: the "permalink" URL to the newly published pact \(the URL specifying the consumer version URL, rather than the "/latest" format.\)
* `${pactbroker.verificationResultUrl}`: the URL to the relevant verification result.

Example usage:

```text
{
  "events": [{
    "name": "contract_content_changed"
  }],
  "request": {
    "method": "POST",
    "url": "http://example.org/something",
    "body": {
      "thisPactWasPublished" : "${pactbroker.pactUrl}"
    }
  }
}
```
