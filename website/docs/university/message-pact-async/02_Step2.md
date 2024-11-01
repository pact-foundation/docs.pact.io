---
title: Step 2 - Create consumer Pact test
sidebar_label: Step 2 - Create consumer Pact test
---

import Tabs from '@theme/Tabs';
import TabItem from '@theme/TabItem';

## Learning Objectives

| Step                                                                                                            | Title                              | Concept Covered         | Learning objectives                                                                                                                                                                                               | Further Reading                                                                                                                                          |
| --------------------------------------------------------------------------------------------------------------- | ---------------------------------- | ----------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [step 2](https://github.com/pact-foundation/pact-workshop-message?tab=readme-ov-file#step-2---create-consumer-pact-test) | Write a Pact test for our consumer | Consumer side pact test | <ul><li>Understand basic Consumer-side Pact concepts</li><li>Understand "Matchers" to avoid test data brittleness</li><li>Demonstrate that Pact tests are able to catch a class of integration problems</li></ul> | <ul><li>https://docs.pact.io/5-minute-getting-started-guide#scope-of-a-consumer-pact-test</li><li>https://docs.pact.io/best_practices/consumer</li></ul> |

<hr/>

## How Message Pact works

Pact is a consumer-driven contract testing tool, which is a fancy way of saying that the API `Consumer` writes a test to set out its assumptions and needs of its API `Provider`(s). By unit testing our API client with Pact, it will produce a `contract` that we can share to our `Provider` to confirm these assumptions and prevent breaking changes.

The process looks like this on the consumer side:

![diagram](https://raw.githubusercontent.com/pact-foundation/pact-js/master/docs/diagrams/message-consumer.png)

The process looks like this on the provider (producer) side:

![diagram](https://raw.githubusercontent.com/pact-foundation/pact-js/master/docs/diagrams/message-provider.png)

1. The consumer writes a unit test of its behaviour using a Mock provided by Pact.
1. Pact writes the interactions into a contract file (as a JSON document).
1. The consumer publishes the contract to a broker (or shares the file in some other way).
1. Pact retrieves the contracts and replays the requests against a locally running provider.
1. The provider should stub out its dependencies during a Pact test, to ensure tests are fast and more deterministic.

## Writing our consumer test

In this section we will look at 1 & 2, writing the unit test which will generate the contract file we can share with our provider.

There are code snippets, below the following steps, that you can use to guide you through the process.

It will consist of the following steps:

1. The target of our test, our Product Event Handler.
    - In most applications, some form of transactionality exists and communication with a MQ/broker happens.
    - It's important we separate out the protocol bits from the message handling bits, so that we can test that in isolation.
2. Import Pact DSL for your language of choice
3. Setup Pact Message Consumer Constructor, which will vary slightly depending on your implementation. Here you can setup the name of the consumer/provider pair for the test, and any required pact options
4. Setup the expectations for the consumer
    1. The description for the event
       1. Used in the provider side verification to map to a function that will produce this message
    2. The contents of the message, we expect to receive
       1. It is advisable to use your domain objects, to build up the contents of the message, as this will help you catch any changes in your domain model, and ensure your tests are updated accordingly.
    3. Pact matchers can be applied, to allow for flexible verification, based on applied matchers.
       1. Your Pact DSL should provide a function to generate a concrete object, from an object that has matchers applied. It is known as the `reify` function, but may have aliases. This is useful as you can use the object your message will receive in your test, but powerful matchers can be applied to ensure your test is flexible during provider side verification.
       2. For more details on matching, see our [documentation](/getting_started/matching)
    4. Setup any required metadata
       1. A consumer may require additional data, which does not form part of the message content. This could be any that can be encoded in a key value pair, that is serialisable to json. In our case, it is the kafka topic our consumer will subscribe to.
5. Pact will send the message to your message handler. If the handler returns a successful promise, the message is saved, otherwise the test fails. There are a few key things to consider:
    - The actual request body that Pact will send, will be contained within a message object along with other context, so the body must be retrieved via `content` attribute. Metadata can be accessed via the `metadata` attribute.
    - All handlers to be tested generally must be of the shape `(m: Message) => Promise<any>` - that is, they must accept a `Message` and return a `Promise`. This is how we get around all of the various protocols, and will often require a lightweight adapter function to convert it, some language DSL's will provide this for you.
      - In the JavaScript case, we wrap the actual `productEventHandler` with a convenience function `asynchronousBodyHandler` provided by Pact, which Promisifies the handler and extracts the contents.
      - If one is not provided, you will need to write your own, which is a simple function that takes the message provided by the Pact framework, as setup in your test, converts it to the correct type and calls the handler under test, returning if the message is processed successfully or throwing if unsuccessful.

### Code Snippets

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

in `consumer-js-kafka/src/product/product.handler.pact.test.js`:

```javascript
// 1. The target of our test, our Product Event Handler
const productEventHandler = require("./product.handler");

// 2. Import Pact DSL for your language of choice
const {
  MatchersV3,
  MessageConsumerPact,
  asynchronousBodyHandler,
} = require("@pact-foundation/pact");
const { like, regex } = MatchersV3;

const path = require("path");

describe("Kafka handler", () => {
  // 3. Setup Pact Message Consumer Constructor
  // specifying consumer & provider naming
  // and any required options
  const messagePact = new MessageConsumerPact({
    consumer: "pactflow-example-consumer-js-kafka",
    dir: path.resolve(process.cwd(), "pacts"),
    pactfileWriteMode: "update",
    provider: "pactflow-example-provider-js-kafka",
    logLevel: process.env.PACT_LOG_LEVEL ?? "info",
  });

  describe("receive a product update", () => {
    it("accepts a product event", () => {
      // 4. Arrange - Setup our message expectations
      return (
        messagePact
          // The description for the event
          //   Used in the provider side verification to map to
          //   a function that will produce this message
          .expectsToReceive("a product event update")
          // The contents of the message, we expect to receive
          //   Pact matchers can be applied, to allow for flexible
          //   verification, based on applied matchers.
          .withContent({
            id: like("some-uuid-1234-5678"),
            type: like("Product Range"),
            name: like("Some Product"),
            version: like("v1"),
            event: regex("^(CREATED|UPDATED|DELETED)$", "UPDATED"),
          })
          // Setup any required metadata
          //   A consumer may require additional data, which does not
          //   form part of the message content. This could be any
          //   that can be encoded in a key value pair, that is
          //   serialisable to json. In our case, it is the kafka
          //   topic our consumer will subscribe to
          .withMetadata({
            contentType: "application/json",
            kafka_topic: "products",
          })
          // 5. Act
          //      Pact provides a verification function where the message
          //      content, and metadata are made available, in order to process
          //      and pass to your system under test, our Product Event Handler.
          //
          //      Some Pact DSL's will provide body handlers, as convenience functions
          //
          .verify(asynchronousBodyHandler(productEventHandler))
      );
    });
  });
});
```

</TabItem>

<TabItem value="java">

in `consumer-java-kafka/src/test/java/io/pactflow/example/kafka/ProductsPactTest.java`:

```java
package io.pactflow.example.kafka;

import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import au.com.dius.pact.consumer.MessagePactBuilder;
import au.com.dius.pact.core.model.annotations.Pact;
import au.com.dius.pact.consumer.dsl.PactDslJsonBody;
import au.com.dius.pact.consumer.junit5.PactConsumerTestExt;
import au.com.dius.pact.consumer.junit5.PactTestFor;
import au.com.dius.pact.consumer.junit5.ProviderType;
import au.com.dius.pact.core.model.messaging.Message;
import au.com.dius.pact.core.model.messaging.MessagePact;
import au.com.dius.pact.core.model.PactSpecVersion; // required for v4.6.x to set pactVersion
import org.junit.jupiter.api.Test;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.fasterxml.jackson.databind.ObjectMapper;

import static org.junit.jupiter.api.Assertions.assertDoesNotThrow;

@ExtendWith(PactConsumerTestExt.class)
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.DEFINED_PORT)
@PactTestFor(providerName = "pactflow-example-provider-java-kafka", providerType = ProviderType.ASYNCH, pactVersion = PactSpecVersion.V3)
public class ProductsPactTest {
  @Autowired
  ProductEventListener listener;

  @Pact(consumer = "pactflow-example-consumer-java-kafka")
  MessagePact createPact(MessagePactBuilder builder) {
    PactDslJsonBody body = new PactDslJsonBody();
    body.stringType("name", "product name");
    body.stringType("type", "product series");
    body.stringType("id", "5cc989d0-d800-434c-b4bb-b1268499e850");
    body.stringMatcher("version", "v[a-zA-z0-9]+", "v1");
    body.stringMatcher("event", "^(CREATED|UPDATED|DELETED)$", "CREATED");

    Map<String, Object> metadata = new HashMap<>();
    metadata.put("Content-Type", "application/json");
    metadata.put("kafka_topic", "products");

    return builder.expectsToReceive("a product created event").withMetadata(metadata).withContent(body).toPact();
  }

  @Test
  @PactTestFor(pactMethod = "createPact")
  void test(List<Message> messages) throws Exception {
    ObjectMapper mapper = new ObjectMapper();
    System.out.println("Message received -> " + messages.get(0).contentsAsString());
    Product product = mapper.readValue(messages.get(0).contentsAsString(), Product.class);

    assertDoesNotThrow(() -> {
      listener.listen(product);
    });
  }
}
```

</TabItem>

<TabItem value="c#">

in `consumer-dotnet-kafka/tests/ConsumerEventTests.cs`:

```csharp
using System.Threading.Tasks;
using PactNet;
using PactNet.Output.Xunit;
using Xunit;
using Xunit.Abstractions;
using Match = PactNet.Matchers.Match;
using Products;

namespace Consumer.Tests
{
    public class ProductEventProcessorTests
    {
        private readonly ProductEventProcessor consumer;

        private readonly IMessagePactBuilderV4 pact;

        public ProductEventProcessorTests(ITestOutputHelper output)
        {
            consumer = new ProductEventProcessor();

            var config = new PactConfig
            {
                PactDir = "../../../pacts/",
                Outputters = new[]
                {
                    new XunitOutput(output)
                }
            };

            pact = Pact.V4("pactflow-example-consumer-dotnet-kafka", "pactflow-example-provider-dotnet-kafka", config).WithMessageInteractions();
        }

        [Fact]
        public async Task ProductEventHandler_ProductCreated_HandlesMessage()
        {
            await pact
                      .ExpectsToReceive("a product event update")
                      .WithMetadata("kafka_topic","products")
                      .WithJsonContent(new
                      {
                          id = Match.Type("some-uuid-1234-5678"),
                          type = Match.Type("Product Range"),
                          name = Match.Type("Some Product"),
                          version = Match.Type("v1"),
                          @event = Match.Regex("UPDATED","^(CREATED|UPDATED|DELETED)$")
                      })
                      .VerifyAsync<ProductEventProcessor.ProductEvent>(consumer.ProductEventHandler);
        }
    }
}
```

</TabItem>

<TabItem value="python">

in `consumer-python-kafka/tests/unit/product_service_pact_test.py`:

```python
import os

import pytest as pytest
import json
import asyncio
import pytest_asyncio
from pact.v3.pact import Pact
from pact.v3.match import like, regex
from pathlib import Path
from typing import (
    TYPE_CHECKING,
    Any,
)
from src.product.product_service import receive_product_update
from src.product.product import Products

CONSUMER_NAME = "pactflow-example-consumer-python-kafka"
PROVIDER_NAME = os.getenv("PACT_PROVIDER", "pactflow-example-provider-python-kafka")
PACT_DIR = os.path.join(os.path.dirname(os.path.realpath(__file__)),"..","..", "pacts")

@pytest.fixture
def handler():
    return receive_product_update

@pytest.fixture(scope="module")
def pact():
    pact_dir = Path(Path(__file__).parent.parent.parent / "pacts")
    pact = Pact(CONSUMER_NAME, PROVIDER_NAME)
    yield pact.with_specification("V4")
    pact.write_file(pact_dir, overwrite=True)

@pytest.fixture
def verifier(
    handler,
):
    """
    Verifier function for the Pact.

    This function is passed to the `verify` method of the Pact object. It is
    responsible for taking in the messages (along with the context/metadata)
    and ensuring that the consumer is able to process the message correctly.

    In our case, we deserialize the message and pass it to our message
    handler for processing.
    """

    def _verifier(msg: str | bytes | None, context: dict[str, Any]) -> Products:
        assert msg is not None, "Message is None"
        data = json.loads(msg)
        print(
            "Processing message: ",
            {"input": msg, "processed_message": data, "context": context},
        )
        loop = asyncio.get_event_loop()
        result = loop.run_until_complete(handler(data))
        print("Handler result: ", result)
        return result
    yield _verifier

def test_receive_a_product_update(pact, handler, verifier):
    event = {
        "id": like("some-uuid-1234-5678"),
        "type": like("Product Range"),
        "name": like("Some Product"),
        "event": regex("UPDATED", regex=r"^(CREATED|UPDATED|DELETED)$")
    }
    (
        pact
        .upon_receiving("a product event update", "Async")
        .with_body(event,
            "application/json")
        .with_metadata({"kafka_topic": "products"})
    )
    pact.verify(verifier, "Async")
```

</TabItem>

<TabItem value="golang">

in the `consumer-go-kafka/handler_test.go`:

```go
package main

import (
 "testing"

 "github.com/pact-foundation/pact-go/v2/log"
 matchers "github.com/pact-foundation/pact-go/v2/matchers"
 message "github.com/pact-foundation/pact-go/v2/message/v4"
 "github.com/stretchr/testify/assert"
)

func TestConsumerV4(t *testing.T) {
 log.SetLogLevel("INFO")

 // 1 We write a small adapter that will take the incoming Message
 // and call the function with the correct type
 var handlerWrapper = func(m message.AsynchronousMessage) error {
  return handler(m.Body.(*ProductEvent).Product, m.Body.(*ProductEvent).Event)
 }

 // 2 Create the Pact Message Consumer
 mockProvider, err := message.NewAsynchronousPact(message.Config{
  Consumer: "pactflow-example-consumer-go-kafka",
  Provider: "pactflow-example-provider-go-kafka",
 })
 assert.NoError(t, err)

 // 3 Write the consumer test, and call ConsumedBy
 // passing through the function, and then Verify
 // to ensure it is correctly executed
 err = mockProvider.
  AddAsynchronousMessage().
  ExpectsToReceive("a product event update").
  WithMetadata(map[string]string{"kafka_topic": "products"}).
  WithJSONContent(matchers.Map{
   "id":      matchers.Like("123"),
   "type":    matchers.Like("Product Range"),
   "name":    matchers.Like("Some Product"),
   "version": matchers.Like("v1"),
   "event":   matchers.Regex("UPDATED", "^(CREATED|UPDATED|DELETED)$"),
  }).AsType(&ProductEvent{}).
  ConsumedBy(handlerWrapper).Verify(t)
 assert.NoError(t, err)
}

```

</TabItem>

<TabItem value="rust">

in the `consumer-rust-kafka/src/main.rs`:

```rust
#[cfg(test)]
mod tests {

use expectest::{expect, prelude::be_some};
use pact_consumer::{matching_regex, prelude::*};
use serde_json::Value;
use crate::{product_event_processor, AppState};
use std::collections::HashMap;
use std::sync::Mutex;
use actix_web::web;
use expectest::matchers::be_equal_to;
#[test]
fn consumes_a_product_event_update_message() {
    // Define the Pact for the test (you can setup multiple interactions by chaining the given or message_interaction calls)
    // For messages we need to use the V4 Pact format.
    let mut pact_builder =
        // Define the message consumer and provider by name
        pact_consumer::builders::PactBuilder::new_v4("pactflow-example-consumer-rust-kafka-async", "pactflow-example-provider-rust-kafka-async");
    pact_builder

        // Adds an interaction given the message description and type.
        .message_interaction("a product event update", |mut i| {
            // Can set the test name (optional)
            i.test_name("consumes_a_product_event_update_message");
            // // defines a provider state. It is optional.
            // i.given("some state");
            // // defines a provider state with parameters. It is optional.
            // i.given_with_params("some state with params {param}",&json!({
            //     "param": "some param"
            //   }));
            // Set the contents of the message. Here we use a JSON pattern, so that matching rules are applied
            i.json_body(json_pattern!({
              "id": like!("some-uuid-1234-5678"),
              "type": like!("Product Range"),
              "name": like!("Some Product"),
              "version": like!("v1"),
              "event": matching_regex!("^(CREATED|UPDATED|DELETED)$","UPDATED")
            }));
            // Set any required metadata
            i.metadata("kafka_topic", "products");
            // Need to return the mutated interaction builder
            i
        });

    // Arrange. setup product database
    let products = Mutex::new(HashMap::new());
    let data = web::Data::new(AppState { products });

    // This will return each message configured with the Pact builder. We need to process them
    // with out message handler (it should be the one used to actually process your messages).
    for message in pact_builder.messages() {
        // Process the message here as it would if it came off the queue
        let message_bytes = message.contents.contents.value().unwrap();
        let kafka_topic = message.contents.metadata.get("kafka_topic");
        let _message: Value = serde_json::from_slice(&message_bytes).unwrap();

        // Send the message to our message processor
        product_event_processor(&data,&message_bytes);

        // assert of the state of our product database, after processing the message
        let products = data.products.lock().unwrap();
        let product = products.get("some-uuid-1234-5678").unwrap();
        println!("{:?}", product);
        expect!(product.id.as_str()).to(be_equal_to("some-uuid-1234-5678".to_string()));
        expect!(product.name.clone()).to(be_equal_to("Some Product".to_string()));
        expect!(product.r#type.clone()).to(be_equal_to("Product Range".to_string()));
        expect!(product.version.clone()).to(be_equal_to("v1".to_string()));

        // assert the correct topic is included in our message
        expect!(kafka_topic)
            .to(be_some().value("products"));
    }
}

}
```

</TabItem>

</Tabs>

## Running the test

You can now run the test.

```sh
> product-service@1.0.0 test
> jest --testTimeout 30000


 RUNS  src/product/product.handler.pact.test.js
 PASS  src/product/product.handler.pact.test.js
  ● Console

    console.log
      received product: {
        event: 'UPDATED',
        id: 'some-uuid-1234-5678',
        name: 'Some Product',
        type: 'Product Range',
        version: 'v1'
      }

      at log (src/product/product.handler.js:5:11)

    console.log
      received product event: UPDATED

      at log (src/product/product.handler.js:6:11)

 PASS  src/product/product.repository.test.js

Test Suites: 2 passed, 2 total
Tests:       2 passed, 2 total
Snapshots:   0 total
Time:        0.601 s, estimated 1 s
```

## Examine the generated Pact file

Take a look at the pact directory, at the generated contract.

```json
{
  "consumer": {
    "name": "pactflow-example-consumer-js-kafka"
  },
  "messages": [
    {
      "contents": {
        "event": "UPDATED",
        "id": "some-uuid-1234-5678",
        "name": "Some Product",
        "type": "Product Range",
        "version": "v1"
      },
      "description": "a product event update",
      "matchingRules": {
        "body": {
          "$.event": {
            "combine": "AND",
            "matchers": [
              {
                "match": "regex",
                "regex": "^(CREATED|UPDATED|DELETED)$"
              }
            ]
          },
          "$.id": {
            "combine": "AND",
            "matchers": [
              {
                "match": "type"
              }
            ]
          },
          "$.name": {
            "combine": "AND",
            "matchers": [
              {
                "match": "type"
              }
            ]
          },
          "$.type": {
            "combine": "AND",
            "matchers": [
              {
                "match": "type"
              }
            ]
          },
          "$.version": {
            "combine": "AND",
            "matchers": [
              {
                "match": "type"
              }
            ]
          }
        },
        "metadata": {}
      },
      "metadata": {
        "contentType": "application/json",
        "kafka_topic": "products"
      }
    }
  ],
  "metadata": {
    "pact-js": {
      "version": "13.1.4"
    },
    "pactRust": {
      "ffi": "0.4.22",
      "models": "1.2.3"
    },
    "pactSpecification": {
      "version": "3.0.0"
    }
  },
  "provider": {
    "name": "pactflow-example-provider-js-kafka"
  }
}
```

## Breaking the test

Your handler should throw an error, if it is unable to process the message. Try commenting out a value such as the event type, in your Pact expectations and re-run your test.

Depending on how your code is structured, it _should_ throw an error, if required fields aren't present. If it doesn't, you may need to add some additional validation to your handler.

Pact aids in test-driven development by helping you mock out the expected behaviour of your provider, and ensuring that your consumer is correctly implemented, before our provider is built,
this can help you catch a class of integration problems early, by applying pressure to the design of your test.


```javascript

```sh
> product-service@1.0.0 test
> jest --testTimeout 30000


 RUNS  src/product/product.handler.pact.test.js
 FAIL  src/product/product.handler.pact.test.jse library successfully found, and the correct version
  ● Console

    console.log
      received product: { id: 'some-uuid-1234-5678' }

      at log (src/product/product.handler.js:5:11)

    console.log
      received product event: undefined

      at log (src/product/product.handler.js:6:11)

  ● Kafka handler › receive a product update › accepts a product event

    Unable to process event

      19 |     );
      20 |   }
    > 21 |   throw new Error("Unable to process event")
         |         ^
      22 | };
      23 |
      24 | module.exports = handler;

      at handler (src/product/product.handler.js:21:9)
      at node_modules/@pact-foundation/src/messageConsumerPact.ts:254:34
      at MessageConsumerPact.Object.<anonymous>.MessageConsumerPact.verify (node_modules/@pact-foundation/src/messageConsumerPact.ts:187:12)
      at Object.verify (src/product/product.handler.pact.test.js:35:10)

 PASS  src/product/product.repository.test.js

Test Suites: 1 failed, 1 passed, 2 total
Tests:       1 failed, 1 passed, 2 total
Snapshots:   0 total
Time:        0.678 s, estimated 1 s
```

Update your test, and re-run it, so your Pact file is up-to-date.

## Step 3

We can now move onto step 3, where we will build out our provider code.

_Move on to [step 3](https://github.com/pact-foundation/pact-workshop-message?tab=readme-ov-file#step-3---create-provider-publisher)_
