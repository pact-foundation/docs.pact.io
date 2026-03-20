---
title: How to test async message integrations
---

This guide explains how to structure your code and your Pact tests to contract-test asynchronous message integrations — events and messages sent over queues or event buses such as AWS SNS, SQS, Kafka, RabbitMQ, or Kinesis.

Before reading this, you should understand the [Message Pact concept](/getting_started/how_pact_works#non-http-testing-message-pact) and have checked [feature support](/roadmap/feature_support) for your language.

## Separate your protocol adapter from your message handler

The key prerequisite for testable async message code is a clean separation between:

- **The adapter** — the code that knows about the specific queuing technology (SNS event shape, Kafka wrapper, AMQP envelope). This is untestable with Pact because Pact does not speak those protocols directly.
- **The port** — the code that handles the domain payload, unaware of the transport. This is what Pact tests.

This is the Ports and Adapters pattern (also called Hexagonal Architecture).

![Ports and Adapters architecture](/img/ports-and-adapters.png)

Without this separation, your Pact test would have to unwrap the transport-specific envelope before it could test the message content — and that couples your test to infrastructure details that don't belong in a contract.

## Consumer side

### Identify your port

Given a product event published through AWS SNS, the raw Lambda handler is the adapter:

```js
const handler = async (event) => {
  console.info(event);

  // Unwrap the SNS envelope and pass the payload to the handler
  const results = event.Records.map((e) => receiveProductUpdate(JSON.parse(e.Sns.Message)));

  return Promise.all(results);
};
```

The `receiveProductUpdate` function is the port — it deals only with the domain payload:

```js
const receiveProductUpdate = (product) => {
  console.log('received product:', product)

  // Handle the product event, e.g. store in the database
  return repository.insert(new Product(product.id, product.type, product.name, product.version))
}
```

Your Pact test targets `receiveProductUpdate`, not `handler`. This function expects a message of the following shape:

```json
{
  "id": "some-uuid-1234-5678",
  "type": "spare",
  "name": "3mm hex bolt",
  "version": "v1",
  "event": "UPDATED"
}
```

### Write the consumer Pact test

In your consumer test, describe the message your port expects to receive, then invoke the port with that message. Pact verifies that the message shape is recorded in the pact file:

```js
// Example structure — exact syntax depends on your Pact library
const { message } = pact;

describe('receiveProductUpdate', () => {
  it('handles a product updated event', () => {
    return message
      .given('a product updated event exists')
      .expectsToReceive('a product updated event')
      .withContent({
        id: like('some-uuid-1234-5678'),
        type: like('spare'),
        name: like('3mm hex bolt'),
        version: like('v1'),
        event: 'UPDATED'
      })
      .withMetadata({ contentType: 'application/json' })
      .verify(receiveProductUpdate); // pass the port function directly
  });
});
```

The `verify` call invokes your port with the message content and confirms it does not throw. If the function handles the message without error, the interaction is recorded in the pact file.

## Provider (producer) side

On the provider side, find the port responsible for producing the message. In this example, `ProductEventService` publishes product events:

```js
class ProductEventService {
  async create(event) {
    const product = productFromJson(event);
    return this.publish(createEvent(product, "CREATED"));
  }

  async update(event) {
    const product = productFromJson(event);
    return this.publish(createEvent(product, "UPDATED"));
  }

  async publish(message) {
    const SNS = new AWS.SNS({
      endpoint: process.env.AWS_SNS_ENDPOINT,
      region: process.env.AWS_REGION
    });

    const params = {
      Message: JSON.stringify(message),
      TopicArn: TOPIC_ARN,
    };

    return SNS.publish(params).promise();
  }
}
```

The `update` method is the port — it produces the domain event. The `publish` method is the adapter — it knows how to send it to SNS.

In the provider verification test, register a handler that calls `update` (the port) and returns the message it would produce. Pact replays the recorded consumer interaction against this handler and checks that the output matches the consumer's expectation.

## Further reading

- [Example consumer project (AWS SNS)](https://docs.pactflow.io/docs/examples/aws/sns/consumer) and [example provider project](https://docs.pactflow.io/docs/examples/aws/sns/provider)
- [Introduction to Async Messages workshop](/university/message-pact-async/00_1_Intro) — a step-by-step tutorial using Kafka
- [Message Pact concept](/getting_started/how_pact_works#non-http-testing-message-pact)
