---
title: Creating pacts
---

## With RSpec

Follow the instructions in the [README](https://github.com/pact-foundation/pact-ruby), this is the default behaviour.

### Configuration of the pact creation

This code would typically go in the `pact_helper.rb`, which would be required by the files that contain the RSpec Pact specs.

```ruby
Pact.service_consumer "consumer name" do
  has_pact_with "provider name" do
    mock_service :provider_name do
      port 1234
      host "..." # Optional, defaults to "localhost". Useful when using a standalone mock service.
      standalone false # Optional. If true, does not automatically start a mock service
                       # You must start/stop the mock service manually.
    end
  end
end
```

## With Capybara

Configure your Rack application to be started by Pact, and tell it what port to run on.

```ruby
Pact.service_consumer "My Consumer" do
  app your_rack_app
  port 8001

  has_pact_with "My Provider" do
    ...
  end
end

```

## With Minitest

Use [pact-consumer-minitest](https://github.com/bethesque/pact-consumer-minitest).


