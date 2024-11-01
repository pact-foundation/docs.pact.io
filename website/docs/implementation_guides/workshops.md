---
title: Hands on learning
---

## Video Training

**Introduction to Pact (via PactFlow)**

<iframe width="800" height="450" src="https://www.youtube.com/embed/videoseries?list=PLwy9Bnco-IpfZ72VQ7hce8GicVZs7nm0i" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

Watch the [introduction to contract testing with Pact](https://www.youtube.com/embed/videoseries?list=PLwy9Bnco-IpfZ72VQ7hce8GicVZs7nm0i) series on Youtube.

### Courses
#### Test Automation University

A great starting point is this [Contract Testing With Pact](https://testautomationu.applitools.com/pact-contract-tests/index.html) course published on Test Automation University

#### Udemy

A step by step guide using Pact JS & Pact .NET [Introduction to Contract Testing](https://www.udemy.com/course/introduction-to-contract-testing-with-pact/learn) course published on Udemy

## Pact workshops - from 0 to Pact in ~2 hours

These hands-on labs walk you through an example problem from start to finish, exploring most concepts that Pact supports.

* [CI/CD](https://docs.pactflow.io/docs/workshops/ci-cd)
* [JS](https://github.com/pact-foundation/pact-workshop-js)
* [Golang](https://github.com/pact-foundation/pact-workshop-go)
* [JVM - Gradle/Junit4/Springboot](https://github.com/pact-foundation/pact-workshop-jvm-spring)
* [JVM - Maven/Junit5/Springboot](https://github.com/pact-foundation/pact-workshop-Maven-Springboot-JUnit5)
* [Ruby](https://github.com/DiUS/pact-workshop-ruby-v2)
* [.NET](https://github.com/pact-foundation/pact-workshop-dotnet)
* [Android](https://github.com/DiUS/pact-workshop-android)

## Examples

We have created a number of example projects that you can use as references for your rolling out your contract-testing initiatives.

All examples can be found over at https://docs.pactflow.io/docs/examples/

### Consumers

| Language | Use Case | Framework/Tech | Description |
| --------- | ------- | ----------- | -------------- |
| JS/NodeJS | Web | React | React JS website relying on a Products API |
| JS/NodeJS | Web | Cypress | Example demonstrating how Cypress could be used to generate consumer pacts |
| JS/NodeJS | AWS/SNS/Messages | SNS Lambda | AWS Lambda SNS Consumer |
| Java | Messages |  Kafka | Java Kafka consumer |
| NodeJS | Messages | Kafka | NodeJS  Kafka consumer |
| Java | SOAP Java | Java | SOAP API consumer (_note: only compatible with the SOAP provider_) |
| .NET | API .NET | .NET Products API consumer |
| Golang | API | Golang | Go API Client |


### Providers

| Language | Use Case | Framework/Tech | Description |
| --------- | ------- | ----------- | -------------- |
| JS/NodeJS | API | Express JS | ExpressJS API provider |
| JS/NodeJS | AWS/SNS/Messages | ExpressJS / AWS SNSreadme) | AWS Lambda SNS Provider |
| Java | API | Spring Boot | Java Spring Boot API provider |
| Java | Messages | Kafka | Java Kafka message provider |
| Java | SOAP | Java  | Java SOAP API provider (_note: only compatible with the SOAP consumer_) |
| .NET | API | .NET | .NET API provider |
| Golang | API | Golang | Gin API Provider |
