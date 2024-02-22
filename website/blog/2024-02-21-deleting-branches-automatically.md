---
title: Deleting Branches Automatically
author: Yousaf Nabi
authorURL: http://twitter.com/you54f
tags: [features, tags, branches, deployments, releases]
keywords: [features, tags, branches, deployments, releases]
date: 2024-02-21
draft: false
hide_table_of_contents: false
---

:::info tl&semi;dr

Call one of the following when a branch is deleted in your CI systems to improve your Pact Broker performance.

- Pact CLI's `pact-broker delete-branch` command
- Pact Broker's API endpoint `http://broker/pacticipants/$APPLICATION_NAME/branches/$BRANCH` 



Most CI systems provide event triggers which can be used to detect branch deletion events.
:::

Back in 2021, the Pact Broker introduced the concepts of Branches and environments, rather than overloading tags, for both purposes. This came with a range of benefits, described in [this post](https://docs.pact.io/blog/2021/07/04/why-we-are-getting-rid-of-tags).

We've seen rafts of you switch over to the new state of [Pact Nirvana](https://docs.pact.io/pact_nirvana), utilizing branches and environments, to their full effect and today I'd like to share a little tip, to help keep your Pact Broker working at it's optimum.

It is important to have good hygiene in your Pact Broker, ensuring that when you remove applications, branches, or environments from your version control system (github/bitbucket etc), you reflect the same within your broker.

Doing so, will improve performance when fetching pacts for verification and is highly recommended if you are deeply reliant on the can-i-deploy matrix's output, to keep query times as low as possible.

Removing stale branches is one of the easiest, and yet most overlooked areas of these, so I'm going to show you a couple of different techniques you can use.

## Delete Branch Methods

Removes a branch from a pacticipant version. Does not delete the actual pacticipant version.

### API

Send a `DELETE` request to the branch version resource.

#### Pact Broker - No Auth - Delete Branch

    curl -X DELETE $PACT_BROKER_BASE_URL/pacticipants/$APPLICATION_NAME/branches/$BRANCH

#### Pact Broker - Basic Auth - Delete Branch

    curl --user $PACT_BROKER_USERNAME:$PACT_BROKER_PASSWORD \
      -X DELETE $PACT_BROKER_BASE_URL/pacticipants/$APPLICATION_NAME/branches/$BRANCH

#### PactFlow Broker - Bearer Auth - Delete Branch

    curl -H "Authorization: Bearer $PACT_BROKER_TOKEN" \
      -X DELETE $PACT_BROKER_BASE_URL/pacticipants/$APPLICATION_NAME/branches/$BRANCH

_Note:_

If you want to check if your Pact Broker has support for the above relation, you can call the Pact Broker index, and check for the existence of `_links."pb:pacticipant-branch"`

#### Pact Broker - No Auth - Index

    curl $PACT_BROKER_BASE_URL \
      | jq '._links."pb:pacticipant-branch"'

#### Pact Broker - Basic Auth - Index

    curl --user $PACT_BROKER_USERNAME:$PACT_BROKER_PASSWORD $PACT_BROKER_BASE_URL \
      | jq '._links."pb:pacticipant-branch"'

#### PactFlow Broker - Bearer Auth - Index

    curl -H "Authorization: Bearer $PACT_BROKER_TOKEN" $PACT_BROKER_BASE_URL \
      | jq '._links."pb:pacticipant-branch"'

### Pact CLI

    pact-broker delete-branch \
      --pacticipant "$APPLICATION_NAME" \
      --branch "$BRANCH" \
      --no-error-when-not-found

_Note:_

The Pact CLI is `PACT_BROKER_*` environment variable aware, so if you have your Basic Auth `PACT_BROKER_USERNAME`/`PACT_BROKER_PASSWORD`, or Bearer Auth `PACT_BROKER_TOKEN` environment variables set, the CLI will pick them up.

In our example above, `PACT_BROKER_BASE_URL` is set in our shell prior to executing.

You can explicitly set those values with

    -b, --broker-base-url=BROKER_BASE_URL
                # The base URL of the Pact Broker
    -u, [--broker-username=BROKER_USERNAME]
                # Pact Broker basic auth username
    -p, [--broker-password=BROKER_PASSWORD]
                # Pact Broker basic auth password
    -k, [--broker-token=BROKER_TOKEN]
                # Pact Broker bearer token

## Example

### GitHub Actions

```yaml
name: Delete application branch in a Pact Broker

on:
  delete:
    branches:
      - "*"

jobs:
  delete-branch-in-pact-broker:
    name: delete
    runs-on: ubuntu-latest

    steps:
      - name: Install Pact CLI
        run: |
          curl -fsSL https://raw.githubusercontent.com/pact-foundation/pact-ruby-standalone/master/install.sh | sh
          echo "PATH=${PATH}:${PWD}/pact/bin/" >>$GITHUB_ENV

      - name: Delete branch
        run: |
          pact-broker delete-branch \
            --pacticipant "$APPLICATION_NAME" \
            --branch "${{ github.event.ref }}" \
            --no-error-when-not-found
        env:
          PACT_BROKER_BASE_URL: "https://your-broker-url"
          PACT_BROKER_USERNAME: ${{ secrets.PACT_BROKER_USERNAME }}
          PACT_BROKER_PASSWORD: ${{ secrets.PACT_BROKER_PASSWORD }}
          APPLICATION_NAME: 'example-consumer'

```

Go forth and delete all the things!