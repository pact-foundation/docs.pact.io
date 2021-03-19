---
title: Other Languages
---

This section describes strategies you can use to test a consumer or provider where a Pact client language doesn't exist.

## Generic Consumer Testing

You will need to build your own DSL to capture the consumer interactions and serialise it into a pact file.

There are two options:

1. Using an HTTP interface (simplest)
1. Integrating to the native pact libraries via a C interface

The HTTP interface is the easiest to do, albeit it does not have support for message pact, XML and later specification versions.
The C interface is more feature complete, but is a little more complicated to integrate.

### Using HTTP and the pact-mock-service tool (v2)

We'll be using the `pact-mock-service` binary, which can be obtained by downloading the [Pact CLI tools](./cli).

You interact with the tool via HTTP calls and passing a customer `X-Pact-Mock-Service=true` header.

Because of the HTTP interaction, you can very quickly create a wrapper interface to generate pact files and ensure your consumer is compliant.

Here is an example bash script, that shows how to interact with the mock service to produce a contract: https://github.com/pact-foundation/pact-mock_service/blob/master/script/example.sh.

#### Reference code

A number of languages currently wrap the pact mock service to create user facing libraries such as [Pact JS](https://github.com/pact-foundation/pact-js/blob/master/src/httpPact.ts) and [Pact Go](https://github.com/pact-foundation/pact-go/blob/master/dsl/mock_service.go).

### Native c interface integration (v2,v3,v4 specification support)

We have exposed a fully functional [C interface](https://github.com/pact-foundation/pact-reference/tree/master/rust/pact_mock_server_ffi) that can be integrated into most modern languages, OS and architectures. Follow the documentation there for further guidance.

#### Reference code

Newer languages wrap the interface, such as [Pact C++](https://github.com/pact-foundation/pact-cplusplus) and [Pact Go](https://github.com/pact-foundation/pact-go/blob/feat/v3-ffi-verifier/v3/internal/native/mockserver/mock_server.go) (beta).

## Generic Pact Provider Verification

For `Providers` written in languages that don't have native Pact support, you can still verify that they satisfy their Pacts, using the generic [Pact Provider CLI Verification tool](https://github.com/pact-foundation/pact-reference/tree/master/rust/pact_verifier_cli).

This setup simplifies Pact Provider verification process in any language.

### How it works

_Steps_:

2. Publish consumer Pacts to the Pact broker \(or create local ones\)
1. Create an API
3. Start your API
4. Run the Pact Provider Verifier, configuring it to discover the pacts and verify the locally running provider
5. Stop your API

The verifier will then replay all of the Pact files against your running API, and will fail \(`exit 1`\) if they are not satisfied.

There is no testing DSL available so you will need to be sensitive to process exit codes when running this in a CI/CD pipeline.