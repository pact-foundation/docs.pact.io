---
id: apigateway
title: API Gateway
description: How to use Pact with API Gateways
---

## Problem statement

The core challenge with using Pact with gateways, is that they are usually configuration based tools or pieces of infrastructure that don't store any state (they delegate to other systems). Validating pacts for them can be very cumbersome, because all of the state handling must be stubbed out for any tests to pass because the gateway doesn't actually know about the functionality. Furthermore, they then must recreate all of the scenarios to pass on to the downstream systems to ensure there are no gaps in contract coverage.

Additional context for this can be found here in the question ["Why Pact may not be the best tool for testing pass through APIs like BFFs"
](https://docs.pact.io/getting_started/what_is_pact_good_for#why-pact-may-not-be-the-best-tool-for-testing-pass-through-apis-like-bffs)

[TODO - HL DIAGRAM]

## Use case 1: Basic

**Context**

Your API Gateway has mostly non-functional responsibilities, such as border security and routing, but does one or more of:

- Authentication
- Routing to downstream systems

Common examples include:

- AWS API Gateway
- nginx
- Kong

**Solution**

The solution to this is usually just to skip the gateway as part of contract testing, and just have other tests for things like authentication. Authentication is usually a very core aspect and will be tested by other layers of your strategy anyway.

If the routes on the gateway have different prefixes/paths than the downstream service, this can be achieved using a couple of different approaches:

1. Use request filters in the provider test, to swap out the correct path. This requires the provider team having information about path mapping
2. Use a test only controller that is aware of the different public-facing request paths

Whilst this is not ideal, it usually works out to be much less effort to maintain Pact tests for the gateway itself.

[TODO: XAMPLE Project]

## Use case 2: Complex

**Problem statement**

You have an API gateway that goes beyond basic routing, border protection and Authentication - it does things like "orchestration" or "choreography" or stitches multiple services together.

In these instances, you can't employ the strategy in Use Case (1) as there is too great a risk of important aspects of the contract not represented.

The solution to 2:

1. Write contract tests from Consumer -> Gateway, and Gateway -> Provider in the diagram. That is, you need to have two sets of contract tests. This can be hard to achieve, given the overarching problem statement.
2. Use Pactflow's bi-directional contract testing feature between client <-> gateway, and verify using OAS. Gateway to downstream systems can choose BDCT or Pact, again depending on similar technical constraints.

### More on (2) where the gateway is a provider

**unit test** - if you can unit test the gateway, Pact is still an option. I’ve written unit-like tests for nginx before, and it was much more straightforward than people thought, the tests ran fast and reliably and it eventually become the backbone of the API gateway for an Aussie stock-exchange listed classifieds company.
**standard functional/integration testing** - whether a stubbed environment or otherwise
**configuration based** - Often gateways are fed a configuration file (e.g. Apigee takes a big XML blob). If you can read this in, you can potentially convert it into OAS for provider verification

### More on (2) where the gateway is a consumer

**unit test** - as above
**record/replay** - If you can setup a black box environment, you could potential use a record/replay pattern to capture scenarios, generate a pact file and then use BDCT to downstream systems.
**configuration based** - Often gateways are fed a configuration file (e.g. Apigee takes a big XML blob). If you can read this in, you can potentially convert it into a consumer contract file and avoid having to write a suite of tests

## Use case 3: Signed requests

The final piece of the puzzle in some instances, is dealing with authentication to the gateway.

**Problem statement**

In some cases, requests need to be signed with dynamic information, for example, when dealing with certain requests to [AWS](https://docs.aws.amazon.com/general/latest/gr/signing_aws_api_requests.html).

In these cases, you can't use static API tokens because you need access to the request information to construct a valid token.

[Read](https://docs.pact.io/provider/handling_auth) our strategies for handling such use cases.
