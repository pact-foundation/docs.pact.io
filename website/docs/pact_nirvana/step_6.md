---
title: 6. Ensure backwards compatibility between the latest provider and production consumer
---

It's all very well knowing that your consumer/provider are compatible with the head versions of each other, but if you want to be able to deploy your consumer and provider independently, you also need to be sure that the latest version of the provider is compatible with the production version of the consumer. The ability to do this is a major selling point of Pact.

To achieve this, firstly, the Pact Broker needs to know which versions of each application are in which environment, and secondly, the provider needs to be configured to verify the consumer versions that are deployed to those environments. Once this is configured, the Broker can determine whether an application is safe to deploy using the [can-i-deploy](/pact_broker/can_i_deploy) tool (which will be covered in step 7).

1. For every deployment environment that you use, create a environment resource in the Pact Broker using the [create-environment](/pact_broker/client_cli#create-environment) command from the Pact Broker CLI.
1. Add a step to your deployment process so that when any application that uses Pact is deployed to an environment, the relevant pacticipant version in the broker is recorded as deployed. This functionality is provided by the [record-deployment and record-release commands](/pact_broker/recording_deployments_and_releases) in the Pact Broker CLI.
2. In the provider verification configuration, add the following [consumer version selector](/pact_broker/advanced_topics/consumer_version_selectors) if it is not already configured: `{ "deployedOrReleased": true }`.

Make sure that you use the same agreed upon names for each environment for all subsequent applications. (eg. is it `prod` or is it `production`?) Having a mix of environment names will not allow you to successfully use the `can-i-deploy` tool to ensure safe deployments.
