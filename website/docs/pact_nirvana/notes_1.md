---
title: Setting up a Pact in a "universal" CI/CD pipeline
sidebar_label: Notes - Setting up a Pact in a "universal" CI/CD pipeline
---

Some organizations have standard CI/CD pipelines that all projects use to release. In this situation, it can be tricky to introduce the verification/can-i-deploy steps because some applications will be using Pact and some won't. `can-i-deploy` will return an error if you try to use it to deploy an application version that it does not know about, and (depending on the configuration options avialable in that language) the verification step may also fail if there are no pacts to verify.

If you are using a shared standard pipeline, the easiest way to make sure every application can be deployed without having to do checks to determine if Pact is or isn't being used for this particular application is to register every application version in the Pact Broker at the start of the pipeline, using the [create-version-tag](https://docs.pact.io/pact_broker/client_cli/readme/#create-version-tag) command from the Pact Broker Client CLI. You will need to use the `--auto-create-version` flag and set the tag name to the name of the branch.

eg.

```
pact-broker create-version-tag --pacticipant ${APPLICATION_NAME} --version ${GIT_SHA} --tag ${GIT_BRANCH} --auto-create-version
```

There is no CLI yet for creating a version with a branch (it will be coming soon), but the branch version resource can be created using the [Pact Broker API directly](https://github.com/pact-foundation/pact_broker/blob/master/lib/pact_broker/doc/views/index/pacticipant-branch-version.markdown).

If you want to pre-create the "pact changed" webhook for providers so that the first time a consumer publishes a pact, the webhook is immediately triggered, you can use the following commands in your pipeline.

```
# ensure the pacticipant exists before creating a webhook for it
pact-broker create-or-update-pacticipant --name PACTICIPANT_NAME
pact-broker create-or-update-webhook --uuid UUID ...
```

See docs for `create-or-update-webhook` [here](https://docs.pact.io/pact_broker/client_cli/readme/#create-or-update-webhook).