---
id: kafka
title: Kafka
description: How to test Kafka services with Pact
---

The code examples here use Java, and are based on writing JSON messages to Kafka. If you are using AVRO or Protobuf, then the Kafka Schema-Registry examples may not yet be implemented.

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

Our test method gets a List of Messages passed in - these are PACT's representation of the message(s) that we defined in the previous step. Each message has space for a byte array and also metadata. We're not going to look much at metadata at this point. 

The "useProductionCodeToDeserializeKafkaBytesToDomain" method tries to indicate that we're meant to be using some real production code in our tests. After all, there would be little point if our tests just test themselves. With Kafka, however, this is quite tricky. We need a production object that will take our byte array and process it. With Kafka, we're not so close to the low level action - we typically use "out of the box" classes to do this work for us. A KafkaConsumer will typically return ConsumerRecords<Key,Value> and you can't pass it a byte array! However, it would be configured with the appropriate Deserializers. For normal JSON, we'd configure it with a KafkaJsonDeserializer. Now, those take byte arrays as input. So, here I would suggest that you read your app's configuration, and work our what the class of the deserialiser is, instantiating an instance and returning it. A little tricky, but that's about as close to production code as we're going to get. The "useProductionCodeToDeserializeKafkaBytesToDomain" is a quicker way of doing it for the sake of this demo.

Having turned out byte array into a custom domain object, what do we do? Well, what would your production application do with it? Call that code and make sure it can process it successfully. We don't need to do all the assertions that "service" tests might be interested in, we just need to be sure that our application understood the input. A simple "assertDoesNotThrow" is likely sufficient.

Assuming you are using the PACT broker (well, why wouldn't you? Its awesome!), you might want to run and publish the consumer test. This is what it looks like on the PACT broker:
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
Lets start off by getting our test class in place with the required annotations - its pretty self explanatory, but note the names of the consumer and provider must match what we put in the corresponding consumer test. We'll also add a @BeforeEach which tells PACT we're running Message related tests (rather than HTTP), and implement the @TestTemplate method. Finally, we have a couple of constants that we'll need in the next step:
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

The KafkaJsonSerializer will take our domain object and turn it into a byte array. we pass this back to PACT which will compare it to what is held in the PACT broker. If its a match, we're green...
