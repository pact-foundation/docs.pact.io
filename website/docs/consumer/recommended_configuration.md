---
title: Recommended configuration for publishing pacts
---

import Tabs from '@theme/Tabs';
import TabItem from '@theme/TabItem';

Using Pact + the Pact Broker in your release pipeline works most naturally if you are using a branch based feature development workflow.

The recommended configuration for the consumer Pact publication configuration is:

* `consumer version number`: the git sha (see [Versioning in the Pact Broker](/getting_started/versioning_in_the_pact_broker) for more info)
* `consumer branch`: the git branch (Pact Broker version 2.82.0 onwards), to be used if both the consumer has support for publishing versions with branches and the provider has support for consumer version selectors with branches. See [Branches Support](/pact_broker/branches#support) for a list of supported libraries.
* `consumer version tag`: the git branch, only recommended for Pact client libraries that don't yet have support for [branches](/pact_broker/branches#support). Tags that represent branches and environments, while still supported, have been superseded by first class support for branches and environments. Please read [this post](/blog/2021/10/08/why-we-are-getting-rid-of-tags) for more information.

Making changes to pacts should happen on a branch of the consumer, and the branch should not be merged until there is a successful verification from the main branch of the provider.
