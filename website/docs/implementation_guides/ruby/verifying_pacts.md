---
title: Verifying Pacts
---

See [Verifying Pacts](../../getting_started/verifying_pacts.md) for an introduction into this topic.

## Using rake pact:verify

Using the `pact:verify` task is the most common way to verify pacts. This is where you configure the default set of pacts that your service provider should honour.

It is made available by requiring `'pact/tasks'` in your Rakefile.

```ruby
# In Rakefile
require 'pact/tasks'

# Remember to add it to your default Rake task
task :default => 'pact:verify'

```

The pacts that will be verified by the `pact:verify` task are configured in the `pact_helper.rb` file in your provider codebase.
The file must be called `pact_helper.rb`, however there is some flexibility in where it can be stored.
The recommended place is `spec/service_consumers/pact_helper.rb`.

To ensure that the latest version of the consumer pact is used each time, it is recommended that you either use a [Pact Broker](/pact_broker)
or that you publish the pacts of a successful consumer build as artefacts in your CI system.

Note: Pact uses Rack::Test, and assumes that your service provider will be a Rack app. See below for options if your provider is not a Rack app.

```ruby
# In specs/service_consumers/pact_helper.rb

require 'pact/provider/rspec'

# Require the provider states files for each service consumer
require 'service_consumers/provider_states_for_my_service_consumer'

Pact.service_provider "My Service Provider" do

  # Optional app configuration. Pact loads the app from config.ru by default
  # (it is recommended to let Pact use the config.ru if possible, so testing
  # conditions are closest to runtime conditions)
  app { MyApp.new }

  honours_pact_with 'My Service Consumer' do

    # This example points to a local file, however, on a real project with a continuous
    # integration box, you would publish your pacts as artifacts,
    # and point the pact_uri to the pact published by the last successful build.

    pact_uri '../path-to-your-consumer-project/specs/pacts/my_consumer-my_provider.json'
  end

  # This block is repeated for every pact that this provider should be verified against.
  honours_pact_with 'Some other Service Consumer' do
    ...
  end

end
```

### With basic auth

To verify a pact from a URL that requires basic auth, add username and password parameters:

```ruby
  pact_uri 'http://...', {username: '...', password: '...'}
```
### With a bearer token

To verify a pact from a URL that requires a bearer token, add the token parameter:

```ruby
  pact_uri 'http://...', {token: '...'}
```


### Fetching pacts from a pact broker

To verify pacts with the specific tag(s):

```ruby
Pact.service_provider "My Service Provider" do
  honours_pacts_from_pact_broker do
    # Base URL of pact broker is mandatory
    # basic auth username/password and token are optional parameters
    pact_broker_base_url 'http://...', {username: '...', password: '...', token: '...'}

    # Optionally specify the consumer version tags for the pacts you want to verify
    # Simple config - a list of tag names
    # This will verify the latest pact with the tag `dev` and the latest pact with the tag `prod`
    consumer_version_tags ['dev', 'prod']

    # Advanced configuration
    # name: name of the tag
    # all: it takes the boolean value true|false. Optional. Defaults to false.
    #      To fetch all the pacts for a tag, set it to true.
    #      To fetch only the latest pact, set it to false.
    # fallback: In case, the tag does not exist, it will fetch pacts for the fallback-tag. This is an optional
    #           parameter.
    consumer_version_tags [{name: 'tag-name', all: false, fallback: 'fallback-tag-name'}]
    
    # Requires version 1.53.0 or later
    enable_pending true # See https://docs.pact.io/pending
    include_wip_pacts_since "2020-01-01" # See https://docs.pact.io/wip
  end
 end
```

## Publishing verification results to a pact broker

If you are using version 1.11.0 or later of the pact gem and 2.0.0 or later of the Pact Broker, you can automatically publish the results of pact verifications back to the broker by setting the `app_version` and `publish_verification_results` options in your service provider configuration.

You should only publish verification results from your CI server, not from your local development machine. The recommended way to do this is to detect an environment variable that will only be present on your CI server, like `BUILD_NUMBER` or `TRAVIS`, or to set an explicit variable like `PUBLISH_VERIFICATION_RESULTS`.

```ruby
provider_version = ENV['GIT_COMMIT'] || `git rev-parse --verify HEAD`
provider_branch = ENV['GIT_BRANCH'] || `git name-rev --name-only HEAD`
publish_flag = ENV['PUBLISH_VERIFICATION_RESULTS'] == 'true' # or some way of detecting you're running on CI like ENV['CI'] == 'true'

Pact.service_provider "My Service Provider" do
  app_version provider_version
  app_version_tags [provider_branch]
  publish_verification_results publish_flag
end

```

If your pact URL includes basic auth configurations for the pact broker, these will be used to publish the verification.

## Verifying a pact at any URL using rake pact:verify:at

You can verify a pact at any arbitrary local or remote URL using the `pact:verify:at` task.
This is useful when you are developing the consumer and provider concurrently, and wish to verify the pact you have just generated in the consumer code base. It will use the same pact_helper file as `pact:verify`.

    $ rake pact:verify:at[../path-to-your-consumer-project/specs/pacts/my_consumer-my_provider.json]
    $ rake pact:verify:at[http://build-box/MyConsumerBuild/latestSuccessful/artifacts/my_consumer-my_provider.json]

With basic auth, set the environment variables `PACT_BROKER_USERNAME` and `PACT_BROKER_PASSWORD`, or use the basic auth URL format, `http://username:password@pactbroker.yourdomain/...`.

## Using a custom pact:verify task

To make a shortcut task for verifying a pact an arbitrary URL that you do not want to verify as part of your normal pact:verify task,
(eg. when you are developing the consumer and provider side by side, and want a shorter feedback cycle than can be provided by
by your CI box) add the following to your Rakefile. The pact.uri may be a local file system path or a remote URL.

```ruby
# In Rakefile or /tasks/pact.rake

# This creates a rake task that can be executed by running
# $ rake pact:verify:dev

Pact::VerificationTask.new(:dev) do | task |
  task.uri '../path-to-your-consumer-project/specs/pacts/my_consumer-my_provider.json'
end
```

With basic auth, set the environment variables `PACT_BROKER_USERNAME` and `PACT_BROKER_PASSWORD`, or use the basic auth URL format, `http://username:password@pactbroker.yourdomain/...`.

With bearer token auth, set the environment variable `PACT_BROKER_TOKEN`.

## Verifying one interaction at a time

At some stage, you'll want to be able to run your specs one at a time while you implement each feature. To do this, set the `PACT_BROKER_INTERACTION_ID` environment variable (if the pact came from a Pact Broker, and is using a recent version of the gem) or the `PACT_DESCRIPTION` and/or `PACT_PROVIDER_STATE` environment variables otherwise. At the bottom of the failed pact:verify output you will see the commands to rerun each failed interaction individually. A command to run just one interaction will look like this if it has come from a Pact Broker:

    $ bundle exec rake pact:verify PACT_BROKER_INTERACTION_ID="6c8857bd2983448096184c82151a1fc0"
    
If it has come from a local file, then you can set the provider state and/or description environment variables.

    $ bundle exec rake pact:verify PACT_DESCRIPTION="a request for something" PACT_PROVIDER_STATE="something exists"

## Modifying the request with live data

Some times you may need to modify the request with data that you only know at run time, like authentication data. If you can't stub the authentication in your rack app, then you can use a proxy app as follows.

```ruby
class ProxyApp

  def initialize real_provider_app
    @real_provider_app = real_provider_app
  end

  def call env
    # Modify request hash (env) here
    # See http://www.rubydoc.info/github/rack/rack/file/SPEC for contents of the env
    # To see the env contents in the console while you run the verification, do a `puts env`
    response = @real_provider_app.call(env)
    # Modify response here
    # A rack response is a 3 item array in the format [status, headers_hash, body_iterable]
    # eg. [200, {"Content-Type" => "text/plain"}, ["Hello world"]]
    response
  end
end

Pact.service_provider "My Service Provider" do
  app { ProxyApp.new(RealApp) }
end
```

Be very careful here that you are only _changing_ existing data in the request - if you _add_ something that the consumer did not actually send in the request, then the request may fail in real life because the consumer does not know it needs to be sent.

## Configuring RSpec

Pact uses dynamically created RSpec specs to verify pacts. If you want to modify the behaviour of the underlying RSpec execution, you can:

1. Configure RSpec in the pact_helper using the normal `RSpec.configure` code.
1. Set `task.rspec_opts` in your custom rake VerificationTask, the same way you would with a normal RSpec rake task declaration.

For future proofing though, try to use the provider state set_up/tear_down blocks where you can, because we may swap out RSpec for custom verification code in the future.

## Pact Helper location

The search paths for the pact_helper are:

```ruby
[
  "spec/**/*service*consumer*/pact_helper.rb",
  "spec/**/*consumer*/pact_helper.rb",
  "spec/**/pact_helper.rb",
  "**/pact_helper.rb"]
```
