---
title: README
custom_edit_url: https://github.com/pact-foundation/pact-cplusplus/edit/master/README.md
---
<!-- This file has been synced from the pact-foundation/pact-cplusplus repository. Please do not edit it directly. The URL of the source file can be found in the custom_edit_url value above -->

![https://github.com/pact-foundation/pact-cplusplus/actions](https://github.com/pact-foundation/pact-cplusplus/workflows/Consumer%20Project/badge.svg)
[ ![Download Consumer Lib](https://api.bintray.com/packages/pact-foundation/conan/pact_cpp_consumer%3Apact/images/download.svg) ](https://bintray.com/pact-foundation/conan/pact_cpp_consumer%3Apact/_latestVersion)

C++ implementation of the consumer driven contract library [pact](https://github.com/pact-foundation/pact-specification).

From the [Ruby Pact website](https://github.com/pact-foundation/pact-ruby):

> Define a pact between service consumers and providers, enabling "consumer driven contract" testing.
>
>Pact provides an RSpec DSL for service consumers to define the HTTP requests they will make to a service provider and the HTTP responses they expect back. 
>These expectations are used in the consumers specs to provide a mock service provider. The interactions are recorded, and played back in the service provider 
>specs to ensure the service provider actually does provide the response the consumer expects.
>
>This allows testing of both sides of an integration point using fast unit tests.
>
>This gem is inspired by the concept of "Consumer driven contracts". See http://martinfowler.com/articles/consumerDrivenContracts.html for more information.


Read [Getting started with Pact](https://docs.pact.io/5-minute-getting-started-guide) for more information on how to get going.

## Contact

* Twitter: [@pact_up](https://twitter.com/pact_up)
* Slack: [Join the chat at http://slack.pact.io/](http://slack.pact.io/)
* Stack Overflow: https://stackoverflow.com/questions/tagged/pact

## Documentation

* [Main Pact documentation](https://docs.pact.io)
* Consumer DSL docs [consumer/](consumer/)
* Consumer DSL HTML docs [consumer/docs/html/](consumer/docs/html/)

## Consumer Tests

The support for consumer tests is documented in [consumer](consumer).

For an example for the consumer test DSL, have a look at [consumer_test.cpp](https://github.com/pact-foundation/pact-cplusplus/blob/master/consumer/test/src/consumer_test.cpp).
