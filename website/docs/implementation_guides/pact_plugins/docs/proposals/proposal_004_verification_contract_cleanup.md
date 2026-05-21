---
title: Verification contract cleanup (Draft)
sidebar_label: Verification contract cleanup (Draft)
custom_edit_url: https://github.com/pact-foundation/pact-plugins/edit/main/docs/proposals/004_Verification_contract_cleanup.md
---
<!-- This file has been synced from the pact-foundation/pact-plugins repository. Please do not edit it directly. The URL of the source file can be found in the custom_edit_url value above -->

> [!NOTE]
> **Implementation phase:** Phase 1 (foundational). Deliver alongside [005](/implementation_guides/pact_plugins/docs/proposals/proposal_005_plugin_capability_negotiation_and_versioning) before any other V2 interface work begins. See the [proposals README](/implementation_guides/pact_plugins/docs/proposals/readme) for the full delivery order.

## Summary

Refine the plugin verification API so plugins receive the specific interaction data they need, instead of having to
re-parse a full Pact document and locate the target interaction themselves.

## Problem statement

The current verification flow still sends the full Pact as JSON together with an interaction key. That makes transport
plugins depend on Pact JSON parsing and Pact model knowledge, even when they only need the verification request data,
the plugin-specific interaction configuration, and a small amount of surrounding metadata.

This creates unnecessary coupling between plugin authors and the Pact data model, increases implementation complexity,
and makes the verification API harder to evolve.

## Recommended direction

- Replace the “full pact JSON + interaction key” verification contract with a dedicated interaction-level verification model.
- Send the interaction data in a structured form that is independent of Pact JSON parsing.
- Keep the contract focused on the data required to prepare and execute verification, including:
  - request/response or message payload data;
  - transport and metadata fields;
  - plugin-specific persisted configuration for the interaction;
  - user-supplied verification configuration;
  - any context required to report verification results cleanly.
- Prefer an interface shape that can be mapped to both gRPC and future in-process plugin runtimes.
- Complete the mock server API cleanup: replace the deprecated `ShutdownMockServerRequest` and `ShutdownMockServerResponse` types with `MockServerRequest` and `MockServerResults` respectively. These replacements already exist in the proto and the swap is marked as a TODO for the next major version.

## Non-goals for this proposal

- Defining field-level matcher callbacks.
- Defining a generic callback or host-function protocol.
- Redesigning plugin packaging or installation.
- Maintaining backwards compatibility with V1 plugins — that is handled by [005](/implementation_guides/pact_plugins/docs/proposals/proposal_005_plugin_capability_negotiation_and_versioning) via the manifest `pluginInterfaceVersion` field. The driver selects the old or new verification format based on that value; V1 plugins continue to receive the existing pact-as-JSON request unchanged.

## WASM compatibility

The structured interaction model defined by this proposal must be transport-neutral. The replacement for the pact-as-JSON approach must work equally as fields in a gRPC message (external process plugins) and as parameters to a host function call or WASM export (in-process WASM plugins). This means the model must not embed transport-specific assumptions or encoding.

The same pact-as-JSON problem exists in the mock server flow: `StartMockServerRequest` also passes the full Pact as a JSON string. Any solution defined here should be applied consistently to the mock server API to avoid leaving a parallel coupling in place.

## Open questions

- What is the smallest interaction model that still supports transport plugins cleanly?
- Which data belongs in the “prepare verification” step versus the “execute verification” step?
- How should plugin-specific persisted configuration be separated from generic interaction data?
