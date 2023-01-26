---
title: Recording deployments and releases
---

:::info
The features described in this page require:

* Pact Broker >= v2.81.0
* Pact Broker Client CLI rubygem >= 1.47.0+, or the pact-cli Docker image >= 0.47.0.0+

As of August 2021, not every Pact library supports the `{ deployedOrReleased: true }` consumer version selector - please see the section on migrating from tags at the bottom of the page.
:::

The Pact Broker needs to know which versions of each application are in each environment so it can return the correct pacts for verification and determine whether a pacticular application version is [safe to deploy](/pact_broker/can_i_deploy).

To notify the Broker that an application version has been deployed or released, the `pact-broker record-deployment` and `pact-broker record-release` commands are provided by the Pact Broker CLI.

"Deployed versions" and "released versions" are very similar, but are modelled slightly differently in the Pact Broker. The difference between `record-deployment` and `record-release` is that 

* `record-deployment` is used to model the real life scenario where a deployment causes the previous version of an application to be replaced by a new version. It is used for APIs and consumer applications that are deployed to known instances. When called, it automatically marks the previously deployed version as undeployed.
* `record-release` models the real life scenario where the release of a new version of an artifact does not cause the previously released versions of the artifact to become unavailable. It is used for mobile applications and libraries that are made publicly available via an application store or repository. When called, it does NOT change the status of any previously released version.

"Deployed versions" and "released versions" are different resource types in the Pact Broker, and an application version may be both deployed and released. For example, a mobile phone application version may be recorded as deployed to a mobile device for automated testing in a test environment, and then recorded as released to an app store in a production environment. 

Deployments and release lifecycles are completely independent of each other. Ending support for a release will not cause a currently deployed version to be marked as undeployed, and marking a version as undeployed will not end support for a release.

## Environments

Before you can record a deployment or a release, you must create the environment in the Pact Broker. To get you you started quickly, the `test` and `production` environments are pre-populated in the Pact Broker.

To create a new environment, use the following [command](/pact_broker/client_cli/readme#create-environment) from the Pact Broker CLI.

    $ pact-broker create-environment --name NAME --display-name DISPLAY_NAME \
      [--no-production|--production]

#### Examples

    $ pact-broker create-environment --name uat --display-name UAT --no-production
    $ pact-broker create-environment --name customer-1-production --display-name "Customer 1 Production" --production

### Handling conflicting views of what an "environment" is

For can-i-deploy to work correctly, every team and the Pact Broker must have the same shared understanding of what an "environment" is. Defining the bounds of an environment can be a tricky thing. A consumer team may have multiple deployed consumer applications that all share the same instance of the provider. From the consumer team's point of view, there are multiple environments, but from the provider team's point of view, there is one. For the Pact Broker to operate correctly, in this situation, you have two options. 

1. Create one environment resource in the Pact Broker, and use the `--application-instance` feature described [below](#application-instances), and give each consumer application instance its own identifier. This would work well if there was only one application in each of the sub environments. 
2. If there are just too many applications in each of the sub environments to want to use the application instance approach, then you can create an environment resource for each sub environment, and when the shared application is deployed, call `record-deployment` once for each sub environment. Before deploying the shared application, the `can-i-deploy` command would need to be called for each sub environment, and it should only deploy if all the results were positive.


## Deployments

### Recording deployments

The `pact-broker record-deployment` command should be called at the very end of the deployment process, when there is no chance that the deployment might fail, and there are no more instances of the previous version running. When `record-deployment` is called, the previously deployed version for that application/environment is automatically marked as no longer deployed, so there is no need to make a separate call for this.

#### Examples

```
record-deployment --pacticipant foo --version 6897aa95e --environment production

record-deployment --pacticipant foo --version 6897aa95e --environment production \
                  --application-instance customer-1

record-deployment --pacticipant foo --version 6897aa95e --environment test \ 
                  --application-instance iphone-2
```

#### Application instances

Setting the "application instance" attribute is only necessary when there are multiple instances of an application *permanently* deployed to the same environment at the same time (ie. not just temporarily during a rolling migration). An example of this might be when you are maintaining on-premises consumer applications for multiple customers that all share the same backend API instance, or when you have more than one mobile device running the same application in a test environment, all pointing to the same test API instance.

The "application instance" field is used to distinguish between deployed versions of an application within the same environment, and most importantly, to identify which previously deployed version has been replaced by the current deployment. The Pact Broker only allows one unique combination of pacticipant/environment/application instance to be considered the "currently deployed" one, and any call to record a deployment will cause the previously deployed version with the same pacticipant/environment/application instance to be automatically marked as undeployed (mimicking the real world process of "deploying over" a previous version). Note that a "null" (anonymous) application instance is considered to be a distinct value, so if you record a deployment with no application instance set, then record a deployment with an application instance set, you will have two different deployed versions in that environment.

The application instance should *not* be used to model blue/green or other forms of no-downtime deployments where there are two different application versions deployed temporarily at once during the deployment phase. See the next section for more information.

Note: In beta releases of the Pact Broker Client, the "application instance" property was called "target". This is still supported, but will generate warnings in the output.

##### Why the application instance should not be used for long running deployments

When executing a rolling deployment (an approach for deploying with no downtime where there are multiple application instances that are deployed to sequentially), there will be a period of time when there are 2 different versions of an application in the environment at the same time. Even if there is a long running deployment, the `record-deployment` should still be called at the end of the deployment, and there is no need to let the Broker know of newer application version until the deployment process is complete.

Why is this so?

Imagine an application, Consumer, which depends on application, Provider. Each of them has version 1 deployed to production. Consumer version 2 is waiting for a new feature to be supported in Provider version 2.

Provider deploys version 2 using a rolling deployment, during which time the response to Consumer's request might come from Provider version 1 or it might come from version 2. Technically, both versions of Provider could be said to be in production at this point in time. However, Consumer v2 cannot be deployed safely to production _until Provider v1 is no longer in production_. This is why there is no advantage to recording Provider v2 as being in production during the time period of the deployment. It's not just that Consumer v2 requires Provider v2 to be in production, it also requires Provider v1 to NOT be in production, and that can't be guaranteed until the deployment is complete.

#### Handling rollbacks

If you need to rollback to a previous version, call `record-deployment` again with the version that you are rolling back to.

### Recording undeployments

Recording undeployments is not usually necessary, because the `record-deployment` command automatically marks any application version that was deployed to the same application instance as undeployed.

If however, an application instance is being permanently removed from an environment, rather than just being deployed over, you can use `pact-broker record-undeployment`.

Once a version is marked as undeployed (either explicitly or automatically), the pacts for that version are no longer returned for verification when using the `{ "deployedOrReleased": true}` [consumer version selector](/pact_broker/advanced_topics/consumer_version_selectors/), and the version is no longer considered when checking if an integrated application is [safe to deploy](/pact_broker/can_i_deploy).

#### Examples

```
record-undeployment --pacticipant my-retired-service --environment test
                    
record-undeployment --pacticipant foo --environment test \
                    --application-instance mobile-2
```

## Releases

### Recording releases

The `pact-broker record-release` command should be called once an application version has been successfully made available in a production environment (eg. via a Github release, made available on an app store, or released to a Maven repository etc.). Unlike recording a deployment, recording a release does not change the status of any previously released application versions, and there is no concept of a release "application instance".

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

The first is when determining which pacts should be verified by the provider. The pact for every version that is currently deployed or released+supported in an environment should be verified during the provider's release pipeline to ensure backwards compatiblity. The [consumer version selector](/pact_broker/advanced_topics/consumer_version_selectors/) to use to identify these pacts is `{ "deployedOrReleased": true }`. See the [section below](#pact-client-support-for-the-deployedorreleased-selector) on which libraries currently support the selector.

The second use for the deployed and released versions is when using [can-i-deploy](/pact_broker/can_i_deploy/). This is the command that is used to check if the version you are about to deploy into an environment has a successful verification result with each of the application versions that is already in the environment. 

eg.

```
pact-broker can-i-deploy --pacticipant Foo \
                         --version 617c76e8bf05e1a480aed86a0946357c042c533c \
                         --to-environment production
```

## Migrating from tags to deployments/releases

Before the introduction of deployed and released versions, [tags](/pact_broker/tags) were used to keep track of which environment each application version was deployed to. Tags were simple string values associated with application versions. Every time an application version was deployed or released, the version would be tagged with the name of the environment. 

The problem with tags is that they have no semantic meaning, and they don't easily support modelling the "undeployment" of the previous version of an application. The Broker also didn't know if the application was a "deployed" application, where there was only one instance of the application in an environment at a time, or a "released" application, where there could be multiple concurrent versions in an environment at a time. This meant that the Pact Broker couldn't automatically identify "the application version(s) in production". The inability to infer real world meaning from the tags made it difficult for the Pact Broker to do intelligent things with the data it had, and pushed the burden of configuration and interpetation back onto the user.

Modelling deployments, releases and environments helps the Broker to automatically determine:

* which pacts to verify to ensure backwards compatibility
* which verifications to trigger when a pact changes to allow the new version of the consumer to be deployed as soon as possible
* whether it is safe to deploy, without having to customise the command for "released" (eg. mobile) applications

### Why migrate?

If you already have your CI/CD workflow set up to use tags, you may wonder what benefits there are to migrating. Here are some advantages.

* The main reason to migrate is that tags are hard for new users to understand, and even if your current team is experienced with Pact, there will always be new users coming into the organization/team.
* The deployed and released versions feature supports use of the new [contract_requiring_verification_published webhook](https://github.com/pact-foundation/pact_broker/pull/476) which will make it easier to get verification results between the head consumer version and the deployed provider versions, resulting in more "yes" responses for `can-i-deploy`, which will allow consumers to deploy to production more often.
* Deployments and releases do not suffer from the same performance issues that tags do when the Pact Broker accumulates a lot of data.
* While tags will continue to be supported, future Pact Broker features will be built for deployed/released versions rather than tags.

### Pact client support for the deployedOrReleased selector

If you would like to make a contribution to Pact by adding support for this selector, please comment on the relevant issue below.

* Pact JS - supported for Javascript from version 9.16 (earlier versions may support the selector but not log it properly in the output)
* Pact Ruby - v1.59.0 (earlier versions may support the selector but not log it properly in the output)
* Pact Go - v1.6.3
* Pact Rust - v0.8.7
* Pact JVM - unsupported ([check status or comment on issue](https://github.com/pact-foundation/pact-jvm/issues/1407))
* Pact NET - v4.0.0-beta.1  ([check status or comment on issue](https://github.com/pact-foundation/pact-net/issues/311))
* Pact Python - unsupported ([check status or comment on issue](https://github.com/pact-foundation/pact-python/issues/246))
* Pact Scala - unsupported ([check status or comment on issue](https://github.com/ITV/scala-pact/issues/224))
* Pact4s - unsupported
* Pact PHP - unsupported ([check status or comment on issue](https://github.com/pact-foundation/pact-php/issues/206))

### Migration steps

To assist in the migration of tags to environments:

* the environments "test" and "production" have been pre-created for you in your Pact Broker instance.
* the Pact Broker from version 2.81.0 supports the automatic conversion of "environment tags" to "deployments" using the configuration setting [create_deployed_versions_for_tag](/pact_broker/configuration/settings#create_deployed_versions_for_tags), which is enabled by default. When this is set to true, and a tag is created, if there is an environment with the name of the newly created tag, a deployed version is also created for the pacticipant version. Note this does not support creating *released* versions - they will need to be migrated explicity.

Steps:

:::note

While these steps might look lengthy, they are broken down into deliberately small steps to support a safe "no downtime" migration. You can see can see the overall diff required to migrate the [example-consumer](https://github.com/pactflow/example-consumer/pull/9/files) and the [example-provider](https://github.com/pactflow/example-provider/pull/13/files) that are used in the [CI/CD workshop](https://docs.pactflow.io/docs/workshops/ci-cd/) is very small.

:::

* Upgrade to the latest version of the [Pact Broker](/pact_broker/docker_images).
* Upgrade to the latest version of the [Pact Broker Client](/pact_broker/client_cli/readme) (either in the pact-cli Docker image, the pact-ruby-standalone or the Ruby gem)
* Check in the [support](#pact-client-support-for-the-deployedorreleased-selector) section that the Pact library for the provider language you are using supports the `{ deployedOrReleased: true }` selector. If your language has not implemented that selector, then there will be an open issue in the Github repo for the feature - please go and comment on it that you are interested in using the feature. You can actually start using deployments/releases even if your provider library does not support the new selector - you'll just need to use tags and deployments in parallel until the new selector is supported.
* Create an environment resource for each of your environments using the [create-environment](/pact_broker/client_cli/readme#create-environment) command in the Pact Broker CLI. The "test" and "production" environments will have been seeded for you. You can check the existing environments by running `pact-broker list-environments`. If you are using PactFlow, you will need the `environment:manage:*` permission associated with the Administrator role to create an environment.

    $ pact-broker create-environment --name NAME --display-name DISPLAY_NAME [--no-production|--production]

* Wherever you are are calling `pact-broker create-version-tag` after a deployment, add another command to record the deployment (or release if appropriate).

    $ pact-broker record-deployment --pacticipant PACTICIPANT --version VERSION --environment ENVIRONMENT

* If your provider library supports it, in the provider codebase, add another selector `{ "deployedOrReleased": true }` to the consumerVersionSelectors. It's ok if the same pact is returned for multiple selectors - they are de-duplicated. When you run the verification step, you should see in the output that some of pacts have been selected because they are deployed/released AND because they are tagged with the environment name.
* Once all the integrated applications for a particular application have started using `record-deployment`, update the application's `can-i-deploy` call to use `--to-environment ENVIRONMENT` instead of `--to ENVIRONMENT`. Drop any use of the `--all` option for mobile applications and code libraries.

    $ pact-broker can-i-deploy --pacticipant PACTICIPANT --version VERSION --to-environment ENVIRONMENT

* If/when your provider supports the new selector, and you are confident that everything is working correctly, you can remove the `create-version-tag` calls, and remove the `{ tag: "<ENVIRONMENT>" }` selector(s) from the consumerVersionSelectors in the provider project.


