---
title: Deleting Branches Automatically
author: Yousaf Nabi
authorURL: http://twitter.com/you54f
tags: [features, tags, branches, deployments, releases]
keywords: [features, tags, branches, deployments, releases]
date: 2024-02-21
draft: false
hide_table_of_contents: true
---

:::info tl&semi;dr

Call the delete-branch endpoint via an API or our CLI tools, when a branch is deleted in your CI systems. Most CI systems provide event triggers which can be used to detect branch deletion events.

:::

Back in 2021, the Pact Broker introduced the concepts of Branches and environments, rather than overloading tags, for both purposes. This came with a raft of benefits, described in this post.

We've seen rafts of you switch over to the new state of Pact Nirvana, utilizing branches and environments, to their full effect and today I'd like to share a little tip, to help keep your Pact Broker working at it's optimum.

It is important to have good hygiene in your Pact Broker, ensuring that when you remove applications, branches, or environments from your systems, you reflect the same within your broker, especially if you are deeply reliant on the can-i-deploy matrixes output.

Removing stale branches is one of the easiest, and yet most overlooked areas of these, so I'm going to show you a couple of different techniques you can use.

### Methods

## API

Removes a branch, from a pacticipant version. Does not delete the actual pacticipant version.

Send a `DELETE` request to the branch version resource.

    curl -XDELETE http://broker/pacticipants/$application_name/branches/$BRANCH

## Pact CLI

    pact-broker delete-branch \
      --pacticipant "$application_name" \
      --branch "$BRANCH" \
      --no-error-when-not-found

### Example

#### GitHub Actions


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
            --pacticipant "$application_name" \
            --branch "${{ github.event.ref }}" \
            --no-error-when-not-found
        env:
          PACT_BROKER_BASE_URL: "https://your-broker-url"
          PACT_BROKER_USERNAME: ${{ secrets.PACT_BROKER_USERNAME }}
          PACT_BROKER_PASSWORD: ${{ secrets.PACT_BROKER_PASSWORD }}

```

Go forth and delete all the things!