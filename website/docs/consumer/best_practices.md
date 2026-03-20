---
title: Consumer best practices
---

## Best Practice Guide

This guide defines best practices for writing high-quality Pact consumer unit tests. Each rule includes an example of good and bad practice to help users lint and review their own code.

### 🧱 1. Test Structure and Naming

#### ✅ Rule: Use meaningful test descriptions
These should describe the client’s intent, not just the request type.

**Explanation:**
Descriptive names improve readability and make it easier for consumers and providers to understand what’s being tested. Avoid repeating technical details already expressed in the test code.

**✅ Good:**
```ts
.uponReceiving("a request to get all products")
```

**❌ Bad:**
```ts
.uponReceiving("GET /products") // Redundant information already described by the Pact test
```

#### ✅ Rule: Use human-readable test cases (BDD-style)
Combine the provider state, request description, and response to form a natural-language sentence.

**Explanation:**
This helps others (including non-developers) understand test intent, and is particularly useful when reviewing contracts in the Pact Broker UI.

**✅ Good:**
```ts
.addInteraction()
  .given("there are active products in the catalog")
  .uponReceiving("a request to get all products")
  .withRequest("GET", "/products")
  .willRespondWith(200, ...)
```

Reads as: 
> **Given** there are active products in the catalog, **upon receiving** a request to get all products, **the provider will respond with** HTTP 200 with a list of products.

**❌ Bad:**
```ts
.addInteraction()
  .uponReceiving("GET /products")
  .withRequest("GET", "/products")
  .willRespondWith(200, ...)
```


#### ✅ Rule: Use a consistent test template
Adopt a known structure across your test suite.

**Explanation:**
A consistent structure makes tests easier to follow, review, and maintain — especially in large teams or codebases.

**✅ Good:**
```ts
// Top level - name of the API
describe("Thing API", () => {
  const pact = new PactV4({
    consumer: "ThingConsumer",
    provider: "ThingProvider",
    spec: SpecificationVersion.SPECIFICATION_VERSION_V4,
  });

  // Level 2 - Describe block for the specific API endpoint
  describe("GET /thing/:id", () => {

    // Level 3 - Test block for the specific test case
    test("given a valid thing, returns 200", async () => {
      await pact
        .addInteraction()
        .given("a thing with id 1 exists")
        .uponReceiving("a request for thing with ID 1")
        .withRequest("GET", "/thing/1", (builder) => {
          builder.headers({ Accept: "application/json" });
        })
        .willRespondWith(200, (builder) => {
          builder.jsonBody(
            like({
              id: 1,
              name: "Thing 1",
              price: 100,
            })
          );
        })
        .executeTest(async (mockserver) => {
          const ThingAPI = new ThingAPI(mockserver.url);
          const Thing = await ThingAPI.getThingById(1);
          expect(Thing).toEqual({
            id: 1,
            name: "Some 1",
            price: 100,
          });
        });
    });
  });
});
```

**❌ Bad:**
```ts
// Random test structure per case, hard to follow
describe("Pact Tests", () => {
  const pact = new PactV4({
    consumer: "ThingConsumer",
    provider: "ThingProvider",
    spec: SpecificationVersion.SPECIFICATION_VERSION_V4,
  });

  // Not organised well, hard to see what has been tested
  test("can call the API", async () => {
    await pact
      .addInteraction()
      .uponReceiving("get a thing")
      .withRequest("GET", "/thing/1", (builder) => {
        builder.headers({ Accept: "application/json" });
      })
      ...
  });
});
```

### 🧪 2. Test Design and Scope

#### ✅ Rule: Bug catcher

Only include tests that protect against real consumer breakages.

**Explanation**:  
Each test example in your contract should exist for a reason: to detect a breaking change in the provider that would actually impact the consumer. A good rule of thumb is to ask: *“If I remove this test, is there a type of provider change that could break the consumer and go unnoticed?”* If the answer is “no,” the test is unnecessary. Avoid adding examples just for coverage or realism — focus instead on what the consumer truly depends on. This keeps your contracts lean, meaningful, and maintainable.

✅ Good example:  
The consumer behaves differently depending on the `status` field returned by a decision API. Removing any of these tests would leave a branch of consumer logic untested.

```ts
// decisionClient.ts – actual consumer logic
export function handleDecision(response: { status: string }) {
  switch (response.status) {
    case 'approved':
      return '✅ Proceed';
    case 'rejected':
      return '❌ Stop';
    case 'pending':
      return '⏳ Await further input';
    default:
      throw new Error(`Unhandled status: ${response.status}`);
  }
}
```

```ts
it('handles approved decision', async () => {
  await provider.addInteraction({
    uponReceiving: 'an approved decision',
    withRequest: { method: 'GET', path: '/decision' },
    willRespondWith: {
      status: 200,
      body: { status: 'approved' }
    }
  });

  const res = await getDecision(provider.mockService);
  expect(handleDecision(res)).toBe('✅ Proceed');
});

it('handles rejected decision', async () => {
  await provider.addInteraction({
    uponReceiving: 'a rejected decision',
    withRequest: { method: 'GET', path: '/decision' },
    willRespondWith: {
      status: 200,
      body: { status: 'rejected' }
    }
  });

  const res = await getDecision(provider.mockService);
  expect(handleDecision(res)).toBe('❌ Stop');
});

it('handles pending decision', async () => {
  await provider.addInteraction({
    uponReceiving: 'a pending decision',
    withRequest: { method: 'GET', path: '/decision' },
    willRespondWith: {
      status: 200,
      body: { status: 'pending' }
    }
  });

  const res = await getDecision(provider.mockService);
  expect(handleDecision(res)).toBe('⏳ Await further input');
});
```

❌ Bad practice:  
If we only tested `'approved'` responses, the `'rejected'` and `'pending'` branches would be untested. If the provider changed those values or response structure, the consumer would break without the contract test noticing.


#### ✅ Rule: Test the actual API Client
Always exercise the real consumer code in your contract tests.

**Explanation**:  
Contract tests should verify that your actual consumer code (e.g. your API client or data-access layer) behaves correctly when interacting with the provider. If you use a generic HTTP client (e.g. `fetch`, `axios`) directly in the test instead of invoking the real consumer logic, you're not truly testing the consumer. This creates blind spots: the contract may be valid, but your consumer might still fail at runtime. Worse, it may give the false impression that the contract is safe to verify on the provider side, even though the consumer has never been properly exercised.

✅ Good example:
A test that imports your app’s API client and verifies how it behaves with mock provider responses.

```js
// consumer.js – your actual app code
export async function getUser(apiClient, id) {
  const response = await apiClient.get(`/users/${id}`);
  return response.data;
}

// consumer.pact.test.js – contract test
import { getUser } from './consumer';

it('gets a user', async () => {
  await provider.addInteraction({
    uponReceiving: 'a request for a user',
    withRequest: {
      method: 'GET',
      path: '/users/123',
    },
    willRespondWith: {
      status: 200,
      body: {
        id: '123',
        name: 'Alice'
      }
    }
  });

  const result = await getUser(provider.mockService, '123');
  expect(result).toEqual({ id: '123', name: 'Alice' });
});
```

❌ Bad example:
A test that uses `axios` or `fetch` directly, bypassing your actual consumer logic.

```js
import axios from 'axios';

it('gets a user (but bypasses consumer logic)', async () => {
  await provider.addInteraction({
    uponReceiving: 'a request for a user',
    withRequest: {
      method: 'GET',
      path: '/users/123',
    },
    willRespondWith: {
      status: 200,
      body: {
        id: '123',
        name: 'Alice'
      }
    }
  });

  const response = await axios.get(`${provider.mockService.baseUrl}/users/123`);
  expect(response.data).toEqual({ id: '123', name: 'Alice' });
});
```

Even though this test may pass and a contract is generated, the actual consumer code isn’t tested — which defeats the purpose of contract testing.

#### ✅ Rule: Add one interaction per test
Each test should represent a single, isolated contract scenario - an *interaction*.

**Explanation:**
This makes tests clearer, failures easier to diagnose and ensures interactions are independently verifiable.


**✅ Good:**
```ts
test("returns 200 when product exists", async () => {
  await pact
    .addInteraction()
    .given("product with ID 1 exists")
    .uponReceiving("a request for product with ID 1")
    .withRequest("GET", "/products/1")
    .willRespondWith(200, ...);
});

test("returns 404 when product does not exist", async () => {
  await pact
    .addInteraction()
    .given("no product with ID 999 exists")
    .uponReceiving("a request for product with ID 999")
    .withRequest("GET", "/products/999")
    .willRespondWith(404, ...);
});
```

**❌ Bad:**
```ts
test("product endpoints", async () => {
  // Multiple unrelated interactions in the same test block
  await pact
    .addInteraction()
    .given("product with ID 1 exists")
    .uponReceiving("a request for product with ID 1")
    .withRequest("GET", "/products/1")
    .willRespondWith(200, ...);

  await pact
    .addInteraction()
    .given("no product with ID 999 exists")
    .uponReceiving("a request for product with ID 999")
    .withRequest("GET", "/products/999")
    .willRespondWith(404, ...);

  // Then run both assertions
  const existing = await api.getProduct("1");
  const missing = await api.getProduct("999");

  expect(existing).toEqual(...);
  expect(missing).toEqual(...);
});
```

#### ✅ Rule: Minimize assertions — assert contract, not behavior
Only assert what’s needed to verify the contract.

**Explanation:**
Avoid including unrelated assertions (e.g. logging, side effects), which can introduce flakiness and clutter.

**✅ Good:**
```ts
expect(response).toEqual([...]);
```

**❌ Bad:**
```ts
expect(response).toEqual([...]);
expect(logger.debug).toHaveBeenCalled();
```

#### ✅ Rule: Only include data and operations used by the consumer
Test only what your consumer relies on.

**Explanation:**
This keeps the contract minimal and avoids unnecessary coupling to unrelated parts of the API. Additional redundant assertions on the provider unnecessarily constrains change.

**✅ Good:**
```ts
builder.jsonBody({ id: like("123"), name: like("Product 1"), price: like(37.25) });
```

**❌ Bad:**
```ts
builder.jsonBody({
  id: like("123"),
  name: like("Product 1"),
  price: like(37.25),
  availableStores: [...],
  ... // Unused fields
});
```

#### ✅ Rule: Focus on contract validation, not functional testing
Contract tests verify HTTP request/response structures, not business logic.

**Explanation:**
System behavior and business logic should be tested separately. Pact tests should focus solely on API client behaviour.

**✅ Good:**
```ts
test("returns products in correct format", async () => {
  await pact
    .addInteraction()
    .uponReceiving("a request to get all products")
    .withRequest("GET", "/products")
    .willRespondWith(200, (builder) => {
      builder.jsonBody([{ id: "1", name: "Product 1" }]);
    })
    .executeTest(async (mockserver) => {
      const products = await new API(mockserver.url).getAllProducts();
      expect(products).toEqual([{ id: "1", name: "Product 1" }]);
    });
});
```

**❌ Bad:**
```ts
test("calculates total cart value", () => {
  const cart = new Cart();
  cart.addItem({ price: 10 });
  expect(cart.total()).toBe(10); // functional test, not contract test
});
```

### 🧭 3. Clarity and Maintainability

#### ✅ Rule: Use provider states for clarity and maintainability
State setup should be explicit.

**Explanation:**
This improves test clarity and helps the provider team replicate test conditions during verification.

**✅ Good:**
```ts
.given("product with ID 1 exists")
.uponReceiving("a request for product with ID 1")
.withRequest("GET", "/products/1")
.willRespondWith(200, ...)
```

**❌ Bad:**
```ts
.uponReceiving("a request for product with ID 1")
.withRequest("GET", "/products/1")
.willRespondWith(200, ...)
// No provider state set — makes provider testing harder, reduces comprehension
```

#### ✅ Rule: Use matchers to reduce test fragility
Avoid asserting on exact values unless necessary.

**Explanation:**
Using matchers like `like()` or `eachLike()` ensures the contract is flexible and tolerant to non-breaking changes.

**✅ Good:**
```ts
eachLike({ id: like("123"), name: like("Product 1") })
```

**❌ Bad:**
```ts
[ { id: "123", name: "Product 1" } ]  // Makes the provider tests more brittle and coupled
```

#### 🧱 Avoid over-constraining the provider

Only assert on formats or constraints that your consumer actually depends on.

**Explanation**:  
Avoid over-constraining the provider by specifying overly strict formats (e.g. using regex patterns) unless your consumer truly relies on them. While you might know how the provider currently behaves, asserting on things your consumer doesn’t need — like a specific ID format — can create unnecessary fragility. This can lead to false test failures if the provider changes in ways that don’t affect your consumer. Keep your assertions just strict enough to ensure your consumer continues to work as expected — and no stricter.


✅ OK:
```json
{
  "customerId": "ABC-123"
}
```

❌ Over-constrained:
```ts
{
  "customerId": regex("[A-Z]{3}-\d{3}", "ABC-123")  // forces provider to constrain to a regex
}
```

Instead, keep your assertions just strict enough to ensure your consumer works as expected — and no stricter. This helps the provider evolve safely without false test failures.

#### ✅ Rule: Avoid duplicate interaction descriptions
Make each interaction description unique.

**Explanation:**
The Pact Broker de-duplicates interactions based on description + provider state. Re-using the same description can result in dropped tests.

**✅ Good:**
```ts
.given("there are active products in the catalog")
.uponReceiving("a request for a single product")
.withRequest("GET", "/products/1")
.willRespondWith(200, ...)
...
.given("there are no active products in the catalog")
.uponReceiving("a request for a single product") // OK: provider state differentiates scenario
.withRequest("GET", "/products/1")
.willRespondWith(404, ...)
```

**❌ Bad:**
```ts
.uponReceiving("a request for a single product") // BAD: no provider state
.withRequest("GET", "/products/1")
.willRespondWith(200, ...)
...
.uponReceiving("a request for a single product") // BAD: no provider state, overrides above
.withRequest("GET", "/products/1")
.willRespondWith(404, ...)
```

#### ✅ Rule: Ensure Pact files are deterministic
Avoid dynamic data without fixed examples.

**Explanation:**
Dynamic data can lead to flaky tests and noisy diffs. Always fix example values when using generators.

**✅ Good:**
```ts
builder.jsonBody({
  id: like("123"), // Example value provided
  createdAt: dateTime("yyyy-MM-dd'T'HH:mm:ss.SSSXXX", "2024-01-01T00:00:00.000Z")
});
```

**❌ Bad:**
```ts
builder.jsonBody({
  id: uuid(), // No example value provided — new value on every run
  createdAt: dateTime("yyyy-MM-dd'T'HH:mm:ss.SSSXXX") // Generates a new value each time
});
```

> ℹ️ Tip: Always provide example values when using generators like `uuid()`, `timestamp()`, or `dateTime()` to ensure stable contract output.


### 🔒 4. Security

#### ✅ Rule: Don’t include sensitive data in tests
Use matchers or fake data instead.

**Explanation:**
Pact files may be published to shared brokers or VCS. Including secrets, credentials, or real customer data is a serious security risk.

**✅ Good:**
```ts
builder.headers({
  Authorization: like("Bearer <token>")
});
```

**❌ Bad:**
```ts
builder.headers({
  Authorization: "Bearer real-production-token"
});
```