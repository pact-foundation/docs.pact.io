---
title: Consumer Version Selectors
---

## Overview

Consumer version selectors are used to configure which pacts the provider verifies. Instead of providing a list of tag names (as in the past) a list of selector objects is provided. These allow a much more flexible and powerful approach to specifying which pacts to verify.

## Properties

A consumer version selector has the following properties:

- `mainBranch`: if the key is specified, can only be set to `true`. Return the pacts for the configured `mainBranch` of each consumer. Use of this selector requires that the consumer has configured the `mainBranch` property, and has set a branch name when publishing the pacts. As of October 2021, this is not yet supported in all Pact client libraries.

- `branch`: the branch name of the consumer versions to get the pacts for. Use of this selector requires that the consumer has configured a branch name when publishing the pacts. As of October 2021, this is not yet supported in all Pact client libraries. As of October 2021, this is not yet supported in all Pact client libraries.

- `fallbackBranch`: the name of the branch to fallback to if the specified `branch` does not exist. Use of this property is discouraged as it may allow a pact to pass on a feature branch while breaking backwards compatibility with the main branch, which is generally not desired. It is better to use two separate consumer version selectors, one with the main branch name, and one with the feature branch name, rather than use this property. As of October 2021, this is not yet supported in all Pact client libraries.

- `tag`: the tag name(s) of the consumer versions to get the pacts for. *This field is still supported but it is recommended to use the `branch` in preference now.*

- `fallbackTag`: the name of the tag to fallback to if the specified `tag` does not exist. *This field is still supported but it is recommended to use the `fallbackBranch` in preference now.*

- `deployed`: if the key is specified, can only be set to `true`. Returns the pacts for all versions of the consumer that are currently deployed to any environment. Use of this selector requires that the deployment of the consumer application is recorded in the Pact Broker using the `pact-broker record-deployment` CLI. As of October 2021, this is not yet supported in all Pact client libraries.

- `released`: if the key is specified, can only be set to `true`. Returns the pacts for all versions of the consumer that are released and currently supported in any environment. Use of this selector requires that the deployment of the consumer application is recorded in the Pact Broker using the `pact-broker record-release` CLI. As of October 2021, this is not yet supported in all Pact client libraries.

- `deployedOrReleased`: if the key is specified, can only be set to `true`. Returns the pacts for all versions of the consumer that are currently deployed or released and currently supported in any environment. Use of this selector requires that the deployment of the consumer application is recorded in the Pact Broker using the `pact-broker record-deployment` or `record-release` CLI. As of October 2021, this is not yet supported in all Pact client libraries.

- `environment`: the name of the environment containing the consumer versions for which to return the pacts. Used to further qualify `{ "deployed": true }` or `{ "released": true }`. Normally, this would not be needed, as it is recommended to verify the pacts for all currently deployed/currently supported released versions. As of October 2021, this is not yet supported in all Pact client libraries.

- `latest`: true. Used in conjuction with the `tag` and `branch` properties. When used with a `branch`, it may be `true` or the key ommitted (in which case it will be inferred to be `true`). This is because it only makes sense to verify the latest pact for a branch. If a `tag` is specified, and `latest` is `true`, then the latest pact for each of the consumers with that tag will be returned. If a `tag` is specified and the latest flag is *not* set to `true`, *all* the pacts with the specified tag will be returned. (This might seem a bit weird, but it's done this way to match the syntax used for the matrix query params. See https://docs.pact.io/selectors). 

- `consumer`: allows a selector to only be applied to a certain consumer.

## Deduplication

The Pact Broker API for retrieving pacts by selectors deduplicates the pacts based on their *content*. This means that if the same content was published in multiple selected pacts, the verification for that content will only need to run once. This is quite common when there hasn't been a change to a pact for a while, and the same pact content is present in development, test and production pacts.


## Examples

### Verifying the latest development pact, and the pacts for deployed or released versions

This is the most common use case.

import Tabs from '@theme/Tabs';
import TabItem from '@theme/TabItem';

<Tabs
groupId="sdk-choice"
defaultValue="javascript"
values={[
{label: 'Javascript', value: 'javascript', },
{label: 'Java', value: 'java', },
{label: 'Gradle', value: 'gradle', },
{label: 'Ruby', value: 'ruby', },
{label: 'Python', value: 'python', },
{label: 'C#', value: 'c#', },
{label: 'Golang', value: 'golang', }
]
}>

  <TabItem value="javascript">

  ```js
  const verificationOptions = {
    // ....
    consumerVersionSelectors: [
      {
        mainBranch: true
      },
      {
        deployedOrReleased: true
      }
    ]
  }
  ```
  </TabItem>

  <TabItem value="java">

```java
@PactBroker(
  host="pactbroker.local",
  port="8080",
  consumerVersionSelectors={
    @VersionSelector(tag = "master"),
    @VersionSelector(tag = "test"),
    @VersionSelector(tag = "production")
  }
)

```

  </TabItem>

  <TabItem value="gradle">

```groovy

pact {
  serviceProviders {
    'Your Service' {
      providerVersion = { '1.2.3' }

      fromPactBroker {
        selectors = latestTags('master', 'test', 'production')
      }
    }
  }
}
```

  </TabItem>

  <TabItem value="ruby">

```ruby
  Pact.service_provider "Your provider" do
    honours_pacts_from_pact_broker do
      pact_broker_base_url "..."
      consumer_version_selectors [
            { tag: "main", latest: true },
            { deployed_or_released: true }
          ]
    end
  end
end
```

  </TabItem>

  <TabItem value="python">

```python
verifier = Verifier(
    provider="Your provider",
    broker_url="...",
    consumer_version_selectors=[
        {"tag": "main", "latest": True},
        {"tag": "test", "latest": True},
        {"tag": "production", "latest": True},
    ],
    # ...
)
```

  </TabItem>

  <TabItem value="c#">

```csharp
    var pactVerifier = new PactVerifier(new PactVerifierConfig())
      .ProviderState($"providerServiceBaseUri/provider-states")
      .ServiceProvider("ProviderPacticipantName", "providerServiceBaseUri")
      .HonoursPactWith("ConsumerPacticipantName")
      .PactBroker(
        "http://pact-broker",
        consumerVersionSelectors: new List<VersionTagSelector>
        {
          new VersionTagSelector("master", latest: true),
          new VersionTagSelector("test", latest: true),
          new VersionTagSelector("production", latest: true)
        });
```

  </TabItem>

  <TabItem value="golang">

```golang
	pact.VerifyProvider(t, types.VerifyRequest{
		ConsumerVersionSelectors: []types.ConsumerVersionSelector{
			types.ConsumerVersionSelector{
				Tag:         "master",
				Latest:      true,
			},
			types.ConsumerVersionSelector{
				Tag:         "test",
				Latest:      true,
			},
			types.ConsumerVersionSelector{
				Tag:         "production",
				Latest:      true,
			},
		},
        // ...
	})
```

  </TabItem>

</Tabs>

### Using a fallback tag for coordinated branch development

Dynamically determine the current branch of the provider, see if there is a matching pact for that branch, fallback to the `master` pact if none exists.

<Tabs
groupId="sdk-choice"
defaultValue="javascript"
values={[
{label: 'Javascript', value: 'javascript', },
{label: 'Java', value: 'java', },
{label: 'Gradle', value: 'gradle', },
{label: 'Ruby', value: 'ruby', },
{label: 'Python', value: 'python', },
{label: 'C#', value: 'c#', },
{label: 'Golang', value: 'golang', }
]
}>
<TabItem value="javascript">

```js
const verificationOptions = {
  //...
  consumerVersionSelectors: [
    {
      tag: process.env.GIT_BRANCH,
      fallbackTag: "master",
      latest: true,
    },
    {
      tag: "test",
      latest: true,
    },
    {
      tag: "production",
      latest: true,
    },
  ],
};
```

  </TabItem>

  <TabItem value="java">

```java
// Requires Pact-JVM 4.1.10 or later
@PactBroker(
  host="pactbroker.local",
  port="8080",
  consumerVersionSelectors={
    @VersionSelector(tag = "${GIT_BRANCH}", fallbackTag = "master"),
    @VersionSelector(tag = "test"),
    @VersionSelector(tag = "production")
  }
)

```

  </TabItem>

  <TabItem value="gradle">

```groovy
// Requires Pact-JVM 4.1.10 or later
pact {
  serviceProviders {
    'Your Service' {
      providerVersion = { '1.2.3' }

      fromPactBroker {
        selectors = latestTags(fallbackTag: 'master', System.getenv('GIT_BRANCH'))
      }
    }
  }
}
```

  </TabItem>

  <TabItem value="ruby">

```ruby
Pact.service_provider "Your provider" do
  honours_pacts_from_pact_broker do
    pact_broker_base_url "..."
    consumer_version_selectors [
        { tag: ENV["GIT_BRANCH"], fallback_tag: "main", latest: true },
        { tag: "test", latest: true },
        { tag: "production", latest: true }
      ]
  end
end
```

  </TabItem>

  <TabItem value="python">

```python
verifier = Verifier(
    provider="Your provider",
    broker_url="...",
    consumer_version_selectors=[
        {"tag": os.environ.get("GIT_BRANCH"), "fallback_tag": "main", "latest": True},
        {"tag": "test", "latest": True},
        {"tag": "production", "latest": True},
    ],
    # ...
)
```

  </TabItem>

  <TabItem value="c#">

```csharp
     var pactVerifier = new PactVerifier(new PactVerifierConfig())
      .ProviderState($"providerServiceBaseUri/provider-states")
      .ServiceProvider("ProviderPacticipantName", "providerServiceBaseUri")
      .HonoursPactWith("ConsumerPacticipantName")
      .PactBroker(
        "http://pact-broker",
        consumerVersionSelectors: new List<VersionTagSelector>
        {
          new VersionTagSelector(Environment.GetEnvironmentVariable("GIT_BRANCH"), fallbackTag: "master", latest: true),
          new VersionTagSelector("test", latest: true),
          new VersionTagSelector("production", latest: true)
        });
```

  </TabItem>

  <TabItem value="golang">

```golang
	pact.VerifyProvider(t, types.VerifyRequest{
    ConsumerVersionSelectors: []types.ConsumerVersionSelector{
			types.ConsumerVersionSelector{
				Tag:         os.Getenv("GIT_BRANCH"),
				FallbackTag: "master",
				Latest:      true,
			},
			types.ConsumerVersionSelector{
				Tag:    "test",
				Latest: true,
			},
			types.ConsumerVersionSelector{
				Tag:    "production",
				Latest: true,
			},
		},
        // ...
	})
```

  </TabItem>

</Tabs>

### Verifying pacts where the consumer is a mobile application

:::caution The information in the following section has been superseded
Using tags to keep track of which application versions are in an environment has now been replaced by first class support for [deployments and releases](/pact_broker/recording_deployments_and_releases). You can now use the "deployedOrReleased: true" selector for all scenarios.
:::

Verify the pacts for the latest `master` and `test` versions, and all `production` versions of "my-mobile-consumer".

<Tabs
groupId="sdk-choice"
defaultValue="javascript"
values={[
{label: 'Javascript', value: 'javascript', },
{label: 'Java', value: 'java', },
{label: 'Ruby', value: 'ruby', },
{label: 'Python', value: 'python', },
{label: 'C#', value: 'c#', },
{label: 'Golang', value: 'golang', },
]
}>
<TabItem value="javascript">

```js
const verificationOptions = {
  // ...
  consumerVersionSelectors: [
    {
      tag: "master",
      latest: true,
    },
    {
      tag: "test",
      latest: true,
    },
    {
      tag: "production",
    },
  ],
};
```

  </TabItem>

  <TabItem value="java">

```java
@PactBroker(
host="pactbroker.local",
port="8080",
consumerVersionSelectors={
  @VersionSelector(tag = "master"),
  @VersionSelector(tag = "test"),
  @VersionSelector(tag = "production", latest = false)
})

```

  </TabItem>

  <TabItem value="ruby">

```ruby
Pact.service_provider "Your provider" do
  honours_pacts_from_pact_broker do
    pact_broker_base_url "..."
    consumer_version_selectors [
        { tag: "main", latest: true },
        { tag: "test", latest: true },
        { tag: "production" }
      ]
  end
end
```

  </TabItem>

  <TabItem value="python">

```python
verifier = Verifier(
    provider="Your provider",
    broker_url="...",
    consumer_version_selectors=[
        {"tag": "main", "latest": True},
        {"tag": "test", "latest": True},
        {"tag": "production"},
    ],
    # ...
)
```

  </TabItem>

<TabItem value="c#">

```csharp
      IPactVerifier pactVerifier = new PactVerifier(new PactVerifierConfig())
      .ProviderState($"providerServiceBaseUri/provider-states")
      .ServiceProvider("ProviderPacticipantName", "providerServiceBaseUri")
      .HonoursPactWith("ConsumerPacticipantName")
      .PactBroker(
        "http://pact-broker",
        consumerVersionSelectors: new List<VersionTagSelector>
        {
          new VersionTagSelector("master", latest: true),
          new VersionTagSelector("test", latest: true),
          new VersionTagSelector("production")
        });
```

  </TabItem>

  <TabItem value="golang">

```golang
	pact.VerifyProvider(t, types.VerifyRequest{
		ConsumerVersionSelectors: []types.ConsumerVersionSelector{
			types.ConsumerVersionSelector{
				Tag:         os.Getenv("GIT_BRANCH"),
				FallbackTag: "master",
				Latest:      true,
			},
			types.ConsumerVersionSelector{
				Tag:    "test",
				Latest: true,
			},
			types.ConsumerVersionSelector{
				Tag:    "production",
				Latest: false,
			},
		},
        // ...
	})
```

  </TabItem>

</Tabs>

### Verifying a pacts where one consumer is a mobile application

:::caution The information in the following section has been superseded
Using tags to keep track of which application versions are in an environment has now been replaced by first class support for [deployments and releases](/pact_broker/recording_deployments_and_releases). You can now use the "deployedOrReleased: true" selector for all scenarios.
:::

Verify the latest `production` version of all consumers, and all `production` versions of "my-mobile-consumer". Note that the pacts are [deduplicated](#deduplication), so despite being included by 2 selectors, the verification of the latest production pact for "my-mobile-consumer" will only run once.

<Tabs
groupId="sdk-choice"
defaultValue="javascript"
values={[
{label: 'Javascript', value: 'javascript', },
{label: 'Java', value: 'java', },
{label: 'Ruby', value: 'ruby', },
{label: 'Python', value: 'python', },
{label: 'C#', value: 'c#', },
{label: 'Golang', value: 'golang', }
]
}>
<TabItem value="javascript">

```js
const verificationOptions = {
  // ...
  consumerVersionSelectors: [
    {
      tag: "master",
      latest: true,
    },
    {
      tag: "test",
      latest: true,
    },
    {
      tag: "production",
      latest: true,
    },
    {
      tag: "production",
      consumer: "my-mobile-consumer",
    },
  ],
};
```

  </TabItem>

  <TabItem value="java">

```java
// Requires Pact-JVM 4.1.8 or later
@PactBroker(
  host="pactbroker.local",
  port="8080",
  consumerVersionSelectors={
    @VersionSelector(tag = "master"),
    @VersionSelector(tag = "test"),
    @VersionSelector(tag = "production"),
    @VersionSelector(tag = "production", consumer = "my-mobile-consumer")
  }
)

```

  </TabItem>

  <TabItem value="ruby">

```ruby
Pact.service_provider "Your provider" do
  honours_pacts_from_pact_broker do
    pact_broker_base_url "..."
    consumer_version_selectors [
        { tag: "main", latest: true },
        { tag: "test", latest: true },
        { tag: "production", latest: true },
        { tag: "production", consumer: "my-mobile-consumer" }
      ]
  end
end
```

  </TabItem>

  <TabItem value="python">

```python
verifier = Verifier(
    provider="Your provider",
    broker_url="...",
    consumer_version_selectors=[
        {"tag": "main", "latest": True},
        {"tag": "test", "latest": True},
        {"tag": "production", "latest": True},
        {"tag": "production", "consumer": "my-mobile-consumer"},
    ],
    # ...
)
```

  </TabItem>

  <TabItem value="c#">

```csharp
      IPactVerifier pactVerifier = new PactVerifier(new PactVerifierConfig())
      .ProviderState($"providerServiceBaseUri/provider-states")
      .ServiceProvider("ProviderPacticipantName", "providerServiceBaseUri")
      .HonoursPactWith("ConsumerPacticipantName")
      .PactBroker(
        "http://pact-broker",
        consumerVersionSelectors: new List<VersionTagSelector>
        {
          new VersionTagSelector("master", latest: true),
          new VersionTagSelector("test", latest: true),
          new VersionTagSelector("production", latest: true),
          new VersionTagSelector("production", "my-mobile-consumer")
        });
```

  </TabItem>

  <TabItem value="golang">

```golang
	pact.VerifyProvider(t, types.VerifyRequest{
		ConsumerVersionSelectors: []types.ConsumerVersionSelector{
			types.ConsumerVersionSelector{
				Tag:         os.Getenv("GIT_BRANCH"),
				FallbackTag: "master",
				Latest:      true,
			},
			types.ConsumerVersionSelector{
				Tag:         "test",
				Latest:      true,
			},
			types.ConsumerVersionSelector{
				Tag:         "production",
				Latest:      true,
			},
			types.ConsumerVersionSelector{
				Tag:         "production",
				Consumer:    "my-mobile-consumer",
			},
		},
        // ...
	})
```

  </TabItem>
</Tabs>

### Verifying the overall latest pact for each consumer

This is syntactically possible, but not recommended, as pacts for different branches of the consumer may overwrite each other as the current latest.

<Tabs
groupId="sdk-choice"
defaultValue="javascript"
values={[
{label: 'Javascript', value: 'javascript', },
{label: 'Java', value: 'java', },
{label: 'Ruby', value: 'ruby', },
{label: 'Python', value: 'python', },
{label: 'C#', value: 'c#', },
{label: 'Golang', value: 'golang', }
]
}>
<TabItem value="javascript">

```js
const verificationOptions = {
  // ...
  consumerVersionSelectors: [
    {
      latest: true,
    },
  ],
};
```

  </TabItem>

  <TabItem value="java">

```java
// Requires Pact-JVM 4.1.8 or later
@PactBroker(
  host="pactbroker.local",
  port="8080",
  consumerVersionSelectors={ @VersionSelector(latest = "true") }
)

```

  </TabItem>

  <TabItem value="ruby">

```ruby
Pact.service_provider "Your provider" do
  honours_pacts_from_pact_broker do
    pact_broker_base_url "..."
    consumer_version_selectors [
        { latest: true }
      ]
  end
end
```

  </TabItem>

  <TabItem value="python">

```python
verifier = Verifier(
    provider="Your provider",
    broker_url="...",
    consumer_version_selectors=[
        {"latest": True},
    ],
    # ...
)
```

  </TabItem>

  <TabItem value="c#">

```csharp
      IPactVerifier pactVerifier = new PactVerifier(new PactVerifierConfig())
      .ProviderState($"providerServiceBaseUri/provider-states")
      .ServiceProvider("ProviderPacticipantName", "providerServiceBaseUri")
      .HonoursPactWith("ConsumerPacticipantName")
      .PactBroker(
        "http://pact-broker",
        consumerVersionSelectors: new List<VersionTagSelector>
        {
          new VersionTagSelector("", latest: true)
        });
```

  </TabItem>

  <TabItem value="golang">

```golang
	pact.VerifyProvider(t, types.VerifyRequest{
		ConsumerVersionSelectors: []types.ConsumerVersionSelector{
			types.ConsumerVersionSelector{
				Latest:      true,
			},
		},
        // ...
	})
```

  </TabItem>

</Tabs>
