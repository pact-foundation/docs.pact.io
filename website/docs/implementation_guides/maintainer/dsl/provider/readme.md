---
title: Provider
sidebar_label: Provider
---

# Provider DSL

- General provider guidance e.g.
  - Pact fetching guidance (local, broker etc.)
  - how to setup `pactffi_verifier_set_provider_info` and `pactffi_verifier_add_provider_transport` effectively to support multiple transports
  - state handlers, request filters
- FFI calls
- Transports (multiple, how they work, default host/port)
- State Handlers (setup/teardown, use as hooks, and behaviour if there are no states)

  see https://pact-foundation.slack.com/archives/C02BXLDJ7JR/p1683037785422899 and https://pact-foundation.slack.com/archives/C02BXLDJ7JR/p1683282113939749 for more on this