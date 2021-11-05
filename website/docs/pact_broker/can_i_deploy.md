---
title: Can I Deploy
description: How to use Pact + the can-i-deploy tool to ensure that you are safe to deploy your application.
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

When an application version is deployed to an environment, the relevant pacticipant version needs to be "tagged" with the name of that environment, so that the Pact Broker knows what is deployed where. Let's see what that looks like in code.

`$ pact-broker create-version-tag --pacticipant Bar --version 56 --tag production`

This line would be added to the end of the deployment script for any application that uses Pact. There's no need to untag the previous `production` version, as we specify "the latest `production` version", rather than "all `production` versions" in our commands. We're just using `production` in our example, but it's recommended to do exactly the same thing with all your pre-prod environments too.

When using the `can-i-deploy` command in conjunction with tags, use the parameter `--to ENVIRONMENT` rather than `--to-environment ENVIRONMENT`.

eg.

`$ pact-broker can-i-deploy --pacticipant Foo --version 23 --to production`
