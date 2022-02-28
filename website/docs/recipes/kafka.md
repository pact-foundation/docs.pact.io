---
id: kafka
title: Kafka
description: How to test Kafka services with Pact
---

# Standard JSON
The code examples here use Java, and are based on writing JSON messages to Kafka.

## Kafka JSON Consumer
We'll start with the bones of a class and we will use Junit5 annotations:

```
@ExtendWith(PactConsumerTestExt.class)
@PactTestFor(providerName = "jsonKafkaProviderApp", providerType = ProviderType.ASYNCH, pactVersion = PactSpecVersion.V3)
class JsonKafkaConsumerTest {
...
}
```

Although we're writing the consumer test, we've also named the provider. Next, we'll define what we *expect* the contract to look like:
```
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
The most interesting part here is the body. We've defined it to have a single String field - I'd expect your real one to have more than one field in all likelihood. Having defined what we're expecting, we can finally write our test:
```
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

Our test method gets a List of Messages passed in - these are Pact's representation of the message(s) that we defined in the previous step. Each message has space for a byte array and also metadata. We're not going to look much at metadata at this point. 

The `useProductionCodeToDeserializeKafkaBytesToDomain` method tries to indicate that we're meant to be using some real production code in our tests. After all, there would be little point if our tests just test themselves. With Kafka, however, this is quite tricky. We need a production object that will take our byte array and process it. With Kafka, we're not so close to the low level action - we typically use "out of the box" classes to do this work for us. A `KafkaConsumer` will typically return `ConsumerRecords<Key,Value>` and you can't pass it a byte array! However, it would be configured with the appropriate Deserializers. For normal JSON, we'd configure it with a `KafkaJsonDeserializer`. Now, those take byte arrays as input. So, here I would suggest that you read your app's configuration, and work our what the class of the deserialiser is, instantiating an instance and returning it. A little tricky, but that's about as close to production code as we're going to get. The `useProductionCodeToDeserializeKafkaBytesToDomain` is a quicker way of doing it for the sake of this demo.

Having turned out byte array into a custom domain object, what do we do? Well, what would your production application do with it? Call that code and make sure it can process it successfully. We don't need to do all the assertions that "service" tests might be interested in, we just need to be sure that our application understood the input. A simple `assertDoesNotThrow` is likely sufficient.

Assuming you are using the Pact broker (well, why wouldn't you? Its awesome!), you might want to run and publish the consumer test. This is what it looks like on the Pact broker:
```
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
            "matchers": [
              {
                "match": "type"
              }
            ]
          }
        }
      },
      "metaData": {
        "contentType": "application/json"
      }
    }
  ],
  "metadata": {
    "pact-jvm": {
      "version": "4.3.4"
    },
    "pactSpecification": {
      "version": "3.0.0"
    }
  },
  "provider": {
    "name": "jsonKafkaProviderApp"
  }
}
```

## Kafka JSON Provider
Lets start off by getting our test class in place with the required annotations - its pretty self explanatory, but note the names of the consumer and provider must match what we put in the corresponding consumer test. We'll also add a `@BeforeEach` which tells Pact we're running Message related tests (rather than HTTP), and implement the `@TestTemplate` method. Finally, we have a couple of constants that we'll need in the next step:
```
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
All that is left, is to write the test:
```
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
    Map<String, Object> config = Map.of(
    );
    KafkaJsonSerializer<ProviderDomainRecord> jsonSerializer = new KafkaJsonSerializer<>();
    jsonSerializer.configure(config, false);
    return jsonSerializer;
}

private MessageAndMetadata createPactRepresentationFor(Map<String, Object> metadata, byte[] bytes) {
    return new MessageAndMetadata(bytes, metadata);
}
```
In a similar fashion to the consumer test, we will need to get hold of a Kafka Serializer, which we should obtain through looking up the configuration of our production code (and again, in this demo, we'll just create an instance for use - make sure you do a better job!). 

The `KafkaJsonSerializer` will take our domain object and turn it into a byte array. we pass this back to Pact which will compare it to what is held in the Pact broker. If its a match, we're green...

# Schema Registry Compliant JSON
The code examples here use Java, and are based on writing JSON messages to Kafka. If you are using AVRO or Protobuf, then the Kafka Schema-Registry examples may not yet be implemented (the PR for the JSON implementation can be found [here](https://github.com/pact-foundation/pact-jvm/pull/1503)).

## Magic Bytes
When a schema registry compliant message is written to a Kafka topic, the message (whether it is JSON, AVRO or Protobuf) is preceded by [5 "magic" bytes](https://docs.confluent.io/platform/current/schema-registry/serdes-develop/index.html#wire-format). If you were to use a compliant producer with a non-compliant consumer, things wouldn't work. We want our contract test to cover us here! Let's take a look at how this can be achieved (reminder - at the time of writing, this only works for JSON).

## Schema Registry JSON Consumer
We'll start with the bones of a class and we will use Junit5 annotations:
```
@ExtendWith(PactConsumerTestExt.class)
@PactTestFor(providerName = "jsonSchemaKafkaProviderApp", providerType = ProviderType.ASYNCH, pactVersion = PactSpecVersion.V3)
class JsonSchemaKafkaConsumerTest {
...
}
```
Next we define what we *expect* the contract to look like:
```
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
And there was our change: the metadata has been changed to match that of a schema registry compliant JSON message. This is significant - Pact will now be aware of the need for those 5 magic bytes mentioned earlier. We can now write our test. First, lets add a few constants and a field:
```
private static final String TOPIC_NAME = "myKafkaTopic";
private static final boolean FAIL_UNKNOWN_PROPERTIES = true;
private static final boolean USE_ONEOF_FOR_NULLABLES = true;
private static final boolean IS_KEY = false;
private static final String IGNORED_TOPIC = "";

private MockSchemaRegistryClient schemaRegistryClient = new MockSchemaRegistryClient();
```
And then the test itself:
```
@Test
@PactTestFor(pactMethod = "schemaJsonPact", providerType = ProviderType.ASYNCH)
void jsonSchemaMessage(List<Message> messages) {
    byte[] kafkaBytes = convertToKafkaBytes(messages.get(0));
    assertDoesNotThrow(() -> {
        expectApplicationToConsumeKafkaBytesSuccessfully(kafkaBytes);
    });
}
```
Now, as we have set the contentType to application/vnd.schemaregistry.v1+json then Pact will augment each of the Message data structures passed in to the method with 5 magic bytes. The values of the bytes themselves are not important (they would be used to communicate the schema id to the registry were we running kafka), but it is now important for your consumer test to be able to process the messages correctly - they will need to effectively ignore those bytes before the JSON is parsed. If it doesn't, then the JSON will be invalid and the test will fail - that's what we're after!

We've referenced some private methods in there, so lets look at the implementations for those:
```
private byte[] convertToKafkaBytes(Message message) {
    return message.contentsAsBytes();
}

private void expectApplicationToConsumeKafkaBytesSuccessfully(byte[] kafkaBytes) {
    ConsumerDomainRecord consumerDomainRecord = useProductionCodeToDeserializeKafkaBytesToDomain(kafkaBytes);
    ProductionCode productionCode = new ProductionCode();
    productionCode.handle(consumerDomainRecord);
}
```
A Kafka consumer application will deserialize messages from a topic into a custom data structure, which the application will then process. That's what we see here - the deserialization happening (more of that in a moment), followed by a call to the application (ProductionCode.handle()) to process the message. Our assertion checks that no Exceptions are thrown - in other words, the application can successfully consume the message (we don't care what it does - that's the job of the functional tests!). Also note that the byte[] being passed in will contain those 5 magic bytes at the start, preceding the actual JSON.
Moving on:
```
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
```
Those last two methods are worthy of note. The getProductionKafkaDeserializer method is intended to reach into your production code (otherwise we're just testing the test code, and not a lot of point in that!) and get hold of the deserializer used. Most Kafka consumer applications would use out-of-the-box deserializers, which are simply a configuration parameter for the KafkaConsumer. You may want to reach into the config and pull out the class name defined for the Deserializer, and then instantiate it perhaps using reflection - I'm going to leave that as an exercise for you as I don't want to play with your production code here! The point is that the implementation given here needs to be replaced with some production code for your test to have much meaning.

Also keep an eye out for the config for the URL to the Schema Registry. As this won't be running for our tests, we configure the value of the URL with "mock://" - this tells the deserializer not to try and communicate to the registry.

Moving on, let's complete the last few private methods:
```
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
We're using a MockSchemaRegistryClient which is provided out-of-the-box. Given that we're not actually running Kafka, we're also not running the Schema Registry, so we don't want anything to try and communicate with it, and thats what this class does for us. We need to register the subject (usually the Kafka topic + either "-key" or "-value") along with the JsonSchema itself into the MockSchemaRegistryClient.

## The Pact
As ever, running the consumer test will generate the Pact file (JSON), and push it out to the Pact Broker (well, you are using one, right?!):
```
{
  "consumer": {
    "name": "jsonSchemaKafkaConsumerApp"
  },
  "messages": [
    {
      "_id": "b99581bf53e0c0cdca0479b93aa6539b142394f6",
      "contents": {
        "name": "almost-anything2"
      },
      "description": "A json schema message",
      "matchingRules": {
        "body": {
          "$.name": {
            "combine": "AND",
            "matchers": [
              {
                "match": "type"
              }
            ]
          }
        }
      },
      "metaData": {
        "contentType": "application/vnd.schemaregistry.v1+json"
      }
    }
  ],
  "metadata": {
    "pact-jvm": {
      "version": "4.3.4"
    },
    "pactSpecification": {
      "version": "3.0.0"
    }
  },
  "provider": {
    "name": "jsonSchemaKafkaProviderApp"
  }
}
```
Hopefully, that's pretty much what you expected to see. Again, note the contentType shows up.

## Schema Registry JSON Provider
Lets take a lok on the other side now - the provider test. We'll get our JUnit5 test class into being, along with a handful of constants:
```
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
Lets add the test:
```
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
We get hold of a serializer from the production code (again you probably want to get hold of the kafka config and instantiate the serializer used via reflection), and give it our domain object to turn into a byte[]. We wrap that in Pact's MessageAndMetadata type and that's what our test returns. Pact will check that it matches what the broker holds, and as we're using the SCHEMA_REGISTRY_JSON_CONTENT_TYPE, it will start parsing the JSON from the 6th byte - missing off those magic bytes.
