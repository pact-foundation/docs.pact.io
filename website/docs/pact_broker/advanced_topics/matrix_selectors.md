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
* `mainBranch` (Boolean) - whether or not the version(s) described are from the main branch of the pacticipant, as set in the `mainBranch` property of the `pacticipant` resource.
* `environment` (String) - the name of the environment that the pacticipant version is deployed to
* `tag` (String) - the name of the pacticipant version tag (supersede by branch and environments)
* `latest` (Boolean) - used in conjuction with other properties to indicate whether the selector is describing the *latest* version from a branch/with a tag/for a pacticipant, or all of them. Note that when used with tags, the "latest" is calculated using the creation date of the pacticipant version, NOT the creation date of the tag.

### Selector examples

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

## Options

The options used when querying the matrix are as important as the selectors themselves. The options are where the "target" is specified for a can-i-deploy query.

Grouping options:

* `latestby` (String): This property (as described above) removes the rows for the overridden pacts/verifications from the results. The options are `cvp` (show only the latest row for each consumer version and provider) and `cvpv` (show only the latest row each consumer version and provider version). For a can-i-deploy query with one selector, it should be set to `cvp`. For a can-i-deploy query with two selectors, it should be set to `cvpv`.

Target options:

* `latest` (Boolean): Used on its own or in conjuction with the `mainBranch` or `tag` options.
  * When used on its own the matrix query answers the question "Is the specified pacticipant version compatible with the latest version of each of the applications with which it integrates".
  * When used with the `mainBranch` option, the matrix query answers the question "Is the specified pacticipant version compatible with the main branches of the applications with which it integrates", where the main branch for each pacticipant is specified in its `mainBranch` property.
  * When used with the `tag` option, the matrix query answers the question "Is the specified pacticipant version compatible with the latest version with the given tag for each of the applications with which it integrates". This variant has been superseded by the `environment` option.
* `environment` (String): The name of the environment into which the application is being deployed. Not to be used with the `latest` option.
* `tag` (String): Used before environments were supported as a first class resource. Generally used in conjuction with the `latest` option.
* `mainBranch` (Boolean): When used on its own it returns results for all the versions on the main branches of each of the applications that the specified pacticipant versions integrate with. This is not very useful, so generally, the `mainBranch` is used in conjuction with `latest=true`.

### Options examples

* Can I deploy Foo v1 to the production environment: `{ "environment": "production", "latestby": "cvp" }`
* Can I deploy Foo v1 with the latest version of each of its integrated applications: `{ "latest": true, "latestby": "cvp" }`
* Can I deploy Foo v1 with the latest version that has the tag "prod" for each of its integrated applications: `{ "latest": true, "tag": "prod", "latestby": "cvp" }`
* Is Foo v1 compatible with the latest version of the main branch of each of its integrated applications: `{ "mainBranch": true, "latest": true, "latestby": "cvp" }`
* Is Foo v1 compatible with all the versions of the main branch of each of its integrated applications (syntactically valid but not useful): `{ "mainBranch": true, "latestby": "cvp" }`

## Matrix queries vs can-i-deploy

The Matrix can be queried using selectors of varying degrees of specificity (eg. just by pacticipant name, with version numbers, branches/environments etc). The can-i-deploy query is a specific variant of the matrix query that answers the question "can I deploy this application version(s) to a particular environment".

A matrix query is a can-i-deploy query if all of the following are true:

* There is a single selector and a "target" described in the options (the most common use case) OR there are multiple selectors.
* One or more of the selectors represents a single pacticipant version (because you can only deploy one version of an application at a time - it doesn't make sense to say "can I deploy every version of Foo from the main branch at once").

## can-i-deploy vs can-i-merge

The can-i-merge query is the same as can-i-deploy, except the "target" is "the main branches of the integrated applications".
