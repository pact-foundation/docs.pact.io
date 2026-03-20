---
title: Pact file format
---

A pact file is a JSON document that describes the interactions between a consumer and a provider. It is generated automatically by the consumer's Pact tests and used as the input for provider verification. This page describes the structure of a pact file across the supported specification versions.

The authoritative specification is maintained at [github.com/pact-foundation/pact-specification](https://github.com/pact-foundation/pact-specification).

## Top-level structure

All pact files share the same top-level shape:

```json
{
  "consumer": { "name": "string" },
  "provider": { "name": "string" },
  "interactions": [...],
  "metadata": {
    "pactSpecification": { "version": "string" }
  }
}
```

| Field | Type | Description |
|---|---|---|
| `consumer.name` | string | The name of the consumer service that generated this pact. |
| `provider.name` | string | The name of the provider service this pact is for. |
| `interactions` | array | The list of interactions recorded during consumer tests. |
| `metadata.pactSpecification.version` | string | The Pact specification version used (e.g. `"2.0.0"`, `"3.0.0"`). |

## HTTP interactions (V1 / V2)

Pact specification V1 and V2 describe synchronous HTTP request/response interactions.

```json
{
  "description": "A request for a product",
  "providerState": "product 10 exists",
  "request": {
    "method": "GET",
    "path": "/products/10",
    "headers": {
      "Accept": "application/json"
    },
    "query": "flag=true"
  },
  "response": {
    "status": 200,
    "headers": {
      "Content-Type": "application/json"
    },
    "body": {
      "id": 10,
      "name": "Wooden Spoon",
      "type": "cutlery"
    },
    "matchingRules": {
      "$.body.id": { "match": "type" }
    }
  }
}
```

### Interaction fields (V1/V2)

| Field | Type | Required | Description |
|---|---|---|---|
| `description` | string | Yes | Human-readable label for this interaction. Must be unique within the pact file. |
| `providerState` | string | No | A named state the provider must be in before this interaction is replayed. |
| `request` | object | Yes | The HTTP request the consumer expects to make. |
| `response` | object | Yes | The HTTP response the consumer expects to receive. |

### Request fields

| Field | Type | Description |
|---|---|---|
| `method` | string | HTTP method (e.g. `GET`, `POST`, `DELETE`). Case-insensitive. |
| `path` | string | The request path. May contain matching rules in V2+. |
| `headers` | object | Request headers as key-value pairs. |
| `query` | string (V1) / object (V2) | Query string. V1 stores as a raw string; V2 stores as a map of arrays. |
| `body` | any | The request body. May be a JSON object, array, string, or absent. |
| `matchingRules` | object | Matching rules applied to request fields. See [Matching rules](#matching-rules). |

### Response fields

| Field | Type | Description |
|---|---|---|
| `status` | integer | The expected HTTP status code. |
| `headers` | object | Expected response headers. Only headers listed here are verified. |
| `body` | any | The expected response body. May be a JSON object, array, string, or absent. |
| `matchingRules` | object | Matching rules applied to response fields. |

## HTTP interactions (V3 / V4)

V3 introduced several breaking changes and additions. V4 extended the format further to support plugins.

Key changes from V2:

- `providerState` (singular string) is replaced by `providerStates` (array of objects).
- `generators` are added alongside `matchingRules` to support dynamic value generation during verification.
- `query` is always an object (map of arrays), not a raw string.

```json
{
  "description": "A request for a product",
  "providerStates": [
    {
      "name": "product 10 exists",
      "params": { "id": 10 }
    }
  ],
  "request": {
    "method": "GET",
    "path": "/products/10",
    "matchingRules": {
      "path": { "matchers": [{ "match": "regex", "regex": "/products/[0-9]+" }] }
    },
    "generators": {
      "path": { "type": "RandomInt", "min": 1, "max": 100 }
    }
  },
  "response": {
    "status": 200,
    "body": {
      "id": 10,
      "name": "Wooden Spoon"
    },
    "matchingRules": {
      "body": {
        "$.id": { "matchers": [{ "match": "type" }] }
      }
    }
  }
}
```

### Provider states (V3+)

| Field | Type | Description |
|---|---|---|
| `name` | string | The name of the provider state. Must match a state registered in the provider's verification setup. |
| `params` | object | Optional key-value parameters passed to the provider state handler. |

## Message interactions (V3)

Message pacts describe asynchronous interactions — events and messages passed over a queue or event bus. There is no HTTP request; instead, the interaction describes only the message content.

```json
{
  "description": "a product updated event",
  "providerStates": [
    { "name": "product 10 exists" }
  ],
  "contents": {
    "id": 10,
    "event": "UPDATED",
    "name": "Wooden Spoon"
  },
  "metadata": {
    "contentType": "application/json"
  },
  "matchingRules": {
    "body": {
      "$.id": { "matchers": [{ "match": "type" }] }
    }
  },
  "generators": {}
}
```

| Field | Type | Description |
|---|---|---|
| `description` | string | Human-readable label for this message. |
| `providerStates` | array | Named states the provider must be in to produce this message. |
| `contents` | any | The expected message payload. |
| `metadata` | object | Message metadata, including `contentType`. |
| `matchingRules` | object | Matching rules applied to message fields. |
| `generators` | object | Generators for dynamic field values. |

## Matching rules

Matching rules control how Pact compares actual values to expected values during verification. Without a matching rule, Pact uses exact equality.

### V1/V2 format

```json
"matchingRules": {
  "$.body.id": { "match": "type" },
  "$.body.name": { "match": "regex", "regex": "[A-Za-z ]+" }
}
```

Rules are keyed by a JSONPath expression. Supported match types:

| `match` value | Description |
|---|---|
| `type` | The actual value must be the same type as the expected value. |
| `regex` | The actual value must match the `regex` field. |
| `integer` | The actual value must be an integer. |
| `decimal` | The actual value must be a decimal number. |
| `number` | The actual value must be any number. |
| `min` | The array must have at least `min` items. |
| `max` | The array must have at most `max` items. |

### V3+ format

```json
"matchingRules": {
  "body": {
    "$.id": {
      "matchers": [{ "match": "type" }],
      "combine": "AND"
    }
  }
}
```

In V3+, rules are nested by section (`body`, `header`, `path`, `query`) and each key maps to an object with a `matchers` array. The `combine` field (`AND`/`OR`) controls how multiple matchers are applied.

## Generators

Generators are used during provider verification to substitute dynamic values (such as random IDs or current timestamps) into requests and responses.

```json
"generators": {
  "body": {
    "$.id": { "type": "RandomInt", "min": 1, "max": 1000 }
  }
}
```

Common generator types:

| `type` | Description |
|---|---|
| `RandomInt` | Generates a random integer between `min` and `max`. |
| `RandomDecimal` | Generates a random decimal number. |
| `RandomString` | Generates a random string of `size` characters. |
| `Regex` | Generates a value matching the provided `regex`. |
| `Uuid` | Generates a random UUID. |
| `Date` | Generates a date using the provided `format`. |
| `DateTime` | Generates a datetime using the provided `format`. |
| `ProviderStateGenerator` | Reads a value from the provider state `params` map. |

## Specification versions

| Version | Key additions |
|---|---|
| V1 | HTTP interactions. `providerState` as a string. `matchingRules` keyed by JSONPath. |
| V2 | Regular expression and type matching. `query` as an object. |
| V3 | `providerStates` as an array of objects. Message interactions. `generators`. V3 matching rule format. |
| V4 | Plugin support. Combined interaction types (`Synchronous/HTTP`, `Asynchronous/Messages`, `Synchronous/Messages`). |

For the full specification, see [Pact Specification on GitHub](https://github.com/pact-foundation/pact-specification).
