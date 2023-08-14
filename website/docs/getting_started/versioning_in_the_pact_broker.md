---
title: Versioning in the Pact Broker
---

When using Pact, you have to be careful about how your application version numbers are set. This document describes the versioning concepts used by the Pact Broker, and recommends best practices.

:::info tl;dr

To avoid race conditions, the application (pacticipant) version number that is used to publish pacts and verification results should either _be_ or _contain_ the commit (ie. the git SHA or equivalent for your version control system).

:::

There are conceptually three resources that can have versions in the Pact Broker:

1. The pact file \(which describes the contract\)
2. The consumer application that generated the pact file
3. The provider application that verified the pact contract

Users of Pact never need to worry about pact contract versions, since this is done automatically by the pact broker. However, consumer and provider application numbers need to be set in a principled way, even in pre-production.

A related concept is the Pact Matrix, which contains the verification status for all possible pairs of consumer and provider application versions, and is used by the [can-i-deploy](/pact_broker/can_i_deploy/) tool to determine if an application is safe to deploy. Following the rules for pacticipant application versions will mean that you’ll be able to get reliable results from can-i-deploy, and avoid deploying application versions that will break integration points.

## Consumer application versions

When a pact contract file is published to the broker, it is associated with a particular consumer name, consumer version, and provider name:

![Pact versioning](/img/version-consumer.png)

The pact contract version is not the same as the consumer version that generated it \(the pact contract version is internal to the framework, and not exposed to users\).

A neat feature of the pact broker is the ability to recognise duplicate contracts, meaning that one specific contract can belong to multiple consumer versions:

![Consumer versions](/img/version-consumer-initial.png)

This happens when two or more application versions publish the same Pact contract. Duplicate detection is done by hashing the pact file. Note that application versions publishing the same pact contract don’t need to be consecutive.

Allowing multiple consumer versions to point to one pact contract file has the major advantage that verifications don’t need to be repeated when contracts haven’t changed. In the diagram above, a provider that has been verified against consumer version 0.0.0 is automatically considered to have been verified against consumer version 0.0.1. This is particularly useful when working on feature branches.

It also has the smaller advantage that it is always safe to republish the same pact contract for the same consumer application version - it will simply be a no-op. You'll see a 200 OK instead of a 201 Created in this situation.

## Provider application versions

At provider verification time, the application version of the provider is associated with the pact content for that particular provider/consumer pair:

![Provider verification](/img/version-verification.png)

This allows the broker to construct verification status for particular consumer/provider version pairs:

![Verification pairs](/img/version-pair-1.png)

This illustrates that consumer version 0.1.0 is able to communicate with provider version v2.0.0, but not v1.0.0.

Note the separation between consumer versions and provider versions. Pact verification is done against specific pact contracts, not specific consumer versions. If another consumer version with the same contract is published, then verification does not need to be repeated:

![Verification pairs](/img/version-pair-2.png)

\(Here a new version of the consumer has been published, but since the contract hasn’t changed, we know that it is able to communicate with provider version 2.0.0\)

Similarly, if a new consumer version that requests a different contract is published, then verification status is not immediately known:

![Verification pairs](/img/version-pair-3.png)

Once a new contract is published, it can be verified with the current provider version.

A provider version can be verified against multiple pact contracts. For example, after another provider version is verified, the picture might then be something like this:

![Verification pairs](/img/version-pair-4.png)

This indicates that provider version 2.0.0 is not able to communicate with consumer version v.0.2.0. However, provider version 2.0.1 is able to communicate with both the older versions, and the v.0.2.0 consumer.

## Version ordering

Application (a.k.a. pacticipant) versions are ordered by the *creation date* of the version resource. Pacts are ordered by creation date of their associated pacticipant version.

When verifying pacts, we often use the term "latest pact". The "latest pact" for an integration is available at the URL `/pacts/provider/{provider}/consumer/{consumer}/latest`, and refers to pact for the most recently created _pacticipant version_. The same URL with `/{tag}` appended refers to the pact for the most recently created pacticipant version that has the specified tag. Neither the "latest pact" nor the "latest tagged pact" use the creation dates of the pact or tag resources for ordering - it is all based on the creation date of the version resource.

The pact for the most recently created pacticipant version is almost always the same as "the most recently published pact", if you follow the pacticipant version number guidelines. If you are noticing strange behaviour with the pacts that are being returned, make sure that you are following the advice in the best practices section below.

If you republish a pact for an existing consumer version, you will not change the ordering of either the versions or the pacts. The latest pact would remain the same as it was before. If you need to republish a pact for an existing consumer version as the latest pact, you need to delete the existing consumer version resource first. This would delete all the pacts associated with that consumer version. If you are following the guidelines for pacticipant version numbers however, this situation would not generally arise.

## Best practices

The best practices for application versioning while using pact are also good best practices for application versioning generally. However, many teams find that the introduction of pact requires a move to more principled versioning - a necessary step when avoiding version hell during microservice deployment.

### Rules

1. _Ensure that your consumer version changes whenever the pact contract changes, and whenever there’s a new deployable build artifact._ This is so that specific application versions can be looked up in the pact matrix for accurate verification status without risk of race conditions.
   * For consumers, you will need a new version number when what consumer version X requires from the provider changes.
   * For providers, this is when the contract that it supports changes \(eg, when an API endpoint is added or changed\).
2. _Ensure that application version numbers are unique._ For example, a feature branch that changes the contract should not be able to have the same version number as any other branch - an application version should always identify one specific instance of application code.
3. _Ensure that your versions can be known during a release._ This is because you will want to be able to use the pact matrix to determine whether or not it is safe to release consumer version X. If you can’t tell the version number until after release, you will not be able to do this
4. If your application is both a consumer and a provider, ensure that the version number used to publish the pact is the same as the version number that is used to publish the verification results. If they differ, the data will not be correct for `can-i-deploy`.

### Guidelines

1. Have the application version number include something that identifies the point in your version control repository that will build this application. **For git, it is ideal if you either use the git commit sha \(short or long\), or include the git commit sha in your version number \(for example 0.0.10+76a39e5\)**. This has several advantages:
   * The consumer version will definitely change whenever the pact contract changes \(satisfying rule 1 above\)
   * Feature branches will automatically have different versions to master branch versions \(satisfying rule 2 above\)
   * Versions can always be known at deploy time \(satisfying rule 3 above\)
   * You can also identify and checkout the production version of the provider.
2. If you are unable to include a pointer to version control inside the application version number, then ensure that you are able to tag the version control repository with a unique application version number at build time.
3. Avoid having random data in your contracts. If your contracts contain random data, then a unique pact contract may be created when the contract has not actually changed. If this happens, you can’t take advantage of Pact’s duplicate contract detection.

### Troubleshooting

#### When running provider verifications in the provider's release pipeline, there are no pacts found for a consumer

eg. "I am publishing consumer contracts with branch 'main', and my provider verification has the consumer version selector `{ branch: "main" }`, but there is no pact being returned."

This is mostly likely due to the fact that you have an application that is both a consumer and provider, and it is publishing results to PactFlow with a non-deterministic version number (eg. including the build number in the version number)

Here is the scenario:

* App A is a consumer of App B, which is a consumer of App C. This means App B is a consumer and a provider.
* App B and App C are configured to verify the pacts of their consumers from their `main` branch ie. the consumer version selectors is set to `[ { "branch": "main" }]`. This configuration means "verify the pact from the latest application version of branch `main`". 
* App B has a webhook configured so that when App A's consumer contract changes, App B's provider verifications are executed.
* Every time a build runs, the application version used to publish to PactFlow increments _(this is the thing that is going to cause problems)_.
* App B pipeline runs, and it publishes a consumer contract with version `B.1` and branch `main`. It also runs provider verifications for App A, and publishes the results with version `B.1` and branch `main`. So far, so good.
* App A pipeline runs, and it publishes a changed consumer contract with version `A.1`
* The webhook triggers App B to execute its provider verifications. It publishes the verification results with version `B.2` and branch `main`
  * _Note: this is the same version of the codebase that published the “B.1” consumer contract, but now PactFlow thinks there are 2 different versions._
  * In PactFlow, the latest App B version on branch `main` is `B.2`, which has a verification result _but no pact_.
* App C now runs its pipeline, and attempts to verify the pact for the latest version of App B from branch `main`, however, none exists. Depending on which Pact implementation you are using, and how the verification task is configured, and whether or not there are other pacts found, at this point, the task will either exit with an error, or will pass without giving any indication that an expected pact was not present.

The solution to this problem is to use a deterministic pacticipant version number so that when the webhook-triggered provider verifications are executed, they publish the verification results with the same pacticipant version number that is used to publish the consumer contracts during the normal pipeline execution.
