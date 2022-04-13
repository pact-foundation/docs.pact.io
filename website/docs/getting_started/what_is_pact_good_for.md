---
title: When to use Pact
---

> When all you have is a hammer everything looks like a nail...

Like every tool, there are situations that Pact is great for, and situations where other tools would be better. In the right situation, Pact should make testing your integrations _less painful_ than traditional integration tests. In the wrong situation, it will probably be just as painful!

## What is Pact good for?

Pact is most valuable for designing and testing integrations where:

* You \(or your team/organisation/partner organisation\) control the development of both the consumer and the provider.
* The consumer and provider are both under active development.
* The provider team can easily control the data returned in the provider's responses.
* The requirements of the consumer\(s\) are going to be used to drive the features of the provider.
* There is a small enough number of consumers for a given provider that the provider team can manage an individual relationship with each consumer team.

The primary advantages are:

* You can continuously evolve your codebases knowing that Pact will guarantee contracts are met.
* You can find out _before_ you deploy whether or not your applications will work together - there is no need to wait for slow e2e tests.

Pact is fantastic tool for developing and testing intra-organisation microservices.

## What is it not good for?

* Testing APIs where the team maintaining the other side of the integration will not also be using Pact
* Testing APIs where the consumers cannot be individually identified \(eg. public APIs\).
* Situations where you cannot load data into the provider without using the API that you're actually testing \(eg. public APIs\). [Why?](#why-pact-may-not-be-the-best-tool-for-testing-public-apis)
* Situations where you cannot control the data being used to generate the provider's responses.
* Testing new or existing providers where the functionality is not being driven or altered by the needs of particular consumers \(eg. a public API or an OAuth provider where the API is completely stable\)
* Testing providers where the consumer and provider teams do not have good communication channels.
* Performance and load testing.
* [Functional testing](../consumer/contract_tests_not_functional_tests.md) of the provider - that is what the provider's own tests should do. Pact is about checking the contents and format of requests and responses.
* Testing "pass through" APIs, where the provider merely passes on the request contents to a downstream service without validating them. [Why?](#why-pact-may-not-be-the-best-tool-for-testing-pass-through-apis-like-bffs)
* Use as a general purpose mocking or stubbing tool for browser driven tests. [Why?](/consumer#avoid-using-pact-for-tests-that-involve-the-ui)

### Why Pact may not be the best tool for testing public APIs

If you use Pact to test a public API, the only way to set up the right provider state is to use the very API that you're actually testing, which will make the tests slower and more brittle compared to the "normal" pact verification tests. Resetting the state between interactions may be quite slow, as you may need to iterate over many APIs to clear previously created data. An alternative might be to modify requests so that they work on a new context each time.

If this is still a better situation for you than integration testing, or using another tool, then you can give it a go! We strongly recommend you do not try to rely on state set up by previous interactions, as this will inevitably lead to flakey tests with dependencies that are hard to reason about. Reliably ordering the interactions within the pact or during replay is not supported in all implementations.

### Why Pact may not be the best tool for testing pass through APIs like BFFs

During pact verification, Pact does not test the side effects of a request being executed on a provider, it just checks that the response body matches the expected response body. If your API is merely passing on a message to a downstream system (eg. a queue) and does not validate the contents of the body before doing so, you could send anything you like in the request body, and the provider would respond the same way. The "contract" that you really want is between the consumer and the downstream system. Checking that the provider responded with a 200 OK does not give you any confidence that your consumer and the downstream system will work correctly in real life.

What you really need is a "non-HTTP" pact between your consumer and the downstream system. Check out this [gist](https://gist.github.com/bethesque/0ee446a9f93db4dd0697) for an example of how to use the Pact contract generation and matching code to test non-HTTP communications.

## If you are unsure

If you're unsure whether Pact will be valuable for your team, read [this page](../faq/convinceme.md).


