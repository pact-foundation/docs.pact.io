---
title: Recommended configuration for publishing
---

import Tabs from '@theme/Tabs';
import TabItem from '@theme/TabItem';

Using Pact + the Pact Broker in your release pipeline works most naturally if you are using a branch based feature development workflow.

The recommended configuration for the consumer Pact publication configuration is:

* `consumer version number`: the git sha (see [Versioning in the Pact Broker](/getting_started/versioning_in_the_pact_broker) for more info)
* `consumer version tag`: the git branch

Making changes to pacts should happen on a branch of the consumer, and the branch should not be merged until there is a successful verification from the main branch of the provider.

