---
title: Pact Mock Server library
custom_edit_url: https://github.com/pact-foundation/pact-core-mock-server/edit/main/pact_mock_server/README.md
---
<!-- This file has been synced from the pact-foundation/pact-core-mock-server repository. Please do not edit it directly. The URL of the source file can be found in the custom_edit_url value above -->

## Source Code

https://github.com/pact-foundation/pact-core-mock-server/tree/main/pact_mock_server


This library implements the in-process mock server for matching HTTP requests and generating responses from a pact file.
It implements the [V3 Pact specification](https://github.com/pact-foundation/pact-specification/tree/version-3)
and [V4 Pact specification](https://github.com/pact-foundation/pact-specification/tree/version-4).

[Online rust docs](https://docs.rs/pact_mock_server/latest/pact_mock_server/)

## Creating a mock server
Mock servers can be created by using the mock server builder in the `builder` package. The
builder can create both standard HTTP and HTTPS servers.

The following example loads a Pact file, starts the mock server and then shuts it down later.
```rust
tokio_test::block_on(async {
    use pact_models::prelude::{Pact, RequestResponsePact};
    use pact_mock_server::builder::MockServerBuilder;
    
    // Setup a Pact file for the mock server
    let pact_json = r#"
        {
            "provider": {
                "name": "Example Provider"
            },
            "consumer": {
                "name": "Example Consumer"
            },
            "interactions": [
              {
                  "description": "a GET request",
                  "request": {
                    "method": "GET",
                    "path": "/path"
                  },
                  "response": {
                    "status": 200,
                    "headers": {
                      "Content-Type": "text/plain"
                    },
                    "body": "Hello from the mock server"
                  }
              }
            ]
        }
        "#;
    let pact = RequestResponsePact::from_json(&"JSON sample".to_string(), &serde_json::from_str(pact_json)?)?;
    
    // Create the mock server. Note that the async version requires a Tokio runtime.
    let mut mock_server = MockServerBuilder::new()
      .bind_to("127.0.0.1:0")
      .with_pact(pact.boxed())
      .start()
      .await?;
    
    // We can now make any requests to the mock server
    let http_client = reqwest::Client::new();
    let response = http_client.get(format!("http://127.0.0.1:{}/path", mock_server.port()).as_str())
      .send()
      .await?;
    assert_eq!(response.text().await?, "Hello from the mock server");
    
    // Shut the mock server down. This will dispose of the running background tasks.
    mock_server.shutdown()?;
    
    // Finally we can now check the status of the mock server.
    assert_eq!(mock_server.all_matched(), true);
    
    Ok::<(), anyhow::Error>(())
});
```

## Legacy functions

The following deprecated functions from the 1.x version exist in the `legacy` module. 

### [create_mock_server](https://docs.rs/pact_mock_server/latest/pact_mock_server/fn.create_mock_server.html)

Creates a mock server. Requires the pact JSON as a string as well as the port for the mock server to run on. A value of 
0 for the port will result in a port being allocated by the operating system. The port of the mock server is returned.

### [mock_server_matched](https://docs.rs/pact_mock_server/latest/pact_mock_server/fn.mock_server_matched.html)

Simple function that returns a boolean value given the port number of the mock service. This value will be true if all
the expectations of the pact that the mock server was created with have been met. It will return false if any request did
not match, an un-recognised request was received or an expected request was not received.

### [mock_server_mismatches](https://docs.rs/pact_mock_server/latest/pact_mock_server/fn.mock_server_mismatches.html)

This returns all the mismatches, un-expected requests and missing requests in JSON format, given the port number of the
mock server.

### [shutdown_mock_server](https://docs.rs/pact_mock_server/latest/pact_mock_server/fn.shutdown_mock_server.html)

Shuts down the mock server with the provided port. Returns a boolean value to indicate if the mock server was successfully shut down.

### [write_pact_file](https://docs.rs/pact_mock_server/latest/pact_mock_server/fn.write_pact_file.html)

Trigger a mock server to write out its pact file. This function should be called if all the consumer tests have passed. 
The directory to write the file to is passed as the second parameter. If None is passed in, the current working 
directory is used. If overwrite is true, the file will be overwritten with the contents of the current pact. Otherwise 
it will be merged with any existing pact file.

Returns Ok if the pact file was successfully written. Returns an Err if the file can not be written, or there is no 
mock server running on that port.

## Crate features
All features are enabled by default

* `datetime`: Enables support of date and time expressions and generators.
* `xml`: Enables support for parsing XML documents.
* `plugins`: Enables support for using plugins.
* `multipart`: Enables support for MIME multipart bodies.
* `tls`: Enables support for mock servers using TLS. This will add the following dependencies: hyper-rustls, rustls, rustls-pemfile, tokio-rustls.
