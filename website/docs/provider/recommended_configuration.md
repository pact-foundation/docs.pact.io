---
title: Recommended configuration for verifying pacts
---

There are typically two different reasons why a pact verification task will need to be run.

1. When the provider makes a change
   * In this situation, a full "regression suite" pact verification needs to be made for all the consumers and all the supported stages (eg. `test`, `production`) to ensure that backwards compatibility is maintained.
2. When a pact changes
   * In this situation, only the changed pact needs to be verified.

## Verification triggered by provider change

The following examples require support for the "pacts for verification" API in your Pact library which you can read about [here](/pact_broker/advanced_topics/provider_verification_results#pacts-for-verification).


* Consumer Version Selectors

    * The minimum pact that should be verified is the latest pact from the main line of development from the consumer (eg. `{ tag: "main", latest: true }`). This requires that the [consumer has configured their tag](/consumer/recommended_configuration) to be the name of the git branch when publishing the pact.

    * If you have matured your Pact workflow to the stage that you are [tagging your application versions](/pact_nirvana/step_6) in the Pact Broker when you deploy to an environment, then you should include selectors for your various environments (eg. `test`, `production`).

    * A common pattern to use when adding new features is for the provider to make a branch with the same name as the consumer's branch (which is used to create the consumer version tag), and to configure a selector that uses the name of the current provider branch (eg. `{ tag: process.env.GIT_BRANCH, latest: true }`). This way, the provider Pact configuration doesn't need to be modified to pull in the matching pact.

        * The pacts will be deduplicated, so if the `GIT_BRANCH` is `main`, you'll still only get one pact to verify. If there are no pacts for the `GIT_BRANCH` tag, the selector will just be ignored.

    * If you can't dynamically determine the tags of the feature pacts you want to verify, you will have to change the selectors while you are on a branch, and then put it back to normal once you've merged.

* Pending pacts

    Enabling the [pending pacts](/pact_broker/advanced_topics/pending_pacts) feature stops changed pacts breaking the main provider
    build. If you are automatically bringing in a pact using the "matching feature branch names" approach, you might want to disable this feature on your feature branches, so that a feature pact correctly fails the branch build until it is fully implemented, and then passes to let you know you can merge.

* Work in progress pacts

    Including [work in progress pacts](/pact_broker/advanced_topics/wip_pacts) allows newly changed pacts to be verified without having to manually change the configuration. You may wish to only enable this feature on your main line of development, as if you are on a branch, you are probably either trying to fulfill a specific pact, or you aren't changing any Pact related code at all.

<Tabs
  groupId="sdk-choice"
  defaultValue="javascript"
  values={[
    { label: 'Javascript', value: 'javascript' }
  ]
}>
  <TabItem value="javascript">

  ```js
  const verificationOptions = {
    // ....
    provider: "example-provider",
    pactBrokerUrl: "http://test.pactflow.io",
    consumerVersionSelectors: [
      {
        tag: "main",
        latest: true
      },
      {
        tag: process.env.GIT_BRANCH,
        latest: true
      },
      {
        tag: "test",
        latest: true
      },
      {
        tag: "production",
        latest: true
      }
    ],
    enablePending: true,
    includeWipPactsSince: process.env.GIT_BRANCH === "main" ? "2020-01-01" : undefined,

    // used when publishing verification results
    publishVerificationResult: process.env.CI === "true", //only publish from CI
    providerVersion: process.env.GIT_COMMIT, //use the appropriate env var from your CI system
    providerVersionTags: process.env.GIT_BRANCH ? [process.env.GIT_BRANCH] : [],
  }
  ```
  </TabItem>
</Tabs>

## Verification triggered by pact change

When a pact has changed, a webhook in the Pact Broker will kick off a build of the provider, passing through the URL of the pact that has changed. See [this](/pact_nirvana/step_4#e-configure-pact-to-be-verified-when-contract-changes) section of the CI/CD set up guide for more information on this.

When the pact URL is known, the `pactBrokerUrl`, `providerName`, `consumerVersionSelectors/consumerVersionTags`, `enablePending`, `includeWipPactsSince` fields should not be set. You can see an example of switching between the two verification modes (all vs changed) in [this Node example](https://github.com/pactflow/example-provider/blob/f1c91ec9f6ab428f95e03cce27c9bd525ee37107/src/product/product.pact.test.js#L23-L75)

<Tabs
  groupId="sdk-choice"
  defaultValue="javascript"
  values={[
    { label: 'Javascript', value: 'javascript' }
  ]
}>
  <TabItem value="javascript">

  ```js
  const verificationOptions = {
    pactUrls: [process.env.PACT_URL],

    // used when publishing verification results

    publishVerificationResult: process.env.CI === "true", //only publish from CI
    providerVersion: process.env.GIT_COMMIT, //use the appropriate env var from your CI system
    providerVersionTags: process.env.GIT_BRANCH ? [process.env.GIT_BRANCH] : [],
  }
   ```
  </TabItem>
</Tabs>
