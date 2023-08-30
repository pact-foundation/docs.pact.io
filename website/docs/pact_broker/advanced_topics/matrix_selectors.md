---
title: Matrix selectors
---

The Matrix is the dataset that is created when all the pacts are joined to all the verifications in the database, and it shows every consumer and provider version that have been tested against each other.

The Matrix can be queried to find out whether particular versions are compatible with each other, and is used as the datasource for the can-i-deploy CLI command. "Selectors" are the way we specify which pacticipants (applications) and versions we want to include when querying the matrix. The best way to understand them is to imagine that we start with a Matrix table that contains the pacts/verification results for every consumer and provider in the Pact Broker.

| Consumer | Consumer version | Provider | Provider version | Success |
| :---     | :---             | :---     | :---             | :---    |
| Foo      | 1                | Oink     | 6                | true    |
| Foo      | 1                | Bar      | 2                | true    |
| Foo      | 1                | Bar      | 3                | false   |

To specify that we wanted to see all the rows between Foo and Bar, our selectors would be:

`{"pacticipant": "Foo"}` and `{"pacticipant": "Bar"}`.

This would return:

| Consumer | Consumer version | Provider | Provider version | Success |
| :---     | :---             | :---     | :---             | :---    |
| Foo      | 1                | Bar      | 2                | true    |
| Foo      | 1                | Bar      | 3                | false   |

To specify that we wanted to see the results for Foo v1 and Bar v3, our selectors would be:

`{"pacticipant": "Foo", "version": "1"}` and `{"pacticipant": "Bar", "version": "3"}`.

This would return:

| Consumer | Consumer version | Provider | Provider version | Success |
| :--- | :--- | :--- | :--- | :--- |
| Foo | 1 | Bar | 3 | false |

Best "Pact Broker" practice specifies that once a pact is published for a particular consumer version, it should not be overwritten, however, old versions of the Pact Broker do not stop multiple pacts being published with the same consumer version \(not recommended, and disallowed in more recent versions\). If the provider verifies each revision, we would end up with a table that looks like this:

| Consumer | Consumer version | Provider | Provider version | Success |
| :---     | :---             | :---     | :---             | :---    |
| Foo | 1 \(revision 1\) | Bar | 3 | false |
| Foo | 1 \(revision 2\) | Bar | 3 | true |
| Foo | 1 \(revision 3\) | Bar | 3 | false |

The overwritten revisions are not useful for determining whether or not we are safe to deploy, so to remove these lines from the dataset, we can specify the option `{latestby: "cvpv"}` to return the latest row when grouped and ordered by "consumer version and provider version".

Putting the selectors and the options together, to specify that we wanted to see the _latest_ results for Foo v1 and Bar v3, our selectors would be:

`{"pacticipant": "Foo", "version": "1"}` and `{"pacticipant": "Bar", "version": "3"}` and our options would be `{"latestby": "cvpv"}`.

This would return:

| Consumer | Consumer version | Provider | Provider version | Success |
| :--- | :--- | :--- | :--- | :--- |
| Foo | 1 \(revision 3\) | Bar | 3 | false |

Instead of specifying the version using the version number, you can also specify it by indicating which environment is deployed to (and by branch or tag - see docs below).

Imagine version version 4 of Bar has been deployed to prod.

| Consumer | Consumer version | Provider | Provider version | Success |
| :---     | :---             | :---     | :---             | :---    |
| Foo      | 1                | Bar      | 2                | true    |
| Foo      | 1                | Bar      | 3                | true    |
| Foo      | 2                | Bar      | 4 \(prod\)       | true    |
| Foo      | 2                | Bar      | 5                | true    |



To determine if Foo v2 can be deployed with the latest prod version of Bar, our selectors would be:

`{"pacticipant": "Foo", "version": "2"}` and `{"pacticipant": "Bar", environment: "prod"}` and our options would be `{"latestby": "cvpv"}`.

This would return:

| Consumer | Consumer version | Provider | Provider version | Success |
| :---     | :---             | :---     | :---             | :---    |
| Foo      | 2                | Bar      | 4 \(prod\)       | true |

Imagine that Foo added another provider \(and may add more in the future\). It would be brittle to specify each of its integration partners by name. The Pact Broker already knows which applications Foo integrates with, so let's allow it to work out the dependencies by itself.

To determine if Foo v2 can be deployed with the latest prod versions of all its integration partners, our selectors would be:

`{"pacticipant": "Foo", "version": "2"}` and our options would be `{ "environment": "prod", latestby: "cvp"}`. \(Note the change in `latestby` from "cvpv" to "cvp". The reasons why this is the case are beyond the scope of this document.\) This is the most common form of the `can-i-deploy` query.

## Selector properties

* `pacticipant` (String) - the name of the pacticipant (application)
* `version` (String) - the version number
* `branch` (String) - the name of the pacticipant version branch
* `mainBranch` (Boolean, default falsey) - whether or not the version(s) described are from the main branch of the pacticipant, as set in the `mainBranch` property of the `pacticipant` resource.
* `environment` (String) - the name of the environment that the pacticipant version is deployed to
* `tag` (String) - the name of the pacticipant version tag (supersede by branch and environments)
* `latest` (Boolean, default falsey) - used in conjuction with other properties to indicate whether the selector is describing the *latest* version from a branch/with a tag/for a pacticipant, or all of them. Note that when used with tags, the "latest" is calculated using the creation date of the pacticipant version, NOT the creation date of the tag.

## Selector examples

* All versions of application Foo: `{ "pacticipant": "Foo" }`
* The latest version of application Foo: `{ "pacticipant": "Foo", "latest": true }`
* All versions of application Foo from branch "develop": `{ "pacticipant": "Foo", "branch": "develop" }`
* The latest version of application Foo from branch "develop": `{ "pacticipant": "Foo", "branch": "develop", "latest": true }`
* All versions of application Foo from its configured main branch: `{ "pacticipant": "Foo", "mainBranch": true }`
* The latest version of application Foo from its configured main branch: `{ "pacticipant": "Foo", "mainBranch": true, "latest": true }`
* All versions of application Foo with tag "test": `{ "pacticipant": "Foo", "tag": "test" }`
* The latest version of application Foo with tag "test": `{ "pacticipant": "Foo", "tag": "test", "latest": true }`
* The version(s) of application Foo currently deployed to production: `{ "pacticipant": "Foo", "environment": "production" }`
* The version of application Foo currently deployed to production: `{ "pacticipant": "Foo", "environment": "production" }`
