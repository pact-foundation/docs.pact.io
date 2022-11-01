---
title: Publish Pacts
description: Code snippets to connect to your broker
---

import Tabs from '@theme/Tabs';
import TabItem from '@theme/TabItem';
import {
  languageIconsWithLabels,
} from "../../src/data/icons";

## Code snippets to connect to your broker

### Consumer

<Tabs groupId="languages">
<TabItem value="js" label={languageIconsWithLabels.label_javascript} >

#### Pact JS (Node JS)

- [Pact-JS documentation](https://github.com/pact-foundation/pact-node/#pact-broker-publishing) for all the pact publication options.

```js
const { Publisher } = require("@pact-foundation/pact")
const opts = {
pactBroker: 'https://<YOUR_BROKER>.pactflow.io',
pactBrokerToken: '<TOKEN>',
consumerVersion: process.env.GIT_COMMIT
pactFilesOrDirs: ['./pacts'],
};

new Publisher(opts).publishPacts()
```

</TabItem>

<TabItem value="java" label={languageIconsWithLabels.label_java} >

#### Java / JUnit 5

- [Pact-JVM documentation](https://docs.pact.io/implementation_guides/jvm/provider/gradle#publishing-pact-files-to-a-pact-broker) for all the pact publication options.

```groovy
pact {
  publish {
    providerVersion = {  '<GIT_COMMIT>' } //yes, this field name is correct :(
    pactBrokerUrl = 'https://<YOUR_BROKER>.pactflow.io/'
    pactBrokerToken = '<TOKEN>'
  }
}
```

#### Java / JUnit 4

```groovy
pact {
  publish {
    providerVersion = {  '<GIT_COMMIT>' } //yes, this field name is correct :(
    pactBrokerUrl = 'https://<YOUR_BROKER>.pactflow.io/'
    pactBrokerToken = '<TOKEN>'
  }
}
```

#### Java / Gradle

```groovy
pact {
  publish {
    providerVersion = {  '<GIT_COMMIT>' } //yes, this field name is correct :(
    pactBrokerUrl = 'https://<YOUR_BROKER>.pactflow.io/'
    pactBrokerToken = '<TOKEN>'
  }
}
```

</TabItem>

<TabItem value="golang" label={languageIconsWithLabels.label_golang} >

#### Golang

```go
p := dsl.Publisher{}
err := p.Publish(types.PublishRequest{
  PactURLs:        []string{"/path/to/pact/file"},
  PactBroker:      "https://<YOUR_BROKER>.pactflow.io",
  ConsumerVersion: "<GIT_COMMIT>",
  BrokerToken:     "<TOKEN>",
})
```

</TabItem>

<TabItem value="ruby" label={languageIconsWithLabels.label_ruby} >

#### Ruby

- [Pact Ruby documentation](https://github.com/pact-foundation/pact_broker-client#usage---ruby) for all the pact publishing options.

```ruby title='Rakefile'
require 'pact_broker/client/tasks'

PactBroker::Client::PublicationTask.new do | task |
task.consumer_version = ENV['GIT_COMMIT']
task.pact_broker_base_url = "https://<YOUR_BROKER>.pactflow.io"
task.pact_broker_token = "<TOKEN>"
end
```

</TabItem>

<TabItem value="dotnet" label={languageIconsWithLabels.label_dotnet} >

#### .NET

- [PactNet documentation](https://github.com/pact-foundation/pact-net#using-the-c-client) for all the pact publishing options.

```csharp title="Pact Publisher options"
var pactPublisher = new PactPublisher("http://<YOUR_BROKER>.pactflow.io",
  new PactUriOptions("<TOKEN>"));
pactPublisher.PublishToBroker("/pact/to/pacts/dir",
  Environment.GetEnvironmentVariable("GIT_COMMIT"));
```

</TabItem>

 <TabItem value="docker" label={languageIconsWithLabels.label_docker} >

#### Docker

- [Pact CLI Docker documentation](https://hub.docker.com/r/pactfoundation/pact-cli) for all the pact publishing options.

```bash
docker run --rm \
-v ${PWD}:${PWD} \
-e PACT_BROKER_BASE_URL="https://<YOUR_BROKER>.pactflow.io" \
-e PACT_BROKER_TOKEN="<TOKEN>" \
pactfoundation/pact-cli:latest \
publish \
${PWD}/pacts \
--consumer-app-version ${GIT_COMMIT}
```

</TabItem>

</Tabs>


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

