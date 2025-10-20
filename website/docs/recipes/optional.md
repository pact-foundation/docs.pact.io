---
title: Optional Fields
description: Strategies for handling optional values in API responses when using Pact.
---

## Problem Statement

Optional values in API responses are a common challenge when using Pact because there is no [optional matcher](/faq#why-is-there-no-support-for-specifying-optional-attributes). You cannot define something like `stringOrNull(...)` to represent this schema:

```yaml
components:
  schemas:
    User:
      type: object
      required:
        - id
      properties:
        id:
          type: number
        lastLogin:     # Optional field
          type: string
          format: date
```

For example, consider an API that responds to `GET /users/{id}` with the following payloads:

Before login:
```json
{
  "id": "123",
  "lastLogin": null
}
```

After login:
```json
{
  "id": "456",
  "lastLogin": "2025-10-20"
}
```

Or, a list that includes both variants:
```json
{
  "users": [
    { "id": "123", "lastLogin": null },
    { "id": "456", "lastLogin": "2025-10-20" }
  ]
}
```

You cannot use an "each like" matcher here, because the array contains objects with different shapes.

## Solution

There are two primary ways to handle optional values:

1. **Provider States:** Define specific provider states for each variant.
2. **Array Contains Matcher:** Use the "Array Contains" matcher (introduced in the [V4 specification](https://github.com/pact-foundation/pact-specification/tree/version-4)) to validate multiple object shapes.

### 1. Provider States

Use provider states to vary the data returned by the provider, ensuring each test scenario represents a consistent state.

#### Consumer Implementation

In your consumer tests, define multiple interactions—typically a "minimum" and "maximum" version of the object—rather than every possible combination.

```js
describe('GET /users/{id}', () => {
  it('returns a user with lastLogin', async () => {
    await pact
      .addInteraction()
      .given('user 1 has previously logged in')
      .uponReceiving('a request to get a user')
      .withRequest('GET', '/users/1')
      .willRespondWith(200, (builder) => {
        builder.jsonBody({
          id: "1",
          lastLogin: "2025-10-20"
        });
      })
      .executeTest(async (mockserver) => {
        const client = new UserService(mockserver.url);
        const user = await client.getUser(1);
        expect(user).to.deep.equal({
          id: "1",
          lastLogin: "2025-10-20"
        });
      });
  });

  it('returns a user without lastLogin', async () => {
    await pact
      .addInteraction()
      .given('user 1 has not previously logged in')
      .uponReceiving('a request to get a user')
      .withRequest('GET', '/users/1')
      .willRespondWith(200, (builder) => {
        builder.jsonBody({ id: "1" });
      })
      .executeTest(async (mockserver) => {
        const client = new UserService(mockserver.url);
        const user = await client.getUser(1);
        expect(user).to.deep.equal({ id: "1" });
      });
  });
});
```

#### Provider Implementation

On the provider side, configure your state handlers to set up the correct data for each scenario.

```js
const stateHandlers = {
  "user 1 has previously logged in": () => {
    userRepository.set("1", new User("Bill", "2025-10-20"));
    return Promise.resolve();
  },
  "user 1 has not previously logged in": () => {
    userRepository.set("1", new User("Bill", null));
    return Promise.resolve();
  },
};
```

This approach ensures that your provider behaves consistently across tests.

### 2. Array Contains Matcher

When working with lists that contain objects of different shapes, configuring provider states can be difficult. In these cases, use the "Array Contains" matcher to verify that all expected object variants appear in the provider's response.

During verification, Pact checks that each expected variant defined in the consumer test is present in the actual provider response. The test passes only if *all* expected variants are found. Any additional objects in the response that do not match one of the expected variants are ignored.

#### Consumer Implementation

In Pact JS, use the `arrayContaining` matcher:

```js
describe('GET /users', () => {
  it('returns multiple users in various states', async () => {
    await pact
      .addInteraction()
      .uponReceiving('a request for users with various lastLogin states')
      .withRequest('GET', '/users')
      .willRespondWith(200, (builder) => {
        builder.jsonBody({
          users: Matchers.arrayContaining(
            Matchers.like({ id: '123', lastLogin: null }),
            Matchers.like({ id: '456', lastLogin: "2025-10-20" })
          ),
        });
      })
      .executeTest(async (mockserver) => {
        const client = new UserService(mockserver.url);
        const users = await client.getUsers();
        expect(users[0]).to.deep.equal({
          id: '123',
          lastLogin: null
        });
      });
  });
});
```

#### Provider Implementation

On the provider side, ensure the response contains the expected variants. Extra objects are ignored by the Pact verification process.

```js
server.get('/users', (req, res) => {
  res.json({
    users: [
      { id: '123', lastLogin: "2025-10-20" },
      { id: '456', lastLogin: null },
      { another: 'object', completely: 'different', yes: false }
    ]
  });
});
```

---

## Summary

- Use **Provider States** when you can easily control data setup for each scenario.
- Use **Array Contains Matchers** for collections with varying shapes that are difficult to preconfigure.
- Test the "minimum" and "maximum" versions of each object to reduce redundancy and improve maintainability.

