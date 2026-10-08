---
title: Maintenance
---

## Automatic data clean up

Performance can degrade when too much data accumulates in the Pact Broker. Luckily, a lot of the data in a broker instance is "unreachable" and can be removed without affecting the way it operates functionally, as generally speaking, the application (pacticipant) versions that are referenced in the verification and can-i-deploy tasks are either the latest for their branch or tag (eg. verifying the latest pact for a version with tag `feat/some-new-feature`, `main` or `production`) or a fairly recent version of the main line of development (eg. when deploying commit `193d71a4` of the `main` branch to `production`).

As of version 2.72.0.0 of the Docker Pact Broker images, an automatic "clean" feature has been included in the image. 

### Categories of removable data

A configurable task will run on a cron schedule of your choosing to remove:

* Overwritten data for application versions
  * Overwritten pacts (these are created when pact is published with the same consumer version but different content from a previous publication - it shouldn't happen if following best practice, but it is technically possible to do)
  * Duplicate verifications (this happens when verification results for the same pact version content are published by the same provider version multiple times - this can happen quite often under normal operation)
* Historical webhook execution data (except for the very latest execution for each consumer/provider/event)
* Application versions and their associated tags/pacts/verifications/webhooks that not in the configurable "keep" list (more on this below).
* Stale branches that have not been active within the configurable retention period (more on this below).

### How the application version cleaning works

To ensure that the data that is still in use is not deleted, a list of "keep" selectors must be configured to specify which application versions (and associated data) should be kept. Any application version not selected by one or more of the keep selectors will (eventually) be deleted. To ensure that the clean up task itself does not impact the performance of the Broker, a limit is placed on the number of application versions that will be deleted at one time. The task will first identify all the application versions to keep, exclude those records, and then delete the oldest \[configurable number\] of application versions and their associated pacts, verifications, tags, webhook executions, and any orphan pact versions. 

### Configuring the "keep" selectors

The keep selectors operate in a very similar way to the [consumer version selectors](/pact_broker/advanced_topics/consumer_version_selectors/) used during verification. Each selector can have the following properties:

* `pacticipant`: the name of the pacticipant
* `branch`: the name of the branch as a string to indicate a particular branch, or a boolean `true` to indicate "any version associated with a branch"
* `tag`: the name of the tag as a string to indicate a particular tag, or a boolean `true` to indicate "any version with a tag"
* `latest`: if `true`, then the latest version matching the other selection properties is specified. If `false` or omitted, all versions matching the other selection properties are specified.
* `max_age`: the number of days since it was created, as an integer, for which to keep the application version.

These properties can be used in any combination, except that `latest` and `max_age` should not be used together.

:::note

The selectors `{ "deployed": true }` and `{ "released": true }` will automatically be added to the keep selectors, meaning that all versions that have ever been deployed or released will be kept.

:::
#### Examples

* keep all `main` versions less than 30 days old: `{"max_age": 30, "tag": "main"}`
* keep the latest version for each pacticipant/tag: `{ "latest": true, "tag": true }`
* keep all versions less than 30 days old: `{"max_age": 30}`
* keep all versions for Foo app: `{"pacticipant": "Foo"}`
* keep the latest version for each pacticipant: `{ "latest": true }`
* keep all main versions for Foo app: `{"pacticipant": "Foo", "tag": "main"}`
* keep all production versions: `{ "tag" : " production" }`

The selectors combine by "OR", meaning that a version is kept if it matches any of the selectors. So `[{"max_age": 30}, { "latest": true, "tag": true }, { "tag": "production" }]` would be "keep every version that's less than 30 days old, or is the latest version for every pacticipant/tag, or is a production version".

#### Recommended starting configuration for keep selectors

* When you deploy an application to production, the relevant application version needs to be tagged in the Pact Broker as the `production` version, so you need to ensure that you keep any version that you're likely to deploy (or rollback to). Specify a max_age value that is at minimum the number of days it takes between a commit being created and that commit being deployed (with a very comfortable margin of error) and any branch that you deploy from. A reasonable max_age value might be 90 days for the `main` branch. eg. `{"max_age": 90, "tag": "main"}`
* If an application is not under active development, a selector that keeps versions by age limit might not actually select any versions. To ensure that we don't loose those critical "latest" versions for our main line of development or our deployed environments, add a selector with `{"tag": true, "latest": true}`.
* For mobile consumers where all production versions of a pact are being verified to ensure backwards compatibility, you will want to keep all production versions by specifying `{"pacticipant": "<YourMobileConsumerName>", "tag": "production"}`. This is not required for applications that run as a single deployed production instance.

#### Initial clean strategy

If you have a very large database, and you are just now enabling the clean, the initial clean up might take some time. To ensure that the clean does not have an impact on the performance of the Broker, it is recommended to set the cron schedule to something quite regular for the first day (eg. every 2 minutes), and set the clean limit quite low (eg. 100). Once the task has stopped deleting any more records, set the schedule back to something like once/twice a day, and make sure the clean limit is higher than the number of new versions you expect in that time period.

### How the stale branch cleaning works

Branches accumulate over time as feature work is merged and abandoned, which degrades query performance and clutters the UI. The clean task automatically deletes stale branches (without touching the associated versions or pacts) based on configurable "keep" selectors.

A branch is considered for deletion if it does not match any of the configured keep selectors. The pacticipant's designated `main_branch` is **always protected** regardless of selectors. Branches are deleted in batches (controlled by a configurable limit) to avoid impacting Broker performance.

### Configuring the "keep branch" selectors

Each branch keep selector can have the following properties:

* `max_age`: the number of days since the branch was last published to, as an integer. Branches last updated within this many days will be kept.
* `branch`: a branch name (string) or list of branch names (array of strings) that should always be kept regardless of age.

These properties can be used individually or together within a single selector. Selectors combine by "OR" — a branch is kept if it matches any selector.

#### Examples

* keep branches active in the last 90 days: `[{"max_age": 90}]`
* keep branches active in the last 90 days, and always keep `main` and `develop`: `[{"max_age": 90}, {"branch": ["main", "develop"]}]`
* disable stale branch cleanup entirely: `[]`

#### Default configuration

The default is `[{"max_age": 90}]`, which deletes any branch that has had no new versions published in the last 90 days (except the pacticipant's `main_branch`).

### Configuration options

#### pactfoundation/pact-broker Docker image

See the [environment variable documentation here](/pact_broker/docker_images/pactfoundation#automatic-data-clean-up)

#### CleanTask (Ruby/Rake)

If you are running the Pact Broker outside of the Docker image, you can configure the clean task directly in your Rakefile:

```ruby
PactBroker::DB::CleanTask.new do |task|
  task.database_connection = # ... your database connection
  task.keep_version_selectors = [
    { max_age: 90, branch: "main" },
    { latest: true, tag: true },
    { deployed: true },
    { released: true }
  ]
  task.keep_branch_selectors = [
    { max_age: 90 },
    { branch: ["main", "develop"] }
  ]
  task.version_deletion_limit = 500
  task.branch_deletion_limit = 100  # defaults to version_deletion_limit if not set
  task.dry_run = false
end
```

Pass `keep_branch_selectors: nil` or `keep_branch_selectors: []` to disable stale branch cleanup entirely.
