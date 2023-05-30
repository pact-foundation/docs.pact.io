---
title: Planned breaking changes in version 3.0
---

## Naming changes

* Rename `pacticipant` to `application` (large)
* Rename failed to failure (small)

## Remove deprecated/superseded/unnecessary functionality

* Removal of deprecated relations without a pb (small)
* Remove option to order by semantic version. (small)
* Drop support for case-insensitive resource names (small)
* Drop support for modifying contracts? (small)
* Disallow modification of verification results (medium)
* Drop support for proxy badge provider mode (small)
* Remove redundant webhook creation endpoints (small)
* Remove deprecated pact publication endpoints (small)
* Remove deprecated JSON in pacticipants endpoint (small)

## API improvements

* Update all error responses to use problem+json (medium)
* Make PUT/PATCH consistent for all resources (large)
* Paginate all collection endpoints by default (medium)

## Database changes

* Make nullable foreign keys not nullable (For backwards compatiblity, all foreign keys added to existing tables need to be nullable, but for data integrity purposes, we want them to be not-nullable. Need a major version to make this change) (medium)

## Bug fixes/poor implementation choices that are breaking changes

* Make the providerVersionBranch not allowed to be blank in PactsForVerificationJSONQuerySchema (small)
* Do not allow blank values in matrix query - it makes it hard to tell if the user has intentionally submitted a blank value or if the client always sets a value (small)
* Add pacticipant name to contract publish endpoint URL (small - but requires change to clients)

## Other

* Do not allow array JSON request bodies (Beth can't remember why this is a thing now)
