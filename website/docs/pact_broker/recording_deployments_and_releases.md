---
title: Recording deployments and releases
---

The Pact Broker needs to know which versions of each application are in each environment so it can return the correct pacts for verification and determine whether a pacticular application version is [safe to deploy](/pact_broker/can_i_deploy).

To notify the Broker that an application version has been deployed or released, the `pact-broker record-deployment` and `pact-broker record-release` commands are provided by the Pact Broker CLI.

## Deployments vs releases

"Deployed versions" and "released versions" in the Pact Broker are very similar, but are modelled slightly differently. The difference between `record-deployment` and `record-release` is that 

* `record-deployment` automatically marks the previously deployed version as undeployed, and is used for APIs and consumer applications that are deployed to known instances.
* `record-release` does NOT change the status of any previously released version, and is used for mobile applications and code libraries that are made publicly available via an application store or repository for someone else to install.

"Deployed versions" and "released versions" are different resources in the Pact Broker, and an application version may be both deployed and released. For example, a mobile phone application version may be recorded as deployed to a mobile device for automated testing in a test environment, and then recorded as released to an app store in a production environment.

## Deployments

### Recording deployments

The `pact-broker record-deployment` command should be called immediately after a successful deployment, when there is no chance that the deployment might fail, and there are no more instances of the previous version running. When `record-deployment` is called, the previously deployed version for that application/environment is automatically marked as no longer deployed, so there is no need to make a separate call for this.

Recording an application version as deployed means that it will be included in the calculations when running the [can-i-deploy](/pact_broker/can_i_deploy) command to determine if an integrated application is safe to deploy to that environment, and that any pacts for that version will be returned for verification if the provider has configured the [consumer version selectors](/pact_broker/advanced_topics/consumer_version_selectors) to include `{ "deployed": true }` versions.

### Prerequisites

Before a version can be recorded as deployed, the relevant environment resource must be created using the [create-environment](/pact_broker/client_cli#create-environment) command. eg. 

```
pact-broker create-environment --name test --display-name Test --no-production

pact-broker create-environment --name production --display-name Production --production
```

#### Examples

```
pact-broker record-deployment --pacticipant foo --version 6897aa95e --environment production

pact-broker record-deployment --pacticipant foo --version 6897aa95e --environment production \
                  --target customer-1

pact-broker record-deployment --pacticipant foo --version 6897aa95e --environment test \ 
                  --target iphone-2
```

#### Target

Setting the "target" field is only necessary when there are multiple instances of an application deployed permanently to the same environment at the same time. An example of this might be when you are maintaining on-premises consumer applications for multiple customers that all share the same backend API instance, or when you have more than one mobile device running the same application in a test environment, all pointing to the same test API instance.

The "target" field is used to distinguish between deployed versions of an application within the same environment, and most importantly, to identify which previously deployed version has been replaced by the current deployment. The Pact Broker only allows one unique combination of pacticipant/environment/target to be considered the "currently deployed" one, and any call to record a deployment will cause the previously deployed version with the same pacticipant/environment/target to be automatically marked as undeployed (mimicking the real world process of "deploying over" a previous version). Note that a "null" target is considered to be a distinct target value, so if you record a deployment with no target set, then record a deployment *with* a target set, you will have two different deployed versions in that environment.

The target should *not* be used to model blue/green or other forms of no-downtime deployments where there are two different application versions deployed simultaneously but temporarily during the deployment phase. See the next section for more information.

##### Why the target should not be used for long running deployments

When executing a rolling deployment (an approach for deploying with no downtime where there are multiple application instances that are deployed to sequentially), there will be a period of time when there are 2 different versions of an application in the environment at the same time. Even if there is a long running deployment, the `record-deployment` should still be called at the end of the deployment, and there is no need to let the Broker know of newer application version until the deployment process is complete.

Why is this so?

Imagine an application, Consumer, which depends on application, Provider. Each of them has version 1 deployed to production. Consumer version 2 is waiting for a new feature to be supported in Provider version 2.

Provider deploys version 2 using a rolling deployment, during which time the response to Consumer's request might come from Provider version 1 or it might come from version 2. Technically, both versions of Provider could be said to be in production at this point in time. However, Consumer v2 cannot be deployed safely to production _until Provider v1 is no longer in production_. This is why there is no advantage to recording Provider v2 as being in production during the time period of the deployment. It's not just that Consumer v2 requires Provider v2 to be in production, it also requires Provider v1 to NOT be in production, and that can't be guaranteed until the deployment is complete.

### Recording undeployments

Recording undeployments is not usually necessary, because the `record-deployment` command automatically marks any application version that was deployed with the same pacticipant/environment/target as undeployed.

If however, an application instance is being permanently removed from an environment, rather than just being deployed over, you can use `pact-broker record-undeployment`.

Once a version is marked as undeployed, the pacts for that version are no longer returned for verification, and it is no longer considered when checking if an integrated application is [safe to deploy](/pact_broker/can_i_deploy).

### Prerequisites

Before a version can be recorded as released, the relevant environment resource must be created using the [create-environment](/pact_broker/client_cli#create-environment) command. eg. 

```
pact-broker create-environment --name production --display-name Production --production
```

#### Examples

```
pact-broker record-undeployment --pacticipant my-retired-service --environment test
                    
pact-broker record-undeployment --pacticipant foo --environment test \
                    --target mobile-2
```

## Releases

### Recording releases

The `pact-broker record-release` command should be called once an application version has been successfully made available in a production environment (eg. via a Github release, made available on an app store, or released to a Maven repository etc.). Unlike recording a deployment, recording a release does not change the status of any previously released application versions, and there is no concept of a release "target".

`record-release` is generally only used for production environments. If you do use it for pre-prod environments, you will need to manually call `record-support-ended` when a version is either promoted to production or it is decided that the version will not be released, otherwise you will end up verifying pacts for unnecessary versions. If you have a pre-prod repository that you are sharing a library to, and you only care about verifying the pacts for the latest version in that repository, then `record-deployment` may be more appropriate for pre-prod releases.

#### Examples

```
pact-broker record-release --pacticipant foo-mobile-app --version 6897aa95e --environment production
```

### Recording support ended for a release

When a released application is deemed to be no longer supported, call `pact-broker record-support-ended`. This will stop all pacts for this version being returned for verification by its providers, and remove it from consideration when checking if an integrated application is [safe to deploy](/pact_broker/can_i_deploy).

#### Examples

```
pact-broker record-support-ended --pacticipant foo-mobile-app --version 6897aa95e --environment production
```

## Migrating from tags to deployments/releases

* Check that the Pact library for the provider language you are using supports the `{ deployedOrReleased: true }` selector. As of the date of writing this document (6 Aug 2021) those languages are Pact JS, Pact Ruby and the Dockerized or standalone pact-provider-verifier. If your language has not implemented that selector, then there will be an open issue in the Github repo for the feature - please go and comment on it that you are interested in using the feature. You can start using the new feature even if your provider library does not support the new selector - you'll just need to use tags and deployments in parallel until the new selector is supported.
* Ensure you are using the Pact Broker Client CLI 1.47.0 or later (0.47.0.0 or later of the pact-cli Docker image).
* Create an environment resource for each of your environments using the `create-environment` command in the Pact Broker CLI.
* Wherever you are are calling `pact-broker create-version-tag --pacticipant PACTICIPANT --version VERSION --tag ENVIRONMENT` after a deployment, add another command `pact-broker record-deployment --pacticipant PACTICIPANT --version VERSION --environment ENVIRONMENT` (or `record-release` if appropriate).
* If your provider library supports it, in the provider codebase, add another selector `{ deployedOrReleased: true }` to the consumerVersionSelectors. It's ok if the same pact is returned for multiple selectors - they are de-duplicated. When you run the verification step, you should see that some of pacts have been selected because they are deployed/released.
* Once all the integrations for a particular application have started using `record-deployment`, update the application's `can-i-deploy` call to use `--to-environment ENVIRONMENT` instead of `--to ENVIRONMENT`.
* When you are confident that everything is working correctly, you can remove the `create-version-tag` calls, and remove the `{ tag: "<ENVIRONMENT>" }` selector from the consumerVersionSelectors in the provider project. If your provider library does not yet support the new selector, you'll need to keep the old tag selector in place until it is supported, and you can upgrade.

You can see can see the overall diff required to migrate to `record-deployment` (which is very small) in the PRs for the [example-consumer](https://github.com/pactflow/example-consumer/pull/9/files) and the [example-provider](https://github.com/pactflow/example-provider/pull/13/files) that are used in the [CI/CD workshop](https://docs.pactflow.io/docs/workshops/ci-cd/) which has been updated to use `record-deployment` instead of tags.

