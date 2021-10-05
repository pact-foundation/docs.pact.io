---
title: Publishing pacts
---

```ruby
# In Gemfile

gem "pact_broker-client"
```

```ruby
# In Rakefile

require 'pact_broker/client/tasks'

PactBroker::Client::PublicationTask.new do | task |
  require 'my_consumer/version'
  task.consumer_version = ENV["GIT_COMMIT"]
  task.pattern = 'custom/path/to/pacts/*.json' # optional, default value is 'spec/pacts/*.json'
  task.pact_broker_base_url = "http://pact-broker"
  task.branch = ENV["GIT_BRANCH"] # Supported from v1.59.0
  task.tag_with_git_branch = true|false # Superseeded by first class `branch` support
  task.tags = ["dev"] # optional
  task.build_url = ENV["CI_BUILD_URL"] # Supported from v1.59.0
  task.pact_broker_basic_auth =  { username: 'basic_auth_user', password: 'basic_auth_pass'} # optional
  task.pact_broker_token = "1234abcd" # Bearer token
  task.write_method = :merge # optional, this will merge the published pact into an existing pact rather than overwriting it if one exists. Not recommended, as it makes a mulch of the workflow on the broker.
end
```

```bash
# In CI script

bundle exec rake pact:publish
```
