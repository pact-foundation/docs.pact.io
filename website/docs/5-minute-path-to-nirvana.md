---
id: 5-minute-path-to-nirvana
title: 5 minute path to nirvana
description: From zero to running Pact tests in 5 mins
---
import Tabs from "@theme/Tabs";
import TabItem from "@theme/TabItem";
import {
  languageIconsWithLabels,
} from "../src/data/icons";

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

### Provider

<Tabs groupId="languages">

 <TabItem value="js" label={languageIconsWithLabels.label_javascript} >

#### Pact JS (Node JS)

- [Pact-JS documentation](https://docs.pact.io/implementation_guides/javascript/readme#verification-options) for all the pact verification options.

```js
const { Verifier } = require("@pact-foundation/pact");

return new Verifier().verifyProvider({
  provider: "<Your provider name here>",
  providerBaseUrl: "http://localhost:8081",

  // Fetch pacts from broker
  pactBrokerUrl: "https://<YOUR_BROKER>.pactflow.io/",
  pactBrokerToken: "<TOKEN>",

  publishVerificationResult: process.env.CI === "true",
  providerVersion: process.env.GIT_COMMIT,
});
```

</TabItem>

<TabItem value="java" label={languageIconsWithLabels.label_java} >

#### Java / JUnit 5

- [Pact-JVM documentation](https://docs.pact.io/implementation_guides/jvm/provider/gradle#publishing-verification-results-to-a-pact-broker) for all the pact verification options.

```java
@Provider("<Your provider name here>")
@PactBroker(host = "<YOUR_BROKER>.pactflow.io", scheme = "https",
  authentication = @PactBrokerAuth(scheme = "bearer", username = "<TOKEN>", password = ""))
public class PactJUnitBrokerTest {

    @TestTemplate
    @ExtendWith(PactVerificationInvocationContextProvider.class)
    void testTemplate(Pact pact, Interaction interaction, HttpRequest request, PactVerificationContext context) {
      context.verifyInteraction();
    }
}
```

#### Java / JUnit 4

- [Pact-JVM documentation](https://docs.pact.io/implementation_guides/jvm/provider/gradle#publishing-verification-results-to-a-pact-broker) for all the pact verification options.

```java
@RunWith(PactRunner.class)
@Provider("<Your provider name here>")
@PactBroker(host = "<YOUR_BROKER>.pactflow.io", scheme = "https",
  authentication = @PactBrokerAuth(scheme = "bearer", username = "<TOKEN>", password = ""))
public class PactJUnitBrokerTest {
  @TestTarget
  public final Target target = new HttpTarget(8080);
}
```

#### Java / Gradle

- [Pact-JVM documentation](https://docs.pact.io/implementation_guides/jvm/provider/gradle#publishing-verification-results-to-a-pact-broker) for all the pact verification options.

```groovy
// To turn on the verification publishing,
// set the project property `pact.verifier.publishResults` to `true`

pact {
  serviceProviders {
    '<Your provider name here>' {

      providerVersion = { '<GIT_COMMIT>' }
      hasPactsFromPactBroker('https://<YOUR_BROKER>.pactflow.io/',
        authentication: ['Bearer', '<TOKEN>'])

    }
  }
}
```

</TabItem>

<TabItem value="golang" label={languageIconsWithLabels.label_golang}>

#### Golang

```go
_, err := pact.VerifyProvider(t, types.VerifyRequest{
  ProviderBaseURL:            fmt.Sprintf("http://127.0.0.1:%d", port),
  BrokerURL:                  "https://<YOUR_BROKER>.pactflow.io",
  BrokerToken:                "<TOKEN>",
  PublishVerificationResults: true,
  ProviderVersion:            "<GIT_COMMIT>"
})
```

</TabItem>

<TabItem value="ruby" label={languageIconsWithLabels.label_ruby}>

#### Ruby

- [Pact Ruby documentation](https://docs.pact.io/implementation_guides/ruby/verifying_pacts/) for all the verification options.

```ruby title='spec/pact_helper.rb'
Pact.service_provider "<Your provider name here>" do
  app_version ENV['GIT_COMMIT']
  publish_verification_results ENV['CI'] == 'true'

  honours_pacts_from_pact_broker do
    pact_broker_base_url "https://<YOUR_BROKER>.pactflow.io", { token: "<TOKEN>" }
  end
end
```

</TabItem>
<TabItem value="dotnet" label={languageIconsWithLabels.label_cplusplus}>

#### .NET

[PactNet documentation](https://github.com/pact-foundation/pact-net#publishing-provider-verification-results-to-a-broker) for all the pact verification options.

```csharp title="Provider verification options"
var ProviderVersion = Environment.GetEnvironmentVariable("GIT_COMMIT");
var PublishVerificationResults = "true".Equals(Environment.GetEnvironmentVariable("CI"));
var config = new PactVerifierConfig
{
    ProviderVersion, //NOTE: Setting a provider version is required for publishing verification results
    PublishVerificationResults
};
IPactVerifier pactVerifier = new PactVerifier(config);
pactVerifier
    .ServiceProvider("<Your provider name here>", "http://your-test-provider-url")
   .PactBroker("https://<YOUR_BROKER>.pactflow.io", uriOptions: new PactUriOptions("<TOKEN>"))
   .Verify();
```


</TabItem>

<TabItem value="docker" label={languageIconsWithLabels.label_docker} >

#### Docker

```docker title=docker-compose-verify.yml
version: "3"

services:
  api:
    image: "your image"
    expose:
      - "9292"

  pact_verifier:
    image: pactfoundation/pact-cli:latest
    depends_on:
      - api
    environment:
      - PACT_BROKER_BASE_URL="https://<YOUR_BROKER>.pactflow.io"
      - PACT_BROKER_TOKEN="<TOKEN>"
    command: >
      verify
      --provider-base-url http://api:9292
      --provider "<Your provider name here>"
```

To run

```bash
docker-compose -f docker-compose-verify.yml up \
    --build --abort-on-container-exit --exit-code-from pact_verifier
```

</TabItem>

</Tabs>
