---
title: Case Study - Gov.UK Pay
---

## Gov.UK Pay

<img src="/img/logos/brand/govuk.png" alt="Government Digital Services Logo" width="500" />

### Overview

The [Government Digital Service team](https://pactflow.io/case-studies/Our%20job%20is%20digital%20transformation%20of%20government) is responsible for the digital transformation of the UK Government. One of the services they provide is their [Pay platform](https://www.payments.service.gov.uk/), which enables other departments to take and manage payments on a fully PCI and government standards compliant platform.

### Challenges

Previously, to release a change, they used to run end-to-end tests to verify the entire system. This meant spinning up their microservices architecture in a dockerized environment to run tests. They found that doing it this way was:

- time-consuming
- unsustainable
- resource intensive
- not giving them the benefits of moving to a microservice architecture as they were still testing as a distributed monolith

### Outcomes

> By switching to contract testing we now have confidence that any service we deploy will always be compatible with the things it needs to connect with

Now, they:

- only use end-to-end tests for new functionality when it is unavoidable
- are confident deployments will not introduce breaking changes between services
- are in a position to replace expensive end-to-end testing with Pact testing where applicable

### Further material

- <https://technology.blog.gov.uk/2019/01/29/lessons-learnt-using-contract-testing-in-gov-uk-pay/>

___
