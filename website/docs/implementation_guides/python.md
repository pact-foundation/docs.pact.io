---
title: Overview
---

[Pact Python](https://github.com/pact-foundation/pact-python/) is currently in active development and supports Pact Specification v2, [pending pacts][pending], and [WIP pacts][wip] via the [pact-ruby-standalone CLI][pact-ruby-standalone], and has recently introduced a [beta v3 interface](https://github.com/pact-foundation/pact-python?tab=readme-ov-file#v3-preview), with a native c integration to the pact-core and supports Pact V3/V4 specification.

[Pactman](https://github.com/reecetech/pactman) is another Python implementation of Pact, which is not officially supported by the core Pact Foundation team. It is in maintenance mode, and supports Pact Specification v3. It has a more idiomatic Python interface as it is pure Python and doesn't wrap the [pact-ruby-standalone CLI][pact-ruby-standalone], however it does not support [pending][pending], [WIP pacts][wip], or [message queue](https://docs.pact.io/implementation_guides/pact_specification#specification-documentation).

[pending]: https://docs.pact.io/pending
[wip]: https://docs.pact.io/wip
[pact-ruby-standalone]: https://github.com/pact-foundation/pact-ruby-standalone
