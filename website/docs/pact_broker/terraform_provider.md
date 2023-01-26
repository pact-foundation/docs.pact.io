---
title: Terraform Provider
description: Automating Pact Broker with Terraform
---


If infrastructure as code is your thing, we have created a Terraform provider to automate some aspects of your Pact Broker setup.

### Using the Provider

Here is a list of resources available for configuration:

| Plugin      | Type     | Platform Support       | Description |
| ----------- | -------- | ---------------------- | ----------- |
| [Pact](https://github.com/pactflow/terraform-provider-pact/blob/master/docs/index.md)        | Provider | Pact Broker + PactFlow | Configures a target Pact Broker (such as a pactflow.io account) |
| [Pacticipant](https://github.com/pactflow/terraform-provider-pact/blob/master/docs/resources/pacticipant.md)  | Resource | Pact Broker + PactFlow | Create applications (known as Pacticipants) |
| [Webhook](https://github.com/pactflow/terraform-provider-pact/blob/master/docs/resources/webhook.md)     | Resource | Pact Broker + PactFlow | Configures a webhook to trigger on certain platform events |
| [Secret](https://github.com/pactflow/terraform-provider-pact/blob/master/docs/resources/secret.md)      | Resource | PactFlow               | Create an encrypted secret for use in Webhooks |
| [API Token](https://github.com/pactflow/terraform-provider-pact/blob/master/docs/resources/token.md)   | Resource | PactFlow               | Manage PactFlow API Tokens |
| [Users](https://github.com/pactflow/terraform-provider-pact/blob/master/docs/resources/user.md)   | Resource | PactFlow               | Manage PactFlow Users |
| [Roles](https://github.com/pactflow/terraform-provider-pact/blob/master/docs/resources/role.md)   | Resource | PactFlow               | Manage PactFlow Roles |
| [Teams](https://github.com/pactflow/terraform-provider-pact/blob/master/docs/resources/team.md)   | Resource | PactFlow               | Manage PactFlow Teams |
| [Authentication Settings](https://github.com/pactflow/terraform-provider-pact/blob/master/docs/resources/authentication.md)   | Resource | PactFlow               | Manage PactFlow Authentication (Github, Google etc.) |

> Learn more at the official [terraform registry](https://registry.terraform.io/providers/pactflow/pact/latest)
