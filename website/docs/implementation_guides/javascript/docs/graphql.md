---
title: GraphQL API
custom_edit_url: https://github.com/pact-foundation/pact-js/edit/master/docs/graphql.md
---
<!-- This file has been synced from the pact-foundation/pact-js repository. Please do not edit it directly. The URL of the source file can be found in the custom_edit_url value above -->

GraphQL is simply an abstraction over HTTP and may be tested via Pact. 

## Support

| Role      | Interface            | Supported? |
|:---------:|:--------------------:|:----------:|
| Consumer | `Pact` / `PactV4`     |     ✅      |
| Consumer | `MessageConsumerPact` |     ❌      |
| Consumer | `PactV3`              |     ✅      |
| Consumer | `PactV4`              |     ✅      |
| Provider | `Verifier`            |     ✅      |
| Provider | `MessageProviderPact` |     ❌      |

### API

There are two wrapper APIs available for GraphQL specific testing: `GraphQLInteraction` and `ApolloGraphQLInteraction` that can be used as a drop-in replacement for the `addInteraction` method.

These are both lightweight wrappers over the standard DSL in order to make GraphQL testing a bit nicer.
