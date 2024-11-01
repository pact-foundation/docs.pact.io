---
title: Learning Objectives
sidebar_label: Learning Objectives
---

If running this as a team workshop format, you may want to take a look through the learning objectives, its a big list.

Don't worry, we will recap each one as you move through the steps. Scoll down, and click requirements to move to the next section.

## Learning Outcomes

| Step                                                                 | Title                                                   | Concept Covered                          | Learning objectives                                                                                                                                                                                              | Further Reading                                                                                                                                           |
|----------------------------------------------------------------------|---------------------------------------------------------|------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------|
| [step 1](https://github.com/pact-foundation/pact-workshop-message?tab=readme-ov-file#step-1---create-consumer-subscriber)  | Create our consumer before the Provider API even exists | Consumer-driven design with Hexagonal Architecture                  | <ul><li>Understand use case</li></ul>                                                                                                                                                                             | <ul><li>https://martinfowler.com/articles/consumerDrivenContracts.html</li></ul>|                                                                         |
| [step 2](https://github.com/pact-foundation/pact-workshop-message?tab=readme-ov-file#step-2---create-consumer-pact-test)     | Write a Pact test for our consumer                      | Consumer side pact test                  | <ul><li>Understand basic Consumer-side Pact concepts</li><li>Understand "Matchers" to avoid test data brittleness</li><li>Demonstrate that Pact tests are able to catch a class of integration problems</li></ul> | <ul><li>https://docs.pact.io/getting_started/how_pact_works#consumer-side</li><li>https://docs.pact.io/best_practices/consumer</li></ul>| |
| [step 3](https://github.com/pact-foundation/pact-workshop-message?tab=readme-ov-file#step-3---create-provider-publisher)  | Create our Provider with Ports & Adapters in mind          | Hexagonal Architecture                  | <ul><li>Understand how to scaffold an provider application, with ports and adapters in mind</li><li>Highlight our area of interest for our Pact message verifications</li></ul>                                               | <ul><li>https://docs.pact.io/getting_started/how_pact_works#provider-producer-side</li></ul>                                                       |
| [step 4](https://github.com/pact-foundation/pact-workshop-message?tab=readme-ov-file#step-4---create-provider-pact-test)   | Verify the consumer pact with the Provider API          | Provider side pact test                  | <ul><li>Understand basic Provider-side Pact concepts</li><li>Place provider side testing in a broader testing context (e.g. where it fits on the pyramid)</li></ul>                                               |                                                    |


Further reading

- https://docs.pact.io/getting_started/how_pact_works#non-http-testing-message-pact
- https://dius.com.au/2017/09/22/contract-testing-serverless-and-asynchronous-applications/
- https://dius.com.au/2018/10/01/contract-testing-serverless-and-asynchronous-applications-part-2/
- https://alistair.cockburn.us/hexagonal-architecture/
- https://netflixtechblog.com/ready-for-changes-with-hexagonal-architecture-b315ec967749
- https://docs.aws.amazon.com/prescriptive-guidance/latest/cloud-design-patterns/hexagonal-architecture.html