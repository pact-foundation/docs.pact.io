---
title: Tags
---

<a name="golden-rule"/>

:::tip
Tags that represent branches and environments, while still supported, have been superseeded by first class support for branches and environments. Please read [this post](/blog/2021/10/08/why-we-are-getting-rid-of-tags) for more information. You'll find links at the bottom of the post to help you migrate from tags to branches and environments.
:::

:::info The Golden Rule for tagging
~~Tag with the branch name when you publish pacts or verification results, and tag with the environment name when you deploy.~~
Now we recommend that you set the [branch](/pact_broker/branches) property when you publish pacts and verification results, and use [record-deployment](/pact_broker/recording_deployments_and_releases#recording-deployments) or [record-release](/pact_broker/recording_deployments_and_releases#recording-releases) when you deploy/release.
:::

To find out what this means, read below!

Tags are simple String values that belong to "pacticipant" version \(that is, application version\) resources in the Pact Broker. They are typically used to provide metadata about a version - the most common use cases being to indicate the git branch of a version \(eg. `master`\) or a stage \(eg `test`, `prod`\).

Pacticipant version tags can be used for multiple purposes.

* Tags can be used to enable you to test consumer and provider `head` and `prod` versions against each other. This allows you to decouple the release cycles of your consumer and provider. Read more about this [here](#ensuring-backwards-compatibility).
* Tags can be used to enable you to add new interactions without breaking all the builds. Read more about this [here](#adding-new-interactions).

Note that the tag is actually placed on the `pacticipant version` resource, not the `pact` itself \(conceptually, you are indicating that that particular version of the application is a "prod" version, or a "feature-x" version\). The URL structures, however, then allow you to retrieve pacts by the tags on their associated versions.

As an example, to tag `Foo` application version `b5236e772` as the production version, do a `PUT` to the resource `/pacticipants/Foo/versions/b5236e772/tags/prod`. All the pacts and verifications associated with `Foo` version `b5236e772` are now considered to be the production pacts/verifications. The pact for provider `Bar` and the latest production version of consumer `Foo` can be retrieved from `/pacts/provider/Bar/consumer/Foo/latest/prod`.

You may have noticed that the URL for a pacticipant version tag starts with `/pacticipants`, not `/consumers` or `/providers`. That is because `consumer` and `provider` are roles that a pacticipant takes in a pact, not identities in themselves. An application may be both a consumer and a provider. 

When you are using tags, you need to ensure that the version numbering scheme you use to identify a "version" cannot give you version that exists on more than one repository branch - don't hard code it. It should either _be_ the git sha \(or equivalent for your repository\), or it should include the git sha as metadata if you are using semantic versioning eg. `1.2.456+405b31ec6`. See [Versioning in the Pact Broker](/getting_started/versioning_in_the_pact_broker) for more information.

### "Latest" pacts

Please note that in the Pact Broker (unlike Docker) the term "latest" is not a tag name itself - it's a dynamic reference to the most recently created resource, like "HEAD" in git. The URL `/pacts/provider/{provider}/consumer/{consumer}/latest` refers to pact for the most recently created pacticipant version. The same URL with `/{tag}` appended refers to the pact for the most recently created pacticipant version that has the specified tag. Some Pact-JVM implementations require you to put the key word "latest" in the list of tags for verification when you want the overall latest pact. This is just an implementation choice of that particular client, and does not mean that there is or should be a tag called "latest". Please do not use the tag "latest" or you will get very confused when talking about the "latest latest pact", which would have a URL of `/pacts/provider/Bar/consumer/Foo/latest/latest`!

## When are tags created?

### When publishing pacts

Your Pact consumer library will allow you to set the "consumer version tags" that will be set for the relevant consumer version when you publish your pacts. The recommended tag value to use is the name of your git branch. See the section below on [feature toggles](#using-tags-with-feature-toggles-instead-of-feature-branches) if you use feature toggles instead of feature branches.

### When publishing verification results

Your Pact provider library will allow you to set the "provider version tags" that will be set for the relevant provider version when you publish your verification results. The recommended tag value to use is the name of your git branch, if applicable, or something like `dev`, if not.

### After deploying to an environment

_Note: this tag is required for the use of can-i-deploy, however, if you are just starting with Pact, you can skip it for now._

When you deploy an application that uses Pact to a given environment \(eg `test`, `prod`\) then you should tag the relevant pacticipant version with the name of the stage using the [create version tag](https://github.com/pact-foundation/pact_broker-client#create-version-tag) command from the [Pact Broker client](/pact_broker/can_i_deploy). This allows other applications to use [can-i-deploy](/pact_broker/can_i_deploy) to ensure that they're compatible with the version you just deployed before they deploy their own version.

:::info Remember the Golden Rule for tagging is:
Tag with the branch name when you publish pacts or verification results, and tag with the environment name when you deploy.
:::

## When are tags used?

### When retrieving pacts to verify

Providers should be configured to retrieve pacts by tag name \(usually the "latest pact" for a given tag eg. the latest `master` and latest `prod` pacts\).

### Before deploying to an environment

The `can-i-deploy` tool queries the Pact Broker to determine if the version of the application you are about to deploy is compatible with the versions of the other applications that are already in that environment, and it uses tags to determine this. For example `can-i-deploy --pacticipant Foo --version ad72df2 --to prod` will tell the Pact Broker to look up the latest version with the tag `prod` for each of Foo's integrations partners, and see if there is a successfully verified pact between that version and version ad72df2 of Foo.

## Retrieving pacts

* `/pacts/provider/PROVIDER/consumer/CONSUMER/latest/TAG` will return the pact associated with the latest pacticipant version that has the specified tag.
* `/pacts/provider/PROVIDER/consumer/CONSUMER/latest-untagged` will return the pact for the latest pacticipant version  that doesn't have any tags.
* `/pacts/provider/PROVIDER/consumer/CONSUMER/latest` will return the pact for the latest pacticipant version, regardless of tags.

## Creating tags

Most of the Pact libraries will provide configuration options to create tags automatically when publishing pacts or verification results.

If you need to create a tag manually, then you can use the [Pact Broker Client CLI](https://github.com/pact-foundation/pact_broker-client#create-version-tag), or send a `PUT` request to the tag resource path.

### When publishing pacts

This is a Javascript example, assuming that the build is running on Travis CI. Please consult the documentation for your chosen Pact language for the relevant syntax for your codebase.

```js
const opts = {
  pactFilesOrDirs: ['./pacts'],
  pactBroker: '...',
  consumerVersion: process.env.TRAVIS_COMMIT,
  tags: [process.env.TRAVIS_BRANCH]
}

new Publisher(opts).publishPacts()
```

Once you have your Pact CI/CD implementation running properly, you would only publish your pacts and verification results from your CI, and not your local development machines. However, if you are in the experimentation stage and wish to publish from your local machine, you can set the version and tags from your local git repository like so:

```js
const exec = command =>
  childProcess
    .execSync(command)
    .toString()
    .trim() //must trim to remove the new line on the end!

const opts = {
  ...,
  consumerVersion: process.env.TRAVIS_COMMIT || exec('git rev-parse HEAD'),
  tags: [process.env.TRAVIS_BRANCH || exec('git rev-parse --abbrev-ref HEAD')]
}

new Publisher(opts).publishPacts()
```

### When publishing verification results

```js
const opts = {
  pactBrokerUrl: '...',
  providerVersion: process.env.TRAVIS_COMMIT,
  providerVersionTags: [process.env.TRAVIS_BRANCH],
  publishVerificationResult: process.env.CI === 'true' // only publish from CI
}

return new Verifier(opts).verifyProvider()
```

## Using tags

### When verifying pacts

If you have reached the stage of Pact CI/CD maturity where you are tagging with the environment name and using `can-i-deploy`, then you should verify the pact from each environment to ensure that `can-i-deploy` returns a `yes` result when promoting a version through the environments.

If you are just starting out with Pact, then we recommend you just start by verifying the `master` pact (or whatever you have called the tag for your main line of development.)

```js
const opts = {
  ...,
  consumerVersionTags: ['master', 'test','production'],
}

return new Verifier(opts).verifyProvider()
```

### When deploying

See the [can-i-deploy](/pact_broker/can_i_deploy) documentation.

## Deleting tags

At the moment, there is no CLI to delete a tag, but you can delete it via the API by sending a `DELETE` request to the tag resource URL. eg `curl -X DELETE https://broker/pacticipants/PACTICIPANT/versions/VERSION/tags/TAG`.

The most common reason for deleting tags is if you are [rolling back](#handling-rollbacks) to a previously deployed application version.

## Adding new interactions

In summary: keep the CI running against a stable version of the pact, while simultaneously providing a new version for the provider team so they can update their code and provider states. Once both the stable and the new versions of the pact are green, the new version can be published as the stable version.

_Remember:_ just because you're doing consumer driven contracts doesn't mean that the consumer team gets to tell the provider team what to do. Please remember that the best results will be achieved by a collaborative approach between the two teams. Communicate with your nice human words folks.

## Ensuring backwards compatibility

If you want to ensure your provider is compatible with both the head version of your consumer, and the production version, you can use pact tagging to achieve this. To read more about this idea, check out this [blog post](https://www.rea-group.com/blog/enter-the-pact-matrix-or-how-to-decouple-the-release-cycles-of-your-microservices/) on decoupling the release cycles of your services.

### Step 1. Tag the production version of the pact

Use the [create-version-tag](https://github.com/pact-foundation/pact_broker-client#create-version-tag) command from the Pact Broker Client CLI.

### Step 2. Configure the provider to verify the production pact

Add the `production` tag to the list of tags to verify in your provider's verification configuration.

## Handling rollbacks

When the Pact Broker is determining "the latest `production` application version" or "the latest `production` pact" the logic it uses is "find all the _pacticipant versions_ that have the `production` tag, and return the most recently created one", NOT "find the most recently created `production` _tag_, and then return the associated pacticipant version".

This means that if you are rolling back to a previously deployed (and hence, previously tagged) application version, you need to remove the `production` tag from the version you are undeploying. See the [Deleting tags](#deleting-tags) section.

:::tip
This complication is one of the reasons that the use of tags to track environments has been superseeded by first class support for [environments](/pact_broker/recording_deployments_and_releases).
:::

## Using tags with feature toggles instead of feature branches

### For feature toggles in the consumer

Pact Broker tags were designed to support a feature branch workflow because it is the workflow that the Pact Broker author was most familiar with. Though it is not as well supported, you can also use tags to effectively test all your code paths if you use a trunk based workflow with feature toggles. These instructions assume that the feature toggle is built into the code base, but is configurable on/off at runtime or build time.

#### Publishing pacts

To do this, you will need to generate a "matrix" of pacts (for once, we're not talking about the Pact Broker Matrix here). 

* **The base pact**
  * One pact should be generated for the base code, with the default feature toggles set. Make sure that only the interactions that can be reached with the default toggles enabled are included in the pact test suite.
  * This pact should be published with the consumer version in the format `${GIT_SHA}`, and the tag `${GIT_BRANCH}` (even if you only ever use one branch).
* **The feature pacts**
  * For each feature, run another set of pact tests, turning on only one toggle at a time. The tests that relate only to that toggle should be run, so that the interactions that relate to the toggle are included in that pact. It doesn't really matter if the interactions for the unchanged parts of the code run or not.
  * For each feature toggle, publish the pact with the consumer version in the format `${GIT_SHA}+${FEATURE_NAME}` and the tag `${GIT_BRANCH}+${FEATURE_NAME}`.

You should now have a collection of pacts, all generated by the same git sha, but conceptually from different "versions" of the codebase. 

eg. 

* version `58024cb` tagged `main`
* version `58024cb+feat_a` tagged `main+feat_a`
* version `58024cb+feat_b` tagged `main+feat_b` etc. 

The consumer versions must be different for each pact because only one pact version can be associated with a consumer version at a time. The tags must be different, because the tags are used by the broker to allow each different feature to be verified separately.

#### Verifying pacts

To ensure each of the feature pacts are verified by the provider, the [Work In Progress Pacts](/pact_broker/advanced_topics/wip_pacts/) feature must be enabled on the provider side. This will ensure the latest pact for each feature is verified by the provider, without the provider needing to know the names of each feature.

#### Deploying

Before deploying the consumer, run `can-i-deploy --pacticipant ${PACTICIPANT_NAME} --version ${GIT_SHA} --to ${ENVIRONMENT}` as normal. 

The difference comes when enabling a feature toggle. Before a feature toggle can be enabled in a runtime system, you need to be sure that the consumer code with the feature toggle ON has been tested successfully with the version of the provider that is currently deployed to that environment. To check this, run `can-i-deploy --pacticipant ${PACTICIPANT_NAME} --version ${GIT_SHA}+${FEATURE_NAME} --to ${ENVIRONMENT}`. This will make sure that the pact for the deployed code with the feature enabled has a successful verification from the deployed version of the provider.
