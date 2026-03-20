---
id: kafka
title: Kafka
description: How to test Kafka services with Pact
---

This guide covers how to write Pact consumer and provider tests for Kafka integrations using Java and pact-jvm. Two scenarios are covered:

1. **Standard JSON** — plain JSON messages on a Kafka topic.
2. **Schema Registry compliant JSON** — JSON messages preceded by 5 "magic bytes" required by the Confluent Schema Registry wire format.

Before writing these tests, read [How to test async message integrations](/consumer/how_to_test_async_messages) for an explanation of the Ports and Adapters pattern that makes async message code testable with Pact.

---

# Standard JSON

## Write the consumer test

### 1. Set up the test class

Annotate your class with `@PactConsumerTestExt` and configure the provider name and message type:

```java
@ExtendWith(PactConsumerTestExt.class)
@PactTestFor(providerName = "jsonKafkaProviderApp", providerType = ProviderType.ASYNCH, pactVersion = PactSpecVersion.V3)
class JsonKafkaConsumerTest {
...
}
```

### 2. Define the expected message contract

Define the message your consumer expects to receive. The body should describe only the fields your consumer actually uses:

```java
@Pact(consumer = "jsonKafkaConsumerApp")
MessagePact simpleJsonPact(MessagePactBuilder builder) {
    PactDslJsonBody body = new PactDslJsonBody();
    body.stringType("name", "almost-anything");

    return builder.expectsToReceive("A simple message")
                  .withMetadata(Map.of("contentType", "application/json"))
                  .withContent(body)
                  .toPact();
}
```

### 3. Write the test method

Your test method receives a `List<Message>` containing the Pact-managed message. Convert the message to a byte array and pass it to your production deserialisation code:

```java
@Test
@PactTestFor(pactMethod = "simpleJsonPact", providerType = ProviderType.ASYNCH)
void simpleMessage(List<Message> messages) {
    byte[] kafkaBytes = convertToKafkaBytes(messages.get(0));

    assertDoesNotThrow(() -> {
        expectApplicationToConsumeKafkaBytesSuccessfully(kafkaBytes);
    });
}

private byte[] convertToKafkaBytes(Message message) {
    return message.contentsAsBytes();
}

private void expectApplicationToConsumeKafkaBytesSuccessfully(byte[] kafkaBytes) {
    ConsumerDomainRecord consumerDomainRecord = useProductionCodeToDeserializeKafkaBytesToDomain(kafkaBytes);

    ProductionCode productionCode = new ProductionCode();
    productionCode.handle(consumerDomainRecord);
}

private ConsumerDomainRecord useProductionCodeToDeserializeKafkaBytesToDomain(byte[] kafkaBytes) {
    Deserializer<ConsumerDomainRecord> deserializer = getProductionKafkaDeserializer();
    return deserializer.deserialize("", kafkaBytes);
}

private Deserializer<ConsumerDomainRecord> getProductionKafkaDeserializer() {
    KafkaJsonDeserializer<ConsumerDomainRecord> domainRecordKafkaJsonDeserializer = new KafkaJsonDeserializer<>();
    Map<String, Object> props = Map.of(
            KafkaJsonDeserializerConfig.JSON_VALUE_TYPE, ConsumerDomainRecord.class.getName()
    );
    domainRecordKafkaJsonDeserializer.configure(props, false);
    return domainRecordKafkaJsonDeserializer;
}
```

:::tip
The `getProductionKafkaDeserializer` method should return your application's actual deserializer. In production, your `KafkaConsumer` is configured with a deserializer class name — reach into that configuration and instantiate it rather than constructing a new instance directly. The example above is a simplified stand-in.
:::

The `assertDoesNotThrow` assertion is intentional. Contract tests verify that the consumer can *handle* the message — the detailed behaviour under that message is covered by your functional tests.

Running this test generates a pact file. The published pact looks like this:

```json
{
  "consumer": {
    "name": "jsonKafkaConsumerApp"
  },
  "messages": [
    {
      "_id": "753ff77671f87af7045426b6f333e767315fbf2e",
      "contents": {
        "name": "almost-anything"
      },
      "description": "A simple message",
      "matchingRules": {
        "body": {
          "$.name": {
            "combine": "AND",
            "matchers": [{ "match": "type" }]
          }
        }
      },
      "metaData": {
        "contentType": "application/json"
      }
    }
  ],
  "metadata": {
    "pact-jvm": { "version": "4.3.4" },
    "pactSpecification": { "version": "3.0.0" }
  },
  "provider": {
    "name": "jsonKafkaProviderApp"
  }
}
```

## Write the provider test

### 1. Set up the test class

Configure the provider and consumer names to match the consumer test. Set the test target to `MessageTestTarget`:

```java
@Provider("jsonKafkaProviderApp")
@Consumer("jsonKafkaConsumerApp")
@PactBroker(url = "http://localhost:9292")
class JsonKafkaProviderTest {

    private static final String JSON_CONTENT_TYPE = "application/json";
    private static final String KEY_CONTENT_TYPE = "contentType";

    @BeforeEach
    void before(PactVerificationContext context) {
        context.setTarget(new MessageTestTarget());
    }

    @TestTemplate
    @ExtendWith(PactVerificationInvocationContextProvider.class)
    void pactVerificationTestTemplate(PactVerificationContext context) {
        context.verifyInteraction();
    }
}
```

### 2. Implement the message producer method

Annotate a method with `@PactVerifyProvider` matching the description in the consumer pact. The method must produce a `MessageAndMetadata` containing a serialised byte array of the message:

```java
@PactVerifyProvider("A simple message")
MessageAndMetadata verifySimpleMessageEvent() {
    Map<String, Object> metadata = Map.of(
            KEY_CONTENT_TYPE, JSON_CONTENT_TYPE
    );
    ProviderDomainRecord providerDomainRecord = new ProviderDomainRecord("name");
    KafkaJsonSerializer<ProviderDomainRecord> serializer = createProductionKafkaSerializer();
    byte[] bytes = serializer.serialize("", providerDomainRecord);
    return createPactRepresentationFor(metadata, bytes);
}

private KafkaJsonSerializer<ProviderDomainRecord> createProductionKafkaSerializer() {
    Map<String, Object> config = Map.of();
    KafkaJsonSerializer<ProviderDomainRecord> jsonSerializer = new KafkaJsonSerializer<>();
    jsonSerializer.configure(config, false);
    return jsonSerializer;
}

private MessageAndMetadata createPactRepresentationFor(Map<String, Object> metadata, byte[] bytes) {
    return new MessageAndMetadata(bytes, metadata);
}
```

Pact serialises your domain object to a byte array, then compares it against the consumer's expectation in the broker. If it matches, verification passes.

---

# Schema Registry Compliant JSON

Use this approach when your Kafka topic uses the Confluent Schema Registry wire format. Schema Registry compliant messages are preceded by [5 "magic" bytes](https://docs.confluent.io/platform/current/schema-registry/serdes-develop/index.html#wire-format) that identify the schema version. Your consumer code must be able to process these bytes correctly.

:::note
At the time of writing, this approach is implemented for JSON only. The PR for the JSON implementation is [here](https://github.com/pact-foundation/pact-jvm/pull/1503). AVRO and Protobuf schema registry support may not yet be available.
:::

## Write the consumer test

### 1. Set up the test class

```java
@ExtendWith(PactConsumerTestExt.class)
@PactTestFor(providerName = "jsonSchemaKafkaProviderApp", providerType = ProviderType.ASYNCH, pactVersion = PactSpecVersion.V3)
class JsonSchemaKafkaConsumerTest {
...
}
```

### 2. Define the expected message contract

The only difference from the standard JSON case is the `contentType` metadata. Setting it to `application/vnd.schemaregistry.v1+json` tells Pact to prepend the 5 magic bytes to the message data:

```java
@Pact(consumer = "jsonSchemaKafkaConsumerApp")
MessagePact schemaJsonPact(MessagePactBuilder builder) {
    PactDslJsonBody body = new PactDslJsonBody();
    body.stringType("name", "almost-anything2");

    return builder.expectsToReceive("A json schema message")
                  .withMetadata(Map.of("contentType", "application/vnd.schemaregistry.v1+json"))
                  .withContent(body)
                  .toPact();
}
```

### 3. Add the required constants and schema registry client

```java
private static final String TOPIC_NAME = "myKafkaTopic";
private static final boolean FAIL_UNKNOWN_PROPERTIES = true;
private static final boolean USE_ONEOF_FOR_NULLABLES = true;
private static final boolean IS_KEY = false;
private static final String IGNORED_TOPIC = "";

private MockSchemaRegistryClient schemaRegistryClient = new MockSchemaRegistryClient();
```

### 4. Write the test method

The test method is identical in structure to the standard JSON case. Because the `contentType` metadata signals the magic bytes, Pact will include them in the byte array passed to your test. Your deserialiser must handle them:

```java
@Test
@PactTestFor(pactMethod = "schemaJsonPact", providerType = ProviderType.ASYNCH)
void jsonSchemaMessage(List<Message> messages) {
    byte[] kafkaBytes = convertToKafkaBytes(messages.get(0));
    assertDoesNotThrow(() -> {
        expectApplicationToConsumeKafkaBytesSuccessfully(kafkaBytes);
    });
}
```

### 5. Implement the deserialiser helper methods

Use a `MockSchemaRegistryClient` to avoid communicating with a real Schema Registry during tests. Configure the URL as `mock://anything`:

```java
private ConsumerDomainRecord useProductionCodeToDeserializeKafkaBytesToDomain(byte[] kafkaBytes) {
    KafkaJsonSchemaDeserializer<ConsumerDomainRecord> deserializer = getProductionKafkaDeserializer();
    return deserializer.deserialize(IGNORED_TOPIC, kafkaBytes);
}

private KafkaJsonSchemaDeserializer<ConsumerDomainRecord> getProductionKafkaDeserializer() {
    Map<String, Object> props = Map.of(
            KafkaJsonSchemaDeserializerConfig.SCHEMA_REGISTRY_URL_CONFIG, "mock://anything",
            KafkaJsonSchemaDeserializerConfig.JSON_VALUE_TYPE, ConsumerDomainRecord.class.getName()
    );
    KafkaJsonSchemaDeserializer<ConsumerDomainRecord> deserializer = new KafkaJsonSchemaDeserializer<>(schemaRegistryClient);
    deserializer.configure(props, IS_KEY);
    tryRegisterSchemaForValue();
    return deserializer;
}

private void tryRegisterSchemaForValue() {
    try {
        registerSchemaForValue();
    } catch (IOException | RestClientException e) {
        e.printStackTrace();
    }
}

private int registerSchemaForValue() throws IOException, RestClientException {
    return schemaRegistryClient.register(TOPIC_NAME + "-value", getConsumerDomainRecordSchema());
}

private JsonSchema getConsumerDomainRecordSchema() throws IOException {
    return JsonSchemaUtils.getSchema(
            new ConsumerDomainRecord("name"),
            SpecificationVersion.DRAFT_7,
            USE_ONEOF_FOR_NULLABLES,
            FAIL_UNKNOWN_PROPERTIES,
            new ObjectMapper(),
            schemaRegistryClient
    );
}
```

Running this test generates a pact file. Note the `contentType` in the metadata:

```json
{
  "consumer": { "name": "jsonSchemaKafkaConsumerApp" },
  "messages": [
    {
      "contents": { "name": "almost-anything2" },
      "description": "A json schema message",
      "matchingRules": {
        "body": {
          "$.name": { "combine": "AND", "matchers": [{ "match": "type" }] }
        }
      },
      "metaData": { "contentType": "application/vnd.schemaregistry.v1+json" }
    }
  ],
  "metadata": {
    "pact-jvm": { "version": "4.3.4" },
    "pactSpecification": { "version": "3.0.0" }
  },
  "provider": { "name": "jsonSchemaKafkaProviderApp" }
}
```

## Write the provider test

### 1. Set up the test class

```java
@Provider("jsonSchemaKafkaProviderApp")
@Consumer("jsonSchemaKafkaConsumerApp")
@PactBroker(url = "http://localhost:9292")
class JsonSchemaKafkaProviderTest {

    private static final String SCHEMA_REGISTRY_JSON_CONTENT_TYPE = "application/vnd.schemaregistry.v1+json";
    private static final String KEY_CONTENT_TYPE = "contentType";
    private static final String DO_NOT_USE_SCHEMA_REGISTRY = "mock://anything";
    private static final boolean IS_KEY = false;

    @BeforeEach
    void before(PactVerificationContext context) {
        context.setTarget(new MessageTestTarget());
    }

    @TestTemplate
    @ExtendWith(PactVerificationInvocationContextProvider.class)
    void pactVerificationTestTemplate(PactVerificationContext context) {
        context.verifyInteraction();
    }
}
```

### 2. Implement the message producer method

Use a `KafkaJsonSchemaSerializer` backed by a `MockSchemaRegistryClient`. Because the `contentType` is set to the schema registry type, Pact will skip the first 5 bytes when comparing the JSON output:

```java
@PactVerifyProvider("A json schema message")
MessageAndMetadata verifyJsonSchemaMessageEvent() {
    Map<String, Object> metadata = Map.of(
        KEY_CONTENT_TYPE, SCHEMA_REGISTRY_JSON_CONTENT_TYPE
    );
    ProviderDomainRecord providerDomainRecord = new ProviderDomainRecord("name");
    KafkaJsonSchemaSerializer<ProviderDomainRecord> serializer = createProductionKafkaSerializer();
    byte[] bytes = serializer.serialize("", providerDomainRecord);
    return createPactRepresentationFor(metadata, bytes);
}

private KafkaJsonSchemaSerializer<ProviderDomainRecord> createProductionKafkaSerializer() {
    Map<String, Object> config = Map.of(
        KafkaJsonSchemaSerializerConfig.SCHEMA_REGISTRY_URL_CONFIG,
        DO_NOT_USE_SCHEMA_REGISTRY
    );
    SchemaRegistryClient client = new MockSchemaRegistryClient();
    KafkaJsonSchemaSerializer<ProviderDomainRecord> jsonSerializer = new KafkaJsonSchemaSerializer<>(client);
    jsonSerializer.configure(config, IS_KEY);
    return jsonSerializer;
}

private MessageAndMetadata createPactRepresentationFor(Map<String, Object> metadata, byte[] bytes) {
    return new MessageAndMetadata(bytes, metadata);
}
```
