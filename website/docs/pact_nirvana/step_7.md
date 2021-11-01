---
title: 7. Use The Pact "Matrix" as a gateway to deployments
---

Before you deploy to a production environment, you need to know whether or not your app is compatible with the versions of the other apps that already exist in that environment. The old-fashioned way of managing these dependencies involved deploying sets of pre-tested applications together, creating a bottleneck and meaning that speedy development and testing on one application may be negated by slow development and testing on another.

The Pact way of managing these dependencies is to use the Pact Matrix - this is the matrix generated when you create a table of all the consumer and provider versions that have been tested against each other using Pact. You can view the Pact Matrix for any pair of applications by opening `/matrix/provider/PROVIDER/consumer/CONSUMER` in your Pact Broker.

![Pact matrix](/img/pact-matrix.png)

One very important thing to note is that a verification is associated with the pact _content_ itself, not with a specific consumer version. This means that if a pact does not change between publications, any previous verifications are automatically be applied to the new pact publication, effectively “pre-verifying” it. \(For this reason, it is best not to use any random data in a pact, as this will cause the broker to consider it a new revision of the pact.\) Linking a verification to the pact content rather than to the application version also means that we can do a “cartesian join” of pacts/verifications, resulting in many more "compatible" versions than would otherwise be the case.

The way you check if you are safe to deploy is to determine if there is a row in the matrix that contains the version of the application you’re about to deploy and the version of the other application that already exists in that environment. You can do this with the [`can-i-deploy`](/pact_broker/can_i_deploy/) tool, which will be described in more detail below.

The need for this check increases proportionately with the time that elapses between your pact test execution and your release. If you practice continuous deployment, and you go straight from a test build into a production deployment build, then you can be pretty sure that the version of the other application that is in production probably hasn’t changed in the meantime. If there is a considerable amount of time, however, it is best to do a compatibility check again just before deploying.

For example, if you run a pact verification on Monday that verifies the recommended "master" and "production" pacts, but you don’t deploy the provider artifact until Friday, the version of the consumer that is now in production may have changed.

Alternatively, a pact may have been verified by the “master” version of the provider, but that version of the provider may not yet have been deployed to production. The consumer cannot be deployed to production until the version of the provider that it depends on is in production \(unless it has been specifically written to fail gracefully, which is actually the best approach, but is one that isn’t always followed\).

Another reason that an extra "safe to deploy?" check is required (as well as the verification tests themselves) is that when the [pending feature](/pact_broker/advanced_topics/pending_pacts/) is enabled to ensure that newly changed pacts do not break the provider build, the build will not necessarily be breaking any more to let you know of an incompatibility.

The `can-i-deploy` tool is a CLI that has been written to query the Matrix to ensure that you are safe to deploy. You can read a detailed description of how it works [here](/pact_broker/can_i_deploy/).

1. Add a step to your deployment process that uses the `can-i-deploy` tool to ensure that the version that you are about to deploy is compatible with the production versions of its integration partners. 
  * You may wish to start off using the `--dry-run` flag for `can-i-deploy`, which will allow you to see the results, but won't fail your build if there are missing or failed verifications. Once you are confident that your pipeline is working as desired, you can remove the flag, and be confident that you won't be allowed to deploy any incompatible changes to an environment.
3. Add a step to your deployment process so that when the application is deployed to production, the relevant pacticipant version in the broker is tagged as the “production” version. This functionality is provided by the [pact-broker client CLI](/pact_broker/client_cli/readme#create-version-tag)

Useful links:

* [Checking verification results using the can-i-deploy CLI](/pact_broker/can_i_deploy/)
* [can-i-deploy CLI documentation](/pact_broker/client_cli/readme#can-i-deploy)


## Setting up a Pact in a "universal" CI/CD pipeline

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
