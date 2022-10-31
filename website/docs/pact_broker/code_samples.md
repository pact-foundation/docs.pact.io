---
title: Code Samples
---

import Tabs from '@theme/Tabs';
import TabItem from '@theme/TabItem';

## Branches 

### Configuring the branch when publishing pacts

<Tabs
  groupId="sdk-choice"
  defaultValue="pact-cli"
  values={[
    { label: 'Pact CLI', value: 'pact-cli', },
    { label: 'Ruby', value: 'ruby' }
  ]
}>
  <TabItem value="pact-cli">

  See [here](/pact_broker/client_cli/readme#publish) for full docs.

  ```
  pact-broker publish ./pacts --consumer-app-version $GIT_COMMIT --branch $GIT_BRANCH

  # or 

  pact-broker publish ./pacts --auto-detect-version-properties
  ```

  </TabItem>
  <TabItem value="ruby">

  See [here](/implementation_guides/ruby/publishing_pacts) for full docs.

  ```ruby
  # In Gemfile

  gem "pact_broker-client"
  
  # In Rakefile

  require "pact_broker/client/tasks"

  PactBroker::Client::PublicationTask.new do | task |
    task.consumer_version = ENV["GIT_COMMIT"]
    task.branch = ENV["GIT_BRANCH"]
  end  
  ```

  </TabItem>
</Tabs>

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


## Consumer version selectors

You can checkout code-snippets below, but here are some links to either documentation, or source code, from the respective languages, around their use of consumer version selectors. Ideally all languages should support raw json version selectors, to allow for extensiblity in the future.

- JavaScript
  - <https://docs.pact.io/implementation_guides/javascript/docs/provider#verification-options>
  - <https://github.com/pact-foundation/pact-js-core/blob/master/src/verifier/types.ts#L3>
- Java
  - <https://docs.pact.io/implementation_guides/jvm/provider/junit#selecting-the-pacts-to-verify-with-consumer-version-selectors-4314>
- Gradle
  - <https://docs.pact.io/implementation_guides/jvm/provider/gradle#using-consumer-version-selectors-4310>
- Ruby
  - <https://docs.pact.io/implementation_guides/ruby/verifying_pacts#fetching-pacts-from-a-pact-broker>
  - <https://github.com/pact-foundation/pact-ruby/blob/master/lib/pact/pact_broker/pact_selection_description.rb>
- Python - Takes raw json consumer_version_selectors
  - <https://github.com/pact-foundation/pact-python/blob/89733d6470cfa4b57102438c464f053093ddd858/pact/verifier.py#L109>
- C#
  - <https://github.com/pact-foundation/pact-net/blob/master/docs/upgrading-to-4.md#provider-tests>
  - <https://github.com/pact-foundation/pact-net/blob/master/src/PactNet.Abstractions/Verifier/ConsumerVersionSelector.cs>
- Golang
  - <https://github.com/pact-foundation/pact-go/blob/2.x.x/docs/provider.md#selecting-pacts-to-verify>
  - <https://github.com/pact-foundation/pact-go/blob/master/types/consumer_version_selector.go>

## Consumer version selectors - Code examples with branches

### Verifying the latest development, test and master pacts

This is the most common use case.

- We recommend using `deployedOrReleased` to return the pacts for all versions of the consumer that are currently deployed or released and currently supported in any environment, this allows the provider to not know that detail and let the Pact broker take care of it for you)
  - alternatively you can target just `deployed` or just `released` consumers across `all` environments , or consumers only in specified `environments`.
- We recommend using `mainBranch` to return the pacts associated with any consumers configured `mainBranch` property (your consumer may have the branch `main`, `master` or `develop`, this allows the provider to not know that detail and let the Pact broker take care of it for you)
- The shown selectors, will target for the provider
  - any pacts for the consumer associated with their configured `mainBranch` property
  - any pacts for the consumers, deployed to `any` environment
    - This if filtered by only pacts `deployed` or `released` to the `test` / `production` environments.
    - If this consumer/provider pair, has an additional environment `staging`, it would not be picked up, due to the named `test` / `production` environments. Removing these conditions, will return any pacts, deployed or released to any environment, which is the recommended setup for the majority of cases. (coupled with enabling pending pacts.)

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
      mainBranch: true, // (recommended) - Returns the pacts for consumers configured mainBranch property
    },
    {
      deployedOrReleased: true, // (recommended) - Returns the pacts for all versions of the consumer that are currently deployed or released and currently supported in any environment.
    },
    {
      environment: 'test', // Normally, this would not be needed, as it is recommended to verify the pacts for all currently deployed/currently supported released versions.
    },
    {
      environment: 'production', // Normally, this would not be needed, as it is recommended to verify the pacts for all currently deployed/currently supported released versions.
    },
  ],
};
```

  </TabItem>

  <TabItem value="java">

```java
  @au.com.dius.pact.provider.junitsupport.loader.PactBrokerConsumerVersionSelectors
  public static SelectorBuilder consumerVersionSelectors() {
    return new SelectorBuilder()
      .mainBranch(); // (recommended) - Returns the pacts for consumers configured mainBranch property
      .deployedOrReleased();  // (recommended) - Returns the pacts for all versions of the consumer that are currently deployed or released and currently supported in any environment.
      .deployedTo('test'); // Normally, this would not be needed, Any versions currently deployed to the specified environment.
      .deployedTo('production'); // Normally, this would not be needed, Any versions currently deployed to the specified environment.
      .environment('test') // Normally, this would not be needed, Any versions currently deployed or released and supported in the specified environment.
      .environment('production') // Normally, this would not be needed, Any versions currently deployed or released and supported in the specified environment.
  }

```

  </TabItem>

  <TabItem value="gradle">

```groovy

pact {
  serviceProviders {
    'Your Service' {
      providerVersion = { '1.2.3' }

      fromPactBroker {
        withSelectors {
            mainBranch() // (recommended) - Returns the pacts for consumers configured mainBranch property
            deployedOrReleased() // (recommended) - Returns the pacts for all versions of the consumer that are currently deployed or released and currently supported in any environment.
            deployedTo('test') // Normally, this would not be needed, Any versions currently deployed to the specified environment.
            deployedTo('test') // Normally, this would not be needed, Any versions currently deployed to the specified environment.
            environment('test')  // Normally, this would not be needed, Any versions currently deployed or released and supported in the specified environment.
            environment('production')  // Normally, this would not be needed, Any versions currently deployed or released and supported in the specified environment.
        }
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
          { mainBranch: true }, # (recommended) - Returns the pacts for consumers configured mainBranch property
          { deployedOrReleased: true }, # (recommended) - Returns the pacts for all versions of the consumer that are currently deployed or released and currently supported in any environment.
          { deployed: "test" }, # Normally, this would not be needed, Any versions currently deployed to the specified environment.
          { deployed: "production" } # Normally, this would not be needed, Any versions currently deployed to the specified environment.
          { environment: "test" }, #  Normally, this would not be needed, Any versions currently deployed or released and supported in the specified environment.
          { environment: "production" } #  Normally, this would not be needed, Any versions currently deployed or released and supported in the specified environment.
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
        {"mainBranch": True}, # (recommended) - Returns the pacts for consumers configured mainBranch property
        {"deployedOrReleased": True}, # (recommended) - Returns the pacts for all versions of the consumer that are currently deployed or released and currently supported in any environment.
        {"deployed": "test"}, # Normally, this would not be needed, Any versions currently deployed to the specified environment.
        {"deployed": "production"}, # Normally, this would not be needed, Any versions currently deployed to the specified environment.
        {"environment": "test"}, #  Normally, this would not be needed, Any versions currently deployed or released and supported in the specified environment.
        {"environment": "production"}, #  Normally, this would not be needed, Any versions currently deployed or released and supported in the specified environment.
    ],
    # ...
)
```

  </TabItem>

  <TabItem value="c#">

```csharp
    IPactVerifier verifier = new PactVerifier(config); 
    verifier.ServiceProvider("My Provider", this.fixture.ServerUri)
        .WithPactBrokerSource(new Uri("https://broker.example.org"), options =>
        {
            options.ConsumerVersionSelectors(new ConsumerVersionSelector { MainBranch = true }, // (recommended) - Returns the pacts for consumers configured mainBranch property
                                                  new ConsumerVersionSelector { DeployedOrReleased = true } // (recommended) - Returns the pacts for all versions of the consumer that are currently deployed or released and currently supported in any environment.
                                                  new ConsumerVersionSelector { Deployed = true, Environment = "test" }, // Normally, this would not be needed, Any versions currently deployed to the specified environment.
                                                  new ConsumerVersionSelector { Deployed = true, Environment = "production" }, // Normally, this would not be needed, Any versions currently deployed to the specified environment.
                                                  new ConsumerVersionSelector { Released = true, Deployed = true, Environment = "test" }, //  Normally, this would not be needed, Any versions currently deployed or released and supported in the specified environment.
                                                  new ConsumerVersionSelector { Released = true, Deployed = true, Environment = "production" }, //  Normally, this would not be needed, Any versions currently deployed or released and supported in the specified environment.
                                                  )
                    .PublishResults(version, results =>
                    {
                        results.ProviderBranch(branch)
                              .BuildUri(new Uri(buildUri));
                    });
        })
        .WithProviderStateUrl(new Uri(this.fixture.ServerUri, "/provider-states"))
        .Verify();       
```

  </TabItem>

  <TabItem value="golang">

```golang
 pact.VerifyProvider(t, types.VerifyRequest{
  ConsumerVersionSelectors: []types.ConsumerVersionSelector{
   types.ConsumerVersionSelector{
    MainBranch:      true,  // (recommended) - Returns the pacts for consumers configured mainBranch property
   },
   types.ConsumerVersionSelector{
    DeployedOrReleased:      true, // (recommended) - Returns the pacts for all versions of the consumer that are currently deployed or released and currently supported in any environment.
   },
   types.ConsumerVersionSelector{
    Deployed:         "test", // Normally, this would not be needed, Any versions currently deployed to the specified environment.
   },
   types.ConsumerVersionSelector{
    Deployed:         "production", // Normally, this would not be needed, Any versions currently deployed to the specified environment.
   },
   types.ConsumerVersionSelector{
    Environment:         "test", //  Normally, this would not be needed, Any versions currently deployed or released and supported in the specified environment.
   },
   types.ConsumerVersionSelector{
    Environment:         "production", //  Normally, this would not be needed, Any versions currently deployed or released and supported in the specified environment.
   },
  },
        // ...
 })
```

  </TabItem>

</Tabs>

### Using a matching branch for coordinated branch development

Dynamically determine the current branch of the provider, see if there is a matching pact for that branch.

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
      matchingBranch: true, // Returns the pacts for providers configured branch property in the verification task. Normally covered by contract_requiring_verification_published event + corresponding webhook
    },
    {
      mainBranch: true, // (recommended) - Returns the pacts for consumers configured mainBranch property
    },
    {
      deployedOrReleased: true, // (recommended) - Returns the pacts for all versions of the consumer that are currently deployed or released and currently supported in any environment.
    },
  ],
};
```

  </TabItem>

  <TabItem value="java">

```java
// Requires Pact-JVM 4.1.10 or later
  @au.com.dius.pact.provider.junitsupport.loader.PactBrokerConsumerVersionSelectors
  public static SelectorBuilder consumerVersionSelectors() {
    return new SelectorBuilder()
      .matchingBranch(); // Returns the pacts for providers configured branch property in the verification task. Normally covered by contract_requiring_verification_published event + corresponding webhook
      .mainBranch(); // (recommended) - Returns the pacts for consumers configured mainBranch property
      .deployedOrReleased();  // (recommended) - Returns the pacts for all versions of the consumer that are currently deployed or released and currently supported in any environment.
  }
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
        withSelectors {
            matchingBranch() // Returns the pacts for providers configured branch property in the verification task. Normally covered by contract_requiring_verification_published event + corresponding webhook
            mainBranch() // (recommended) - Returns the pacts for consumers configured mainBranch property
            deployedOrReleased() // (recommended) - Returns the pacts for all versions of the consumer that are currently deployed or released and currently supported in any environment.
        }
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
          { matchingBranch: true }, # Returns the pacts for providers configured branch property in the verification task. Normally covered by contract_requiring_verification_published event + corresponding webhook
          { mainBranch: true }, # (recommended) - Returns the pacts for consumers configured mainBranch property
          { deployedOrReleased: true }, # (recommended) - Returns the pacts for all versions of the consumer that are currently deployed or released and currently supported in any environment.
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
        {"matchingBranch": True}, #  Returns the pacts for providers configured branch property in the verification task. Normally covered by contract_requiring_verification_published event + corresponding webhook
        {"mainBranch": True}, # (recommended) - Returns the pacts for consumers configured mainBranch property
        {"deployedOrReleased": True}, # (recommended) - Returns the pacts for all versions of the consumer that are currently deployed or released and currently supported in any environment.
    ],
    # ...
)
```

  </TabItem>

  <TabItem value="c#">

```csharp
    IPactVerifier verifier = new PactVerifier(config); 
    verifier.ServiceProvider("My Provider", this.fixture.ServerUri)
        .WithPactBrokerSource(new Uri("https://broker.example.org"), options =>
        {
            options.ConsumerVersionSelectors(new ConsumerVersionSelector { MatchingBranch = true }, //  Returns the pacts for providers configured branch property in the verification task. Normally covered by contract_requiring_verification_published event + corresponding webhook
                                                  new ConsumerVersionSelector { DeployedOrReleased = true } // (recommended) - Returns the pacts for all versions of the consumer that are currently deployed or released and currently supported in any environment.
                                                  new ConsumerVersionSelector { MainBranch = true }, // (recommended) - Returns the pacts for consumers configured mainBranch property
                                                  )
                    .PublishResults(version, results =>
                    {
                        results.ProviderBranch(branch)
                              .BuildUri(new Uri(buildUri));
                    });
        })
        .WithProviderStateUrl(new Uri(this.fixture.ServerUri, "/provider-states"))
        .Verify();     
```

  </TabItem>

  <TabItem value="golang">

```golang
 pact.VerifyProvider(t, types.VerifyRequest{
  ConsumerVersionSelectors: []types.ConsumerVersionSelector{
   types.ConsumerVersionSelector{
    MatchingBranch:      true,  //  Returns the pacts for providers configured branch property in the verification task. Normally covered by contract_requiring_verification_published event + corresponding webhook
   },
   types.ConsumerVersionSelector{
    MainBranch:      true,  // (recommended) - Returns the pacts for consumers configured mainBranch property
   },
   types.ConsumerVersionSelector{
    DeployedOrReleased:      true, // (recommended) - Returns the pacts for all versions of the consumer that are currently deployed or released and currently supported in any environment.
   },
  },
        // ...
 })
```

  </TabItem>

</Tabs>

### Verifying pacts where the consumer is a mobile application

Verify the pacts for the latest `master` and `test` versions, and all `production` versions of "my-mobile-consumer".

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
      mainBranch: true, // (recommended) - Returns the pacts for consumers configured mainBranch property
    },
    {
      deployed: 'test', // only the latest deployed version to test
    },
    {
      deployedOrReleased: 'production', // all deployed or released versions in production
    },
  ],
};
```

  </TabItem>

  <TabItem value="java">

```java
  @au.com.dius.pact.provider.junitsupport.loader.PactBrokerConsumerVersionSelectors
  public static SelectorBuilder consumerVersionSelectors() {
    return new SelectorBuilder()
      .mainBranch(); // (recommended) - Returns the pacts for consumers configured mainBranch property
      .deployedTo('test'); // only the latest deployed version to test
      .environment('production') // all deployed or released versions in production
  }

```

  </TabItem>

  <TabItem value="gradle">

```groovy

pact {
  serviceProviders {
    'Your Service' {
      providerVersion = { '1.2.3' }

      fromPactBroker {
        withSelectors {
            mainBranch() // (recommended) - Returns the pacts for consumers configured mainBranch property
            deployedTo('test') // only the latest deployed version to test
            environment('production')  // all deployed or released versions in production
        }
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
          { mainBranch: true }, # (recommended) - Returns the pacts for consumers configured mainBranch property
          { deployed: "test" }, # only the latest deployed version to test
          { environment: "production" } #  all deployed or released versions in production
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
        {"mainBranch": True}, # (recommended) - Returns the pacts for consumers configured mainBranch property
        {"deployed": "test"}, # only the latest deployed version to test
        {"environment": "production"}, # all deployed or released versions in production
    ],
    # ...
)
```

  </TabItem>

  <TabItem value="c#">

```csharp
    IPactVerifier verifier = new PactVerifier(config); 
    verifier.ServiceProvider("My Provider", this.fixture.ServerUri)
        .WithPactBrokerSource(new Uri("https://broker.example.org"), options =>
        {
            options.ConsumerVersionSelectors(new ConsumerVersionSelector { MainBranch = true }, // (recommended) - Returns the pacts for consumers configured mainBranch property
                                                  new ConsumerVersionSelector { Deployed = true, Environment = "test" }, // only the latest deployed version to test
                                                  new ConsumerVersionSelector { Released = true, Deployed = true, Environment = "production" }, // all deployed or released versions in production
                                                  )
                    .PublishResults(version, results =>
                    {
                        results.ProviderBranch(branch)
                              .BuildUri(new Uri(buildUri));
                    });
        })
        .WithProviderStateUrl(new Uri(this.fixture.ServerUri, "/provider-states"))
        .Verify();       
```

  </TabItem>

  <TabItem value="golang">

```golang
 pact.VerifyProvider(t, types.VerifyRequest{
  ConsumerVersionSelectors: []types.ConsumerVersionSelector{
   types.ConsumerVersionSelector{
    MainBranch:      true,  // (recommended) - Returns the pacts for consumers configured mainBranch property
   },
   types.ConsumerVersionSelector{
    Deployed:         "test", // only the latest deployed version to test
   },
   types.ConsumerVersionSelector{
    Environment:         "production", //  all deployed or released versions in production
   },
  },
        // ...
 })
```

  </TabItem>

</Tabs>

### Verifying a pacts where one consumer is a mobile application

Verify the latest `production` version of all consumers, and all `production` versions of "my-mobile-consumer". Note that the pacts are [deduplicated](#deduplication), so despite being included by 2 selectors, the verification of the latest production pact for "my-mobile-consumer" will only run once.

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
      mainBranch: true, // (recommended) - Returns the pacts for consumers configured mainBranch property
    },
    {
      deployed: 'test', // Verify the latest deployed `test` version of all consumers
    },
    {
      deployed: 'production', // Verify the latest deployed `production` version of all consumers
    },
    {
      deployedOrReleased: 'production', // Verify all deployed or released `production` versions of my-mobile-consumer
      consumer: 'my-mobile-consumer'
    },
  ],
};
```

  </TabItem>

  <TabItem value="java">

```java
  @au.com.dius.pact.provider.junitsupport.loader.PactBrokerConsumerVersionSelectors
  public static SelectorBuilder consumerVersionSelectors() {
    return new SelectorBuilder()
      .mainBranch(); // (recommended) - Returns the pacts for consumers configured mainBranch property
      .deployedTo('test'); // Verify the latest deployed `test` version of all consumers
      .deployedTo('production'); // Verify the latest deployed `production` version of all consumers
      .rawSelectorJson('{ "deployedOrReleased": "production", "consumer": "my-mobile-consumer" }') // Verify all deployed or released `production` versions of my-mobile-consumer
  }

```

  </TabItem>

  <TabItem value="gradle">

```groovy

pact {
  serviceProviders {
    'Your Service' {
      providerVersion = { '1.2.3' }

      fromPactBroker {
        withSelectors {
            mainBranch() // (recommended) - Returns the pacts for consumers configured mainBranch property
            deployedTo('test') // Verify the latest deployed `test` version of all consumers
            deployedTo('production')  // Verify the latest deployed `production` version of all consumers
            rawSelectorJson('{ "deployedOrReleased": "production", "consumer": "my-mobile-consumer" }') // Verify all deployed or released `production` versions of my-mobile-consumer
        }
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
          { mainBranch: true }, # (recommended) - Returns the pacts for consumers configured mainBranch property
          { deployed: "test" }, # Verify the latest deployed `test` version of all consumers
          { deployed: "production" }, # Verify the latest deployed `production` version of all consumers
          { deployedOrReleased: "production", consumer: "my-mobile-consumer" } #  Verify all deployed or released `production` versions of my-mobile-consumer
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
        {"mainBranch": True}, # (recommended) - Returns the pacts for consumers configured mainBranch property
        {"deployed": "test"}, # Verify the latest deployed `test` version of all consumers
        {"deployed": "production"}, # Verify the latest deployed `production` version of all consumers
        {"environment": "production", "consumer": "my-mobile-consumer" }, #  Verify all deployed or released `production` versions of my-mobile-consumer
    ],
    # ...
)
```

  </TabItem>

  <TabItem value="c#">

```csharp
    IPactVerifier verifier = new PactVerifier(config); 
    verifier.ServiceProvider("My Provider", this.fixture.ServerUri)
        .WithPactBrokerSource(new Uri("https://broker.example.org"), options =>
        {
            options.ConsumerVersionSelectors(new ConsumerVersionSelector { MainBranch = true }, // (recommended) - Returns the pacts for consumers configured mainBranch property
                                                  new ConsumerVersionSelector { Deployed = true, Environment = "test" }, // Verify the latest deployed `test` version of all consumers
                                                  new ConsumerVersionSelector { Deployed = true, Environment = "production" }, // Verify the latest deployed `production` version of all consumers
                                                  new ConsumerVersionSelector { Released = true, Deployed = true, Environment = "production", Consumer = "my-mobile-consumer" }, // Verify all deployed or released `production` versions of my-mobile-consumer
                                                  )
                    .PublishResults(version, results =>
                    {
                        results.ProviderBranch(branch)
                              .BuildUri(new Uri(buildUri));
                    });
        })
        .WithProviderStateUrl(new Uri(this.fixture.ServerUri, "/provider-states"))
        .Verify();       
```

  </TabItem>

  <TabItem value="golang">

```golang
 pact.VerifyProvider(t, types.VerifyRequest{
  ConsumerVersionSelectors: []types.ConsumerVersionSelector{
   types.ConsumerVersionSelector{
    MainBranch:      true,  // (recommended) - Returns the pacts for consumers configured mainBranch property
   },
   types.ConsumerVersionSelector{
    Deployed:         "test", // Verify the latest deployed `test` version of all consumers
   },
   types.ConsumerVersionSelector{
    Deployed:         "production", //  Verify the latest deployed `production` version of all consumers
   },
   types.ConsumerVersionSelector{
    Environment:         "production", //  Verify all deployed or released `production` versions of my-mobile-consumer
    Consumer:    "my-mobile-consumer",
   },
  },
        // ...
 })
```

  </TabItem>

</Tabs>

### Verifying the overall latest pact for each consumer

Verifying the overall latest pact for each consumer is syntactically possible, but not recommended, as pacts for different branches of the consumer may overwrite each other as the current latest.

You can do this by setting `latest: true`, however as this is wholly unrecommended, we instead show the minimum ideal requirement, to cover the latest pacts for

- any consumer that is registered with the provider
  - the latest pact for any environment the consumer is `deployed` to
  - the latest pact, for any environment in the consumer is `released` to
  - the latest pact, for the consumer configured `mainBranch`

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
      mainBranch: true, // (recommended) - Returns the pacts for consumers configured mainBranch property
    },
    {
      deployedOrReleased: true, // (recommended) - Returns the pacts for all versions of the consumer that are currently deployed or released and currently supported in any environment.
    },
  ],
};
```

  </TabItem>

  <TabItem value="java">

```java
  @au.com.dius.pact.provider.junitsupport.loader.PactBrokerConsumerVersionSelectors
  public static SelectorBuilder consumerVersionSelectors() {
    return new SelectorBuilder()
      .mainBranch(); // (recommended) - Returns the pacts for consumers configured mainBranch property
      .deployedOrReleased();  // (recommended) - Returns the pacts for all versions of the consumer that are currently deployed or released and currently supported in any environment.
  }

```

  </TabItem>

  <TabItem value="gradle">

```groovy

pact {
  serviceProviders {
    'Your Service' {
      providerVersion = { '1.2.3' }

      fromPactBroker {
        withSelectors {
            mainBranch() // (recommended) - Returns the pacts for consumers configured mainBranch property
            deployedOrReleased() // (recommended) - Returns the pacts for all versions of the consumer that are currently deployed or released and currently supported in any environment.
        }
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
          { mainBranch: true }, # (recommended) - Returns the pacts for consumers configured mainBranch property
          { deployedOrReleased: true }, # (recommended) - Returns the pacts for all versions of the consumer that are currently deployed or released and currently supported in any environment.
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
        {"mainBranch": True}, # (recommended) - Returns the pacts for consumers configured mainBranch property
        {"deployedOrReleased": True}, # (recommended) - Returns the pacts for all versions of the consumer that are currently deployed or released and currently supported in any environment.
    ],
    # ...
)
```

  </TabItem>

  <TabItem value="c#">

```csharp
    IPactVerifier verifier = new PactVerifier(config); 
    verifier.ServiceProvider("My Provider", this.fixture.ServerUri)
        .WithPactBrokerSource(new Uri("https://broker.example.org"), options =>
        {
            options.ConsumerVersionSelectors(new ConsumerVersionSelector { MainBranch = true }, // (recommended) - Returns the pacts for consumers configured mainBranch property
                                                  new ConsumerVersionSelector { DeployedOrReleased = true } // (recommended) - Returns the pacts for all versions of the consumer that are currently deployed or released and currently supported in any environment.
                                                  )
                    .PublishResults(version, results =>
                    {
                        results.ProviderBranch(branch)
                              .BuildUri(new Uri(buildUri));
                    });
        })
        .WithProviderStateUrl(new Uri(this.fixture.ServerUri, "/provider-states"))
        .Verify();       
```

  </TabItem>

  <TabItem value="golang">

```golang
 pact.VerifyProvider(t, types.VerifyRequest{
  ConsumerVersionSelectors: []types.ConsumerVersionSelector{
   types.ConsumerVersionSelector{
    MainBranch:      true,  // (recommended) - Returns the pacts for consumers configured mainBranch property
   },
   types.ConsumerVersionSelector{
    DeployedOrReleased:      true, // (recommended) - Returns the pacts for all versions of the consumer that are currently deployed or released and currently supported in any environment.
   },
  },
        // ...
 })
```

  </TabItem>

</Tabs>

## Consumer version selectors - Code examples with tags

### Verifying the latest development, test and master pacts

This is the most common use case.

<Tabs
groupId="sdk-choice-tags"
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

Dynamically determine the current branch of the provider, see if there is a matching pact for that branch, fallback to the `master` pact if none exists. This approach is not longer recommended - see the note on the `fallbackTag` at the top of the page.

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





## Verifying pacts
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
    ...(process.env.GIT_BRANCH === "main"
  ? {
      includeWipPactsSince: "2020-01-01",
    }
  : {})

    // used when publishing verification results
    publishVerificationResult: process.env.CI === "true", //only publish from CI
    providerVersion: process.env.GIT_COMMIT, //use the appropriate env var from your CI system
    providerVersionBranch: process.env.GIT_BRANCH,  //use the appropriate env var from your CI system
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
