---
title: Introduction
description: Fast and reliable testing for your APIs and microservices during development. Safety during deployment.
slug: /
---

Pact is a code-first tool for testing HTTP and message integrations using `contract tests`. Contract tests assert that inter-application messages conform to a shared understanding that is documented in a contract. Without contract testing, the only way to ensure that applications will work correctly together is by using expensive and brittle integration tests.

Do you [set your house on fire to test your smoke alarm?](https://dius.com.au/2014/05/19/simplifying-micro-service-testing-with-pacts/) No, you test the contract it holds with your ears by using the testing button. Pact provides that testing button for your code, allowing you to safely confirm that your applications will work together without having to deploy the world first.

To view an animated step-by-step explanation of how Pact works, check out this [How Pact works](https://pactflow.io/how-pact-works?utm_source=ossdocs&utm_campaign=getting_started) (external↗️) page.

<div align="center">
  <a href="https://pactflow.io/how-pact-works?utm_source=ossdocs&utm_campaign=getting_started">
    <img src="/img/how-pact-works/summary.png" alt="How Pact works preview"></img>
  </a>
</div>

## Watch a video

<iframe width="800" height="450" src="https://www.youtube.com/embed/IetyhDr48RI" frameBorder="0" allow="autoplay; encrypted-media" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" title="YouTube video player"  allowFullScreen></iframe>

Or, watch the [full series on contract testing](https://www.youtube.com/embed/videoseries?list=PLwy9Bnco-IpfZ72VQ7hce8GicVZs7nm0i).
## Ready to jump into the code already?

Get started with our [5 minute guide](5-minute-getting-started-guide.md).

## What is contract testing?

_**Contract testing** is a technique for testing an integration point by checking each application in isolation to ensure the messages it sends or receives conform to a shared understanding that is documented in a "contract"._

For applications that communicate via HTTP, these "messages" would be the HTTP request and response, and for an application that used queues, this would be the message that goes on the queue.

In practice, a common way of implementing contract tests \(and the way Pact does it\) is to check that all the calls to your test doubles [return the same results](https://martinfowler.com/bliki/ContractTest.html) as a call to the real application would.

## When would I use contract testing?

Contract testing is immediately applicable anywhere where you have two services that need to communicate - such as an API client and a web front-end. Although a single client and a single service is a common use case, contract testing really shines in an environment with many services \(as is common for a microservice architecture\). Having well-formed contract tests makes it easy for developers to avoid version hell. Contract testing is the killer app for microservice development and deployment.

## Contract testing terminology

In general, a contract is between a _consumer_ \(for example, a client that wants to receive some data\) and a _provider_ \(for example, an API on a server that provides the data the client needs\). In microservice architectures, the traditional terms _client_ and _server_ are not always appropriate -- for example, when communication is achieved through message queues. For this reason, we stick to _consumer_ and _provider_ in this documentation.

## Consumer Driven Contracts

Pact is a code-first [_consumer-driven_](http://martinfowler.com/articles/consumerDrivenContracts.html) contract testing tool, and is generally used by developers and testers who code. The contract is generated during the execution of the automated consumer tests. A major advantage of this pattern is that only parts of the communication that are actually used by the consumer\(s\) get tested. This in turn means that any provider behaviour not used by current consumers is free to change without breaking tests.

Unlike a schema or specification \(eg. OAS\), which is a static artifact that describes all possible states of a resource, a Pact contract is enforced by executing a collection of test cases, each of which describes a single concrete request/response pair - Pact is, in effect, "contract by example". Read more on the [difference between schema testing and contract testing](https://pactflow.io/blog/contract-testing-using-json-schemas-and-open-api-part-1/).

## Provider contract testing

The term "contract testing", or "provider contract testing", is sometimes used in other literature and documentation in the context of a standalone provider application (rather than in the context of an integration). When used in this context, "contract testing" means: a technique for ensuring a provider's actual behaviour conforms to its documented contract (for example, an Open API specification). This type of contract testing helps avoid integration failures by ensuring the provider code and documentation are in sync with each other. On its own, however, it does not provide any test based assurance that the consumers are calling the provider in the correct manner, or that the provider can meet all its consumers' expectations, and hence, it is not as effective in preventing integration bugs.

Whenever the Pact documentation references "contract testing" it is referring to "integration contract testing" as described previously in this page.

## Next steps

To learn by doing, get started with our [5 minute guide](5-minute-getting-started-guide.md).

