---
title: Verification - Consumer change
description: Provider verification tasks performed on contracts requiring verification
---



import Tabs from '@theme/Tabs';
import TabItem from '@theme/TabItem';

## Provider verification tasks performed on contracts requiring verification

### Configuring the branch when publishing verification results


<Tabs
  groupId="sdk-choice"
  defaultValue="pact-cli"
  values={[
    { label: 'Ruby provider-verifier CLI', value: 'pact-cli', },
    { label: 'Ruby', value: 'ruby' }
  ]
}>
  <TabItem value="pact-cli">

  See [here](https://github.com/pact-foundation/pact-provider-verifier) for full docs.

  ```  
  pact-provider-verifier  \
    --provider "Example API" \
    --provider-app-version $GIT_COMMIT \
    --provider-version-branch $GIT_BRANCH \
    ...
  ```
    
  </TabItem>
  <TabItem value="ruby">

  See [here](/implementation_guides/ruby/verifying_pacts) for full docs.

  ```ruby
  # In spec/pact_helper.rb

  Pact.service_provider "My Service Provider" do
    app_version ENV["GIT_COMMIT"]
    app_version_branch ENV["GIT_BRANCH"]
  end
  ```

  </TabItem>
</Tabs>



### Verification triggered by a contract requiring verification published

When a pact has changed, a webhook in the Pact Broker will kick off a build of the provider, passing through the URL of the pact that has changed. See [this](/pact_nirvana/step_6#add-a-new-provider-verification-job) section of the CI/CD set up guide for more information on this.

Using this webhook event allows the changed pact to be tested against the head of the providers main branch and any deployed or released versions of the provider, in the same way as the consumer version selectors can be configured to allow the head of the consumers main branch and any deployed or released versions of the pact to be tested against a version of the provider.

More details on the webhook can be found in the [webhook documentation](/pact_broker/webhooks#using-webhooks-with-the-contract_requiring_verification_published-event)

When the pact URL is known, the `pactBrokerUrl`, `providerName`, `consumerVersionSelectors/consumerVersionTags`, `enablePending`, `includeWipPactsSince` fields should not be set. You can see an example of switching between the two verification modes (all vs changed) in [this Node example](https://github.com/pactflow/example-provider/blob/f1c91ec9f6ab428f95e03cce27c9bd525ee37107/src/product/product.pact.test.js#L23-L75)

### Examples

You can find samples in our [webhook template library](/pact_broker/webhooks/template_library) for common build systems and see below for how to configure your provider build to use the pact URL.

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
    providerVersionBranch: process.env.GIT_BRANCH // if using branches and environments (recommended)
    providerVersionTags: process.env.GIT_BRANCH ? [process.env.GIT_BRANCH] : [], // optional, it is recommend you set the branch as well.
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
