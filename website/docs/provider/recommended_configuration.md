---
title: Recommended configuration
---

The following examples require support for the "pacts for verification" API in your Pact library which you can read about [here](/pact_broker/advanced_topics/provider_verification_results#pacts-for-verification).


* Consumer Version Selectors

    * The minimum pact that should be verified is the latest pact from the main line of development from the consumer (eg. `{ tag: "main", latest: true }`). This requires that the [consumer has configured their tag](/consumer/recommended_configuration) to be the name of the git branch when publishing the pact.

    * If you have matured your Pact workflow to the stage that you are [tagging your application versions](/pact_nirvana/step_6) in the Pact Broker when you deploy to an environment, then you should include selectors for your various environments (eg. `test`, `production`).

    * A common pattern to use when adding new features is for the provider to make a branch with the same name as the consumer's branch (which is used to create the consumer version tag), and to configure a selector that uses the name of the current provider branch (eg. `{ tag: process.env.GIT_BRANCH, latest: true }`). This way, the provider Pact configuration doesn't need to be modified to pull in the matching pact.

        * The pacts will be deduplicated, so if the `GIT_BRANCH` is `main`, you'll still only get one pact to verify. If there are no pacts for the `GIT_BRANCH` tag, the selector will just be ignored.

    * If you can't dynamically determine the tags of the feature pacts you want to verify, you will have to change the selectors while you are on a branch, and then put it back to normal once you've merged.

* Pending pacts

    Enabling the [pending pacts](/pact_broker/advanced_topics/pending_pacts) feature stops changed pacts breaking the provider
    build.

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
    includeWipPactsSince: process.env.GIT_BRANCH === "main" ? "2020-01-01" : undefined
  }
  ```
  </TabItem>
</Tabs>
