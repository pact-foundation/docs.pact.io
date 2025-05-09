---
title: Set up Checklist
---

This is a high level check list of things that need to be done when setting up an integration to be tested with Pact using the Pact Broker. As there are many Pact implementations in different languages, you will need to consult the documentation for your language to find out how to implement each step. See the [Effective Pact Setup Guide](/pact_nirvana) for an in depth explanation of the purpose of each step.

## Basic

This will get you to the stage where your consumer and provider have a pact that is generated and verified automatically, with a set up that allows you to introduce changes without breaking the provider build.

### Anyone

* [Set up](https://github.com/pact-foundation/pact_broker#for-reals) an instance of the Pact Broker or create a [PactFlow](https://pactflow.io/pricing/?utm_source=ossdocs&utm_campaign=pact_broker_set_up_checklist) account.

### Consumer team

* Write tests for the consumer that use the Pact mock provider \(these generate the pact\).
* Add a task that only runs on the CI to publish the generated pacts to the Pact Broker \(the Pact implementation for your language will provide this\).
* Configure the pacts to be published with a tag that is the dynamically determined name of the git/svn branch \(eg. `master`, `feat-foo`\).

### Provider team

* Add a pact verification test to the provider build.
* Configure the verification test to verify the pacts with the tag `master` \(or whatever the "main line" of development is called\).
* Configure the pact verification task to publish verification results only when run on the CI.
* Create a separate CI job that just does the pact verification/results publishing steps. It should accept the URL of the changed pact as a parameter \(see the [webhooks](/pact_broker/webhooks/) page for more information on this\).
* Create a webhook that triggers the pact verification CI job when a pact changes, and use the webhook template parameters to pass the URL of the changed pact into the CI job \(see the [webhooks](/pact_broker/webhooks/) page for more information on this\).

## Advanced

This set up will ensure that you can only deploy compatible versions of your consumer and provider to a given environment.

### Consumer team

* Ensure the Pact Broker knows which application versions are in each environment by adding a step to the deployment process to [tag](/pact_broker/tags#after-deploying-to-an-environment) the relevant consumer version with the name of the environment \(eg. `test`, `prod`\)
* Check that you are safe to deploy to a given environment by adding a call to [can-i-deploy](/pact_broker/can_i_deploy) before deploying.

### Provider team

* To ensure backwards compatibility between the production consumer and the latest provider, add the name of the tag for the production environment \(eg. `prod`\) to the list of tags that the provider verifies.
* Add a step to the deployment process to [tag](/pact_broker/tags#after-deploying-to-an-environment) the relevant provider version with the name of the environment \(eg. `test`, `prod`\)
* Check that you are safe to deploy to a given environment by adding a call to [can-i-deploy](/pact_broker/can_i_deploy) before deploying.

## Super advanced

This step should not be necessary if you deploy both consumer and provider at similar and regular intervals, but you may get in to a situation where you're trying to deploy a new version of the consumer to production, but `can-i-deploy` fails because you have never verified the production version of the provider against the latest version of the consumer. To get around this you can either 1. deploy the latest version of the provider \(recommended if possible\) or 2. check out the production version of the provider codebase, and run the pact verification task against the pact for the consumer version you're trying to deploy. You can find out which application version of the provider is in production by using the [`describe-version`](https://github.com/pact-foundation/pact_broker-client#describe-version) command from the [Pact Broker Client CLI](/pact_broker/client_cli). eg `pact-broker describe-version --pacticipant <APPLICATION> --latest <NAME OF YOUR PRODUCTION TAG>`.
