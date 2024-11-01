---
title: Step 3 - Create Provider (Publisher)
sidebar_label: Step 3 - Create Provider (Publisher)
---

import Tabs from '@theme/Tabs';
import TabItem from '@theme/TabItem';

## Learning Objectives

| Step                                                                                                            | Title                                             | Concept Covered        | Learning objectives                                                                                                                                                             | Further Reading             |
| --------------------------------------------------------------------------------------------------------------- | ------------------------------------------------- | ---------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------- |
| [step 3](https://github.com/pact-foundation/pact-workshop-message?tab=readme-ov-file#step-3---create-provider-publisher) | Create our Provider with Ports & Adapters in mind | Hexagonal Architecture | <ul><li>Understand how to scaffold an provider application, with ports and adapters in mind</li><li>Highlight our area of interest for our Pact message verifications</li></ul> | <ul><li>TODO LINK</li></ul> |

<hr/>

## Creating Provider (Publisher)

For our Provider, we are again going to be following the Ports and Adapters pattern.

We need - a "Port" that is responsible for _producing_ the message. - an "Adapter" that is responsible for _sending_ the message.

In our case, we have a `ProductEventService` that is responsible for this:

- The `publish` is the bit ("Adapter") that knows how to talk to the message queue
- The `update` is the bit ("Port") that just deals in our domain and knows how to create the specific event structure.
  - `createEvent` This is the function on the provider side that we'll test is able to _produce_ the correct message structure.

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

__Port & Adapter__

in `provider-js-kafka/src/product/product.event.service.js`:

```javascript
const { Kafka, Partitioners } = require("kafkajs");
const { productFromJson } = require("./product");
const { createEvent } = require("./product.event");

const KAFKA_BROKER = process.env.KAFKA_BROKER || "localhost:9092";
const TOPIC = process.env.TOPIC || "products";

class ProductEventService {
  constructor() {
    this.kafka = new Kafka({
      clientId: "product-event-service",
      brokers: [KAFKA_BROKER],
    });
    this.producer = this.kafka.producer({ createPartitioner: Partitioners.LegacyPartitioner });

  ...

  // Port
  async create(event) {
    const product = productFromJson(event);
    // SUT
    await this.publish(createEvent(product, "CREATED"));
  }
  // Port
  async update(event) {
    const product = productFromJson(event);
    await this.publish(createEvent(product, "UPDATED"));
  }
  // Port
  async delete(event) {
    const product = productFromJson(event);
    await this.publish(createEvent(product, "DELETED"));
  }

  // Adapter
  async publish(message) {
    const payload = {
      topic: TOPIC,
      messages: [{ value: JSON.stringify(message) }],
    };

    console.log("ProductEventService - sending message:", message);

    return this.producer.send(payload);
  }
}

module.exports = {
  ProductEventService,
  createEvent,
};

```

__Target of our test__

in `provider-js-kafka/src/product/product.event.js`:

```js
const createEvent = (product, type) => ({
  ...product,
  event: type,
  version: incrementVersion(product.version),
});

const incrementVersion = (v) => {
  const version = v ? parseInt(v.match(/[0-9]+/g)[0], 10) + 1 : 1;
  return `v${version}`;
};

module.exports = {
  createEvent,
};
```

</TabItem>

<TabItem value="java">

__Port & Adapter__

in `provider-java-kafka/src/main/java/io/pactflow/example/kafka/ProductRepository.java`:

```java
@Component
class ProductRepository {
  @Autowired
  private KafkaTemplate<String, String> template;
  public static Logger logger = LoggerFactory.getLogger(Application.class);

  public void save(final ProductEvent product) {
    logger.info("writing product to stream", product);

    try {
      // Port
      Message<String> message = new ProductMessageBuilder().withProduct(product).build();
      // Adapter
      this.template.send(message);

    } catch (final JsonProcessingException e) {
      logger.error("unable to serialise product to JSON", e);
    }
  }
}
```

__Target of our test__

in `provider-java-kafka/src/main/java/io/pactflow/example/kafka/ProductMessageBuilder.java`:

```java
public class ProductMessageBuilder {
  private ObjectMapper mapper = new ObjectMapper();
  private ProductEvent product;

  public ProductMessageBuilder withProduct(ProductEvent product) {
    this.product = product;
    return this;
  }

  public Message<String> build() throws JsonProcessingException {
    return MessageBuilder.withPayload(this.mapper.writeValueAsString(this.product))
        .setHeader(KafkaHeaders.TOPIC, "products").setHeader("Content-Type", "application/json; charset=utf-8")
        .build();
  }

}
```

</TabItem>

<TabItem value="c#">

__Port & Adapter__

Adapter

in `provider-dotnet-kafka/src/KafkaProducer.cs`:

```csharp
namespace Products;
public class KafkaProducer
{
    private readonly ProducerConfig _config;

    public KafkaProducer(string bootstrapServers = "localhost:9092")
    {
        _config = new ProducerConfig { BootstrapServers = bootstrapServers };
    }

    public async Task ProduceProductEventAsync(ProductEvent productEvent)
    {
        using var producer = new ProducerBuilder<Null, string>(_config).Build();
        try
        {
            var message = new Message<Null, string> { Value = JsonSerializer.Serialize(productEvent) };
            var deliveryResult = await producer.ProduceAsync("products", message);
            Console.WriteLine($"Delivered '{deliveryResult.Value}' to '{deliveryResult.TopicPartitionOffset}'");
        }
        catch (ProduceException<Null, string> e)
        {
            Console.WriteLine($"Delivery failed: {e.Error.Reason}");
        }
    }
}
```

Port

in `provider-dotnet-kafka/src/Repositories/ProductRepository.cs`:

```csharp

using System.Collections.Generic;
namespace Products;

public sealed class ProductRepository
{

  public void AddProduct(Product product) {
    _kafkaProducer.ProduceProductEventAsync(new ProductEventProducer().CreateEvent(product,"CREATED")).GetAwaiter().GetResult();
  }

  public void UpdateProduct(Product product) {
    _kafkaProducer.ProduceProductEventAsync(new ProductEventProducer().CreateEvent(product,"UPDATED")).GetAwaiter().GetResult();
  }

  public void DeleteProduct(Product product) {
    _kafkaProducer.ProduceProductEventAsync(new ProductEventProducer().CreateEvent(product,"DELETED")).GetAwaiter().GetResult();
  }
}
```

__Target of our test__

in `provider-dotnet-kafka/src/Repositories/ProductEventProducer.cs`:

```csharp
namespace Products
{
    public class ProductEventProducer
    {
        public ProductEvent CreateEvent(Product product, string eventType)
        {
            var productId = product.id != null ? product.id : Guid.NewGuid().ToString();
            return new ProductEvent
            (
               productId,
               product.type,
               product.name,
               IncrementVersion(product.version),
               eventType
            );
        }

        private string IncrementVersion(string version)
        {
            int versionNumber = 1;
            if (!string.IsNullOrEmpty(version))
            {
                var match = Regex.Match(version, @"\d+");
                if (match.Success)
                {
                    versionNumber = int.Parse(match.Value) + 1;
                }
            }
            return $"v{versionNumber}";
        }
    }
}
```

</TabItem>

<TabItem value="python">

__Port & Adapter__

in `provider-python-kafka/src/server.py`:

```python
class ProductRepository:

    PRODUCT_TOPIC = 'products'

    # Port
    @staticmethod
    def create_product(data):
        if "id" not in data:
            data["id"] = str(uuid.uuid4())
        ProductRepository._send_event('CREATED', data)
        return data

    @staticmethod
    def update_product(data):
        ProductRepository._send_event('UPDATED', data)
        return data

    @staticmethod
    def delete_product(data):
        ProductRepository._send_event('DELETED', data)
        return data

    # Adapter
    @staticmethod
    def _send_event(event_type, data):
        msg = ProductRepository.produce_event(event_type, data)
        producer.produce(msg[0],value=msg[1].encode('utf-8'))
        producer.poll(10000)
        producer.flush()
```

__Target of our test__

in `provider-python-kafka/src/server.py`:

```python
    @staticmethod
    def produce_event(event_type, data):
        product_event = {
            'event': event_type,
            'type': data["type"],
            'id': data["id"],
            'version': data["version"],
            'name': data["name"]
        }
        return (ProductRepository.PRODUCT_TOPIC, json.dumps(product_event))
```

</TabItem>

<TabItem value="golang">

__Port & Adapter__

in `provider-go-kafka/kafka_producer.go`:

Our Adapter

```go
func KakfaProducer(data ProductEvent) {

	p, err := kafka.NewProducer(&kafka.ConfigMap{
		"bootstrap.servers": "localhost:9092",
		"acks":              "all"})

...

	topic := "products"

	jsonData, err := json.Marshal(data)
	if err != nil {
		fmt.Printf("Failed to marshal data: %s", err)
		return
	}

	p.Produce(&kafka.Message{
		TopicPartition: kafka.TopicPartition{Topic: &topic, Partition: kafka.PartitionAny},
		Value:          jsonData,
	}, nil)

	// Wait for all messages to be delivered
	p.Flush(15 * 1000)
	p.Close()
}

```

Our Port

in `provider-go-kafka/repository.go`

```go
// Save adds or updates a product in the repository
func Save(product *Product) error {
	KakfaProducer(createEvent(*product, "CREATED"))
	return nil
}

// Delete removes a product from the repository by its ID
func Delete(product *Product) error {
	KakfaProducer(createEvent(*product, "DELETED"))
	return nil
}

// Update modifies an existing product in the repository
func Update(product *Product) error {
	KakfaProducer(createEvent(*product, "UPDATED"))
	return nil
}
```

__Target of our test__

in `provider-go-kafka/product_service.go`:

```go
func createEvent(product Product, eventType string) ProductEvent {
	incrementVersion(product.Version)
	if product.ID == "" {
		product.ID = uuid.New().String()
	}
	return ProductEvent{
		Product: product,
		Event:   eventType,
	}
}
```

</TabItem>

<TabItem value="rust">

__Port & Adapter__

in `provider-rust-kafka/src/main.rs`:

```rust
impl ProductEventService {
    async fn new(broker: &str, topic: &str) -> Self {
        let producer: FutureProducer = ClientConfig::new()
            .set("bootstrap.servers", broker)
            .create()
            .expect("Producer creation error");

        ProductEventService {
            producer: Arc::new(Mutex::new(producer)),
            topic: topic.to_string(),
        }
    }

    // Adapter
    async fn publish(&self, event: ProductEvent) {
        let payload = serde_json::to_string(&event).unwrap();
        let record = FutureRecord::<String, String>::to(&self.topic).payload(&payload);
        let producer = self.producer.lock().await;
        producer
            .send(record, rdkafka::util::Timeout::Never)
            .await
            .unwrap();
    }

    // Port
    async fn create(&self, product: Product) {
        let event = create_event(product, "CREATED");
        self.publish(event).await;
    }

    // Port
    async fn update(&self, product: Product) {
        let event = create_event(product, "UPDATED");
        self.publish(event).await;
    }

    // Port
    async fn delete(&self, product: Product) {
        let event = create_event(product, "DELETED");
        self.publish(event).await;
    }
}
```

__Target of our test__

in `provider-rust-kafka/src/main.rs`:

```rust
pub fn create_event(product: Product, event_type: &str) -> ProductEvent {
    let version = increment_version(product.version);
    ProductEvent {
        id: product
            .id
            .unwrap_or_else(|| uuid::Uuid::new_v4().to_string()),
        name: product.name,
        r#type: product.r#type,
        event: event_type.to_string(),
        version,
    }
}
```

</TabItem>

</Tabs>


## Step4

Move onto step 4, where we will create a Pact provider test, which will map our consumer Pact message descriptions to our create event function to ensure it will _produce_ the correct message structure.

_Move on to [step 4](https://github.com/pact-foundation/pact-workshop-message?tab=readme-ov-file#step-4---create-provider-pact-test)_
