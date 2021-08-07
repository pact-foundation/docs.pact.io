---
title: Recording deployments and releases
---

:::info
The features described in this page require:

* Pact Broker >= v2.81.0
* Pact Broker Client CLI rubygem >= 1.47.0+, or the pact-cli Docker image >= 0.47.0.0+

As of August 2021, not every Pact library supports the `{ deployedOrReleased: true}` consumer version selector - please see the section on migrating from tags at the bottom of the page.
:::

The Pact Broker needs to know which versions of each application are in each environment so it can return the correct pacts for verification and determine whether a pacticular application version is [safe to deploy](/pact_broker/can_i_deploy).

To notify the Broker that an application version has been deployed or released, the `pact-broker record-deployment` and `pact-broker record-release` commands are provided by the Pact Broker CLI.

"Deployed versions" and "released versions" are very similar, but are modelled slightly differently in the Pact Broker. The difference between `record-deployment` and `record-release` is that 

* `record-deployment` automatically marks the previously deployed version as undeployed, and is used for APIs and consumer applications that are deployed to known instances.
* `record-release` does NOT change the status of any previously released version, and is used for mobile applications and libraries that are made publicly available via an application store or repository.

"Deployed versions" and "released versions" are different resource types in the Pact Broker, and an application version may be both deployed and released. For example, a mobile phone application version may be recorded as deployed to a mobile device for automated testing in a test environment, and then recorded as released to an app store in a production environment.

## Deployments

### Recording deployments

The `pact-broker record-deployment` command should be called at the very end of the deployment process, when there is no chance that the deployment might fail, and there are no more instances of the previous version running. When `record-deployment` is called, the previously deployed version for that application/environment is automatically marked as no longer deployed, so there is no need to make a separate call for this.

#### Examples

```
record-deployment --pacticipant foo --version 6897aa95e --environment production

record-deployment --pacticipant foo --version 6897aa95e --environment production \
                  --target customer-1

record-deployment --pacticipant foo --version 6897aa95e --environment test \ 
                  --target iphone-2
```

#### Target

Setting the "target" field is only necessary when there are multiple instances of an application deployed permanently to the same environment at the same time. An example of this might be when you are maintaining on-premises consumer applications for multiple customers that all share the same backend API instance, or when you have more than one mobile device running the same application in a test environment, all pointing to the same test API instance.

The "target" field is used to distinguish between deployed versions of an application within the same environment, and most importantly, to identify which previously deployed version has been replaced by the current deployment. The Pact Broker only allows one unique combination of pacticipant/environment/target to be considered the "currently deployed" one, and any call to record a deployment will cause the previously deployed version with the same pacticipant/environment/target to be automatically marked as undeployed (mimicking the real world process of "deploying over" a previous version). Note that a "null" target is considered to be a distinct target value, so if you record a deployment with no target set, then record a deployment with a target set, you will have two different deployed versions in that environment.

The target should *not* be used to model blue/green or other forms of no-downtime deployments where there are two different application versions deployed at once during the deployment phase. See the next section for more information.

##### Why the target should not be used for long running deployments

When executing a rolling deployment (an approach for deploying with no downtime where there are multiple application instances that are deployed to sequentially), there will be a period of time when there are 2 different versions of an application in the environment at the same time. Even if there is a long running deployment, the `record-deployment` should still be called at the end of the deployment, and there is no need to let the Broker know of newer application version until the deployment process is complete.

Why is this so?

Imagine an application, Consumer, which depends on application, Provider. Each of them has version 1 deployed to production. Consumer version 2 is waiting for a new feature to be supported in Provider version 2.

Provider deploys version 2 using a rolling deployment, during which time the response to Consumer's request might come from Provider version 1 or it might come from version 2. Technically, both versions of Provider could be said to be in production at this point in time. However, Consumer v2 cannot be deployed safely to production _until Provider v1 is no longer in production_. This is why there is no advantage to recording Provider v2 as being in production during the time period of the deployment. It's not just that Consumer v2 requires Provider v2 to be in production, it also requires Provider v1 to NOT be in production, and that can't be guaranteed until the deployment is complete.

### Recording undeployments

Recording undeployments is not usually necessary, because the `record-deployment` command automatically marks any application version that was deployed to the same target as undeployed.

If however, a application instance is being permanently removed from an environment, rather than just being deployed over, you can use `pact-broker record-undeployment`.

Once a version is marked as undeployed (either explicitly or automatically), the pacts for that version are no longer returned for verification when using the `{ "deployedOrReleased": true}` [consumer version selector](/pact_broker/advanced_topics/consumer_version_selectors/), and the version is no longer considered when checking if an integrated application is [safe to deploy](/pact_broker/can_i_deploy).

#### Examples

```
record-undeployment --pacticipant my-retired-service --environment test
                    
record-undeployment --pacticipant foo --environment test \
                    --target mobile-2
```

## Releases

### Recording releases

The `pact-broker record-release` command should be called once an application version has been successfully made available in a production environment (eg. via a Github release, made available on an app store, or released to a Maven repository etc.). Unlike recording a deployment, recording a release does not change the status of any previously released application versions, and there is no concept of a release "target".

`record-release` is generally only used for production environments. If you do use it for pre-prod environments, you will need to manually call `record-support-ended` when a version is either promoted to production or it is decided that the version will not be released, otherwise you will end up verifying pacts for unnecessary versions. If you have a pre-prod repository that you are sharing a library to, and you only care about verifying the pacts for the latest version in that repository, then `record-deployment` may be more appropriate for pre-prod releases.

#### Examples

```
record-release --pacticipant foo-mobile-app --version 6897aa95e --environment production
```

### Recording support ended for a release

When a released application is deemed to be no longer supported, call `pact-broker record-support-ended`. This will stop all pacts for this version being returned for verification by its providers, and remove it from consideration when checking if an integrated application is [safe to deploy](/pact_broker/can_i_deploy).

#### Examples

```
record-support-ended --pacticipant foo-mobile-app --version 6897aa95e --environment production
```

## Using deployed and released versions

There are two main uses for the deployed and released version resources in the Pact Broker. 

The first is when determining which pacts should be verified by the provider. The pact for every version that is currently deployed or released+supported in an environment should be verified during the provider's release pipeline to ensure backwards compatiblity. The [consumer version selector](/pact_broker/advanced_topics/consumer_version_selectors/) to use to identify these pacts is `{ "deployedOrReleased": true }`. As of the date of writing this document (6 Aug 2021) the languages that support this selector are Pact JS, Pact Ruby and the Dockerized or standalone pact-provider-verifier.

The second use for the deployed and released versions is when using [can-i-deploy](/pact_broker/can_i_deploy/). This is the command that is used to check if the version you are about to deploy into an environment has a successful verification result with each of the application versions that is already in the environment. 

eg.

```
pact-broker can-i-deploy --pacticipant Foo \
                         --version 617c76e8bf05e1a480aed86a0946357c042c533c \
                         --to-environment production
```

## Migrating from tags to deployments/releases

Before the introduction of deployed and released versions, [tags](/pact_broker/tags) were used to keep track of which environment each application version was deployed to. Tags were simple string values associated with application versions. Every time an application version was deployed or released, the version would be tagged with the name of the environment. 

Because there was poor support for handling "undeployments" with tags, every version that was ever deployed to an environment had the environment tag. For applications that were deployed (ie. services) the "current version" in an environment was inferred to be the latest version with the environment tag. For applications that were released (eg. mobile apps) the "current versions" in an environment were all the versions with the environment tag. This meant there was no way for the Pact Broker identify "the application version(s) in production" - the user had to know whether or not this was the "latest version with tag 'production'" or "all versions with tag 'production'". The inability to infer semantic meaning from the tags made it difficult for the Pact Broker to do intelligent things with the data it had, and pushed the burden of interpetation back onto the user.

Modelling deployments, releases and environments helps the Broker to automatically determine:

* which pacts to verify to ensure backwards compatibility
* which verifications to trigger when a pact changes to allow the new version of the consumer to be deployed as soon as possible
* whether it is safe to deploy, without having to customise the command for "released" (eg. mobile) applications

### Why migrate?

If you already have your CI/CD workflow set up to use tags, you may wonder what benefits there are to migrating. Here are some advantages.

* The main reason to migrate is that tags are hard for new users to understand, and even if your current team is experienced with Pact, there will always be new users coming into the organization/team.
* The deployed and released versions feature supports use of the new [contract_requiring_verification_published webhook](https://github.com/pact-foundation/pact_broker/pull/476) which will make it easier to get verification results between the head consumer version and the deployed provider versions, resulting in more "yes" responses for `can-i-deploy`, which will allow consumers to deploy to production more often.
* While tags will continue to be supported, future Pact Broker features will be built for deployed/released versions rather than tags.

### Migration steps

* Upgrade to the latest version of the [Pact Broker](/pact_broker/docker_images).
* Upgrade to the latest version of the [Pact Broker Client](/pact_broker/client_cli/readme) (either in the pact-cli Docker image, the pact-ruby-standalone or the Ruby gem)
* Check that the Pact library for the provider language you are using supports the `{ deployedOrReleased: true }` selector. As of the date of writing this document (6 Aug 2021) those languages are Pact JS, Pact Ruby and the Dockerized or standalone pact-provider-verifier. If your language has not implemented that selector, then there will be an open issue in the Github repo for the feature - please go and comment on it that you are interested in using the feature. You can start using the new feature even if your provider library does not support the new selector - you'll just need to use tags and deployments in parallel until the new selector is supported.
* Create an environment resource for each of your environments using the [create-environment](/pact_broker/client_cli/readme#create-environment) command in the Pact Broker CLI. The "test" and "production" environments will have been seeded for you. You can check the existing environments by running `pact-broker list-environments`. If you are using Pactflow, you will need the `environment:manage:*` permission associated with the Administrator role to create an environment.

    $ pact-broker create-environment --name NAME --display-name DISPLAY_NAME [--no-production|--production]

* Wherever you are are calling `pact-broker create-version-tag` after a deployment, add another command to record the deployment (or release if appropriate).

    $ pact-broker record-deployment --pacticipant PACTICIPANT --version VERSION --environment ENVIRONMENT

* If your provider library supports it, in the provider codebase, add another selector `{ "deployedOrReleased": true }` to the consumerVersionSelectors. It's ok if the same pact is returned for multiple selectors - they are de-duplicated. When you run the verification step, you should see in the output that some of pacts have been selected because they are deployed/released.
* Once all the integrations for a particular application have started using `record-deployment`, update the application's `can-i-deploy` call to use `--to-environment ENVIRONMENT` instead of `--to ENVIRONMENT`. Drop any use of the `--all` option for mobile applications and code libraries.

    $ pact-broker can-i-deploy --pacticipant PACTICIPANT --version VERSION --to-environment ENVIRONMENT

* If/when your provider supports the new selector, and you are confident that everything is working correctly, you can remove the `create-version-tag` calls, and remove the `{ tag: "<ENVIRONMENT>" }` selector(s) from the consumerVersionSelectors in the provider project.

You can see can see the overall diff required to migrate to `record-deployment` (which is very small) in the PRs for the [example-consumer](https://github.com/pactflow/example-consumer/pull/9/files) and the [example-provider](https://github.com/pactflow/example-provider/pull/13/files) that are used in the [CI/CD workshop](https://docs.pactflow.io/docs/workshops/ci-cd/) which has been updated to use `record-deployment` instead of tags.
