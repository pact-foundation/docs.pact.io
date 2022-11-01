---
title: Broker Connection
description: Code snippets to connect to your broker
---

import Tabs from "@theme/Tabs";
import TabItem from "@theme/TabItem";
import {
  languageIconsWithLabels,
} from "../../src/data/icons";

## Code snippets to connect to your broker

Code snippets to connect to your broker

### Pact

### Pactflow

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


### Pactflow

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
