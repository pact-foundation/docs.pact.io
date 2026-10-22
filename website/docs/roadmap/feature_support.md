---
title: Feature support
---

There are multiple implementations of Pact, and while we try to keep feature parity between them, some implementations are ahead of others in terms of feature support.

## Implementation Notes

**Implementation Types:**

- **Ruby-based (#):** Pact Ruby, Pact PHP, Pact Python - wrap the shared "pact-ruby-standalone" core
- **Rust-based (^):** Pact JS, Pact .NET, Pact Go, Pact Swift - wrap the Rust shared core
- **Native:** Pact JVM, pact4s, Pact Rust, Pact C++ - standalone implementations

**Status Legend:**

- ✅ **Fully Supported** - Feature is implemented and available
- 🔧 **CLI Recommended** - Use [Pact CLI tools](/implementation_guides/cli) for this feature
- ⚠️ **Partially Available** - Feature exists in underlying implementation but may not be exposed in wrapper
- 🔧 **In Development** - Base support implemented but not yet used
- ❓ **Unknown** - Support status unclear
- ❌ **Not Supported** - Feature not available

If you're interested in a partially available feature but can't find documentation for it in your implementation, please raise an issue in the relevant repository.

## Core Features

### HTTP Pacts

Basic HTTP request/response contract testing.

| Language | Support |
|----------|---------|
| Pact JVM | ✅ |
| Pact JS | ✅ |
| Pact Ruby | ✅ |
| Pact .NET | ✅ |
| Pact Go | ✅ |
| Pact PHP | ✅ |
| Pact Python | ✅ |
| Pact Swift | ✅ |
| pact4s | ✅ |
| Pact Rust | ✅ |
| Pact C++ | ✅ |

### Asynchronous Messaging

Support for testing asynchronous message-based interactions.

| Language | Support |
|----------|---------|  
| Pact JVM | ✅ |
| Pact JS | ✅ |
| Pact Ruby | ✅ |
| Pact .NET | ✅ |
| Pact Go | ✅ |
| Pact PHP | ✅ |
| Pact Python | ✅ |
| Pact Swift | ❌ |
| pact4s | ❌ |
| Pact Rust | ✅ |
| Pact C++ | ❌ |

### Synchronous Messaging

Support for testing synchronous message interactions.

| Language | Support |
|----------|---------|  
| Pact JVM | ✅ |
| Pact JS | ✅ |
| Pact Ruby |  ✅ |
| Pact .NET | ❌ |
| Pact Go | ✅ |
| Pact PHP | ✅ |
| Pact Python | ⚠️ Partially Available |
| Pact Swift | ❌ |
| pact4s | ❌ |
| Pact Rust | ✅ |
| Pact C++ | ❌ |

### Plugin System

Support for the Pact plugin framework for custom content types and protocols.

| Language | Support |
|----------|---------|  
| Pact JVM | ✅ |
| Pact JS | ✅ |
| Pact Ruby | ✅ |
| Pact .NET | ⚠️ Partially Available |
| Pact Go | ✅ |
| Pact PHP | ✅ |
| Pact Python | ⚠️ Partially Available |
| Pact Swift | ❓ Unknown |
| pact4s | ❓ Unknown |
| Pact Rust | ✅ |
| Pact C++ | ❌ |

## Matching Features

### Regular Expression Matching

Pattern-based matching using regular expressions.

| Language | Support |
|----------|---------|  
| Pact JVM | ✅ |
| Pact JS | ✅ |
| Pact Ruby | ✅ |
| Pact .NET | ✅ |
| Pact Go | ✅ |
| Pact PHP | ✅ |
| Pact Python | ✅ |
| Pact Swift | ✅ |
| pact4s | ✅ |
| Pact Rust | ✅ |
| Pact C++ | ✅ |

### Type-Based Matching ("like")

Matching based on data types rather than exact values.

| Language | Support |
|----------|---------|  
| Pact JVM | ✅ |
| Pact JS | ✅ |
| Pact Ruby | ✅ |
| Pact .NET | ✅ |
| Pact Go | ✅ |
| Pact PHP | ✅ |
| Pact Python | ✅ |
| Pact Swift | ✅ |
| pact4s | ✅ |
| Pact Rust | ✅ |
| Pact C++ | ✅ |

### Flexible Array Length ("each like")

Matching arrays with variable length while validating element structure.

| Language | Support |
|----------|---------|  
| Pact JVM | ✅ |
| Pact JS | ✅ |
| Pact Ruby | ✅ |
| Pact .NET | ✅ |
| Pact Go | ✅ |
| Pact PHP | ✅ |
| Pact Python | ✅ |
| Pact Swift | ✅ |
| pact4s | ✅ |
| Pact Rust | ✅ |
| Pact C++ | ✅ |

## Specification Support

### Pact Specification v2

Support for Pact specification version 2.

| Language | Support |
|----------|---------|  
| Pact JVM | ✅ |
| Pact JS | ✅ |
| Pact Ruby | ✅ |
| Pact .NET | ✅ |
| Pact Go | ✅ |
| Pact PHP | ✅ |
| Pact Python | ✅ |
| Pact Swift | ✅ |
| pact4s | ✅ |
| Pact Rust | ✅ |
| Pact C++ | ✅ |

### Pact Specification v3

Support for Pact specification version 3, including advanced matching rules.

| Language | Support |
|----------|---------|  
| Pact JVM | ✅ |
| Pact JS | ✅ |
| Pact Ruby | ✅ |
| Pact .NET | ✅ |
| Pact Go | ✅ |
| Pact PHP | ✅ |
| Pact Python | ✅ |
| Pact Swift | ✅ |
| pact4s | ✅ |
| Pact Rust | ✅ |
| Pact C++ | ✅ |

### Pact Specification v4

Support for the latest Pact specification version 4.

| Language | Support |
|----------|---------|  
| Pact JVM | ✅ |
| Pact JS | ✅ |
| Pact Ruby | ✅ |
| Pact .NET | ✅ |
| Pact Go | ✅ |
| Pact PHP | ✅ |
| Pact Python | ✅ |
| Pact Swift | ❌ |
| pact4s | ❓ Unknown |
| Pact Rust | ✅ |
| Pact C++ | ⚠️ Partially Available |

## Provider States

### Multiple Provider States (Creation)

Ability to create pacts with multiple provider states.

| Language | Support |
|----------|---------|  
| Pact JVM | ✅ |
| Pact JS | ✅ |
| Pact Ruby | ✅ |
| Pact .NET | ✅ |
| Pact Go | ✅ |
| Pact PHP | ✅ |
| Pact Python | ✅ |
| Pact Swift | ✅ |
| pact4s | ❓ Unknown |
| Pact Rust | ✅ |
| Pact C++ | ✅ |

### Multiple Provider States (Verification)

Ability to verify pacts with multiple provider states.

| Language | Support |
|----------|---------|  
| Pact JVM | ✅ |
| Pact JS | ✅ |
| Pact Ruby | ✅ |
| Pact .NET | ✅ |
| Pact Go | ✅ |
| Pact PHP | ✅ |
| Pact Python | ✅ |
| Pact Swift | ✅ |
| pact4s | ❓ Unknown |
| Pact Rust | ✅ |
| Pact C++ | ❌ |

## Pact Broker Integration

### Publish Pacts to Pact Broker

Direct publishing of pacts to Pact Broker.

| Language | Support |
|----------|---------|  
| Pact JVM | 🔧 CLI Recommended |
| Pact JS | 🔧 CLI Recommended |
| Pact Ruby | 🔧 CLI Recommended |
| Pact .NET | 🔧 CLI Recommended |
| Pact Go | 🔧 CLI Recommended |
| Pact PHP | 🔧 CLI Recommended |
| Pact Python | 🔧 CLI Recommended |
| Pact Swift | 🔧 CLI Recommended |
| pact4s | 🔧 CLI Recommended |
| Pact Rust | 🔧 CLI Recommended |
| Pact C++ | 🔧 CLI Recommended |

### Dynamic Pact Fetching for Verification

Automatically fetch pacts from Pact Broker for provider verification.

| Language | Support |
|----------|---------|  
| Pact JVM | ✅ |
| Pact JS | ✅ |
| Pact Ruby | ✅ |
| Pact .NET | ✅ |
| Pact Go | ✅ |
| Pact PHP | ✅ |
| Pact Python | ✅ |
| Pact Swift | ⚠️ Partially Available |
| pact4s | ❓ Unknown |
| Pact Rust | ✅ |
| Pact C++ | ❌ |

### Fetch Pacts with Specified Tags

Fetch pacts based on consumer tags.

| Language | Support |
|----------|---------|  
| Pact JVM | ✅ |
| Pact JS | ✅ |
| Pact Ruby | ✅ |
| Pact .NET | ✅ |
| Pact Go | ✅ |
| Pact PHP | ✅ |
| Pact Python | ✅ |
| Pact Swift | ⚠️ Partially Available |
| pact4s | ❓ Unknown |
| Pact Rust | ✅ |
| Pact C++ | ❌ |

## Advanced Broker Features

### 'Pacts for Verification' API

Use the modern Pact Broker API for fetching pacts for verification.

| Language | Support |
|----------|---------|  
| Pact JVM | ✅ |
| Pact JS | ✅ |
| Pact Ruby | ✅ |
| Pact .NET | ✅ |
| Pact Go | ✅ |
| Pact PHP | ✅ |
| Pact Python | ✅ |
| Pact Swift |  ❓ Unknown |
| pact4s |  ❓ Unknown |
| Pact Rust | ✅ |
| Pact C++ | ❌ |

### Pending Pacts

Support for pending pacts workflow.

| Language | Support |
|----------|---------|  
| Pact JVM | ✅ |
| Pact JS | ✅ |
| Pact Ruby | ✅ |
| Pact .NET | ✅ |
| Pact Go | ✅ |
| Pact PHP | ✅ |
| Pact Python | ✅ |
| Pact Swift | ❓ Unknown |
| pact4s | ❓ Unknown |
| Pact Rust | ✅ |
| Pact C++ | ❌ |

### WIP Pacts

Support for work-in-progress pacts.

| Language | Support |
|----------|---------|  
| Pact JVM | ✅ |
| Pact JS | ✅ |
| Pact Ruby | ✅ |
| Pact .NET | ✅ |
| Pact Go | ✅ |
| Pact PHP | ✅ |
| Pact Python | ✅ |
| Pact Swift | ❓ Unknown |
| pact4s | ❓ Unknown |
| Pact Rust | ✅ |
| Pact C++ | ❌ |

## Testing Features

### Single Interaction Verification

Run verification for a single interaction.

| Language | Support |
|----------|---------|  
| Pact JVM | ✅ |
| Pact JS | ✅ |
| Pact Ruby | ✅ |
| Pact .NET | ✅ |
| Pact Go | ✅ |
| Pact PHP | ✅ |
| Pact Python | ✅ |
| Pact Swift | ❓ Unknown |
| pact4s | ❓ Unknown |
| Pact Rust | ✅ |
| Pact C++ | ❌ |

### Provider State Value Injection

Inject values from provider state callbacks into requests.

| Language | Support |
|----------|---------|  
| Pact JVM | ✅ |
| Pact JS | ✅ |
| Pact Ruby | ✅ |
| Pact .NET | ⚠️ Partially Available |
| Pact Go | ✅ |
| Pact PHP | ✅ |
| Pact Python | ⚠️ Partially Available |
| Pact Swift | ⚠️ Partially Available |
| pact4s | ❌ |
| Pact Rust | ✅ |
| Pact C++ | ❌ |

### Date/Time Expressions with Generators

Generate dynamic date/time values in pacts.

| Language | Support |
|----------|---------|  
| Pact JVM | ✅ |
| Pact JS | ✅ |
| Pact Ruby | ❌ |
| Pact .NET | ⚠️ Partially Available |
| Pact Go | ✅ |
| Pact PHP | ✅ |
| Pact Python | ⚠️ Partially Available |
| Pact Swift | ⚠️ Partially Available |
| pact4s | ❌ |
| Pact Rust | ❌ |
| Pact C++ | ❌ |

### XML Support

Support for XML content type matching and verification.

| Language | Support |
|----------|---------|  
| Pact JVM | ✅ |
| Pact JS | ✅ |
| Pact Ruby | ⚠️ Partially Available |
| Pact .NET | ⚠️ Partially Available |
| Pact Go | ⚠️ Partially Available |
| Pact PHP | ✅ |
| Pact Python | ⚠️ Partially Available |
| Pact Swift | ⚠️ Partially Available |
| pact4s | ✅ |
| Pact Rust | 🔧 In Development |
| Pact C++ | ❌ |

---

