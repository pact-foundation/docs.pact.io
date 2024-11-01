---
title: Step 4 - Create Provider Pact Test
sidebar_label: Step 4 - Create Provider Pact Test
---

import Tabs from '@theme/Tabs';
import TabItem from '@theme/TabItem';

## Learning Objectives

| Step                                                                                                            | Title                                          | Concept Covered         | Learning objectives                                                                                                                                                 | Further Reading             |
| --------------------------------------------------------------------------------------------------------------- | ---------------------------------------------- | ----------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------- |
| [step 4](https://github.com/pact-foundation/pact-workshop-message?tab=readme-ov-file#step-4---create-provider-pact-test) | Verify the consumer pact with the Provider API | Provider side pact test | <ul><li>Understand basic Provider-side Pact concepts</li><li>Place provider side testing in a broader testing context (e.g. where it fits on the pyramid)</li></ul> | <ul><li>TODO LINK</li></ul> |

<hr/>

As per the Consumer case, Pact takes the position of the intermediary (MQ/broker) and checks to see whether or not the Provider sends a message that matches the Consumer's expectations.

### Verifying messages

Pact does this by using a proxy HTTP server in place of the message queue, some Pact DSL's will create one for you, in other languages you may need to create you own.

The verifier will read interactions in a pact file, and for asynchronous messages, will send POST request to the configured provider endpoint and expect the message payload in the response. 

The POST request will include the description and any provider states configured in the Pact file for the message, formatted as JSON.

Example POST request:

```json
{
  "description": "Test Message",
  "providerStates": [{ "name": "message exists" }]
}
```

### Verifying metadata

Message metadata can be included as base64 encoded key/value pairs in the response, packed into the `pact-message-metadata` HTTP header, and will be compared against any expected metadata in the pact file.

The values may contain any valid JSON. Languages that include a message http proxy should automatically encode and decode the metadata for you.

For example, given this metadata:

```json
{
  "Content-Type": "application/json",
  "topic": "baz",
  "number": 27,
  "complex": {
    "foo": "bar"
  }
}
```

The Pact framework, or the user would encode it into a base64 string, giving us `ewogICJDb250ZW50LVR5cGUiOiAiYXBwbGljYXRpb24vanNvbiIsCiAgInRvcGljIjogImJheiIsCiAgIm51bWJlciI6IDI3LAogICJjb21wbGV4IjogewogICAgImZvbyI6ICJiYXIiCiAgfQp9Cg==`.

The Pact framework, would them compare the provided metadata, with that contained in the pact interaction which has been replayed, ensuring that the metadata generated, matches the consumers exceptations. This may be important, dependant on your use case, in our example, we are ensuring that the message is sent to the correct topic.

### Writing our test

1.  We require our system under test, which will be the API producer contains a function called create event which is responsible for generating the message that will be sent to the consumer via some message queue. 
    1.  We will use our `Product` domain model as we will use this to ensure the messages we generate comply with our Domain.
2.  Import the Pact DSL in the language of choice, and set up options
3.  We configure Pact to stand-in for the queue. The most important bit here is the `messageProviders` .
    - Similar to the Consumer tests, we map the various interactions that are going to be verified as denoted by their `description` field. In the JavaScript case, `a product event update`, maps to the `createEvent` handler.
    - We are using the `providerWithMetadata` function because we are also going to validate message metadata (in this case, the queue the message will be sent on).
    - The Python & Rust examples require the user to create the message proxy themselves, and the metadata is encoded and decoded manually. The user should inform the Pact framework of the location of the `async-message` proxy, with a hostname, path and port.
4.  We can now run the verification process. Pact will read all of the interactions specified by its consumer, and invoke each function that is responsible for generating that message.

<Tabs
groupId="sdk-choice"
defaultValue="javascript"
values={[
{label: 'Javascript', value: 'javascript', },
{label: 'Java', value: 'java', },
{label: 'Python', value: 'python', },
{label: 'C#', value: 'c#', },
{label: 'Golang', value: 'golang', },
{label: 'Rust', value: 'rust', },
]}>

<TabItem value="javascript">

in `provider-js-kafka/src/product/product.pact.test.js`:

```javascript
// 1. Import message producing function, and Product domain object
const { createEvent } = require("./product.event");
const { Product } = require("./product");

// 2. Import Pact DSL
const {
  MessageProviderPact,
  providerWithMetadata,
} = require("@pact-foundation/pact");

const path = require("path");

describe("Message provider tests", () => {
  // 3. Arrange

  // Pact sources - here we are going to use a local file
  const pactUrl =
    process.env.PACT_URL ||
    path.join(
      __dirname,
      "..",
      "..",
      "..",
      "consumer-js-kafka",
      "pacts",
      "pactflow-example-consumer-js-kafka-pactflow-example-provider-js-kafka.json"
    );

  const opts = {
    pactUrls: [pactUrl],
    // Pact message providers
    messageProviders: {
      "a product event update": providerWithMetadata(
        () => createEvent(new Product("42", "food", "pizza"), "UPDATED"),
        {
          kafka_topic: "products",
        }
      ),
    },
  };

  const p = new MessageProviderPact(opts);

  describe("product api publishes an event", () => {
    it("can generate messages for specified consumers", () => {
      // 4. Run the pact verification
      return p.verify();
    });
  });
});
```

</TabItem>

<TabItem value="java">

in `provider-java-kafka/src/test/java/io/pactflow/example/kafka/ProductsKafkaProducerTest.java`:

```java
package io.pactflow.example.kafka;

import au.com.dius.pact.core.model.Interaction;
import au.com.dius.pact.core.model.Pact;
import au.com.dius.pact.provider.MessageAndMetadata;
import au.com.dius.pact.provider.PactVerifyProvider;
import au.com.dius.pact.provider.junit5.MessageTestTarget;
import au.com.dius.pact.provider.junit5.PactVerificationContext;
import au.com.dius.pact.provider.junit5.PactVerificationInvocationContextProvider;
import au.com.dius.pact.provider.junitsupport.AllowOverridePactUrl;
import au.com.dius.pact.provider.junitsupport.Provider;
import au.com.dius.pact.provider.junitsupport.loader.PactFolder;
import au.com.dius.pact.provider.junitsupport.loader.PactBrokerAuth;
import au.com.dius.pact.provider.junitsupport.loader.SelectorBuilder;

import java.util.HashMap;

import com.fasterxml.jackson.core.JsonProcessingException;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.TestTemplate;
import org.junit.jupiter.api.extension.ExtendWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.messaging.Message;

@Provider("pactflow-example-provider-java-kafka")
@PactFolder("${PACT_FOLDER}")
public class ProductsKafkaProducerTest {
  private static final Logger LOGGER = LoggerFactory.getLogger(ProductsKafkaProducerTest.class);

  @TestTemplate
  @ExtendWith(PactVerificationInvocationContextProvider.class)
  void testTemplate(Pact pact, Interaction interaction, PactVerificationContext context) {
    context.verifyInteraction();
  }

  @BeforeEach
  void before(PactVerificationContext context) {
    context.setTarget(new MessageTestTarget());
  }

  @PactVerifyProvider("a product event update")
  public MessageAndMetadata productUpdateEvent() throws JsonProcessingException {
    ProductEvent product = new ProductEvent("id1", "product name", "product type", "v1", EventType.UPDATED, 15.00);
    Message<String> message = new ProductMessageBuilder().withProduct(product).build();

    return generateMessageAndMetadata(message);
  }

  @PactVerifyProvider("a product created event")
  public MessageAndMetadata productCreatedEvent() throws JsonProcessingException {
    ProductEvent product = new ProductEvent("id1", "product name", "product type", "v1", EventType.CREATED, 27.00);
    Message<String> message = new ProductMessageBuilder().withProduct(product).build();

    return generateMessageAndMetadata(message);
  }

  private MessageAndMetadata generateMessageAndMetadata(Message<String> message) {
    HashMap<String, Object> metadata = new HashMap<String, Object>();
    message.getHeaders().forEach((k, v) -> metadata.put(k, v));

    return new MessageAndMetadata(message.getPayload().getBytes(), metadata);
  }
}
```

</TabItem>

<TabItem value="c#">

in `provider-dotnet-kafka/tests/ProviderApiTests.cs`:

```csharp
using System;
using System.IO;
using System.Collections.Generic;
using PactNet.Infrastructure.Outputters;
using PactNet.Output.Xunit;
using PactNet.Verifier;
using PactNet;
using Xunit;
using Xunit.Abstractions;
using System.Text.Json;
using Products;

namespace tests;

public class ProviderApiTests : IDisposable
{
    private ITestOutputHelper _outputHelper { get; }
    private string pactUrl;
    private readonly PactVerifier verifier;

    public void Dispose()
    {
        // make sure you dispose the verifier to stop the internal messaging server
        GC.SuppressFinalize(this);
        this.verifier.Dispose();
    }

    private static readonly JsonSerializerOptions Options = new()
    {
        PropertyNamingPolicy = JsonNamingPolicy.CamelCase,
        PropertyNameCaseInsensitive = true
    };

    public ProviderApiTests(ITestOutputHelper output)
    {
        _outputHelper = output;
                var config = new PactVerifierConfig
        {

            // NOTE: We default to using a ConsoleOutput,
            // however xUnit 2 does not capture the console output,
            // so a custom outputter is required.
            Outputters = new List<IOutput>
                            {
                                new XunitOutput(_outputHelper),
                                new ConsoleOutput()
                            },

            // Output verbose verification logs to the test output
            LogLevel = PactLogLevel.Information,
        };

        string providerName = !string.IsNullOrEmpty(Environment.GetEnvironmentVariable("PACT_PROVIDER_NAME"))
                                ? Environment.GetEnvironmentVariable("PACT_PROVIDER_NAME")
                                : "pactflow-example-provider-dotnet-kafka";
        verifier = new PactVerifier(providerName, config);
        pactUrl = Environment.GetEnvironmentVariable("PACT_URL") ?? Path.Combine(AppContext.BaseDirectory, "..","..","..","..","..","consumer-dotnet-kafka","tests","pacts","pactflow-example-consumer-dotnet-kafka-pactflow-example-provider-dotnet-kafka.json");

    }

    [Fact]
    public void EnsureProviderApiHonoursPactWithConsumer()
    {
        // Arrange
        verifier
        .WithHttpEndpoint(new Uri("http://localhost:49152"))
        .WithMessages(scenarios =>
                {
                    scenarios
                    .Add("a product event update", builder =>
                         {
                             builder
                             .WithMetadata(new
                                    {
                                        ContentType = "application/json",
                                        kafka_topic = "products"
                                    })
                            .WithContent(() => new ProductEventProducer().CreateEvent(new Product("1", "food", "pancake", "1.0.0"), "UPDATED"));
                         });
                }, Options)
        .WithFileSource(new FileInfo(pactUrl))
        // Act
        .Verify();

    }
}

```

</TabItem>

<TabItem value="python">

in `provider-python-kafka/tests/message_product_pact_test.py`:

```python
"""
Producer test of example message.

This test will read a pact between the message handler and the message provider
and then validate the pact against the provider.
"""

from __future__ import annotations
import pytest as pytest

from pathlib import Path
from unittest.mock import MagicMock

from src.server import ProductRepository
from tests.provider_server import start_provider
from pact.v3 import Verifier
import json

PACT_DIR = (Path(__file__).parent.parent.parent / "consumer-python-kafka" / "pacts").resolve()

responses: dict[str, dict[str, str]] = {
    "a product event update": {
        "function_name": "product_event_update",
    }
}

CURRENT_STATE: str | None = None
MESSAGE_DESCRIPTION: str | None = None


def message_producer_function() -> tuple[str, str, str]:
    producer = ProductRepository()
    # TODO - The demo provider_server mirrors the same bug in pact-python v2
    # incorrect mapping of states, rather than description
    assert CURRENT_STATE is not None, "Message Description is not set"
    function_name = responses.get(CURRENT_STATE, {}).get("function_name")
    assert function_name is not None, "Function name could not be found"
    if function_name == "product_event_update":
        updated_product = producer.produce_event("UPDATED",{"name": "Some Product", "type": "Product Range","version":"v1", "id":"123"})
        return (
          updated_product[1],
          "application/json",
          f'{{"kafka_topic":"{updated_product[0]}"}}'
        )

    return (
      nil,
      nil,
      nil
    )


def state_provider_function(state_name: str) -> None:
    global CURRENT_STATE  # noqa: PLW0603
    CURRENT_STATE = state_name

def test_producer() -> None:
    """
    Test the message producer.
    """
    with start_provider(
        handler_module=__name__,
        handler_function="message_producer_function",
        state_provider_module=__name__,
        state_provider_function="state_provider_function",
    ) as provider_url:
      verifier = (
          Verifier()
          .set_state(
              f"{provider_url}/set_provider_state",
              teardown=True,
          )
          .set_info("pactflow-example-provider-python-kafka", url=f"{provider_url}/produce_message")
          .add_source(PACT_DIR / "pactflow-example-consumer-python-kafka-pactflow-example-provider-python-kafka.json")
      )
      verifier.verify()
```

In `provider-python-kafka/tests/provider_server.py` we create a HTTP server that will stand in as our message proxy

```python
        @self.app.route(self.produce_message_url, methods=["POST"])
        def produce_message() -> flask.Response | tuple[str, int]:
            """
            Route a message request to the handler function.

            Returns:
                The response from the handler function.
            """
            try:
                request_data = flask.request.get_json()
                description = request_data.get("description")
                if self.state_provider_function:
                    self.state_provider_function(description)
                body, content_type, metadata = self.handler_function()
                if metadata:
                    metadata_str = base64.b64encode(metadata.encode('utf-8')).decode('utf-8')
                    headers = {"pact-message-metadata": metadata_str}
                else:
                    headers = {}
                return flask.Response(
                    response=body,
                    status=200,
                    content_type=content_type,
                    headers=headers,
                    direct_passthrough=True,
                )
            except Exception as e:  # noqa: BLE001
                return str(e), 500
```

</TabItem>

<TabItem value="golang">

in `provider-go-kafka/product_service_test.go`:

```go
package main

import (
	"fmt"
	"os"
	"path/filepath"
	"testing"

	"github.com/pact-foundation/pact-go/v2/log"
	"github.com/pact-foundation/pact-go/v2/message"
	"github.com/pact-foundation/pact-go/v2/models"
	"github.com/pact-foundation/pact-go/v2/provider"
)

var pactDir, _ = os.Getwd()

func TestMessageProvider(t *testing.T) {
	log.SetLogLevel("INFO")

	verifier := provider.NewVerifier()

	// Map test descriptions to message producer (handlers)
	functionMappings := message.Handlers{
		"a product event update": func([]models.ProviderState) (message.Body, message.Metadata, error) {
			return createEvent(Product{
					ID:      "567",
					Name:    "A Product",
					Version: "v7",
					Type:    "Household Products",
				}, "UPDATED"), message.Metadata{
					"contentType": "application/json",
					"kafka_topic": "products",
				}, nil
		},
	}

	// Verify the Provider with local Pact Files

	verifier.VerifyProvider(t, provider.VerifyRequest{
		PactFiles:       []string{filepath.ToSlash(fmt.Sprintf("%s/../consumer-go-kafka/pacts/pactflow-example-consumer-go-kafka-pactflow-example-provider-go-kafka.json", pactDir))},
		Provider:        "pactflow-example-provider-go-kafka",
		MessageHandlers: functionMappings,
	})

}

```

</TabItem>

<TabItem value="rust">

in `provider-rust-kafka/src/main.rs`:

```rust
#[cfg(test)]
mod tests {

    use crate::{create_event, Product};
    use actix_web::http::header::HeaderName;
    use actix_web::http::header::HeaderValue;
    use actix_web::{web, App, HttpRequest, HttpResponse, HttpServer, Responder};
    use async_trait::async_trait;
    use base64::{engine::general_purpose, Engine as _};
    use expectest::prelude::*;
    use maplit::*;
    use pact_models::provider_states::ProviderState;
    use pact_verifier::{
        callback_executors::ProviderStateExecutor, verify_provider_async, FilterInfo,
        NullRequestFilterExecutor, PactSource, ProviderInfo, ProviderTransport,
        VerificationOptions,
    };
    use reqwest::Client;
    use serde_json::json;
    use serde_json::Value;
    use std::{collections::HashMap, env, path::PathBuf, sync::Arc};
    use tokio::sync::oneshot;
    #[derive(Debug)]
    struct DummyProviderStateExecutor;

    #[async_trait]
    impl ProviderStateExecutor for DummyProviderStateExecutor {
        async fn call(
            self: Arc<Self>,
            _interaction_id: Option<String>,
            _provider_state: &ProviderState,
            _setup: bool,
            _client: Option<&Client>,
        ) -> anyhow::Result<HashMap<String, Value>> {
            Ok(hashmap! {})
        }

        fn teardown(self: &Self) -> bool {
            return false;
        }
    }

    async fn start_message_proxy() -> oneshot::Sender<()> {
        async fn handle_request(
            req: HttpRequest,
            body: web::Json<serde_json::Value>,
        ) -> impl Responder {
            println!("Incoming request path: {}", req.path());
            println!("Incoming request path: {}", req.method());
            println!("Incoming request body: {}", body);
            println!("Incoming request body: {}", body["description"]);

            match body["description"].as_str() {
                Some("a product event update") => {
                    let product = Product {
                        id: Some("some-uuid-1234-5678".to_string()),
                        name: "Some Product".to_string(),
                        r#type: "Product Range".to_string(),
                        version: Some("v1".to_string()),
                    };
                    let event_type = "UPDATED";
                    let product_event = create_event(product, event_type);
                    let mut response = HttpResponse::Ok().json(product_event);
                    let metadata = json!({
                      "kafka_topic": "products"
                    });
                    let encoded_metadata =
                        general_purpose::STANDARD.encode(metadata.to_string());
                    response.headers_mut().insert(
                        HeaderName::from_static("pact-message-metadata"),
                        HeaderValue::from_str(&encoded_metadata).unwrap(),
                    );
                    response
                }
                _ => HttpResponse::NotFound().finish(),
            }
        }

        let (tx, rx) = oneshot::channel();
        let server = HttpServer::new(|| {
            App::new().route("/pact-messages", web::post().to(handle_request))
        })
        .bind("127.0.0.1:8090")
        .expect("Failed to bind server")
        .run();
        let server_handle = server.handle();
        // let _ = server.await;
        tokio::spawn(async move {
            let _ = server.await;
            rx.await.ok();
            server_handle.stop(true).await;
        });

        tx
    }


    #[tokio::test]
    async fn verifies_api_produces_correct_messages_for_consumers() {

        let shutdown_tx = start_message_proxy().await;

        /// Get the path to one of our sample *.json files.
        fn fixture_path(path: &str) -> PathBuf {
            env::current_dir()
                .expect("could not find current working directory")
                .join("..")
                .join("consumer-rust-kafka-async")
                .join("target")
                .join("pacts")
                .join(path)
                .to_owned()
        }
        let pact_file = fixture_path(
            "pactflow-example-consumer-rust-kafka-async-pactflow-example-provider-rust-kafka-async.json",
        );

        #[allow(deprecated)]
        let provider_info = ProviderInfo {
            name: "pactflow-example-provider-rust-kafka-async".to_string(),
            host: "127.0.0.1".to_string(),
            port: Some(8090),
            transports: vec![ProviderTransport {
                transport: "async-message".to_string(),
                port: Some(8090),
                path: Some("/pact-messages".to_string()),
                scheme: Some("http".to_string()),
            }],
            ..ProviderInfo::default()
        };

        let pact_source = PactSource::File(pact_file.to_string_lossy().to_string());

        let verification_options: VerificationOptions<NullRequestFilterExecutor> =
            VerificationOptions::default();
        let provider_state_executor = Arc::new(DummyProviderStateExecutor {});

        let result = verify_provider_async(
            provider_info,
            vec![pact_source],
            FilterInfo::None,
            vec![],
            &verification_options,
            None,
            &provider_state_executor,
            None,
        )
        .await;

        // shutdown our message proxy
        shutdown_tx
        .send(())
        .expect("Failed to send shutdown signal");

        // check the verification results
        match result {
            Ok(res) => {
                if res.result {
                    expect!(res.result).to(be_equal_to(true));
                } else {
                    panic!("Pact verification failed");
                }
            },
            Err(error) => panic!("failed to get pact verification execution result {}",error),
        }
    }
}

```

</TabItem>

</Tabs>

## Running the test

We can now run our test

```sh
> product-service@1.0.0 test
> jest --testTimeout 30000 --testMatch "**/*.pact.test.js"


 RUNS  src/product/product.pact.test.js
[21:15:59.007] INFO (36404): pact@13.1.4: Verifying message
[21:15:59.012] INFO (36404): pact-core@15.2.1: Verifying Pacts.
[21:15:59.013] INFO (36404): pact-core@15.2.1: Verifying Pact Files
 RUNS  src/product/product.pact.test.js
2024-10-22T20:15:59.196741Z  INFO ThreadId(11) pact_verifier: Running setup provider state change handler with empty state for 'a product event update'
2024-10-22T20:15:59.196899Z  INFO ThreadId(11) pact_verifier: Running provider verification for 'a product event update'
2024-10-22T20:15:59.196981Z  INFO ThreadId(11) pact_verifier::provider_client: Sending request to provider at http://localhost:58571/
2024-10-22T20:15:59.196984Z  INFO ThreadId(11) pact_verifier::provider_client: Sending request HTTP Request ( method: POST, path: /, query: None, headers: Some({"Content-Type": ["application/json"]}), body: Present(40 bytes, application/json) )
2024-10-22T20:15:59.206234Z  INFO ThreadId(11) pact_verifier::provider_client: Received response: HTTP Response ( status: 200, headers: Some({"date": ["Tue, 22 Oct 2024 20:15:59 GMT"], "connection": ["keep-alive"], "keep-alive": ["timeout=5"], "pact_message_metadata": ["eyJrYWZrYV90b3BpYyI6InByb2R1Y3RzIn0="], "content-length": ["73"], "content-type": ["application/json; charset=utf-8"], "pact-message-metadata": ["eyJrYWZrYV90b3BpYyI6InByb2R1Y3RzIn0="], "x-powered-by": ["Express"], "etag": ["W/\"49-41p5fNWaTSGyF99I4ouOdCtiDE0\""]}), body: Present(73 bytes, application/json;charset=utf-8) )
2024-10-22T20:15:59.207511Z  WARN ThreadId(11) pact_matching::metrics:

Please note:
We are tracking events anonymously to gather important usage statistics like Pact version and operating system. To disable tracking, set the 'PACT_DO_NOT_TRACK' environment variable to 'true'.

 RUNS  src/product/product.pact.test.js

Verifying a pact between pactflow-example-consumer-js-kafka and pactflow-example-provider-js-kafka

  a product event update (0s loading, 185ms verification)
    generates a message which
      includes metadata
        "contentType" with value "application/json" (OK)
        "kafka_topic" with value "products" (OK)
      has a matching body (OK)

 PASS  src/product/product.pact.test.js
  Message provider tests
    product api publishes an event
      ✓ can generate messages for specified consumers (657 ms)

Test Suites: 1 passed, 1 total
Tests:       1 passed, 1 total
Snapshots:   0 total
Time:        1.233 s
```

Great, the test passed!

## Breaking the test 

Let's take a look at some failing situations.

### Unmapped event handler

1. Change the description mapping in the message provider, from `a product event update` to `a product event updated`

```sh
Verifying a pact between pactflow-example-consumer-js-kafka and pactflow-example-provider-js-kafka

  a product event update (4ms loading, 196ms verification)
    generates a message which
      includes metadata
        "contentType" with value "application/json" (OK)
        "kafka_topic" with value "products" (FAILED)
      has a matching body (FAILED)


Failures:

1) Verifying a pact between pactflow-example-consumer-js-kafka and pactflow-example-provider-js-kafka - a product event update
    1.1) has a matching body
           $ -> Actual map is missing the following keys: event, id, name, type, version
    -{
  "event": "UPDATED",
  "id": "some-uuid-1234-5678",
  "name": "Some Product",
  "type": "Product Range",
  "version": "v1"
}
    +{}

    1.2) has matching metadata
           Expected message metadata 'kafka_topic' to have value 'products' but was ''

There were 1 pact failures
 FAIL  src/product/product.pact.test.js
  Message provider tests
    product api publishes an event
      ✕ can generate messages for specified consumers (466 ms)

  ● Message provider tests › product api publishes an event › can generate messages for specified consumers

    Verfication failed

      at node_modules/@pact-foundation/pact-core/src/verifier/nativeVerifier.ts:52:20

Test Suites: 1 failed, 1 total
Tests:       1 failed, 1 total
Snapshots:   0 total
Time:        1.172 s, estimated 2 s
```

Great, we can see a failure, where we don't have a mapping from our message interaction in the consumer pact, in our provider test. Change it back to `a product event update`.

You can expect Pact to fail, where there is no defined handler for a message, which ensures that the provider correctly handles each of these cases.

As a consumer generating contracts, one should work with the provider team, in order to ensure mapping can be agreed upon. There may be the opportunity to reuse existing mappings created by other teams.

### Incorrect returned data

Change some data in the generated event, in your messageProviders. Lets try changing `UPDATED` to `MODIFIED`, and change the metadata key `kafka_topic` to `topic`

Run the test

```sh
Verifying a pact between pactflow-example-consumer-js-kafka and pactflow-example-provider-js-kafka

  a product event update (4ms loading, 200ms verification)
    generates a message which
      includes metadata
        "contentType" with value "application/json" (OK)
        "kafka_topic" with value "products" (FAILED)
      has a matching body (FAILED)


Failures:

1) Verifying a pact between pactflow-example-consumer-js-kafka and pactflow-example-provider-js-kafka - a product event update
    1.1) has a matching body
           $.event -> Expected 'MODIFIED' to match '^(CREATED|UPDATED|DELETED)$'

    1.2) has matching metadata
           Expected message metadata 'kafka_topic' to have value 'products' but was ''

There were 1 pact failures
 FAIL  src/product/product.pact.test.js
  Message provider tests
    product api publishes an event
      ✕ can generate messages for specified consumers (446 ms)

  ● Message provider tests › product api publishes an event › can generate messages for specified consumers

    Verfication failed
```

Great, the test fails, both on the body content, and the returned metadata.

Here, Pact matchers restricted the value of `$.event` to be one of `CREATED` / `UPDATED` or `DELETED`, by way of a regular expression.

Our metadata is also checked, to ensure the correct value is generated.

Try reverting the metadata key `topic` back to `kafka_topic`, but change the topic name to `product`..

Running the test again will return a new error about the metadata, telling us the correct key was returned, but the incorrect value was. This will allow us not only to validate the body contents of our messages, but important data wthat will relate to our transmission protocol (or anything else we deem suitable).

```sh

    1.2) has matching metadata
           Expected message metadata 'kafka_topic' to have value '"products"' but was '"product"'
```

In our instance, if we were posting to a different queue, that the customer was listening to, it may be a while before anyone realises that messages will never be received. Pact gives you early feedback, long before requiring deploying each application, along side a queue and testing in an integration environment

## Thats a wrap

We have now completed the workshop, and have a good understanding of how to use Pact to test asynchronous message contracts.

To take your Pact journey to the next level, why not apply the [PactFlow CI/CD workshop](https://docs.pactflow.io/docs/workshops/ci-cd) fundamentals to your message contracts, and automate the publishing & verification of your message contracts as part of your CI/CD pipeline.