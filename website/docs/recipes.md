---
id: recipes
title: Overview
description: Recipes and pre-built integrations to test common scenarios in Pact
---

Recipes and pre-built integrations to test common scenarios in Pact

| Recipe/Integration                                     | Description                                                                                                                         |
| ------------------------------------------------------ | ----------------------------------------------------------------------------------------------------------------------------------- |
| [Optional Fields](/recipes/optional)                             | How to test payloads with optional fields                                                                      |
| [GraphQL](/recipes/graphql)                             | Strategies for testing GraphQL endpoints (example with Apollo)                                                                      |
| [API Gateway](/recipes/apigateway)                      | Strategies for dealing with API Gateways, such as AWS API Gateway, Kong etc.                                                        |
| [AWS Signed Requests](/recipes/awssignedrequests)                      | How to test services AWS services that use [signed requests](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html)                                                        |
| [Lambda/FaaS (Asynchronous)](/recipes/lambdaasync)      | How to write contract tests for asynchronous lambda functions / FaaS                                                                |
| [Lambda (HTTP)](/recipes/lambdahttp)                    | How to write contract tests for HTTP based lambdas with AWS SAM                                                                     |
| [ELT processes / file transfers](https://dius-au.medium.com/contract-testing-serverless-and-asynchronous-applications-part-2-76b5576c789e) | How to use Message Pact to test JSON file transfers to S3, Dynamo |
| [Cypress](/recipes/cypress)                             | Best practices for integrating Pact with Cypress, and converting your cypress `cy.route()` / `cy.intercept()` calls into pact files |
| [MSW](https://github.com/you54f/msw-pact)              | Library for integrating MSW with Pact                                                                                               |
| [NestJS](https://github.com/omermorad/nestjs-pact)     | Library for integrating Pact with NestJS                                                                                            |
| [Kafka](/recipes/kafka)                                 | How to test Kafka messages with Pact                                                                                                |
| [Jest](https://github.com/pact-foundation/jest-pact)   | A Pact adaptor for to allow you to easily run tests with Jest                                                                       |
| [Mocha](https://github.com/pact-foundation/mocha-pact) | A Pact adaptor for to allow you to easily run tests with Mocha                                                                      |
| [MUnit (Mule4) with Pact](/recipes/munit) | How to use Pact for testing MuleSoft (Mule 4) APIs with MUnit                                                                     |
| [Cypress](https://docs.pactflow.io/docs/examples/cypress/readme)                                                   | How to safely combine the use of Cypress and Pact tests                                                                                               |
| AWS Lambda (HTTP)                                                                                                  | How to test a lambda function behind an HTTP API Gateway                                                                                              |
| [AWS Lambda (Asynchronous)](https://docs.pactflow.io/docs/examples/aws/sns/consumer/readme)                        | How to test a lambda function that communicates asynchronously                                                                                        |
| [gRPC / Protobufs](https://medium.com/@ivangsa/consumer-driven-contract-testing-for-grpc-pact-io-d60155d21c4c)     | Example implementation of gRPC and Protobufs with Pact. See also https://pact.canny.io/feature-requests/p/support-grpc to track the official support. |
| [Pact Nirvana reference implementation (Portugese)](https://github.com/PauloGoncalvesBH/nirvana-teste-de-contrato) | Implementation of the [Pact nirvana CI/CD setup](/pact_nirvana) 