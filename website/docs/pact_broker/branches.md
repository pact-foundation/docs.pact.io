---
title: Branches
---

From version 2.82.0 onwards, the Pact Broker supports repository branches as a first class concept. Previously, users were recommended to use version [tags](/pact_broker/tags) to represent the branch with which a particular pacticipant version was associated. Adding explict support for branches allows the Pact Broker to provide simpler documentation, better messaging and sensible defaults.

## Domain model

Branches in the Pact Broker are designed to model repository (git, svn etc) branches. A `branch` in the Pact Broker belongs to a `pacticipant` (application). A `branch` may have many `pacticipant versions`, and a `pacticipant version` may belong to many branches (but typically, it will belong to just one). 

Remember that a `pacticipant version` in the Pact Broker should map 1:1 to a commit in your repository. To facilitate this, the version number used to publish pacts and verification results should either [_be_ or _contain_ the commit](/getting_started/versioning_in_the_pact_broker#guidelines).

## When are branches created?

Branches are automatically created and associated with a pacticipant version when pacts and verification results are published. Check the support section to see if your Pact library supports this feature yet.

## When are branches used?

Branches are used to identify which pacts a provider should verify using [consumer version selectors](/pact_broker/advanced_topics/consumer_version_selectors). Typically, the provider should be configured to verify the pacts belonging to the main branch of each consumer (amongst others - read more [here](/provider/recommended_configuration#verification-triggered-by-provider-change)). 

## Automatic branch creation from first tag

To assist in the migration from tags to branches, the Pact Broker from 2.82.0 supports the configuration option [`use_first_tag_as_branch`](/pact_broker/configuration/settings#use_first_tag_as_branch). When set to `true`, the first tag applied to a pacticipant version (within a given timeframe) will be inferred to be the branch. To disable this, set `use_first_tag_as_branch` to `false`.

## Pacticipant main branch property

From version 2.82.0 onwards, the `pacticipant` resource supports a `mainBranch` property. This property is used to identify which versions to display first in the UI, and the branch for which a build should be run when the `contract_requiring_verification_published` webhook is triggered.

### Automatic main branch detection

To assist in the migration from tags to branches, the main branch will be automatically set for a pacticipant if a version is created with a branch or tag name matching one of `develop`, `main`, or `master`. 

The main branch candidate names are [configurable](/pact_broker/configuration/settings#main_branch_candidates). To disable the automatic setting of the main branch, set [`auto_detect_main_branch`](/pact_broker/configuration/settings#auto_detect_main_branch) to `false`.

### Setting the main branch manually

To explicitly set the main branch of a pacticipant, use the Pact Broker Client [`create-or-update-pacticipant`](/pact_broker/client_cli/readme/#create-or-update-pacticipant) command.

```shell
pact-broker create-or-update-pacticipant --name Foo --main-branch dev
```

## Support

Support for publishing pacts and verification results with branches is currently (late 2021) being rolled out across the Pact client libraries.

* Pact Ruby - v1.59.0
* Ruby Dockerized pact-provider-verifier - v1.36.0
* Pact JS - unsupported
* Pact Go - unsupported
* Pact Rust - unsupported
* Pact JVM - unsupported
* Pact NET - unsupported
* Pact Python - unsupported
* Pact Scala - unsupported
* Pact4s - unsupported
* Pact PHP - unsupported
