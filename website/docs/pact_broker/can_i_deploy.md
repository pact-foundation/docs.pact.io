---
title: Can I Deploy
description: How to use Pact + the can-i-deploy tool to ensure that you are safe to deploy your application.
toc_max_heading_level: 4
---

Before you deploy a new version of an application to a production environment, you need to know whether or not the version you're about to deploy is compatible with the versions of the other apps that already exist in that environment. The old-fashioned way of managing these dependencies involved deploying sets of pre-tested applications together, creating a bottleneck, and meaning that speedy development and testing on one application may be negated by slow development and testing on another.

The Pact way of managing these dependencies is to use the Pact "Matrix" and the `can-i-deploy` tool. The "Matrix" is the grid created when you create a table of all the consumer and provider versions that have been tested against each other using Pact. \(When a pact is published, the version of the consumer that generated the pact is recorded. When a pact is verified against a provider, the verification results are published to the Pact Broker, along with the version of the provider that verified the pact. When you put all of the consumer versions and provider versions that have been tested against each other into a table, you end up with the "Pact Matrix".\)

You can view the Pact Matrix for any pair of applications by clicking on the little grid icon for your pact in the Pact Broker index page.

Imagine the pact verification matrix for consumer Foo and provider Bar. It shows the consumer version, the provider version, and whether or not the verification passed.

| Foo version \(consumer\) | Bar version \(provider\) | Verification success? |
| :--- | :--- | :--- |
| 22 | 56 | true |
| 23 | 56 | true |
| 23 | 57 | false |
| 23 | 58 | true |
| 24 | 58 | true |
| 25 | 58 | false |

So how does this help us? Well, if we know that version 56 of Bar is already in our prod environment, looking at the matrix tells us that we are safe to deploy version 22 or 23 to prod, but not any of the versions after. Conversely, if we know that version of 24 of Foo is in prod, then we know we're safe to deploy version 58 of Bar, but not any of the versions before.

Let's see how the Pact Matrix helps us deploy safely in practice.

In the deployment script for each application that uses Pact, we need to add a step after the successful deployment that notifies the Pact Broker of the event. Depending on which version of the Pact Broker you are using, you will notify the Broker in a different way. The latest versions of the Pact Broker support the [`record-deployment`](/pact_broker/recording_deployments_and_releases/#recording-deployments) and [`record-release`](/pact_broker/recording_deployments_and_releases/#recording-releases) commands. Older versions of the Pact Broker use "tags" to keep track of deployments. See the [section below](#using-can-i-deploy-with-tags) if you are using an version of the Broker that does not support recording deployments.

Notifying the Pact Broker of a deployment looks like this:

`$ pact-broker record-deployment --pacticipant Bar --version 56 --environment production`

We're just using `production` in our example, but it's recommended to do exactly the same thing with all your pre-prod environments too.

Out matrix now looks like this:

| Foo version \(consumer\) | Bar version \(provider\) | Verification success? |
| :--- | :--- | :--- |
| 22 | 56 (production) | true |
| 23 | 56 (production) | true |
| 23 | 57 | false |
| 23 | 58 | true |
| 24 | 58 | true |
| 25 | 58 | false |

The Pact Broker already knows from its contracts what each application's dependencies are, and recording the deployments allows the Pact Broker to know which version of each application is in each environment. This means it can now determine whether or not a particular application version can be deployed safely into an environment by inspecting the matrix, and making sure that there is a successful verification result between the version that is about to be deployed, and all the versions of the integrated applications that are already in that environment.

Here is how we would check to see if we were safe to deploy Foo version 23 to production:

```
$ pact-broker can-i-deploy --pacticipant Foo --version 23 --to-environment production

Computer says yes \o/ 
 
CONSUMER | C.VERSION  | PROVIDER | P.VERSION  | SUCCESS? | RESULT#
---------|------------|----------|------------|----------|--------
Foo      | 23         | Bar      | 56         | true     | 1

 
VERIFICATION RESULTS
--------------------
1. https://pact-broker/pacts/provider/Bar/consumer/Foo/pact-version/cc4e5ae3c12482c6ffd87c4018090a7a1524c634/metadata/Y3ZuPTMzNzFmN2Y5MQ/verification-results/375 (success)

 
All required verification results are published and successful
```

\(exit code 0 means yes!\)

Here's what would happen if we tried to deploy Foo version 24 to production:

```
$ pact-broker can-i-deploy --pacticipant Foo --version 24 --to-environment production

Computer says no ¯_(ツ)_/¯
 
CONSUMER | C.VERSION  | PROVIDER | P.VERSION  | SUCCESS? | RESULT#
---------|------------|----------|------------|----------|--------
Foo      | 24         | Bar      | 56         | false    | 1

 
VERIFICATION RESULTS
--------------------
1. https://pact-broker/pacts/provider/Bar/consumer/Foo/pact-version/cc4e5ae3c12482c6ffd87c4018090a7a1524c634/metadata/Y3ZuPTMzNzFmN2Y5MQ/verification-results/375 (failure)

 
All required verification results are published and successful
```

\(exit code 1 means no\)

## Summary

To make sure you are safe to deploy an application, add the following line before deploying:

`$ pact-broker can-i-deploy --pacticipant PACTICIPANT --version VERSION --to-environment ENVIRONMENT`

and add the following line after deploying:

`$ pact-broker record-deployment --pacticipant PACTICIPANT --version VERSION --environment ENVIRONMENT`

## Further reading

Click [here](/pact_broker/recording_deployments_and_releases ) for more information on recording deployments and releases.

Other features of `can-i-deploy` include:

* Polling for verification results to be returned (useful when waiting for results to be returned from a provider build that is triggered by a webhook)
* Ignoring specific integrations (useful when a new provider is added that has not had its pact verification tests set up)
* "Dry run" mode, where the results can be viewed, but the exit code is always successful, so that you can check that your pipeline working as expected before enabling the `can-i-deploy` check fully.

Please see the [Pact Broker Client CLI documentation](/pact_broker/client_cli/readme#can-i-deploy) for an explanation of all the parameters for can-i-deploy.

## Using can-i-deploy with tags

Before first class support was added to the Pact Broker for recording deployments and releases, tags were used to keep track of which versions were deployed to each environment. Tags will continue to be supported for existing functionality, however, new features may not include support for tags. We strongly recommend using the new deployments and releases features over tags.

Tags are metadata \(just simple string values\) that are stored with the pacticipant version object in the database. A version may have many tags, and the same tag can be applied to many versions. \(You can think of the time ordered list of pacticipant versions that share the same tag as forming a "pseudo-branch" of versions.\)

The can-i-deploy tool was originally written to support specifying versions and dependencies using tags. This usage has now been superseded by first class support for [environments, deployments and releases](https://docs.pact.io/pact_broker/recording_deployments_and_releases/).

The following documentation covers the usage of can-i-deploy for users who are still using tags to track environments and deployments.

There are two ways to use `can-i-deploy` with tags. The first (recommended and most commonly used) approach is to specify just the application version you want to deploy and let the Pact Broker work out the dependencies for you. The second approach is to specify each application version explicitly. This would generally only be used if there were limitations that stopped you being able to use the first approach.

#### Specifying an application version

To specify an application (pacticipant) version you need to provide:

* the name of the application using the `--pacticipant PACTICIPANT` parameter,
* directly followed by *one* of the following parameters:
  * `--version VERSION` to specify a known application version (recommended)
  * `--latest` to specify the latest version
  * `--latest TAG` to specify the latest version that has a particular tag
  * `--all TAG` to specify all the versions that have a particular tag (eg. "all prod" versions). This would be used when ensuring you have backwards compatiblity with all production mobile clients for a provider. Note, when using this option, you need to specify dependency explicitly (see the second usage option).

Using a specific version is the easiest way to ensure you get an accurate response that won't be affected by race conditions.

#### Recommended usage - allowing the Pact Broker to automatically determine the dependencies

Prerequisite: if you would like the Pact Broker to calculate the dependencies for you when you want to deploy an application into a given environment, you will need to let the Broker know which version of each application is in that environment.

How you do this depends on the version of the Pact Broker you are running.

If you are using a Broker version where deployment versions are supported, then you would notify the Broker of the deployment of this application version like so:

    pact-broker record-deployment --pacticipant Foo --version 173153ae0 --environment test

This assumes that you have already set up an environment named "test" in the Broker.

If you are using a Broker version that does not support deployment environments, then you will need to use tags to notify the broker of the deployment of this application version, like so:

    pact-broker create-version-tag --pacticipant Foo --version 173153ae0 --tag test

Once you have configured your build to notify the Pact Broker of the successful deployment using either method describe above, you can use the following simple command to find out if you are safe to deploy (use either `--to` or  `--to-environment` as supported):

    $ pact-broker can-i-deploy --pacticipant PACTICIPANT --version VERSION
                               [--to-environment ENVIRONMENT | --to ENVIRONMENT_TAG ]
                               --broker-base-url BROKER_BASE_URL

If the `--to` or `--to-environment` options are omitted, then the query will return the compatiblity with the overall latest version of each of the other applications.

Examples:

Can I deploy version 173153ae0 of application Foo to the test environment?

    $ pact-broker can-i-deploy --pacticipant Foo --version 173153ae0 \
                               --to-environment test \
                               --broker-base-url https://my-pact-broker

Can I deploy the latest version of application Foo with the latest version of each of the applications it integrates to?

    $ pact-broker can-i-deploy --pacticipant Foo --latest \
                               --broker-base-url https://my-pact-broker

Can I deploy the latest version of the application Foo that has the tag "test" to the "prod" environment?

    $ pact-broker can-i-deploy --pacticipant Foo --latest test \
                               --to prod \
                               --broker-base-url https://my-pact-broker

#### Alternate usage - specifying dependencies explicitly

If you are unable to use tags, or there is some other limitation that stops you from using the recommended approach, you can specify one or more of the dependencies explictly. You must also do this if you want to use the `--all TAG` option for any of the pacticipants.

You can specify as many application versions as you like, and you can even specify multiple versions of the same application (repeat the `--pacticipant` name and supply a different version.)

You can use explictly declared dependencies with or without the `--to ENVIRONMENT_TAG`. For example, if you declare two (or more) application versions with no `--to ENVIRONMENT_TAG`, then only the applications you specify will be taken into account when determining if it is safe to deploy. If you declare two (or more) application versions *as well as* a `--to ENVIRONMENT`, then the Pact Broker will work out what integrations your declared applications will have in that environment when determining if it safe to deploy. When using this script for a production release, and you are using tags, it is always the most future-proof option to use the `--to` if possible, as it will catch any newly added consumers or providers.

If you are finding that your dependencies are not being automatically included when you supply multiple pacticipant versions, please upgrade to the latest version of the Pact Broker, as this is a more recently added feature.

    $ pact-broker can-i-deploy --pacticipant PACTICIPANT_1 [--version VERSION_1 | --latest [TAG_1] | --all TAG_1] \
                               --pacticipant PACTICIPANT_2 [--version VERSION_2 | --latest [TAG_2] | --all TAG_2] \
                               [--to-environment ENVIRONMENT | --to ENVIRONMENT_TAG]

Examples:

Can I deploy version Foo version 173153ae0 and Bar version ac23df1e8 together?

    $ pact-broker can-i-deploy --pacticipant Foo --version 173153ae0 \
                               --pacticipant Bar --version ac23df1e8

Can I deploy the latest version of Foo with tag "master" and the latest version of Bar with tag "master" together?

    $ pact-broker can-i-deploy --pacticipant Foo --latest master \
                               --pacticipant Bar --latest master

Mobile provider use case - can I deploy version b80e7b1b of Bar, all versions of Foo with tag "prod", and the latest version tagged "prod" of any other automatically calculated dependencies together? (Eg. where Bar is a provider and Foo is a mobile consumer with multiple versions in production, and Bar also has its own providers it needs to be compatible with.)

```
    $ pact-broker can-i-deploy --pacticipant Bar --version b80e7b1b \
                               --pacticipant Foo --all prod \
                               --to prod
```
