---
title: 4. Silver - manually integrate with Pact Broker
sidebar_label: 4. Silver - manually integrate with Pact Broker
---

Now you have two different sets of tests in two different codebases. The artifacts that tie these tests together are the Pact file, and the verification results. The next step is to automate the exchange of these artifacts. At this level, you still run on your machine, but you have the consumer test publish its pact to the Pact Broker, and manually run provider verification where it gets the latest pact from the broker.

<details open>
  <summary>Silver diagram</summary>

![Silver diagram](images/silver.png)
</details>

The [Pact Broker](https://github.com/pact-foundation/pact_broker) is a service that allows your projects to exchange pacts and verification results in an automated way.

While you can use Pact without a Pact Broker, using one allows you to get the most out of Pact. Without the Broker, you will have to work out how to create your own feedback loop that lets you know the results of the pact verifications, and your pacts will not enable to you release your services independently and safely using the `can-i-deploy` tool \(more on this later\).

### Sharing the contracts with the provider team via a broker

> Sharing is caring

Now that you have created and run your consumer tests, producing a contract \(the pact file\) as an artefact.
You've shared it with the team responsible for managing the Order API.
They can confirm they meet all of the expectations set in it. 

There are multiple ways to [share pacts](getting_started/sharing_pacts.md), but the recommended approach is to use a [Pact Broker](pact_broker/) as it enables powerful automation workflows.

There are two flavours. 

- The Pact Broker is an open source tool that requires you to deploy, administer and host it yourself. 
- The Pactflow Broker is plug-and-play option, that we've created [Pactflow](https://pactflow.io/?utm_source=ossdocs&utm_campaign=five_minute_guide), a fully managed Pact Broker with additional features to simplify teams getting started and scaling with Pact.

> To get started for free, you can sign up to our Developer Plan [here](https://pactflow.io/pricing/?utm_source=ossdocs&utm_campaign=five_minute_guide_dev_plan).

We will get started with the Open source broker, at this point in the demo, and once you have a full workflow, we will get you setup with a free hosted Pact Broker from pactflow.io

> **Quick Start with Pactflow**
>
> The Pact Broker is an open source tool that requires you to deploy, administer and host it yourself. If you would prefer a plug-and-play option, we've created [Pactflow](https://pactflow.io/?utm_source=ossdocs&utm_campaign=effective_pact_setup), a fully managed Pact Broker with additional features to simplify teams getting started and scaling with Pact.
>
> Get started for free on our Developer Plan [here](https://pactflow.io/pricing/?utm_source=ossdocs&utm_campaign=effective_pact_setup_dev_plan).

### Verifying pacts

There are two reasons that a verification task will need to be run:

1. When the provider code changes

* The verification task will run as part of the normal CI/CD pipeline for the provider
* The verification task will fetch and verify all the relevant pacts from all consumers from the Pact Broker to ensure no regressions have occurred.

2. When the pact changes

* We recommend that a separate pipeline is set up to verify just the changed pact (more details on this later in the guide).

### Consumer pipeline

The following diagram shows what a fully fledged Pact supported release pipeline might look like for a consumer. During this step of the set up guide, we are just going to cover publishing the pact. The other parts of this pipeline will be covered in later steps.

<details open>
  <summary>Consumer release pipeline</summary>

![Consumer release pipeline](/img/advanced-pact-workshop-diagrams-consumer-pipeline.png)
</details>

### Provider pipeline

The following diagram shows what a fully fledged Pact supported release pipeline might look like for a provider. During this step of the set up guide, we are just going to cover the pact verification and results publication. The other parts of this pipeline will be covered in later steps.

<details open>
  <summary>Provider release pipeline</summary>

![Provider release pipeline](/img/advanced-pact-workshop-diagrams-provider-pipeline.png)
</details>

## Tasks

### A. Set up a Pact Broker

1. Read the Pact Broker [home page](https://github.com/pact-foundation/pact_broker), \(taking note of the various deployment options available to you in the Usage section\), or sign up to a hosted Developer plan at [Pactflow](https://pactflow.io/pricing/?utm_source=ossdocs&utm_campaign=effective_pact_setup_step_1).
2. Deploy a Pact Broker to a network that has access to both consumer and provider CI systems so it can trigger builds.

Useful links:

* [Installing a Docker Pact Broker](https://hub.docker.com/r/pactfoundation/pact-broker)

For each of the next steps, you will need to set the following variables to your projects

* `PACT_BROKER_BASE_URL`
* `PACT_BROKER_USERNAME` # Pact Broker Only
* `PACT_BROKER_PASSWORD` # Pact Broker Only
* `PACT_BROKER_TOKEN` # Pactflow Broker Only


Copy this file and run `docker-compose up -d`, once it is running you can visit it at http://localhost:8000 and login with pact_workshop/pact_workshop

```js reference
https://github.com/YOU54F/path-to-pact-nirvana/blob/main/Step_03_GetAPactBroker/docker-compose.yml
```

### B. Manually publish the pact to the Pact Broker

Now that things in are a fairly stable state, you can start taking advantage of the Pact Broker to manage the
communication between your provider and consumer.

* See the recommended configuration for publishing <https://docs.pact.io/consumer/recommended_configuration>
* Use one of our [Pact CLI tools](https://docs.pact.io/pact_broker/client_cli)
  1. [Docker](https://hub.docker.com/r/pactfoundation/pact-cli)
  2. [Pact Standalone CLI](https://github.com/pact-foundation/pact-ruby-standalone/releases)
  3. [Pact Broker Client (Ruby)](https://github.com/pact-foundation/pact_broker-client)
  4. [Github Actions](https://github.com/pactflow/actions)

You can read more about publishing and retrieving pacts from a Pact Broker [here](https://docs.pact.io/pact_broker/publishing_and_retrieving_pacts#publishing)

If you are using Pactflow - see <https://docs.pactflow.io/#consumer> for how to configure your consumer in each respective language implementation

Debug this until it works and looks good.

### C. Manually verify using the Pact Broker

Now you can see if you can run your provider tests, this time pulling the pact file not from your local filesystem,
but from the broker. Reconfigure your provider project to get the latest pact for each of its consumers from the broker.

If you are using Pactflow - see <https://docs.pactflow.io/#provider> for how to configure your provider in each respective language implementation

> See folder ./Step_05_VerifyYourFirstPactFromABrokerLocally

Once your pact is uploaded, grab the pact file URL.

run you test with `PACT_URL=your_url npm run test:provider`

We will setup this task to run later via a webhook, so that it runs when the consumer pact file changes. We can publish our results back to the broker.

However we would normally do that via CI, you can trigger it by setting an env var

`PACT_URL=your_url PACT_BROKER_PUBLISH_VERIFICATION_RESULTS=true npm run test:provider`

```js reference
https://github.com/YOU54F/path-to-pact-nirvana/blob/main/Step_05_VerifyYourFirstPactFromABrokerLocally/provider/provider.spec.js
```

As verification results can affect things, lets run it from CI instead, so every time we make a change in our codebase, we can upload our pacts to the broker, and verify them
