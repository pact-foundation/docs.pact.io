---
title: Contract testing a GraphQL API
author: Matt Fellows
authorURL: https://twitter.com/matthewfellows
tags: [GraphQL]
keywords: [GraphQL]
date: 2018-24-07
draft: false
hide_table_of_contents: true
---

> REST is dead, long live REST

GraphQL is being hailed by many as the _new REST_ - it has type safety, a neat DSL and a great ecosystem. Perhaps best of all, it focuses on the needs of the client; consumers get the data they want, in the shape they want it - nothing more and nothing less.

I can now fetch data from my [BFF](https://samnewman.io/patterns/architectural/bff/) via my React Component with caching, error handling and state management all taken care of for me, just like so:

```js
import { Query } from "react-apollo";
import gql from "graphql-tag";

const ExchangeRates = () => (
  <Query
    query={gql`
      {
        rates(currency: "USD") {
          currency
          rate
        }
      }
    `}
  >
    {({ loading, error, data }) => {
      if (loading) return <p>Loading...</p>;
      if (error) return <p>Error :(</p>;

      return data.rates.map(({ currency, rate }) => (
        <div key={currency}>
          <p>{`${currency}: ${rate}`}</p>
        </div>
      ));
    }}
  </Query>
);
```

For some, however, this ability to define a schema and even [generate client code](https://github.com/apollographql/apollo-cli#apollo-codegengenerate-output), harkens back to the [brittle and dark ages of WSDL](http://greglturnquist.com/2017/05/23/power-rest-part-1/), whereby clients are tightly coupled to their API implementation.

Can we have our cake and it it too?

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">Do you see this as a bad thing? WSDL absolutely has its issues, but it is a definition language. CDC is an approach, which can work with WSDL, Swagger, or any definition format or wire protocol. They are orthogonal concepts</p>&mdash; Matt Fellows (@matthewfellows) <a href="https://twitter.com/matthewfellows/status/1019685135891849216?ref_src=twsrc%5Etfw">July 18, 2018</a></blockquote>
<script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
<p>&nbsp;</p>

If you look under the covers, it turns out GraphQL is actually just a simple abstraction over REST, which means we can still test GraphQL as we do with regular RESTful APIs - including using contract testing! 🙌

GraphQL (mostly) follows just a few simple rules:

1. Requests are made via an `HTTP POST`
2. GraphQL queries are sent as stringified JSON contained within a `query` property of the request
3. The response body is wrapped in the `data` sub-property, namespaced by the operation (Query or Mutation) that is being called, alongside any `errors` for the operation.

Read more about the GraphQL specification [here](https://graphql.org/learn/queries/)

Constructing a basic cURL for a simplistic `hello` operation looks something like this:

```sh
curl -X POST \
  -H 'content-type: application/json' \
  -d '{ "query": "{ hello }" }' \
  http://someapi/api
```

Whilst you can create this request using the usual Pact DSL, in our latest version of [Pact JS](https://github.com/pact-foundation/pact-js/tree/6.x.x/) (`6.x.x` or `@prerelease`) we have even created a `GraphQLInteraction` interface to simplify creating the expectations - including [variables](https://graphql.org/learn/queries/#variables) support and matching rules:

```js
  const graphqlQuery = new GraphQLInteraction()
    .uponReceiving("a hello request")
    .withQuery(`{ hello(person: $person }`)
    .withRequest({
      path: "/graphql",
      method: "POST",
    })
    .withVariables({
      person: "Sally",
    })
    .willRespondWith({
      status: 200,
      headers: {
        "Content-Type": "application/json; charset=utf-8",
      },
      body: {
        data: {
          hello: like("Hello Sally"),
        },
      },
    });
```

So there it is, Pact + GraphQL: a match made in heaven.
   