---
title: Recommended configuration for verifying pacts
---

import Tabs from '@theme/Tabs';
import TabItem from '@theme/TabItem';


There are typically two different reasons why a pact verification task will need to be run.

1. When the provider makes a change
   * In this situation, a full "regression suite" pact verification needs to be made for all the consumers and all the supported stages (eg. `test`, `production`) to ensure that backwards compatibility is maintained.
2. When a pact changes
   * In this situation, only the changed pact needs to be verified.

## Verification triggered by provider change

The following examples require support for the "pacts for verification" API in your Pact library which you can read about [here](/pact_broker/advanced_topics/provider_verification_results#pacts-for-verification).


### Consumer Version Selectors

#### If using branches/environments:

See [this blog post](/blog/2021/07/04/why-we-are-getting-rid-of-tags) on branches and environments.

* The minimum pact that should be verified is the latest pact from the main line of development from the consumer (eg. `{ "mainBranch": true }`). This requires that the [consumer has configured the branch](/pact_broker/branches#configuring-the-branch-when-publishing-pacts) when publishing the pact.
* If you have matured your Pact workflow to the stage that you are [recording deployments](/pact_broker/recording_deployments_and_releases) in the Pact Broker when you deploy to an environment, then you should include selectors for the deployed and released versions (eg. `{ "deployedOrReleased": true }` )
* A common pattern to use when adding new features is for the provider to make a branch with the same name as the consumer's branch (which is used to create the consumer version tag), and to use a selector to find the matching branch (eg. `{ "matchingBranch": true }`). This way, the provider Pact configuration doesn't need to be modified to pull in the matching pact.
  * The pacts will be de-duplicated, so if the `GIT_BRANCH` is `main`, you'll still only get one pact to verify. If there are no pacts for the current `GIT_BRANCH`, the selector will just be ignored.
  * If you can't dynamically determine the tags of the feature pacts you want to verify, you will have to change the selectors while you are on a branch, and then put them back to normal once you've merged.

#### If using tags 

This not recommended if you are on versions of the Pact Broker and Pact libraries that support branches and environments.

* The minimum pact that should be verified is the latest pact from the main line of development from the consumer (eg. `{ tag: "main", latest: true }`). This requires that the [consumer has configured their tag](/consumer/recommended_configuration) to be the name of the git branch when publishing the pact.

* If you have matured your Pact workflow to the stage that you are [tagging your application versions](/pact_nirvana/step_6) in the Pact Broker when you deploy to an environment, then you should include selectors for your various environments (eg. `test`, `production`).

* A common pattern to use when adding new features is for the provider to make a branch with the same name as the consumer's branch (which is used to create the consumer version tag), and to configure a selector that uses the name of the current provider branch (eg. `{ tag: process.env.GIT_BRANCH, latest: true }`). This way, the provider Pact configuration doesn't need to be modified to pull in the matching pact.

  * The pacts will be de-duplicated, so if the `GIT_BRANCH` is `main`, you'll still only get one pact to verify. If there are no pacts for the `GIT_BRANCH` tag, the selector will just be ignored.

  * If you can't dynamically determine the tags of the feature pacts you want to verify, you will have to change the selectors while you are on a branch, and then put them back to normal once you've merged.

### Pending pacts

Enabling the [pending pacts](/pact_broker/advanced_topics/pending_pacts) feature stops changed pacts breaking the main provider build. If you are automatically bringing in a pact using the "matching feature branch names" approach, you might want to disable this feature on your feature branches, so that a feature pact correctly fails the branch build until it is fully implemented, and then passes to let you know you can merge.

### Work in progress pacts

Including [work in progress pacts](/pact_broker/advanced_topics/wip_pacts) allows newly changed pacts to be verified without having to manually change the configuration. You may wish to only enable this feature on your main line of development, as if you are on a branch, you are probably either trying to fulfill a specific pact, or you aren't changing any Pact related code at all.

### Examples

<Tabs
  groupId="sdk-choice"
  defaultValue="javascript"
  values={[
    { label: 'Javascript', value: 'javascript', },
    {label: 'Ruby', value: 'ruby', }
  ]
}>
  <TabItem value="javascript">

  Using branches and environments
    
  ```js
  const verificationOptions = {
    // ....
    provider: "example-provider",
    pactBrokerUrl: "http://test.pactflow.io",
    consumerVersionSelectors: [
      {
        mainBranch: true
      },
      {
        matchingBranch: true
      },
      {
        deployedOrReleased: true
      }
    ],
    enablePending: true,
    includeWipPactsSince: process.env.GIT_BRANCH === "main" ? "2020-01-01" : undefined,

    // used when publishing verification results
    publishVerificationResult: process.env.CI === "true", //only publish from CI
    providerVersion: process.env.GIT_COMMIT, //use the appropriate env var from your CI system
    providerBranch: process.env.GIT_BRANCH,  //use the appropriate env var from your CI system
  }
  ```
    
  Using tags (this approach is now superseded by branches and environments)
    
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

  
  <TabItem value="ruby">

  Using branches and environments
    
  ```ruby
    # The git commands are just for local testing, not needed for real CI
    provider_version = ENV['GIT_COMMIT'] || `git rev-parse --verify HEAD`.strip
    provider_branch = ENV['GIT_BRANCH'] || `git name-rev --name-only HEAD`.strip
    publish_results = ENV['CI'] == 'true' # results should only be published from CI
    # choose the appropriate credentials for your broker
    credentials = {
      username: ENV['PACT_BROKER_USERNAME'],
      password: ENV['PACT_BROKER_PASSWORD'],
      token: ENV['PACT_BROKER_TOKEN']
    }.compact

    Pact.service_provider "example-provider" do
      app_version provider_version
      app_version_branch provider_branch
      publish_verification_results publish_results
      
      honours_pacts_from_pact_broker do
        pact_broker_base_url 'http://test.pactflow.io', credentials

        consumer_version_selectors [
            { main_branch: true },
            { matching_branch: true },
            { deployed_or_released: true }
        ]
        enable_pending true
        include_wip_pacts_since provider_branch == "main" ? "2020-01-01" : nil
      end
    end
  ```    
    
  Using tags (this approach is now superseded by branches and environments)
    
  ```ruby
    # The git commands are just for local testing, not needed for real CI
    provider_version = ENV['GIT_COMMIT'] || `git rev-parse --verify HEAD`.strip
    provider_branch = ENV['GIT_BRANCH'] || `git name-rev --name-only HEAD`.strip
    publish_results = ENV['CI'] == 'true' # results should only be published from CI
    # choose the appropriate credentials for your broker
    credentials = {
      username: ENV['PACT_BROKER_USERNAME'],
      password: ENV['PACT_BROKER_PASSWORD'],
      token: ENV['PACT_BROKER_TOKEN']
    }

    Pact.service_provider "example-provider" do
      app_version provider_version
      app_version_tags [provider_branch]
      publish_verification_results publish_results
      
      honours_pacts_from_pact_broker do
        pact_broker_base_url 'http://test.pactflow.io', credentials

        consumer_version_selectors [
            { tag: 'main', latest: true },
            { tag: provider_branch, latest: true },
            { tag: 'test', latest: true },
            { tag: 'production', latest: true }
        ]
        enable_pending true
        include_wip_pacts_since provider_branch == "main" ? "2020-01-01" : nil
      end
    end
  ```

  </TabItem>
</Tabs>


## Verification triggered by pact change

When a pact has changed, a webhook in the Pact Broker will kick off a build of the provider, passing through the URL of the pact that has changed. See [this](/pact_nirvana/step_4#e-configure-pact-to-be-verified-when-contract-changes) section of the CI/CD set up guide for more information on this.

When the pact URL is known, the `pactBrokerUrl`, `providerName`, `consumerVersionSelectors/consumerVersionTags`, `enablePending`, `includeWipPactsSince` fields should not be set. You can see an example of switching between the two verification modes (all vs changed) in [this Node example](https://github.com/pactflow/example-provider/blob/f1c91ec9f6ab428f95e03cce27c9bd525ee37107/src/product/product.pact.test.js#L23-L75)

### Examples

<Tabs
  groupId="sdk-choice"
  defaultValue="javascript"
  values={[
    { label: 'Javascript', value: 'javascript' },
    { label: 'Ruby', value: 'ruby' }
  ]
}>
  <TabItem value="javascript">

  ```js
  const verificationOptions = {
    pactUrls: [process.env.PACT_URL],

    // used when publishing verification results

    publishVerificationResult: process.env.CI === "true", //only publish from CI
    providerVersion: process.env.GIT_COMMIT, //use the appropriate env var from your CI system
    providerBranch: process.env.GIT_BRANCH // if using branches and environments
    providerVersionTags: process.env.GIT_BRANCH ? [process.env.GIT_BRANCH] : [], //only if not setting the branch
  }
   ```

  </TabItem>
  <TabItem value="ruby">

  ```shell
  PACT_BROKER_BASE_URL="..." # also set PACT_BROKER_USERNAME/PACT_BROKER_PASSWORD or PACT_BROKER_TOKEN
  bundle exec rake pact:verify:at[${PACT_URL}]
   ```

  </TabItem>
</Tabs>
