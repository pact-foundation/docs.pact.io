---
title: Other Languages
---

This section describes strategies you can use to test a consumer or provider where a Pact client language doesn't exist.

## Generic Consumer Testing

You will need to build your own DSL to capture the consumer interactions and serialise it into a pact file.

There are two options:

1. Integrating to the native pact libraries via a C interface
1. Using an HTTP or CLI interface via a standalone executable

The interface via HTTP or CLI is simpler, however the C interface will be more performant, but is a little more complicated to integrate.

### Using HTTP and the pact-mock-server tool

We'll be using the `pact-mock-server` via the `pact mock` command, which can be obtained by downloading the [Pact CLI tools](./cli/pact-cli).

You interact with the tool via HTTP calls or CLI calls.

Because of the HTTP interaction, you can very quickly create a wrapper interface to generate pact files and ensure your consumer is compliant.

Here is an example bash script, that shows how to interact with the mock service to produce a contract: <https://github.com/pact-foundation/pact-cli/blob/main/examples/mock_example-rust.sh>.

#### Reference code

Most languages wrap the native interface, such as [Pact Go](https://github.com/pact-foundation/pact-go/blob/master/internal/native/mock_server.go), Pact-JS, Pact-Go, Pact-Net, Pact-Python & Pact-Ruby.

### Native c interface integration (v2,v3,v4 specification support)

We have exposed a fully functional [C interface](https://github.com/pact-foundation/pact-reference/tree/master/rust/pact_ffi) that can be integrated into most modern languages, OS and architectures. Follow the documentation there for further guidance.

## Generic Pact Provider Verification

For `Providers` written in languages that don't have native Pact support, you can still verify that they satisfy their Pacts, using the generic [Pact Verifier tool](/cli/pact-verifier).

This setup simplifies Pact Provider verification process in any language.

### How it works

_Steps_:

1. Publish consumer Pacts to the Pact broker \(or create local ones\)
1. Create an API
1. Start your API
1. Run the Pact Provider Verifier, configuring it to discover the pacts and verify the locally running provider
1. Stop your API

The verifier will then replay all of the Pact files against your running API, and will fail \(`exit 1`\) if they are not satisfied.

There is no testing DSL available so you will need to be sensitive to process exit codes when running this in a CI/CD pipeline.

Here is an example bash script, that shows how to interact with the verifier to verify a contract: <http://github.com/pact-foundation/pact-cli/blob/main/examples/verifier_example-rust.sh>.