---
title: Publishing Pact verification statuses to Github
author: Beth Skurrie
authorURL: http://twitter.com/bethesque
tags: [verification]
keywords: [verification]
date: 2018-10-18
draft: false
hide_table_of_contents: true
---

If you're using Travis CI, Code Climate, or one of many other CI tools with Github, you've probably noticed the little checklist of items that shows just above the "merge" button when you open a pull request. 

![commit-statuses](https://s3-ap-southeast-2.amazonaws.com/blog-pact-io/2018/07/commit-statuses.png)

These are called commit "statuses", and there is a [Github API][github-api] for reporting these (Gitlab also has a similar [API][gitlab-api]). If you are using a git sha for the [consumer version number][pacticipant-version-numbers] when you publish your pacts, you can now use Pact Broker webhooks to report the verification statuses of your pacts back to Github.

To do this, open up your Pact Broker API Browser, and click on the `NON-GET` button next to the `pb:webhooks` relation. Modify the JSON below to match your consumer, repository and Github auth details (we recommend you make a separate [token][github-token] for this purpose with the `repo:status` grant), and click `Make Request`.

```json
{
  "consumer": {
    "name": "<consumer name>"
  },
  "events": [
    {
      "name": "contract_published"
    },
    {
      "name": "provider_verification_published"
    }
  ],
  "request": {
    "method": "POST",
    "url": "https://api.github.com/repos/<organization>/<project>/statuses/${pactbroker.consumerVersionNumber}",
    "headers": {
      "Content-Type": "application/json"
    },
    "body": {
      "state": "${pactbroker.githubVerificationStatus}",
      "description": "Pact Verification Tests ${pactbroker.providerVersionTags}",
      "context": "${pactbroker.providerName}",
      "target_url": "${pactbroker.verificationResultUrl}"
    },
    "username": "USERNAME",
    "password": "PASSWORD"
  }
}

```

If all your consumer names match their repository names in Github, you can make this a global webhook by removing the `consumer` node, and replacing the hardcoded `<project>` name in the URL with the parameter `${pactbroker.consumerName}`.

Want to use this cool feature? You'll need version [2.47.1][pact-broker-release] or later of the Pact Broker.

Check out the [webhook template library][webhook-template-library] for more handy webhooks.

[gitlab-api]: https://docs.gitlab.com/ee/api/commits.html#post-the-build-status-to-a-commit
[github-api]: https://developer.github.com/v3/repos/statuses/
[pacticipant-version-numbers]: https://github.com/pact-foundation/pact_broker/wiki/Pacticipant-version-numbers
[github-token]: https://help.github.com/articles/creating-a-personal-access-token-for-the-command-line/
[pact-broker-release]: https://github.com/pact-foundation/pact_broker/releases/tag/v2.47.1
[webhook-template-library]: https://github.com/pact-foundation/pact_broker/wiki/Webhook-template-library

