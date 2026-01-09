---
title: Pact JVM Mock
custom_edit_url: https://github.com/ludorival/pact-jvm-mock/edit/main/README.md
slug: ./consumer/pact-jvm-mock
---
<!-- This file has been synced from the ludorival/pact-jvm-mock repository. Please do not edit it directly. The URL of the source file can be found in the custom_edit_url value above -->

![Build status](https://github.com/ludorival/pact-jvm-mock/actions/workflows/main.yaml/badge.svg)
![GitHub release (latest by date)](https://img.shields.io/github/v/release/ludorival/pact-jvm-mock)

pact-jvm-mock is a library that automatically generates Pact contracts from your existing [Mockk](https://github.com/mockk/mockk) or [Mockito](https://github.com/mockito/mockito) mocks. It leverages your existing test mocks to create Pact contract files, saving time and reducing the risk of human error.

Pact is a powerful tool for ensuring the compatibility of microservices. However, writing these contracts can be time-consuming and repetitive. pact-jvm-mock automatically generates Pact contracts from your existing mocks, making it easy to integrate contract testing into your existing testing workflow.

## Dependency

The library is available on Maven Central using:

* group-id = `io.github.ludorival`
* artifact-id = `pact-jvm-mock-mockito` (for Mockito) or `pact-jvm-mock-mockk` (for Mockk) or `pact-jvm-mock-spring` (for Spring RestTemplate)
* version-id = `1.4.0`

### Gradle

```groovy
testImplementation "io.github.ludorival:pact-jvm-mock-mockito:$pactJvmMockVersion"
// or
testImplementation "io.github.ludorival:pact-jvm-mock-mockk:$pactJvmMockVersion"
// or
testImplementation "io.github.ludorival:pact-jvm-mock-spring:$pactJvmMockVersion"
```

### Maven

```xml
<!-- For intercepting Mockito calls -->
<dependency>
    <groupId>io.github.ludorival</groupId>
    <artifactId>pact-jvm-mock-mockito</artifactId>
    <version>${pactJvmMockVersion}</version>
    <scope>test</scope>
</dependency>

<!-- For intercepting Mockk calls -->
<dependency>
    <groupId>io.github.ludorival</groupId>
    <artifactId>pact-jvm-mock-mockk</artifactId>
    <version>${pactJvmMockVersion}</version>
    <scope>test</scope>
</dependency>

<!-- For intercepting Spring RestTemplate calls -->
<dependency>
    <groupId>io.github.ludorival</groupId>
    <artifactId>pact-jvm-mock-spring</artifactId>
    <version>${pactJvmMockVersion}</version>
    <scope>test</scope>
</dependency>
```

## DSL Usage

### Basic Setup

First, create a configuration class that extends `PactConfiguration`:

**Kotlin:**

```kotlin
import io.github.ludorival.pactjvm.mock.PactConfiguration
import io.github.ludorival.pactjvm.mock.spring.SpringRestTemplateMockAdapter

object MyServicePactConfig : PactConfiguration(SpringRestTemplateMockAdapter("my-consumer"))
```

**Java:**

```java
import io.github.ludorival.pactjvm.mock.PactConfiguration;
import io.github.ludorival.pactjvm.mock.spring.SpringRestTemplateMockAdapter;

public static class MyPactConfiguration extends PactConfiguration {
    public MyPactConfiguration() {
        super(new SpringRestTemplateMockAdapter("my-consumer"));
    }
}
```

Then, annotate your test class with `@EnablePactMock`:

**Kotlin:**

```kotlin
import io.github.ludorival.pactjvm.mock.EnablePactMock

@EnablePactMock(MyServicePactConfig::class)
class ShoppingServiceClientTest
```

**Java:**

```java
import io.github.ludorival.pactjvm.mock.EnablePactMock;

@EnablePactMock(MyPactConfiguration.class)
public class ShoppingServiceClientTest {
    // ... test methods
}
```

### Using with Mockk (Kotlin)

The library is fully compatible with your existing Mockk code. Simply replace `every` calls with `uponReceiving`:

```kotlin
import io.github.ludorival.pactjvm.mock.mockk.uponReceiving

// Your existing Mockk code
every {
    restTemplate.getForEntity(match<String> { it.contains("user-service") }, UserProfile::class.java)
} returns ResponseEntity.ok(USER_PROFILE)

// Simply becomes
uponReceiving {
    restTemplate.getForEntity(match<String> { it.contains("user-service") }, UserProfile::class.java)
} returns ResponseEntity.ok(USER_PROFILE)
```

All your existing Mockk matchers and features continue to work exactly the same way. The library supports:
- Static responses with `returns`
- Dynamic responses with `answers`
- Multiple responses with `andThen`
- Exception throwing with `throws`
- Coroutines with `coAnswers`

This migration can be easily done with a `Replace All` in your IDE, replacing `every` with `uponReceiving`.

### Using with Mockito (Java)

To use pact-jvm-mock with Mockito in Java, simply replace `Mockito.when` calls with `PactMockito.uponReceiving`:

```java
import static io.github.ludorival.pactjvm.mock.mockito.PactMockito.uponReceiving;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.eq;

// Simple response
uponReceiving(restTemplate.getForEntity(any(String.class), eq(UserProfile.class)))
    .thenReturn(ResponseEntity.ok(USER_PROFILE));
```

Run your tests, and you should see the generated pact files in your `src/test/resources/pacts`.

### Setting a Description

By default, the description is built from the current test name. You can set a custom description for each interaction:

**Kotlin:**

```kotlin
uponReceiving {
    restTemplate.getForEntity(match<String> { it.contains("user-service") }, UserProfile::class.java)
} withDescription { "get the user profile" } returns ResponseEntity.ok(USER_PROFILE)
```

**Java:**

```java
uponReceiving(restTemplate.getForEntity(any(String.class), eq(UserProfile.class)))
    .withDescription("Get user profile")
    .thenReturn(ResponseEntity.ok(USER_PROFILE));
```

You can also use a function to generate the description dynamically:

**Java:**

```java
import java.util.function.Function;
import io.github.ludorival.pactjvm.mock.InteractionBuilder;

Function<InteractionBuilder<?>, String> descriptionFunction = 
    builder -> "Get user profile for " + builder.call.getUri().getPath();

uponReceiving(restTemplate.getForEntity(any(String.class), eq(UserProfile.class)))
    .withDescription(descriptionFunction)
    .thenReturn(ResponseEntity.ok(USER_PROFILE));
```

### Setting Provider States

The provider state refers to the state of the API or service that is being tested. You can specify provider states using the `given` method:

**Kotlin:**

```kotlin
uponReceiving {
    restTemplate.getForEntity(match<String> { it.contains("user-service") }, UserProfile::class.java)
} given { 
    state("The user has a preferred shopping list") 
} returns ResponseEntity.ok(USER_PROFILE)
```

**Java:**

```java
import java.util.function.Function;
import io.github.ludorival.pactjvm.mock.ProviderStateBuilder;
import java.util.Collections;
import java.util.Map;

Function<ProviderStateBuilder, ProviderStateBuilder> stateFunction = 
    builder -> builder.state("The user has a preferred shopping list", 
                             Map.of("userId", USER_PROFILE.getId()));

uponReceiving(restTemplate.getForEntity(any(String.class), eq(UserProfile.class)))
    .given(stateFunction)
    .thenReturn(ResponseEntity.ok(USER_PROFILE));
```

### Configuring Matching Rules

You can specify matching rules for both requests and responses using `matchingRequest` and `matchingResponse`:

**Kotlin:**

```kotlin
import au.com.dius.pact.core.model.matchingrules.RegexMatcher
import au.com.dius.pact.core.model.matchingrules.TypeMatcher

uponReceiving {
    restTemplate.exchange(
        match<URI> { it.path.contains("user-service") },
        HttpMethod.GET,
        any(),
        any<ParameterizedTypeReference<List<User>>>()
    )
} matchingRequest {
    header("Authorization", RegexMatcher("Bearer .*"))
} matchingResponse {
    body("[*].id", TypeMatcher)
} returns ResponseEntity.ok(listOf(USER_1, USER_2))
```

**Java:**

```java
import java.util.function.Function;
import io.github.ludorival.pactjvm.mock.MatchingRulesBuilder;
import au.com.dius.pact.core.model.matchingrules.RegexMatcher;
import au.com.dius.pact.core.model.matchingrules.TypeMatcher;

Function<MatchingRulesBuilder, MatchingRulesBuilder> requestRules = 
    rules -> rules.header("Authorization", new RegexMatcher("Bearer .*"));

Function<MatchingRulesBuilder, MatchingRulesBuilder> responseRules = 
    rules -> rules.body("[*].id", TypeMatcher.INSTANCE);

uponReceiving(restTemplate.exchange(
        any(URI.class),
        eq(HttpMethod.GET),
        any(),
        any(ParameterizedTypeReference.class)
    ))
    .matchingRequest(requestRules)
    .matchingResponse(responseRules)
    .thenReturn(ResponseEntity.ok(Arrays.asList(USER_1, USER_2)));
```

In this example:
- The request matching rule ensures the Authorization header matches the pattern "Bearer" followed by any string
- The response matching rule specifies that each user ID in the array should match by type rather than exact value

### Handling Errors

You can record HTTP errors using exception throwing:

**Kotlin:**

```kotlin
import io.github.ludorival.pactjvm.mock.anError

uponReceiving {
    restTemplate.postForEntity(
        match<URI> { it.path.contains("shopping-service") },
        any(),
        eq(ShoppingList::class.java)
    )
} given {
    state("The request should return a 400 Bad request") 
} throws anError(ResponseEntity.badRequest().body("The title contains unexpected character"))
```

**Java:**

```java
import static io.github.ludorival.pactjvm.mock.mockito.PactMockito.uponReceiving;
import static io.github.ludorival.pactjvm.mock.UtilsKt.anError;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.eq;
import org.springframework.http.ResponseEntity;
import java.util.function.Function;
import io.github.ludorival.pactjvm.mock.ProviderStateBuilder;
import java.util.Collections;
import java.net.URI;

Function<ProviderStateBuilder, ProviderStateBuilder> stateFunction = 
    builder -> builder.state("The request should return a 400 Bad request", 
                             Collections.emptyMap());

uponReceiving(restTemplate.postForEntity(any(URI.class), any(), eq(ShoppingList.class)))
    .given(stateFunction)
    .thenThrow(anError(ResponseEntity.badRequest().body("The title contains unexpected character")));
```

## Advanced Configuration

### Custom JSON ObjectMapper

You can specify a custom ObjectMapper for serializing request/response bodies for specific providers. This is useful when you need special serialization handling, like custom date formats or naming strategies.

**Kotlin:**

```kotlin
import io.github.ludorival.pactjvm.mock.PactConfiguration
import io.github.ludorival.pactjvm.mock.spring.SpringRestTemplateMockAdapter
import io.github.ludorival.pactjvm.mock.spring.serializerAsDefault
import org.springframework.http.converter.json.Jackson2ObjectMapperBuilder
import com.fasterxml.jackson.databind.PropertyNamingStrategies
import java.time.LocalDate

object MyServicePactConfig : PactConfiguration(
    SpringRestTemplateMockAdapter("my-service", { providerName ->
        Jackson2ObjectMapperBuilder()
            .propertyNamingStrategy(PropertyNamingStrategies.SNAKE_CASE)
            .serializerByType(
                LocalDate::class.java,
                serializerAsDefault<LocalDate>("2023-01-01")
            ).build()
    })
)
```

### Deterministic Contracts

When working with Pact contracts, it's important to ensure that your tests are deterministic - meaning they produce the same output every time they run. This is particularly important when dealing with dynamic data like timestamps, UUIDs, or any other values that change between test runs.

Enable deterministic mode by setting `isDeterministic = true` in your `PactConfiguration`:

**Kotlin:**

```kotlin
import io.github.ludorival.pactjvm.mock.PactConfiguration
import io.github.ludorival.pactjvm.mock.spring.SpringRestTemplateMockAdapter

object MyServicePactConfig : PactConfiguration(SpringRestTemplateMockAdapter("my-service")) {
    override fun isDeterministic() = true // Enable deterministic mode
}
```

For specific fields that are naturally dynamic (like dates or IDs), you can provide custom serializers to ensure consistent values:

**Kotlin:**

```kotlin
import io.github.ludorival.pactjvm.mock.PactConfiguration
import io.github.ludorival.pactjvm.mock.spring.SpringRestTemplateMockAdapter
import io.github.ludorival.pactjvm.mock.spring.serializerAsDefault
import org.springframework.http.converter.json.Jackson2ObjectMapperBuilder
import java.time.LocalDateTime
import java.util.UUID

object MyServicePactConfig : PactConfiguration(
    SpringRestTemplateMockAdapter("my-service", { providerName ->
        Jackson2ObjectMapperBuilder()
            .serializerByType(
                LocalDateTime::class.java,
                serializerAsDefault<LocalDateTime>("2023-01-01T00:00:00")
            )
            .serializerByType(
                UUID::class.java,
                serializerAsDefault<UUID>("123e4567-e89b-12d3-a456-426614174000")
            )
            .build()
    })
) {
    override fun isDeterministic() = true
}
```

When deterministic mode is enabled:
- The same interaction must always return the same response
- If an interaction changes, the test will fail with a detailed error message showing the differences
- You must provide unique descriptions for different interactions using `withDescription`
- Dynamic values should be handled with custom serializers

### Changing the Pact Directory

By default, the generated pacts are stored in `src/test/resources/pacts`. You can configure that in the pact options:

**Kotlin:**

```kotlin
import io.github.ludorival.pactjvm.mock.PactConfiguration
import io.github.ludorival.pactjvm.mock.spring.SpringRestTemplateMockAdapter

object MyServicePactConfig : PactConfiguration(SpringRestTemplateMockAdapter("my-service")) {
    override fun getPactDirectory() = "my-own-directory"
}
```

## Contributing

pact-jvm-mock is an open-source project and contributions are welcome! If you're interested in contributing, please
check out the [contributing guidelines](https://github.com/ludorival/pact-jvm-mock/blob/main/CONTRIBUTING.md).

## License

pact-jvm-mock is licensed under the [MIT License](https://github.com/ludorival/pact-jvm-mock/blob/main/LICENSE).
