---
title: Upgrading to 4.3.x
custom_edit_url: https://github.com/pact-foundation/pact-jvm/edit/v4.5.x/upgrade-to-4.3.x.md
---
<!-- This file has been synced from the pact-foundation/pact-jvm repository. Please do not edit it directly. The URL of the source file can be found in the custom_edit_url value above -->

## Pact specification version defaults to V4

If you are using the old Java DSL with JUnit 5, you need to specify V3 on the PactTestFor annotation, otherwise you will get a
Pact merge conflict error.

For example,

```java
@ExtendWith(PactConsumerTestExt.class)
@PactTestFor(providerName = "ArticlesProvider", port = "1234", pactVersion = PactSpecVersion.V3) // set V3 here
public class ArticlesTest {
  @Pact(consumer = "ArticlesConsumer")
  public RequestResponsePact articles(PactDslWithProvider builder) { // This is using the old DSL
    
  }
}
```

## Apache HTTP client has been upgraded to 5.1

Target request filters will now be called with either `org.apache.hc.core5.http.HttpRequest` or `org.apache.hc.core5.http.ClassicHttpRequest`. JUnit 5 tests will
need to have this interface injected.
