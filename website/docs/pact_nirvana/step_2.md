---
title: 2. Talk - get team alignment
sidebar_label: 2. Talk - get team alignment
---

Contract tests are a big win when it comes to enabling teams to work and deploy independently, but they also require some level of coordination. Consumer contract tests are of very little value unless they're verified against the provider, and a provider can't write contract tests for their system without working with the consumer team to get the tests added to the consumer project.

Contracts are not a replacement for good communication between or within teams. In fact, contracts require collaboration and communication. One could make the argument that this is one of the main reasons to leverage Pact and enforce communication pathways in large internal and external development organizations.

Contracts are not a magical silver bullet that will allow you to hide in your developer caves and toss built artifacts at each other until everything passes. It is important for all teams to be invested in the process. One of the most common reasons that Pact fails to be successfully adopted in an organisation is a lack of buy in from all parties.

Collaborate about the problems, collaborate over the design, and keep the communication channels open.

The hardest thing about setting up Pact in any company is getting buy in from all the teams. Everyone needs to be on the same page to make Pact work.

A good way to determine if Pact works for you is to write and verify a pact for a real consumer and provider.

## How to identify a good integration point to start with

A good candidate for starting with Pact will:

* meet the requirements described in [What is Pact good for?](/getting_started/what_is_pact_good_for#what-is-pact-good-for)
* be under active development or be actively causing problems due to integration bugs
* have two teams that are committed to trying out contract testing (or even have the same team developing both sides of the integration)
* have some metric for measuring the impact of the introduction of contract testing (eg. number of bugs per release, lead time for changes, length of the build pipeline)
* have a provider that is being developed *for* the given consumer (rather than being a general purpose interface that is used by an unknown number of consumers) and have as small a number of consumers as possible. This is so that the benefits gained by using contract tests have the most chance of making a positive effect - if there is an existing lengthy test suite for every other consumer, then the speed gained by contract testing one integration won't have any impact on the overall release time.

See the next page for more details as to how!