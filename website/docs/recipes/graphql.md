---
id: graphql
title: GraphQL
description: How to test GraphQL APIs with Pact
---

This [blog post](https://pactflow.io/blog/contract-testing-a-graphql-api/) describes the basics of how to test GraphQL with Pact. TL;DR - GraphQL is just a HTTP API, so you can use Pact to test it just like any other HTTP API.

If you use query string based GraphQL, it should work pretty much out of the gate. If you use POST based GraphQL, you might like to create a utility function to wrap the HTTP requests to reduce some boilerplate.

Some languages have a GraphQL interface added for convenience, such as [Pact JS](https://github.com/pact-foundation/pact-js/blob/master/src/dsl/graphql.ts) and [Pact Go](https://github.com/pact-foundation/pact-go/pull/200/files). You can review their implementations to add support to your language as needed:

## Examples

* Pact JS: https://github.com/pact-foundation/pact-js/tree/master/examples/graphql
* Pact Go: https://github.com/pact-foundation/pact-go/blob/v1.x.x/examples/graphql/consumer/graphql_consumer_test.go
