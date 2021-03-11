---
title: Terraform Provider
description: Automating Pact Broker with Terraform
---


If infrastructure as code is your thing, we have created a Terraform provider to automate some aspects of your Pact Broker setup.

### Using the Provider

Here is a list of resources available for configuration:

| Plugin      | Type     | Platform Support       | Description |
| ----------- | -------- | ---------------------- | ----------- |
| [Pact](docs/index.md)        | Provider | Pact Broker + Pactflow | Configures a target Pact Broker (such as a pactflow.io account) |
| [Pacticipant](docs/resources/pacticipant.md)  | Resource | Pact Broker + Pactflow | Create applications (known as Pacticipants) |
| [Webhook](docs/resources/webhook.md)     | Resource | Pact Broker + Pactflow | Configures a webhook to trigger on certain platform events |
| [Secret](docs/resources/secret.md)      | Resource | Pactflow               | Create an encrypted secret for use in Webhooks |
| [API Token](docs/resources/token.md)   | Resource | Pactflow               | Manage Pactflow API Tokens |
| [Users](docs/resources/user.md)   | Resource | Pactflow               | Manage Pactflow Users |
| [Roles](docs/resources/role.md)   | Resource | Pactflow               | Manage Pactflow Roles |
| [Teams](docs/resources/team.md)   | Resource | Pactflow               | Manage Pactflow Teams |
| [Authentication Settings](docs/resources/authentication.md)   | Resource | Pactflow               | Manage Pactflow Authentication (Github, Google etc.) |

> Learn more at the official [terraform registry](https://registry.terraform.io/providers/pactflow/pact/latest)
