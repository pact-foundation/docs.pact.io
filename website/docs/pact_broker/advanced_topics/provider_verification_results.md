---
title: Provider verification results
---

## Publishing

When a pact is verified against a provider, the outcome of that verification \(pass or fail\) needs to be made available to the consumer and provider teams, so they know whether or not the code in either project can be safely deployed. The pact verification tool can automatically publish the verification results back to the broker, and they will be displayed on the index page next to the pact details.

To use the verifications feature, you will need version 2.0+ of the Pact Broker, and a Pact implementation that wraps version &gt;= 1.11.1 of the pact gem, or pact-jvm &gt;= 3.5.4.

Note that you can only publish verification results for pacts that were retrieved from a pact broker. You cannot publish results for local pact files.

### Configuration

The exact method of configuration will depend on the implementation you are using, but the principle remains the same. You will need to set the provider application version, and turn the `publish_verification_results` setting on. Please check the documentation for your pact verification tool for instructions on how to configure verification publishing.

The recommended way to do this so that you only publish verifications from your CI is to detect some environment variable that is only available during CI \(eg. `BUILD_NUMBER`\).

```ruby
Pact.service_provider "My Service Provider" do
  app_version ENV['GIT_SHA'] 
  publish_verification_results ENV['CI'] == 'true'
end
```

If your pact URL includes basic auth configurations for the pact broker, these will be used to publish the verification.

#### Pacts for Verification

Earlier versions of the Pact libraries accepted a list of consumer version tags, and fetched each pact directly by tag. The more recent versions of the Pact libraries use a "pacts for verification" endpoint in the Pact Broker. It supports:

* the [pending pacts](./pending_pacts) feature.
* the [work in progress pacts](./wip_pacts) feature.
* specifying the pacts to verify using [consumer version selectors](./consumer_version_selectors) rather than just a list of tags.
* de-duplication of pact contents for faster verifications.

To use these features:

* You need to either be using [pactflow.io](https://pactflow.io?utm_source=ossdocs&utm_campaign=provider_verification_results), or have version 2.60.0+ of the OSS Pact Broker.
* You need to be use at least the following version of your Pact library:
    * JVM: 4.1.7
    * For the following libraries that wrap the [pact-ruby-standalone](https://docs.pact.io/wrapper_implementations), at least version 1.49.3 of the standalone is required.
        * JS: 9.11.1 (not supported by the v3 implementation that uses Rust)
        * Ruby: 1.52.0
        * Go: latest as of September 2020 (version TBC)
        * .Net: latest as of September 2020 (version TBC)
        * Python: latest as of September 2020 (version TBC)

## Querying

Once your verification is published, your consumer build will need some way of determining the verification results before releasing to production.

To do this, you need to know the version number of your candidate release eg. `1.2.3`, and you will need the [Pact Broker CLI](https://github.com/pact-foundation/pact-ruby-standalone/releases). The documentation for the `can-i-deploy` tool is [here](../can_i_deploy.md).

The `can-i-deploy` tool should be added to your consumer deployment script, before you do the actual deployment. If all the pacts for the given consumer version are not successfully verified the command will exit with an error code \(and will output the current verification results and let you know what is missing/failed\). If your deployment script is configured to stop on error \(as would be normal\), the rest of the deployment will not proceed.

Something to note is that if the content of your contract has not changed since the previous verification, then the contract will be "pre-verified" with the results of the last verification. This means that most of the time, you should be able to go straight from the consumer test/package phase into the deploy phase.

Changes to the contract that may cause the initial provider verification to fail should be introduced using [tags](/pact_broker/tags).

## Viewing

There is no UI for viewing the interaction level verification results in the open source Pact Broker \(this UI is available in [PactFlow](https://pactflow.io)\) however, you can view them in the API browser. The easiest way to find them is to click on the "Matrix" icon for the integration (the little grid icon in between the consumer and provider names) and then click on the link in the "Pact Verified" column for the results that you want to see. 
