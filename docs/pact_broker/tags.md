---
title: Tags
---

Tags are simple String values that that belong to "pacticipant" version \(that is, application version\) resources in the Pact Broker. They are typically used to provide metadata about a version, the most common use cases being to indicate the git branch of a version \(eg. `master`\) or a stage \(eg `test`, `prod`\).

Pacticipant version tags can be used for multiple purposes.

* Tags can be used to enable you to test consumer and provider `head` and `prod` versions against each other. This allows you to decouple the release cycles of your consumer and provider. Read more about this [here](#ensuring-backwards-compatibility).
* Tags can be used to enable you to add new interactions without breaking all the builds. Read more about this [here](#adding-new-interactions).

Note that the tag is actually placed on the `pacticipant version` resource, not the `pact` itself \(conceptually, you are indicating that that particular version of the application is a "prod" version, or a "feature-x" version\). The URL structures, however, then allow you to retrieve pacts by the tags on their associated versions.

As an example, to tag `Foo` application version `b5236e772` as the production version, do a `PUT` to the resource `/pacticipants/Foo/versions/b5236e772/tags/prod`. All the pacts and verifications associated with `Foo` version `b5236e772` are now considered to be the production pacts/verifications. The pact for provider `Bar` and the latest production version of consumer `Foo` can be retrieved from `/pacts/provider/Bar/consumer/Foo/latest/prod`.

\(You may have noticed that the URL for a pacticipant version tag starts with `/pacticipants`, not `/consumers` or `/providers`. That is because `consumer` and `provider` are roles that a pacticipant takes in a pact, not an identities in themselves. An application may be both a consumer and a provider.\)

When you are using tags, you need to ensure that the version numbering scheme you use to identify a "version" cannot give you version that exists on more than one repository branch - don't hard code it. It should either _be_ the git sha \(or equivalent for your repository\), or it should include the git sha as metadata if you are using semantic versioning eg. `1.2.456+405b31ec6`.

## When are tags created?

### When publishing pacts

Your Pact consumer library will allow you to set the "consumer version tags" that will be set for the relevant consumer version when you publish your pacts. The recommended tag value to use is the name of your git branch, if applicable, or `dev`, if not.

### When publishing verification results

Your Pact provider library will allow you to set the "provider version tags" that will be set for the relevant provider version when you publish your verification results. The recommended tag value to use is the name of your git branch, if applicable, or `dev`, if not.

### After deploying to an environment

_Note: making use of this feature is recommended for experienced Pact users, however, if you are just starting with Pact, you can skip it for now._

When you deploy an application that uses Pact to a given environment \(eg `test`, `prod`\) then you should tag the relevant pacticipant version with the name of the stage using the [create version tag](https://github.com/pact-foundation/pact_broker-client#create-version-tag) command from the [Pact Broker client](https://github.com/pact-foundation/pact_broker-client). This allows you to use the [can-i-deploy](https://github.com/pact-foundation/pact_broker/wiki/can-i-deploy) tool to ensure that other applications that are deployed to the same environment can check to make sure they're compatible with the version you just deployed.

## When are tags used?

### When retrieving pacts

Providers can \(and should\) be configured to retrieve pacts by tag name \(usually the "latest pact" for a given tag eg. the latest `master` and latest `prod` pacts\).

### Before deploying to an environment

The `can-i-deploy` tool queries the Pact Broker to determine if the version of the application you are about to deploy is compatible with the versions of the other applications that are already in that environment, and it uses tags to determine this. For example `can-i-deploy --pacticipant Foo --version ad72df2 --to prod` will tell the Pact Broker to look up the latest version with the tag `prod` for each of Foo's integrations partners, and see if there is a successfully verified pact between that version and version ad72df2 of Foo.

## Retrieving pacts

* `/pacts/provider/PROVIDER/consumer/CONSUMER/latest/TAG` will return the pact associated with the latest pacticipant version that has the specified tag.
* `/pacts/provider/PROVIDER/consumer/CONSUMER/latest-untagged` will return the pact for the latest pacticipant version  that doesn't have any tags.
* `/pacts/provider/PROVIDER/consumer/CONSUMER/latest` will return the pact for the latest pacticipant version, regardless of tags.

## Creating and using tags

Most of the Pact libraries will provide configuration options to create tags automatically when publishing pacts or verification results, and when configuring the pacts to verify.

If you need to create a tag manually, then you can use the [Pact Broker Client CLI](/pact_broker/pact_broker_client_cli).

## Deleting tags

At the moment, there is no CLI to delete a tag, but you can delete it via the API by sending a `DELETE` request to the tag resource URL.

## Tagging approaches

### 1. Automatically tag with branch name when pact is published \(recommended\)

With this approach, the consumer version always has a tag, whether it be `master`, `prod` or `feature-x`. This approach works well if you use feature branches for development, and release from a production branch.

An example configuration in a ruby project to achieve this would be:

```ruby
PactBroker::Client::PublicationTask.new do | task |
  task.pact_broker_base_url = "..."
  task.consumer_version = "..."
  task.tag = `git rev-parse --abbrev-ref HEAD`.strip
end
```

The provider CI would then be configured to verify the required branches using the URLs described above - the recommended approach would be to always verify `master` and `prod`.

### 2. Manually tag production or feature pacts

If you release from master, then the production version of the consumer application should be tagged with `prod` as part of the release process. The provider CI should verify the `latest-untagged` and `latest/prod` endpoints described above. You can also [manually tag](https://github.com/pact-foundation/pact_broker/wiki/How-to-add-new-interactions-without-breaking-everything) pacts with the tag name of your choice to allow you to add in new interactions without breaking the provider CI.

## Adding new interactions

In summary: keep the CI running against a stable version of the pact, while simultaneously providing a new version for the provider team so they can update their code and provider states. Once both the stable and the new versions of the pact are green, the new version can be published as the stable version.

_Remember:_ just because you're doing consumer driven contracts doesn't meant that the consumer team gets to tell the provider team what to do. Please remember that the best results will be achieved by a collaborative approach between the two teams. Communicate with your nice human words folks.

## Ensuring backwards compatibility

If you want to ensure your provider is compatible with both the head version of your consumer, and the production version, you can use pact tagging to achieve this. To read more about this idea, check out this [blog post](http://techblog.realestate.com.au/enter-the-pact-matrix-or-how-to-decouple-the-release-cycles-of-your-microservices/) on decoupling the release cycles of your services.

### Step 1. Tag the production version of the pact

* Determine the production version of your consumer. eg. "1.0.0".
* Send a request to the Pact Broker's RESTful API to tag the given consumer version with the name of your choice. eg "prod"

  $ curl -v -X PUT -H "Content-Type: application/json" [http://pact-broker/pacticipants/Zoo App/versions/1.0.0/tags/prod](http://pact-broker/pacticipants/Zoo%20App/versions/1.0.0/tags/prod)

### Step 2. Configure the provider to verify the production pact

* Add a new pact URL to the verification configuration of your provider project. The new URL will be the same as the normal "latest" url, with the name of the tag appended.

  eg. `http://pact-broker/pacts/provider/Animal%20Service/consumer/Zoo%20App/latest/prod`

If you are using Ruby, the provider configuration will look like this.

```ruby
Pact.service_provider 'Animal Service' do

  honours_pact_with "Zoo App" do
    pact_uri 'http://pact-broker/pacts/provider/Animal%20Service/consumer/Zoo%20App/latest'
  end

  honours_pact_with "Zoo App" do
    pact_uri 'http://pact-broker/pacts/provider/Animal%20Service/consumer/Zoo%20App/latest/prod'
  end

end
```

