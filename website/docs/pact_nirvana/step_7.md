---
title: Diamond level
sidebar_label: 7. Diamond - Add Pact to your deploy pipelines
---

It's all very well knowing that your consumer/provider are compatible with the head versions of each other, but if you want to be able to deploy your consumer and provider independently, you also need to be sure that the latest version of the provider is compatible with the production version of the consumer. The ability to do this is a major selling point of Pact.

Tags allow you ensure backwards compatibility between production and head versions of your applications by allowing the provider to verify the pact associated with the latest production version as well as the latest master version. This enables the safe deployment workflow described in step 6.

Before you deploy to a production environment, you need to know whether or not your app is compatible with the versions of the other apps that already exist in that environment. The old-fashioned way of managing these dependencies involved deploying sets of pre-tested applications together, creating a bottleneck and meaning that speedy development and testing on one application may be negated by slow development and testing on another.

The Pact way of managing these dependencies is to use the Pact Matrix - this is the matrix generated when you create a table of all the consumer and provider versions that have been tested against each other using Pact. You can view the Pact Matrix for any pair of applications by opening `/matrix/provider/PROVIDER/consumer/CONSUMER` in your Pact Broker.

<details open>
  <summary>Pact matrix</summary>

![Pact matrix](/img/pact-matrix.png)
</details>

One very important thing to note is that a verification is associated with the pact _content_ itself, not with a specific consumer version. This means that if a pact does not change between publications, any previous verifications are automatically be applied to the new pact publication, effectively “pre-verifying” it. \(For this reason, it is best not to use any random data in a pact, as this will cause the broker to consider it a new revision of the pact.\) Linking a verification to the pact content rather than to the application version also means that we can do a “cartesian join” of pacts/verifications, resulting in many more "compatible" versions than would otherwise be the case.

The way you check if you are safe to deploy is to determine if there is a row in the matrix that contains the version of the application you’re about to deploy and the version of the other application that already exists in that environment. You can do this with the [`can-i-deploy`](/pact_broker/can_i_deploy/) tool, which will be described in more detail below.

The need for this check increases proportionately with the time that elapses between your pact test execution and your release. If you practice continuous deployment, and you go straight from a test build into a production deployment build, then you can be pretty sure that the version of the other application that is in production probably hasn’t changed in the meantime. If there is a considerable amount of time, however, it is best to do a compatibility check again just before deploying.

For example, if you run a pact verification on Monday that verifies the recommended "master" and "production" pacts, but you don’t deploy the provider artifact until Friday, the version of the consumer that is now in production may have changed.

Alternatively, a pact may have been verified by the “master” version of the provider, but that version of the provider may not yet have been deployed to production. The consumer cannot be deployed to production until the version of the provider that it depends on is in production \(unless it has been specifically written to fail gracefully, which is actually the best approach, but is one that isn’t always followed\).

Another reason that an extra "safe to deploy?" check is required (as well as the verification tests themselves) is that when the [pending feature](/pact_broker/advanced_topics/pending_pacts/) is enabled to ensure that newly changed pacts do not break the provider build, the build will not necessarily be breaking any more to let you know of an incompatibility.

The `can-i-deploy` tool is a CLI that has been written to query the Matrix to ensure that you are safe to deploy. You can read a detailed description of how it works [here](/pact_broker/can_i_deploy/).


## Lets tag on deploy!

Now we're ready to tag pacts when we deploy, and switch `can-i-deploy` to use environment names rather than branch names.

<details open>
  <summary>Diamond level diagram</summary>

![Diamond level diagram](images/diamond.png)
</details>

Note how in the PR pipeline we are checking to see if we can deploy to all the environments that we deploy to from 
the main branch. The rationale for this is that we don't want to merge something into our main branch which we know 
will break once we deploy - we want our main branch to stay clean and not get blocked by broken builds.  If you 
deploy to other environments such as preprod, you would want to check that environment as well.

Then, when we're actually ready to deploy to an environment, we check again. We do this because the version of the 
other side of the contract could have changed since the PR validation ran.  Doing the check in the PR pipeline 
reduces the chance of breakage, but it's still a possibility, and we want to check for that before we deploy.

Note also that the first step in our commit pipeline is to let the broker know that a particular version of the 
provider or consumer is now in the main branch.

### Add tagging to your commit pipelines

The first step is to start tagging when the consumer or provider is deployed to an environment. So when you successfully 
deploy to staging, apply the staging tag; when you successfully deploy to prod, apply the prod tag. Do this for each 
environment you deploy to. 

1. Add a step to your deployment process so that when the consumer is deployed to an environment, the relevant pacticipant version in the broker is tagged with the name of the environment (eg. `test`, `production`). This functionality is provided by the [pact broker CLI](/pact_broker/client_cli/readme#create-version-tag) which is available as a standalone executable, and a Docker image. Alternatively you can use the API for tagging directly, with documentation available [here](https://docs.pact.io/pact_broker/tags).
2. Add the new tag names to the list of pacts the provider will verify (eg. `{ consumerVersionSelectors: { tag: "main", latest: true }, { tag: "test", latest: true }, { tag: "production", latest: true } }`).
3. Make sure that you use the same agreed upon names for each environment for all subsequent applications. (eg. is it `prod` or is it `production`?) Having a mix of environment names will not allow you to successfully use the `can-i-deploy` tool to ensure safe deployments.
   
### Add can-i-deploy to your commit pipelines

Once you have successfully run your pipeline with the tagging, you can safely add `can-i-deploy` checks before you 
deploy to an environment, to make sure it's safe to deploy.

### Add can-i-deploy to environments to your PR pipelines

The final step is to make sure before you merge a PR that you can successfully deploy to all the environments that are 
targeted from the main branch (staging, prod, preprod, etc.)

### What if we use a release branch?

If you use a release branch, then you do not deploy to prod and preprod from your main branch, so you can eliminate 
that check on the PR pipeline.

However, before you cut a release branch, you want to check if you can deploy to preprod and prod.

The general idea is:

- check if you can deploy to an environment before you commit a change to the branch it is deployed from
- check again if you can deploy to an environment just before you actually deploy to that environment.

It might look something like this:

<details open>
  <summary>Diamond with release branch diagram</summary>

![Diamond with release branch diagram](images/diamond-release.png)
</details>

### Modify can-i-deploy in your consumer and provider PR validation pipelines

Now that you are tagging your provider with the environment it is deployed to, you can modify your PR pipeline to 
ask if you can deploy to the environment tag, rather than to the main branch tag.

Congratulations! You have fully operationalized Pact!


Useful links:

* [Checking verification results using the can-i-deploy CLI](/pact_broker/can_i_deploy/)
* [can-i-deploy CLI documentation](/pact_broker/client_cli/readme#can-i-deploy)