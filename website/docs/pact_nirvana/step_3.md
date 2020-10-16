---
title: 3. Write and verify a real Pact
---

The hardest thing about setting up Pact in any company is getting buy in from all the teams. Everyone needs to be on the same page to make Pact work.

A good way to determine if Pact works for you is to write and verify a pact for a real consumer and provider.

## How to identify a good integration point to start with

A good candidate for starting with Pact will:

* meet the requirements described in [What is Pact good for?](/getting_started/what_is_pact_good_for#what-is-pact-good-for)
* be under active development or be actively causing problems due to integration bugs
* have two teams that are committed to trying out contract testing (or even have the same team developing both sides of the integration)
* have some metric for measuring the impact of the introduction of contract testing (eg. number of bugs per release, lead time for changes, length of the build pipeline)
* have a provider that is being developed *for* the given consumer (rather than being a general purpose interface that is used by an unknown number of consumers) and have as small a number of consumers as possible. This is so that the benefits gained by using contract tests have the most chance of making a positive effect - if there is an existing lengthy test suite for every other consumer, then the speed gained by contract testing one integration won't have any impact on the overall release time.

## Tasks

1. Write a Pact test in your consumer project \(consult [the documentation](/implementation_guides/cli) for your chosen language\) and generate the pact.
2. Ship the pact file to the provider team - it still doesn’t matter how yet, we’ll get on to that in the next step.
3. Verify the pact against the provider \(again, consult the documentation for your chosen language\)
4. Talk about it.
5. Decide whether or not Pact is the right tool for you, taking into account that there are situations for which Pact is [a good solution](/faq/#what-is-pact-good-for), and situations for which Pact is [not a good solution](/faq/#what-is-pact-not-good-for).
