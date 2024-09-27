---
title: Debugging webhooks
---

Webhooks are executed when either the pact content changes, or a verification is published.

## Creating webhooks

First, check the [webhook template library](/pact_broker/webhooks/template_library) to see if there is an example for the webhook you want to create.

The best process to create a new webhook is to first get the API call that the webhook will execute working outside the Pact Broker, using a tool like curl or Postman. If you use curl, you can then take the arguments that you passed to the command, and use them to create the webhook using the [Pact Broker Client CLI](/pact_broker/client_cli/readme#create-webhook). If you are using a token or username/password, be aware that they are stored unencrypted in the Pact Broker database, so make sure you use a token or account with limited permissions. If you are using [PactFlow](https://pactflow.io/?utm_source=ossdocs&utm_campaign=debugging_webhooks) then you can store the credential(s) in a [secret](https://docs.pactflow.io/docs/user-interface/settings/secrets/).

## Testing webhook execution

### PactFlow

Click on the Settings icon, and then select the Webhooks tab.

Select the webhook you want to test, and click "EDIT". Scroll to the bottom of the screen, and the click the "TEST" button.

### Pact Broker

You can find the full list of webhooks at `/webhooks` \(or open the API Browser, and click on the `GET` button for the `pb:webhooks` relation\).

Navigate to the webhook you want to test by clicking on the `GET` button for the desired webhook under the `pb:webhooks` relation in the Links section.

Click on the `NON-GET` button for the `pb:execute` relation, and then click `Make Request`. The execution logs will be returned on the next page.

## Identifying why a webhook did or did not get triggered

Search in the application logs for the consumer version number for which your pact was published. You'll find the line where it indicates that a pact is being published for that consumer version number. The next few lines in the logs will explain why a webhook did or did not get fired.

eg.

* "Pact content has not changed since previous version, not triggering webhooks for changed content"
* "No enabled webhooks found for consumer "x" and provider "y" and event contract_published"
* "Webhook triggered for the following reasons: first time pact published with consumer version tagged feat/y"
* "Scheduling job for webhook with uuid ap7c1tk-AdEYyphWBVieIg"

If you can't see these logs, set the `PACT_BROKER_LOG_LEVEL` to `DEBUG` and try again (you may wish to set the `PACT_BROKER_SQL_LOG_LEVEL` to `none` to reduce the SQL logging noise).

## Viewing logs for past webhook executions

The second column from the right on the index page shows the webhook status for each pact. The colour indicates the status, and the text indicates the last run time.

If you click on the link in that column, you'll get the webhooks status resource for that Pact. If there has been an error, you'll find a `pb:error-logs` relation for the error logs in the Links section. Click on the "GET" button to see them.

The properties section will tell you how many of the webhooks succeeded for the last trigger event, and how many failed.

The Embedded Resources section will give you links to the execution logs.

By default, for security purposes, the execution logs will be hidden. You will need to configure the whitelist to see the logs. If you are using one of the [Docker images](/pact_broker/docker_images) you can configure the whitelist via environment variables, documented [here](/pact_broker/configuration/settings#webhook_host_whitelist). The documentation that explains how the whitelists work is [here](/pact_broker/configuration/features#webhooks) (note that the example code shows how to configure the underlying Ruby application, however, if you are using a Docker image, you need to use the environment variables in the first link).

If you see no evidence of any attempted executions, look in the application logs. For every pact publication, there are detailed logs that explain why a webhook is/isn't fired for a particular publication. See [Identifying why a webhook did or did not get triggered](#identifying-why-a-webhook-did-or-did-not-get-triggered)
