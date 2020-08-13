---
title: Using Pact to support UI testing
---

While we don't recommend you generate pacts from your UI tests, you can use Pact to support your UI testing using one of a few approaches.

## 1. Use the generated pact file to run a Pact HTTP stub server

You can use the [Rust](https://github.com/pact-foundation/pact-stub-server) implementation (which supports v3 Pact Specification), or the [Ruby](https://github.com/pact-foundation/pact-mock_service#stub-service-usage) stub server if you are using one of the languages that already wraps the Ruby implementation (JS, go, .Net, Python, php). See the page on [API stubs](/getting_started/stubs) for more information.

## 2. Use the generated pact file to seed a non-Pact stub server

The pact stub server is built specifically for generating contracts, for narrowly scoped tests, so it is not a fully fledged general stub server. When running the Pact stub server, you may find that it does not have the range features that you need for supporting your UI tests.

An alternative is to parse the JSON pact file, extract the interactions you are interested in for each test (each interaction is uniquely defined by description and provider state) and use it to set up stubs using the stub server of your choice. This ensures that the stubs you are using are in line with the contract.

## 3. Use shared fixtures to set up the Pact tests and seed a non-Pact stub server

Another approach to ensure your stub data is kept in line with the contract is to use shared fixture data to set up both the Pact tests, and the stubs for the UI tests.

## 4. Use a Pactflow stub

If you are using [Pactflow](https://pactflow.io?utm_source=ossdocs&utm_campaign=using_pact_to_support_ui_testing) as your Pact Broker, you have access to an hosted stub for every pact that you publish. You can read more about the hosted stubs [here](https://pactflow.io/blog/hosted-stubs/?utm_source=ossdocs&utm_campaign=using_pact_to_support_ui_testing).

## Further Reading

* Combining tools like Cypress, TestCafe, CodeceptJS with Pact: https://pactflow.io/blog/cypress-pact-front-end-testing-with-confidence/
* A cautionary tale for why you shouldn't use UI tests to generate pacts: https://pactflow.io/blog/a-disastrous-tale-of-ui-testing-with-pact/