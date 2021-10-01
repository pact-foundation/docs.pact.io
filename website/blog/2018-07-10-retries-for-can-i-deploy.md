---
title: Retries for can-i-deploy
author: Beth Skurrie
authorURL: http://twitter.com/bethesque
---

The `can-i-deploy` tool is a CLI that ensures you are safe to deploy a consumer or provider into a given environment. To do this, it queries the Pact Broker to ensure that there is a successful verification result between the existing application versions and the application version you're about to deploy. 

If you deploy to a test environment as part of your build pipeline, you may find yourself in the situation where the verification result is unknown because the provider build is still running. What typically would happen is that a changed pact would trigger a provider build via a webhook in the Pact Broker, and the provider may not have finished before `can-i-deploy` is invoked.

To help out in this scenario, you can now use the following two options to let the `can-i-deploy` command poll until all the verification results arrive.

```
[--retry-while-unknown=TIMES] 
              # The number of times to retry while there is an unknown
              # verification result 
              # (ie. the provider verification is likely still running)
              # Default: 0
[--retry-interval=SECONDS]
              # The time between retries in seconds. 
              # Use in conjuction with --retry-while-unknown
              # Default: 10
```

Remember, however, that changes to pacts are best introduced on feature branches of your consumer. This allows your pact to be ["pre-verified"](https://github.com/pact-foundation/pact_broker/wiki/Terminology#pre-verification) by the time the branch is merged into master, which will mean `can-i-deploy` should never block your master build.

You can read about how to do this in [The steps to reaching Pact Nirvana](https://docs.google.com/document/d/e/2PACX-1vRf1kSDccImNipOOm1G-bjcSs-ifbZjf1v54K-dIcq8BLKeFPAAm_bf_p71UKqkRMIx30QWWL-kN8TI/pub).

Want to use this new feature? You'll need version [1.48.0](https://github.com/pact-foundation/pact-ruby-standalone/releases/tag/v1.48.0) or later of the Pact CLI, and version [2.23.4](https://github.com/pact-foundation/pact_broker/releases/tag/v2.23.4) or later of the Pact Broker
