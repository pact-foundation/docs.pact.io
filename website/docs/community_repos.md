---
title: Community Projects
---

There are loads of awesome Pact projects in the wild, if you have seen one, please add it to the list. You can scroll down to the bottom of the page, and click `Edit this page`.

Please try to add

- type (full workflows / consumer / provider)
- transport mechanism (HTTP, Kafka, Soap, etc)
- language of implementation (split by consumer/provider if including both)
  
## Full Workflows

- [Contract test example](https://github.com/PauloGoncalvesBH/contract-test-nirvana)
  - Description: A diamond level contract testing implementation is exemplified in this repository.
  - Consumer Language: JavaScript
  - Provider Language: JavaScript
  - Transport Mechanism: HTTP
  - Author: [Paulo Gonçalves](https://github.com/PauloGoncalvesBH)
- [Pact Workshop in Node.js](https://github.com/lirantal/pact-workshop-consumer-nodejs)
  - Description: A full workshop going through implementing YouMDB - a movies database service with a movies and reviews service
  - Consumer Language: JavaScript
  - Provider Language: JavaScript
  - Transport Mechanism: HTTP
  - Author: [Liran Tal](https://github.com/lirantal)
- [Quarkus Superheroes Sample](https://github.com/quarkusio/quarkus-super-heroes)
  - Description: This is a sample application demonstrating Quarkus features and best practices. The application allows superheroes to fight against supervillains, it features multi-protocol, with the RESTful services tested with Pact
  - Consumer Language: Java
  - Provider Language: Java
  - Transport Mechanism: HTTP
  - Supporting material
    - [How to avoid common pitfalls with modern microservices testing](https://www.youtube.com/watch?v=vYwkDPrzqV8) (Video, [slides](https://hollycummins.com/modern-microservices-testing-pitfalls-devoxx/) also available)
  - Author: [QuarkusIO](https://github.com/quarkusio)
- [pact-ruby-demo](https://github.com/AndrewJanuary/pact-ruby-demo)
  - Description: A demonstration of Consumer Driven Contract Testing for a message based (non-HTTP) producer and consumer relationship using the [pact-message-ruby gem](https://github.com/pact-foundation/pact-message-ruby).
  - Consumer Language: Ruby
  - Provider Language: Ruby
  - Transport Mechanism: Message
  - Author: [Andrew January](https://github.com/AndrewJanuary)
- [Provider API Example](https://github.com/sergeyklay/provider-pact-example) and [Consumer API Example](https://github.com/sergeyklay/consumer-pact-example)
  - Description: Provider- and Consumer-side demo using Consumer Driven Contract Testing
  - Consumer Language: Python
  - Provider Language: Python
  - Transport Mechanism: HTTP
  - Author: [Serghei Iakovlev](https://github.com/sergeyklay)
- [Ecommerce Microservices Testing Example](https://github.com/teixeira-fernando/EcommerceApp)
  - Description: Exploring QA strategies for microservices with Synchronous and Asynchronous communication. Include examples of message-based and HTTP contracts
  - Consumer Language: Java
  - Provider Language: Java
  - Transport Mechanism: HTTP and Message
  - Author: [Fernando Teixeira](https://github.com/teixeira-fernando)
- [pacto](https://github.com/pfichtner/pacto)
  - Description: A Java library for generating Pact JVM contracts directly from DTO method invocations, supporting nested models, strict and lenient matching modes, and rich matcher definitions while eliminating duplication between DTOs and Pact DSLs.
  - Type: Primarily consumer (also supports provider workflows)
  - Transport Mechanism: Any / transport-agnostic
  - Consumer Language: Java
  - Provider Language: Java
  - Author: [Peter Fichtner](https://github.com/pfichtner)
