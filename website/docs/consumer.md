---
title: Writing Consumer tests
---

<a name="golden-rule"/>

:::info The Golden rule
When thinking about authoring consumer pact tests: start with the goal of writing a good set of unit tests for your API client. An important side-effect of doing this with Pact is that you also produce an API contract you can use for contract testing.
:::

The art of writing good consumer Pact tests is mostly about knowing what _not_ to test. Getting this right will make the difference between Pact tests that are lightweight and helpful, and Pact tests that make you wish you'd stuck with integration testing. Your Pact tests should be as loose as they possibly can be, while still ensuring that the provider can't make changes that will break compatibility with the consumer.

It is easy to write brittle, unnecessarily strict, burdensome Pact tests if you don't know what you're doing. It's worth taking the time to make sure you understand what to focus on before starting to write Pact tests for real.

## Watch a video: writing good consumer tests

The following video from Pact maintainer Beth Skurrie explains how to write good consumer tests, covering:

1. What does a good Pact test look like
1. Scope of a good consumer test
1. Provider API client responsibilities, and why you shouldn't include UI/business logic layers
1. Options for "top to bottom" consumer tests
1. Using matchers effectively
1. Key things to remember (Postel's Law, extra keys)
1. Functional tests vs contract tests
1. How to avoid writing brittle or hard to maintain tests
1. Human readable scenarios (BDD)
1. What a good contract test aims to do

<iframe width="800" height="450" src="https://www.youtube.com/embed/oPuHb9Rl8Zo" frameBorder="0" allow="autoplay; encrypted-media" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" title="YouTube video player"  allowFullScreen></iframe>

## Use `Pact` for contract testing, not functional testing of the provider

* Functional testing is about ensuring the provider does the right thing with a request. These tests belong in the provider codebase, and it's not the job of the consumer team to be writing them.
* Contract testing is about making sure your consumer team and provider team have a shared understanding of what the requests and responses will be in each possible scenario.
* Pact tests should focus on
  * exposing _bugs_ in how the consumer creates the requests or handles responses
  * exposing _misunderstandings_ about how the provider will respond
* Pact tests should **not** focus on
  * exposing bugs in the provider \(though this might come up as a by product\)

You can read more about the difference between contract and functional tests [here](/consumer/contract_tests_not_functional_tests).

**The rule of thumb for working out what to test or not test is - if I don't include this scenario, what bug in the consumer or what misunderstanding about how the provider responds might be missed. If the answer is none, don't include it.**

## Only make assertions about things that will affect the consumer if they change

Avoid the temptation to make assertions about general business rules that you know about the provider \(eg. the customer ID is expected to be in the format `[A-Z][A-Z][A-Z]\-\d\d\d`\). Only make assertions about things that would affect your consumer if they changed \(eg. a link must start with `http` because your app is expecting absolute URLs, and would error if it received a relative one\). This allows the provider to evolve without getting false alerts from unncessarily strict pact verification tests.

## Choose the right type of matching for the situation

Typically, exact matching is most appropriate for Pact tests on the consumer side that are running at the unit test level. The same person is responsible for both the expectation and the actual request, so making sure that they match should be straightforward.

If you are using Pact for tests that cover more than just the "client" code, then you might want to use a looser matching (eg. type based matching and regular expressions). Remember that the more of the consumer code you cover with your Pact tests, the less maintainable it is, so do this with caution, and make sure you understand the trade-offs.

For the response, loose matching is generally the recommended option, however, the exact/loose matching decision should be made on a field by field basis. Most of the time, the consumer should not really care about the contents of a response field, and should just care about the type. However, there will be times when the contents do matter, so use exact matching when this is the case. The question to ask yourself when writing the response expectations is "if I made this looser/tighter what bugs would I miss/prevent?"

If you find you are putting in strict matchers on the contents of a field because you need to extract a particular piece of data out of it (eg. parsing a street number out of an address, or an ID out of a URL) or you are trying to infer a fact about it (e.g codes that start with `VIC-` are from the state of Victoria) then that tends to mean that the API should be providing that field for you separately itself, rather than pushing that work into the consumer side. Your tests are sending you message! Creating explicit separate fields for things like this will make the API more usable and the consumer code much less brittle. Highlighting issues like this is exactly what the "consumer driven" part of "consumer driven contracts" is about.

## Use `Pact` for isolated \(unit\) tests

* as a mock \(calls to mocks are verified after a test\) not a stub \(calls to stubs are not verified\). Using `Pact` as a stub defeats the purpose of using `Pacts`.
* for _isolated tests_ \(ie. unit tests\) of the class\(es\) that will be responsible for making the HTTP calls from your `Consumer` application to your `Provider` application, not for integrated tests of your entire consumer codebase.
* _carefully_, for any sort of functional or integrated tests within your consumer codebase.

  **Why?**

If you use `Pact` with exact matching for tests that cover multiple layers of your application \(especially your UI\), you will drive yourself nuts. You will have very brittle `Consumer` tests, as `Pact` checks every outgoing path, JSON node, query param and header. You will also end up with a cartesian explosion of interactions that need to be verified on the `Provider` side. This will increase the amount of time you spend getting your `Provider` tests to pass, without usefully increasing the amount of test coverage.

## Avoid using Pact for tests that involve the UI

If you use Pact for your UI tests you will likely end up with:

* consumer tests that are very hard to debug because you will be setting up multiple interactions on the mock server at a time, and potentially using multiple mock servers at a time.
* multiple redundant calls to the same endpoint with slight variations of data that increase the maintenance required, but don't helpfuly increase the amount of test coverage of your API.

Ideally, your Pact tests be scoped to cover as little consumer code as possible while still being a useful exercise \(ie. don't just test a raw HTTP client call\), and use as few mocked interactions at a time as possible.

A better approach than using Pact for UI tests is to use shared fixtures, or the generated pact itself, to provide HTTP stubs for tests that cover all layers of your consumer. Following the "testing pyramid" approach, most of the tests for your UI components should be isolated tests anyway, and tests covering the full stack of your consumer should be kept to a minimum.

## Think carefully about how you use it for non-isolated tests \(functional, integration tests\)

* Keep your isolated, exact match tests. These will make sure that you’re mapping the right data from your domain objects into your requests.
* For the integration tests, use loose, type based matching for the requests to avoid brittleness, and pull out the setup into a method that can be shared between tests so that you do not end up with a million interactions to verify \(this will help because the interactions collection in the `Pact` acts like a set, and discards exact duplicates\).

If you don’t care about verifying your interactions, you could use something like Webmock for your integrated tests, and use shared fixtures for requests/responses between these tests and the `Pact` tests to ensure that you have some level of verification happening.

## Ensure all calls to the `Provider` go through classes/functions that have been tested with `Pact`

Do not hand create any HTTP requests directly in your `Consumer` application. Testing through a client class/function \(a class/function with the sole responsibility of handling the HTTP interactions with the `Provider`\) gives you much more assurance that your `Consumer` app will be creating the HTTP requests that you think it should.

## Beware of Garbage In, Garbage Out with PUT/POST/PATCH

Each interaction is tested in isolation, meaning you can’t do a PUT/POST/PATCH, and then follow it with a GET to ensure that the values you sent were actually read successfully by the `Provider`. For example, if you have an optional `surname` field, and you send `lastname` instead, a `Provider` will most likely ignore the misnamed field, and return a 200, failing to alert you to the fact that your `lastname` has gone to the big `/dev/null` in the sky.

To ensure you don’t have a Garbage In Garbage Out situation, expect the response body to contain the newly updated values of the resource, and all will be well.

If you can't include the updated resource in the response, another way to avoid GIGO is to use a shared fixture between a GET response body, and a PUT/POST request body. That way, you know that the fields you are PUTing or POSTing are the same fields that you will be GETing.

## Use `can-i-deploy`

Use the [can-i-deploy](https://github.com/pact-foundation/pact_broker/wiki/Provider-verification-results) feature of the [Pact Broker CLI](https://github.com/pact-foundation/pact_broker-client#can-i-deploy). It will give you a definitive answer if the version of your consumer that is being deployed, is compatible with all of its providers.

## In dynamic languages, ensure the models you use in other tests could actually be created from the responses you expect

Sure, you’ve checked that your client deserialises the HTTP response into the Alligator class you expect, but then you need to make sure when you create an Alligator in another test, that you create it with valid attributes \(eg. is the Alligator’s last\_login\_time a Time or a DateTime?\). One way to do this is to use factories or fixtures to create the models for all your tests. See this [gist](https://gist.github.com/bethesque/69ae590e8312523e5337) for a more detailed explanation.

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