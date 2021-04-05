---
title: Testing scope
---

## Watch a video

<iframe width="800" height="450" src="https://www.youtube.com/embed/3T8J8Pwu3I4" frameBorder="0" allow="autoplay; encrypted-media" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" title="YouTube video player"  allowFullScreen></iframe>

Or, watch the [full series on contract testing](https://www.youtube.com/embed/videoseries?list=PLwy9Bnco-IpfZ72VQ7hce8GicVZs7nm0i).

## Scope of a Consumer Pact Test

Ideally, the Pact tests should be "unit tests" for your client class, and they should just focus on ensuring that the request creation and response handling are correct. If you use pact for your UI tests, you'll end up with an explosion of redundant interactions that will make the verification process tedious. Remember that pact is for testing the contract used for communication, and not for testing particular UI behaviour or business logic.

Usually, your application will be broken down into a number of sub-components, depending on what type of application your consumer is \(e.g. a Web application or another API\). This is how you might visualise the coverage of a consumer Pact test:

![Scope of a consumer Pact test](/img/consumer-test-coverage.png)

Here, a _Collaborator_ is a component whose job is to communicate with another system. In our case, this is the `OrderApiClient`communicating with the external `Order Api` system. This is what we want our consumer test to inspect.

## Scope of a Provider Pact Test

On the Provider side, Pact needs to replay all of the interactions \(usually HTTP requests\) against your service. There are a number of choices that can be made here, but usually these are the choices:

* Invoke just the controller layer \(in an MVC app, or the "Adapter" in our diagram\) and stub out layers beneath.
* Execute the code up to the service/business logic layer, but mock out the data persistence layer
* Choosing a real vs mocked out database
* Choosing to hit mock HTTP servers or mocks for external services

Generally speaking, it's easiest to test the entire service and mock out external services such as downstream APIs \(which would need their own set of Pact tests\). This gives you some of the benefits of an integration test without the high costs of maintenance.

If you have a database that you can easily create a local instance of and set up/tear down data on, then it's probably easiest to use the real database (even better if you can use something like SQLite). If it is a legacy database that you can't create a local instance of then you might want to stub out your data persistence layer (or which ever layer has the best cost/benefit ratio for your situation).

Invoking just the controller/adapter layer can lead to meaningless verification results, as the response often depends on business logic that gets executed in lower layers.

This is how you might visualise the coverage of a provider Pact test:

![Provider side Pact test scope](/img/provider-test-coverage.png)
