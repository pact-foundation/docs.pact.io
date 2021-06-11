---
title: Recording deployments and releases
---

:::caution
This documentation is for features that are a work in progress, but not yet released. They are being put out for feedback on the planned features before official release. If you have feedback, please post it in the #pact-broker channel in Slack.
:::

The Pact Broker needs to know which versions of each application are deployed or released to each environment so it can return the correct pacts for verification and determine whether a pacticular application version is [safe to deploy](/pact_broker/can_i_deploy).

To notify the Broker that an application version has been deployed or released, the `pact-broker record-deployment` and `pact-broker record-release` commands are provided by the Pact Broker CLI.

The difference between `record-deployment` and `record-release` is that 

* `record-deployment` automatically marks the previously deployed version as undeployed, and is used for APIs and consumer applications that are deployed to known instances.
* `record-release` does NOT change the status of any previously released version, and is used for mobile applications and libraries that are made publicly available via an application store or repository.

# Deployments

## Recording deployments

The `pact-broker record-deployment` command should be called at the very end of the deployment process, when there is no chance that the deployment might fail, and there are no more instances of the previous version running. 

### Examples

```
record-deployment --pacticipant foo --version 6897aa95e --environment production

record-deployment --pacticipant foo --version 6897aa95e --environment production \
                  --target customer-1

record-deployment --pacticipant foo --version 6897aa95e --environment test \ 
                  --target iphone-2
```

### Target

Setting the "target" field is only necessary when there are multiple instances of an application deployed permanently to the same environment at the same time. An example of this might be when you are maintaining on-premises consumer applications for multiple customers that all share the same backend API instance, or when you have more than one mobile device running the same application in a test environment, all pointing to the same test API instance.

The "target" field is used to distinguish between deployed versions of an application within the same environment, and most importantly, to identify which previously deployed version has been replaced by the current deployment. The Pact Broker only allows one unique combination of pacticipant/environment/target to be considered the "currently deployed" one, and any call to record a deployment will cause the previously deployed version with the same pacticipant/environment/target to be automatically marked as undeployed (mimicking the real world process of "deploying over" a previous version). Note that a "null" target is considered to be a distinct target value, so if you record a deployment with no target set, then record a deployment with a target set, you will have two different deployed versions in that environment.

The target should *not* be used for blue/green or other forms of no-downtime deployments where there are two different application versions deployed at once during the deployment phase. See the next section for more information.

#### Why the target should not be used for long running deployments

When executing a rolling deployment (an approach for deploying with no downtime where there are multiple application instances that are deployed to sequentially), there will be a period of time when there are 2 different versions of an application in the environment at the same time. Even if there is a long running deployment, the `record-deployment` should still be called at the end of the deployment, and there is no need to let the Broker know of newer application version until the deployment process is complete.

Why is this so?

Imagine an application, X, which depends on application Y. Each of them has version 1 deployed to production. X version 2 is waiting for a new feature to be supported in Y version 2.

Y takes a long time to deploy, during which time X's response might come from version 1 or it might come from version 2. Technically, both versions of Y could be said to be in production at this point in time. However, Xv2 cannot be deployed safely to production until Yv1 is no longer in production. This is why there is no advantage to recording Yv2 as being in production during the time period of the deployment. It's not just that Xv2 requires Yv2 to be in production, it also requires Yv1 to NOT be in production, and that can't be guaranteed until the deployment is complete.

## Recording undeployments

Recording undeployments is not usually necessary, because the `record-deployment` command automatically marks any application version that was deployed to the same target as undeployed.

If however, a application instance is being permanently removed from an environment, rather than just being deployed over, you can use `pact-broker record-undeployment`.

Once a version is marked as undeployed, the pacts for that version are no longer returned for verification, and it is no longer considered when checking if an integrated application is [safe to deploy](/pact_broker/can_i_deploy).

### Examples

```
record-undeployment --pacticipant my-retired-service --environment test
                    
record-undeployment --pacticipant foo --environment test \
                    --target mobile-2
```

# Releases

## Recording releases

The `pact-broker record-release` command should be called once an application version has been successfully made available in an production environment (eg. via a Github release, made available on an app store, or released to a Maven repository etc.). Unlike recording a deployment, recording a release does not change the status of any previously released application versions, and there is no concept of a release "target".

`record-release` is generally only used for production environments. If you do use it for pre-prod environments, you will need to manually call `record-support-ended` when a version is either promoted to production or it is decided that the version will not be released, otherwise you will end up verifying pacts for unnecessary versions. If you have a pre-prod repository that you are sharing a library to, and you only care about verifying the pacts for the latest version in that repository, then `record-deployment` may be more appropriate for pre-prod releases.

### Examples

```
record-release --pacticipant foo-mobile-app --version 6897aa95e --environment production
```

## Recording support ended for a release

When a released application is deemed to be no longer supported, call `pact-broker record-support-ended`. This will stop the pacts for this version being returned for verification by its providers, and remove it from consideration when checking if an integrated application is [safe to deploy](/pact_broker/can_i_deploy).

### Examples

```
record-support-ended --pacticipant foo-mobile-app --version 6897aa95e --environment production
```
