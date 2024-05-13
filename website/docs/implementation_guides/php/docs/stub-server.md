---
title: Usage for the optional `pact-stub-service`
custom_edit_url: https://github.com/pact-foundation/pact-php/edit/master/docs/stub-server.md
---
<!-- This file has been synced from the pact-foundation/pact-php repository. Please do not edit it directly. The URL of the source file can be found in the custom_edit_url value above -->

If you would like to test with fixtures, you can use the `pact-stub-service` like this:

```php
$files    = [__DIR__ . '/someconsumer-someprovider.json'];
$port     = 7201;
$endpoint = 'test';

$config = (new StubServerConfig())
            ->setFiles($files)
            ->setPort($port);

$stubServer = new StubServer($config);
$stubServer->start();

$client = new \GuzzleHttp\Client();

$response = $client->get($this->config->getBaseUri() . '/' . $endpoint);

echo $response->getBody(); // output: {"results":[{"name":"Games"}]}
```
