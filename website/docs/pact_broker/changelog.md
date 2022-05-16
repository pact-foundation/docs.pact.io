---
title: Changelog
custom_edit_url: https://github.com/pact-foundation/pact_broker/edit/master/CHANGELOG.md
---
<!-- This file has been synced from the pact-foundation/pact_broker repository. Please do not edit it directly. The URL of the source file can be found in the custom_edit_url value above -->

<a name="v2.99.0"></a>

### v2.99.0 (2022-05-13)

#### Features

* remove disable_use_branch_heads_for_latest_branch_pacts feature toggle	 ([5c6f1766](https://github.com/pact-foundation/pact_broker/commit/5c6f1766))
* remove new_wip_calculation feature toggle	 ([add6cb08](https://github.com/pact-foundation/pact_broker/commit/add6cb08))
* timeout long running pact content diff requests (#555)	 ([88abb2cf](https://github.com/pact-foundation/pact_broker/commit/88abb2cf))
* change sql_log_level default from debug to none	 ([9f7aed46](https://github.com/pact-foundation/pact_broker/commit/9f7aed46))

#### Bug Fixes

* **ui**
  * fix unescaped pacticipant name and main branch in details and network pages	 ([b8b1d306](https://github.com/pact-foundation/pact_broker/commit/b8b1d306))

* return a 400 when invalid JSON is used to create a version	 ([9af2cfaf](https://github.com/pact-foundation/pact_broker/commit/9af2cfaf))
* only log API requests/responses, not web assets, when http_debug_logging_enabled is true	 ([1f232c08](https://github.com/pact-foundation/pact_broker/commit/1f232c08))

* **matrix**
  * fix performance issue when querying matrix with one selector	 ([3a08d128](https://github.com/pact-foundation/pact_broker/commit/3a08d128))

* **pacts for verification**
  * return the pacts for the branch heads when using the branch selector	 ([6dac495e](https://github.com/pact-foundation/pact_broker/commit/6dac495e))

<a name="v2.98.0"></a>

### v2.98.0 (2022-03-29)

#### Features

* support debug logging of entire request and response	 ([42eb4a17](https://github.com/pact-foundation/pact_broker/commit/42eb4a17))

<a name="v2.97.0"></a>

### v2.97.0 (2022-03-29)

#### Features

* **webhook certificates**
  * support setting webhook certificates using environment variables	 ([82c7a7e5](https://github.com/pact-foundation/pact_broker/commit/82c7a7e5))

#### Bug Fixes

* do not set postgres connection driver options if database_statement_timeout is nil	 ([adec4b00](https://github.com/pact-foundation/pact_broker/commit/adec4b00))

<a name="v2.96.0"></a>

### v2.96.0 (2022-03-21)

#### Features

* print final value of configuration attribute rather than source value	 ([9c0fd3c4](https://github.com/pact-foundation/pact_broker/commit/9c0fd3c4))

#### Bug Fixes

* ensure database and basic auth credentials are not coerced to arrays if they contain commas	 ([5bce7ce4](https://github.com/pact-foundation/pact_broker/commit/5bce7ce4))
* allow lazy loading when finding individual pacts	 ([04e03cb2](https://github.com/pact-foundation/pact_broker/commit/04e03cb2))

<a name="v2.95.1"></a>

### v2.95.1 (2022-03-18)

#### Bug Fixes

* **can-i-deploy**
  * allow new provider to be introduced to existing consumer without can-i-deploy having circular dependency issues	 ([e43974ca](https://github.com/pact-foundation/pact_broker/commit/e43974ca))

<a name="v2.95.0"></a>

### v2.95.0 (2022-03-16)

#### Features

* add relation for can-i-deploy branch to environment badge	 ([6ece8e93](https://github.com/pact-foundation/pact_broker/commit/6ece8e93))
* add badge url for 'can I deploy latest version of branch to envionment' endpoint	 ([086b8c10](https://github.com/pact-foundation/pact_broker/commit/086b8c10))

#### Bug Fixes

* **pacts for verification**
  * do not de-duplicate pacts with the same content but different consumers	 ([ae3bb541](https://github.com/pact-foundation/pact_broker/commit/ae3bb541))

<a name="v2.94.0"></a>

### v2.94.0 (2022-02-22)

#### Features

* add can-i-deploy endpoint for checking if the latest version for a branch can be deployed to a particular environment	 ([34b145e8](https://github.com/pact-foundation/pact_broker/commit/34b145e8))
* truncate tags, branches and versions in UI when they are super long (#513)	 ([94bbf915](https://github.com/pact-foundation/pact_broker/commit/94bbf915))

* **integration dashboard**
  * add copy buttons next to the branch, tag and environment labels	 ([5b86ac88](https://github.com/pact-foundation/pact_broker/commit/5b86ac88))

#### Bug Fixes

* Improve Matrix request performance (#537)	 ([123f8629](https://github.com/pact-foundation/pact_broker/commit/123f8629))
* Eagerly load pact publication fields (#536)	 ([c3f6993b](https://github.com/pact-foundation/pact_broker/commit/c3f6993b))

* **hal-browser**
  * properties accordion should be collapsed by default (#544)	 ([19466121](https://github.com/pact-foundation/pact_broker/commit/19466121))

<a name="v2.93.4"></a>

### v2.93.4 (2022-02-21)

#### Bug Fixes

* **matrix page**
  * set correct base URL for links when a path is specified in the base URL	 ([8305456b](https://github.com/pact-foundation/pact_broker/commit/8305456b))

* handle DateTimes that come back from Sqlite as Strings	 ([1312a049](https://github.com/pact-foundation/pact_broker/commit/1312a049))

<a name="v2.93.3"></a>

### v2.93.3 (2022-02-02)

#### Bug Fixes

* ensure webhook_certificates setting is honoured in webhook	 ([7933a526](https://github.com/pact-foundation/pact_broker/commit/7933a526))
* ensure disable_ssl_verification setting is honoured in webhook	 ([08bc758c](https://github.com/pact-foundation/pact_broker/commit/08bc758c))
* ensure webhook_certificates setting is honoured in webhook	 ([8a720cdb](https://github.com/pact-foundation/pact_broker/commit/8a720cdb))
* ensure disable_ssl_verification setting is honoured in webhook	 ([0728b3d7](https://github.com/pact-foundation/pact_broker/commit/0728b3d7))

* **hal-browser**
  * fixing vulnerability by upgrading HAL browser dependencies	 ([a6b06f66](https://github.com/pact-foundation/pact_broker/commit/a6b06f66))

<a name="v2.93.2"></a>

### v2.93.2 (2021-12-23)

#### Bug Fixes

* Improve SortContent performance on large contracts (#538)	 ([1914c01f](https://github.com/pact-foundation/pact_broker/commit/1914c01f))

<a name="v2.93.1"></a>

### v2.93.1 (2021-12-21)

#### Bug Fixes

* optimise query for calculating the latest overall pacts	 ([f44aaa70](https://github.com/pact-foundation/pact_broker/commit/f44aaa70))

<a name="v2.93.0"></a>

### v2.93.0 (2021-12-07)

#### Features

* remove feature flag for new_wip_calculations	 ([972ceadd](https://github.com/pact-foundation/pact_broker/commit/972ceadd))
* call the database clean within a transaction	 ([408c84ef](https://github.com/pact-foundation/pact_broker/commit/408c84ef))

#### Bug Fixes

* fix clean performance fix (#530)	 ([6c71e57b](https://github.com/pact-foundation/pact_broker/commit/6c71e57b))
* fix performance issue loading latest version for pacticipant	 ([c575d132](https://github.com/pact-foundation/pact_broker/commit/c575d132))

<a name="v2.92.0"></a>

### v2.92.0 (2021-11-27)

#### Features

* allow SQL caller logging to be enabled	 ([861d8f21](https://github.com/pact-foundation/pact_broker/commit/861d8f21))
* use a separate table to track the successful verifications of pact versions for each provider version tag (feature toggled with "new_wip_calculation")	 ([df0acfa3](https://github.com/pact-foundation/pact_broker/commit/df0acfa3))

#### Bug Fixes

* **cleanup**
  * Improve delete orphans SQL query (#527)	 ([853354ea](https://github.com/pact-foundation/pact_broker/commit/853354ea))

* cast PACT_BROKER_DATABASE_CONNECTION_VALIDATION_TIMEOUT to an integer	 ([8816c61f](https://github.com/pact-foundation/pact_broker/commit/8816c61f))

<a name="v2.91.0"></a>

### v2.91.0 (2021-11-15)

#### Features

* add environments to matrix response	 ([fd50f22c](https://github.com/pact-foundation/pact_broker/commit/fd50f22c))
* remove feature toggle around change to return the pact for the latest tagged version, rather than the latest pact that has a version with the tag	 ([fac3fc8a](https://github.com/pact-foundation/pact_broker/commit/fac3fc8a))

#### Bug Fixes

* load images from the correct path when the Pact Broker application is run from a non root context	 ([a268ef25](https://github.com/pact-foundation/pact_broker/commit/a268ef25))

<a name="v2.90.0"></a>

### v2.90.0 (2021-11-12)

#### Features

* do not let clean task delete currently deployed or currently released+supported versions	 ([b05f0b67](https://github.com/pact-foundation/pact_broker/commit/b05f0b67))
* allow webhook certificates to be configured in the pact_broker.yml file	 ([7c60c955](https://github.com/pact-foundation/pact_broker/commit/7c60c955))

#### Bug Fixes

* handle conflict check for pacts where the interactions are missing in one or the other	 ([71844f0f](https://github.com/pact-foundation/pact_broker/commit/71844f0f))
* fix error that occurs in some versions of Sqlite when running 20210702_drop_unused_columns_from_deployed_versions.rb	 ([0daa4459](https://github.com/pact-foundation/pact_broker/commit/0daa4459))
* correct logic when redacting database URL without a password	 ([30d66cf7](https://github.com/pact-foundation/pact_broker/commit/30d66cf7))
* set resolved environment for environment selectors	 ([f02474b7](https://github.com/pact-foundation/pact_broker/commit/f02474b7))

* **deps**
  * upgrade to bootstrap v4.6.1	 ([0433107c](https://github.com/pact-foundation/pact_broker/commit/0433107c))

<a name="v2.89.1"></a>

### v2.89.1 (2021-10-28)

#### Bug Fixes

* **clean**
  * honour max_age when set in clean selector	 ([828420d4](https://github.com/pact-foundation/pact_broker/commit/828420d4))

* null safe navigation in case a branch head does not exist for a branch version	 ([4b259a81](https://github.com/pact-foundation/pact_broker/commit/4b259a81))

<a name="v2.89.0"></a>

### v2.89.0 (2021-10-15)

#### Features

* add applicationInstance to deployed version resource as a replacement for target	 ([9bfafc8a](https://github.com/pact-foundation/pact_broker/commit/9bfafc8a))
* apply allow_dangerous_contract_modification setting when publishing using the /contracts/publish endpoint	 ([956227fe](https://github.com/pact-foundation/pact_broker/commit/956227fe))
* add support for matchingBranch property in consumer version selectors	 ([48068d29](https://github.com/pact-foundation/pact_broker/commit/48068d29))

#### Bug Fixes

* set missing provider branch name parameter for contract_requiring_verification_published webhooks	 ([777ccdd2](https://github.com/pact-foundation/pact_broker/commit/777ccdd2))
* correct misnamed database port configuration property causing the PACT_BROKER_DATABASE_PORT not to be respected	 ([3d14013a](https://github.com/pact-foundation/pact_broker/commit/3d14013a))

<a name="v2.88.0"></a>

### v2.88.0 (2021-10-11)

#### Features

* include relations for each consumer version that a pact version belongs to when retrieved using the URL from the 'pacts for verification' response	 ([3458c9e5](https://github.com/pact-foundation/pact_broker/commit/3458c9e5))

#### Bug Fixes

* use the decoded path info rather than the encoded one when creating the pact info	 ([dd30a1a2](https://github.com/pact-foundation/pact_broker/commit/dd30a1a2))
* edge case in webhook description rendering with participants specified by labels (#512)	 ([7e6a78d8](https://github.com/pact-foundation/pact_broker/commit/7e6a78d8))

* **matrix**
  * prevent long version names overlfow the table (#511)	 ([3c279556](https://github.com/pact-foundation/pact_broker/commit/3c279556))

<a name="v2.87.0"></a>

### v2.87.0 (2021-10-05)

#### Features

* **matrix**
  * preselect the consumer version when clicking through to matrix page from integration dashboard	 ([b550b470](https://github.com/pact-foundation/pact_broker/commit/b550b470))

* **dashboard**
  * show tooltip explaining auto created branches	 ([cdaf7f6e](https://github.com/pact-foundation/pact_broker/commit/cdaf7f6e))

* **can-i-deploy**
  * support ignoring specific version numbers	 ([2ac5a946](https://github.com/pact-foundation/pact_broker/commit/2ac5a946))
  * make verification results URL reference the appropriate consumer version as the pb:pact-version	 ([145bb37b](https://github.com/pact-foundation/pact_broker/commit/145bb37b))

* add pb:can-i-deploy-pacticipant-version-to-environment relation	 ([67328194](https://github.com/pact-foundation/pact_broker/commit/67328194))

* **webhooks**
  * support ${pactbroker.providerVersionDescriptions} template parameter	 ([54a073eb](https://github.com/pact-foundation/pact_broker/commit/54a073eb))
  * support ${pactbroker.buildUrl} template parameter	 ([9b79b33f](https://github.com/pact-foundation/pact_broker/commit/9b79b33f))
  * support $pactbroker.consumerVersionBranch template parameter	 ([b97ba84c](https://github.com/pact-foundation/pact_broker/commit/b97ba84c))

#### Bug Fixes

* **mysql**
  * increase size of event_context column	 ([c1596419](https://github.com/pact-foundation/pact_broker/commit/c1596419))

* correctly merge dry validation and custom validation error messages when publishing contracts	 ([688b1e3f](https://github.com/pact-foundation/pact_broker/commit/688b1e3f))

* **pacts for verification**
  * correct logic for returning pact for main branch when no consumer version selectors are specified	 ([8847e442](https://github.com/pact-foundation/pact_broker/commit/8847e442))

* **db clean**
  * optimise calls to identify overwritten data to delete	 ([aaef9e6d](https://github.com/pact-foundation/pact_broker/commit/aaef9e6d))

<a name="v2.86.0"></a>

### v2.86.0 (2021-09-17)

#### Features

* allow webhooks to match pacticipants by label (#501)	 ([f30a9dcc](https://github.com/pact-foundation/pact_broker/commit/f30a9dcc))
* in the webhook body for contract_published and contract_content_changed, use the latest verification from the main branch if present	 ([b45398bd](https://github.com/pact-foundation/pact_broker/commit/b45398bd))
* change default database_connection_validation_timeout from -1 (every request) to nil (which Sequel will set to 3600 seconds)	 ([0c508572](https://github.com/pact-foundation/pact_broker/commit/0c508572))
* add version details of the implementation that verified a Pact (#363)	 ([021a8692](https://github.com/pact-foundation/pact_broker/commit/021a8692))

<a name="v2.85.1"></a>

### v2.85.1 (2021-09-14)

#### Bug Fixes

* fix bug identifying latest verification for tagged pact	 ([43ac4b03](https://github.com/pact-foundation/pact_broker/commit/43ac4b03))

<a name="v2.85.0"></a>

### v2.85.0 (2021-09-13)

#### Features

* show in the UI whether or not a pact was pending when verification failed	 ([326c068e](https://github.com/pact-foundation/pact_broker/commit/326c068e))
* thread safe configuration overrides (#500)	 ([50900231](https://github.com/pact-foundation/pact_broker/commit/50900231))
* allow dashboard pacts to be viewed by branch, tag, environment or all	 ([1ec8fc82](https://github.com/pact-foundation/pact_broker/commit/1ec8fc82))
* support deleting pacts by branch in the UI	 ([bc8fef1d](https://github.com/pact-foundation/pact_broker/commit/bc8fef1d))
* update UI	 ([0ba5eda3](https://github.com/pact-foundation/pact_broker/commit/0ba5eda3))

<a name="v2.84.0"></a>

### v2.84.0 (2021-09-10)

#### Features

* use the first tag as the branch when publishing pacts using the contracts/publish endpoint	 ([7b903c1d](https://github.com/pact-foundation/pact_broker/commit/7b903c1d))
* support multiple branches per version (#495)	 ([acff2fcc](https://github.com/pact-foundation/pact_broker/commit/acff2fcc))
* Support deleting all pacts for a specific tag in the UI (#480)	 ([10dda8ae](https://github.com/pact-foundation/pact_broker/commit/10dda8ae))
* add webhook template parameter for GItlab verification statuses (#493)	 ([390ae0d8](https://github.com/pact-foundation/pact_broker/commit/390ae0d8))

* **pacts for verification**
  * include pending status for responses by default when includePendingStatus is not specified	 ([748d3b87](https://github.com/pact-foundation/pact_broker/commit/748d3b87))

#### Bug Fixes

* when the latest version for a tag does not have a pact, do not return a pact for the 'latest tag' selector	 ([374c77ce](https://github.com/pact-foundation/pact_broker/commit/374c77ce))
* issue-reproduction/Dockerfile-pact-broker to reduce vulnerabilities (#491)	 ([9692b465](https://github.com/pact-foundation/pact_broker/commit/9692b465))
* Dockerfile to reduce vulnerabilities (#496)	 ([57c190ef](https://github.com/pact-foundation/pact_broker/commit/57c190ef))

<a name="v2.83.0"></a>

### v2.83.0 (2021-08-19)

#### Features

* **clean**
  * update default selectors for clean task to include deployed, released and branch head versions	 ([aaffe71f](https://github.com/pact-foundation/pact_broker/commit/aaffe71f))
  * support keeping currently deployed and released versions, and the latest version for each branch	 ([e4fbd766](https://github.com/pact-foundation/pact_broker/commit/e4fbd766))

* add index to verifications table to improve performance of 'latest verification' query	 ([02eeb424](https://github.com/pact-foundation/pact_broker/commit/02eeb424))

#### Bug Fixes

* use provider_version_number from webhook context	 ([3cf421ac](https://github.com/pact-foundation/pact_broker/commit/3cf421ac))
* validate matrix query limit	 ([ac5e0890](https://github.com/pact-foundation/pact_broker/commit/ac5e0890))

<a name="v2.82.0"></a>

### v2.82.0 (2021-08-14)

#### Features

* do not allow contract content for a consumer version to be modified for all new Broker instances (#484)	 ([b1819749](https://github.com/pact-foundation/pact_broker/commit/b1819749))
* ensure saved configuration is loaded appropriately into the RuntimeConfiguration	 ([c5ab52ad](https://github.com/pact-foundation/pact_broker/commit/c5ab52ad))
* automatically set main branch (#483)	 ([63e287ee](https://github.com/pact-foundation/pact_broker/commit/63e287ee))
* allow the first tag to be used as the branch name to assist migrating to branches (#478)	 ([a086214a](https://github.com/pact-foundation/pact_broker/commit/a086214a))
* add support for contract_requiring_verification_published webhook (#476)	 ([b4699df0](https://github.com/pact-foundation/pact_broker/commit/b4699df0))
* automatically create database connection from YAML or environment variable config	 ([ca34b030](https://github.com/pact-foundation/pact_broker/commit/ca34b030))
* move basic auth code in from pact-broker-docker	 ([869bcd61](https://github.com/pact-foundation/pact_broker/commit/869bcd61))
* allow Pact Broker to be configured using a YAML file and environment variables (#471)	 ([6e3d0e62](https://github.com/pact-foundation/pact_broker/commit/6e3d0e62))

* **pacts for verification**
  * if no consumer version selectors are specified, return the pacts for the latest main version, and all the deployed and released versions	 ([5fccd524](https://github.com/pact-foundation/pact_broker/commit/5fccd524))

* **metrics**
  * add counts for environment, deployed version, released version, pacticipants and versions with branch set	 ([8272b08b](https://github.com/pact-foundation/pact_broker/commit/8272b08b))

#### Bug Fixes

* lazy load latest verification using select max, and eager load using the skynet query	 ([e6ee6ab5](https://github.com/pact-foundation/pact_broker/commit/e6ee6ab5))
* improve performance of query for latest verification for pact_version	 ([d63081d8](https://github.com/pact-foundation/pact_broker/commit/d63081d8))
* do not allow the deployment of a provider version with no results when one of its consumers is already deployed (#486)	 ([219029c0](https://github.com/pact-foundation/pact_broker/commit/219029c0))
* add cache busting parameters to css and js links	 ([9cab749a](https://github.com/pact-foundation/pact_broker/commit/9cab749a))

* **can-i-deploy**
  * correctly construct options when environment is used in the can-i-deploy GET endpoint	 ([cb79a404](https://github.com/pact-foundation/pact_broker/commit/cb79a404))

<a name="v2.81.0"></a>

### v2.81.0 (2021-07-17)

#### Features

* enable environments, deployed versions and released versions endpoints without a feature toggle required	 ([84a59c10](https://github.com/pact-foundation/pact_broker/commit/84a59c10))
* add detailed debug logging for WIP pact calculations	 ([81290238](https://github.com/pact-foundation/pact_broker/commit/81290238))
* add debug level logging for WIP pacts calculations	 ([a7c16833](https://github.com/pact-foundation/pact_broker/commit/a7c16833))
* include deployed and released versions in index page when viewing latest tags	 ([655e9dd5](https://github.com/pact-foundation/pact_broker/commit/655e9dd5))
* add interactions counts to metrics endpoint	 ([c765afe1](https://github.com/pact-foundation/pact_broker/commit/c765afe1))
* automatically create a deployed version when a tag is created with the same name as an environment	 ([56a583af](https://github.com/pact-foundation/pact_broker/commit/56a583af))
* support viewing all versions for branch in matrix UI	 ([12f92951](https://github.com/pact-foundation/pact_broker/commit/12f92951))
* validate environment name in consumer version selector	 ([f1ad8f6b](https://github.com/pact-foundation/pact_broker/commit/f1ad8f6b))
* support the deployedOrReleased: true consumer version selector	 ([042a1612](https://github.com/pact-foundation/pact_broker/commit/042a1612))
* add interactions_count and messages_count to pact_versions table	 ([c17adbe6](https://github.com/pact-foundation/pact_broker/commit/c17adbe6))
* shorten length of metadata in pact URLs by using the consumer version id instead of number	 ([27b34bc9](https://github.com/pact-foundation/pact_broker/commit/27b34bc9))

#### Bug Fixes

* Display pagination correctly in index page with tag (#469)	 ([cda9c15e](https://github.com/pact-foundation/pact_broker/commit/cda9c15e))

<a name="v2.80.0"></a>

### v2.80.0 (2021-07-06)

#### Features

* filter pacticipant name on index page (#446)	 ([fd882da4](https://github.com/pact-foundation/pact_broker/commit/fd882da4))
* add uuid to webhook decorator	 ([3a916064](https://github.com/pact-foundation/pact_broker/commit/3a916064))
* add endpoint to list currently supported versions for an environment	 ([9608be8b](https://github.com/pact-foundation/pact_broker/commit/9608be8b))
* support marking a released version as unsupported	 ([f6c4ee27](https://github.com/pact-foundation/pact_broker/commit/f6c4ee27))
* add pactbroker.azureDevOpsVerificationStatus webhook parameter	 ([8804a90f](https://github.com/pact-foundation/pact_broker/commit/8804a90f))
* add deployed version resource, supporting marking deployed version as undeployed	 ([3dd19955](https://github.com/pact-foundation/pact_broker/commit/3dd19955))
* add warnings to can-i-deploy response when bad practice selectors are used	 ([85540c85](https://github.com/pact-foundation/pact_broker/commit/85540c85))
* support PATCH for pacticipant with application/merge-patch+json	 ([404e14cb](https://github.com/pact-foundation/pact_broker/commit/404e14cb))
* set main branch for pacticipant	 ([ab1cd016](https://github.com/pact-foundation/pact_broker/commit/ab1cd016))
* rename writeMode to onConflict for contract publishing endpoint	 ([26a4e358](https://github.com/pact-foundation/pact_broker/commit/26a4e358))
* replace mainDevelopmentBranches with mainBranch for pacticipant	 ([02d4525e](https://github.com/pact-foundation/pact_broker/commit/02d4525e))
* updating pending and wip logic to exclude pacts already verified by another branch before the specified branch was created (#432)	 ([db643d3c](https://github.com/pact-foundation/pact_broker/commit/db643d3c))
* ignore pacticipant for can i deploy (#429)	 ([25e62fd9](https://github.com/pact-foundation/pact_broker/commit/25e62fd9))
* add notices to contract publishing response, with intent to rem… (#430)	 ([dacbe906](https://github.com/pact-foundation/pact_broker/commit/dacbe906))
* support deployments and releases as separate concepts (#426)	 ([58d173db](https://github.com/pact-foundation/pact_broker/commit/58d173db))
* keep the triggered webhooks after the webhook has been deleted	 ([a5ab2a35](https://github.com/pact-foundation/pact_broker/commit/a5ab2a35))
* add endpoint to create pacts, pacticipant, version, tags in one request (#420)	 ([df899ebd](https://github.com/pact-foundation/pact_broker/commit/df899ebd))
* add pb:version relation to the pacticipant resource	 ([83ce38a4](https://github.com/pact-foundation/pact_broker/commit/83ce38a4))
* add repository and branch properties to pacticipant	 ([98a799b2](https://github.com/pact-foundation/pact_broker/commit/98a799b2))
* currently deployed selector (#396)	 ([8666d709](https://github.com/pact-foundation/pact_broker/commit/8666d709))
* add relations to environments endpoint for each environment	 ([784c3535](https://github.com/pact-foundation/pact_broker/commit/784c3535))
* allow multiple base URLs to be configured	 ([f88c69de](https://github.com/pact-foundation/pact_broker/commit/f88c69de))
* support recording deployments (#389)	 ([19ac1fcc](https://github.com/pact-foundation/pact_broker/commit/19ac1fcc))

* **pacts for verification**
  * support released:true selector (#451)	 ([8a90cc57](https://github.com/pact-foundation/pact_broker/commit/8a90cc57))
  * default latest to true when branch is specified and currentlyDeployed to true when an environment is specified	 ([984320b6](https://github.com/pact-foundation/pact_broker/commit/984320b6))
  * display selectors in a formatted list	 ([3cab7a00](https://github.com/pact-foundation/pact_broker/commit/3cab7a00))
  * update validation for consumer version selectors for the fields environment, currentlyDeployed and branch	 ([ec7dc435](https://github.com/pact-foundation/pact_broker/commit/ec7dc435))

* **webhooks**
  * support consumerVersionBranch and providerVersionBranch in the template parameters	 ([6637644f](https://github.com/pact-foundation/pact_broker/commit/6637644f))
  * support ${pactbroker.currentlyDeployedProviderVersionNumber} in webhook templates (#402)	 ([1e5487f8](https://github.com/pact-foundation/pact_broker/commit/1e5487f8))

* **matrix**
  * support querying by branch	 ([110578dc](https://github.com/pact-foundation/pact_broker/commit/110578dc))

* **pacticipant versions**
  * support use of PATCH with application/merge-patch+json to create versions	 ([0429398f](https://github.com/pact-foundation/pact_broker/commit/0429398f))
  * do not allow branch to be modified once set	 ([4aa8e121](https://github.com/pact-foundation/pact_broker/commit/4aa8e121))

* **record deployment**
  * require replacedPreviousDeployedVersion to be set	 ([70398069](https://github.com/pact-foundation/pact_broker/commit/70398069))

* **environments**
  * validate environment name in can-i-deploy and matrix queries	 ([dcad5fb5](https://github.com/pact-foundation/pact_broker/commit/dcad5fb5))
  * allow environments endpoint to be searched by name	 ([ce4b188e](https://github.com/pact-foundation/pact_broker/commit/ce4b188e))

* **deployed versions**
  * add endpoint to list deployed versions for an environment	 ([bd0ca9d6](https://github.com/pact-foundation/pact_broker/commit/bd0ca9d6))

#### Bug Fixes

* add rubocop and fix offenses (#441)	 ([7c1c3044](https://github.com/pact-foundation/pact_broker/commit/7c1c3044))
* gracefully handle an interactions value that is not an array	 ([a9a5df3d](https://github.com/pact-foundation/pact_broker/commit/a9a5df3d))
* Dockerfile to reduce vulnerabilities (#418)	 ([5319a997](https://github.com/pact-foundation/pact_broker/commit/5319a997))
* select pact publication with matching consumer version when triggering webhook for verification	 ([274e1456](https://github.com/pact-foundation/pact_broker/commit/274e1456))
* issue-reproduction/Dockerfile-pact-broker to reduce vulnerabilities (#414)	 ([34c70984](https://github.com/pact-foundation/pact_broker/commit/34c70984))
* use URL safe base64 encoding for pact metadata	 ([fa1a3333](https://github.com/pact-foundation/pact_broker/commit/fa1a3333))
* handle metadata that has had its padding removed	 ([06bd6d3d](https://github.com/pact-foundation/pact_broker/commit/06bd6d3d))
* lock reform gem	 ([00cbac8c](https://github.com/pact-foundation/pact_broker/commit/00cbac8c))
* fix missing verification status colours in matrix rows	 ([d91662d9](https://github.com/pact-foundation/pact_broker/commit/d91662d9))

* **verifications**
  * gracefully handle a verification number in the URL that is not an integer	 ([7fe98a7d](https://github.com/pact-foundation/pact_broker/commit/7fe98a7d))

* **ui**
  * Make long pacticipant versions look nice (#407)	 ([dbb967e3](https://github.com/pact-foundation/pact_broker/commit/dbb967e3))

<a name="v2.79.0"></a>

### v2.79.0 (2021-02-25)

#### Features

* allow multiple base URLs to be configured	 ([6d0dc8b3](https://github.com/pact-foundation/pact_broker/commit/6d0dc8b3))
* copy full git sha rather than abbreviated one when clicking the copy button next to an application version	 ([dae9cae5](https://github.com/pact-foundation/pact_broker/commit/dae9cae5))

#### Bug Fixes

* fix missing verification status colours in matrix rows	 ([687d4647](https://github.com/pact-foundation/pact_broker/commit/687d4647))

<a name="v2.78.1"></a>

### v2.78.1 (2021-02-18)

#### Bug Fixes

* handle nil response when determining webhook success status	 ([20ca9e66](https://github.com/pact-foundation/pact_broker/commit/20ca9e66))

<a name="v2.78.0"></a>

### v2.78.0 (2021-02-15)

#### Features

* support create, update and delete of environment resources (#379)	 ([410f2e80](https://github.com/pact-foundation/pact_broker/commit/410f2e80))
* allow version to be created with tags	 ([798afce9](https://github.com/pact-foundation/pact_broker/commit/798afce9))
* Follow up for #239 + adding list of success codes to SAVABLE_SETTING_NAMES variable (#388)	 ([08c0ad09](https://github.com/pact-foundation/pact_broker/commit/08c0ad09))

<a name="v2.77.0"></a>

### v2.77.0 (2021-02-11)

#### Features

* **webhooks**
  * allow the http codes to be considered as "successful" to be configured.	 ([a84989b1](https://github.com/pact-foundation/pact_broker/commit/a84989b1))

* add duplicate columns to tags table to reduce joins	 ([5ca9de62](https://github.com/pact-foundation/pact_broker/commit/5ca9de62))
* set the branch in the seed data	 ([9a00ce6d](https://github.com/pact-foundation/pact_broker/commit/9a00ce6d))
* display version branch on index and matrix pages	 ([2057df7d](https://github.com/pact-foundation/pact_broker/commit/2057df7d))
* support creating version with branch (#371)	 ([5884a047](https://github.com/pact-foundation/pact_broker/commit/5884a047))
* sort tags on index and matrix pages and APIs by creation date	 ([91590718](https://github.com/pact-foundation/pact_broker/commit/91590718))
* sort consumer version tags by date in dashboard response	 ([f82ba1bc](https://github.com/pact-foundation/pact_broker/commit/f82ba1bc))

<a name="v2.76.2"></a>

### v2.76.2 (2021-01-29)

#### Bug Fixes

* trigger one webhook for each pact publication that the verified content belongs to when using the 'pacts for verification' API (#378)	 ([114ccad0](https://github.com/pact-foundation/pact_broker/commit/114ccad0))

<a name="v2.76.1"></a>

### v2.76.1 (2021-01-28)

#### Bug Fixes

* deduplicate wip pacts by content	 ([0af90776](https://github.com/pact-foundation/pact_broker/commit/0af90776))
* message when pending pact is verified successfully for the first time (#376)	 ([4fc69190](https://github.com/pact-foundation/pact_broker/commit/4fc69190))
* use base URL from rack env in UI	 ([5bf21324](https://github.com/pact-foundation/pact_broker/commit/5bf21324))

<a name="v2.76.0"></a>

### v2.76.0 (2021-01-21)

#### Features

* **verification results**
  * redirect requests for verification results to the HAL browser if requested in a web browser	 ([0f948de5](https://github.com/pact-foundation/pact_broker/commit/0f948de5))

<a name="v2.75.0"></a>

### v2.75.0 (2021-01-18)

#### Features

* upgrade bootstrap (#370)	 ([a457c337](https://github.com/pact-foundation/pact_broker/commit/a457c337))
* add indexes to webhook_executions and triggered_webhooks tables	 ([b05e7dbe](https://github.com/pact-foundation/pact_broker/commit/b05e7dbe))

* **webhook**
  * set read and open timeouts	 ([8b502c44](https://github.com/pact-foundation/pact_broker/commit/8b502c44))

#### Bug Fixes

* **ui**
  * upgrade to jquery-3.5.1 to address vulnerabilities in jquery-3.3.1	 ([de41b231](https://github.com/pact-foundation/pact_broker/commit/de41b231))

* **deps**
  * upgrade redcarpet for CVE-2020-26298	 ([b57aad32](https://github.com/pact-foundation/pact_broker/commit/b57aad32))

<a name="v2.74.1"></a>

### v2.74.1 (2021-01-05)

#### Bug Fixes

* **deps**
  * remove manual specification for nokogiri now the fix for CVE-2020-26247 has been released in 1.11	 ([771378a9](https://github.com/pact-foundation/pact_broker/commit/771378a9))

<a name="v2.74.0"></a>

### v2.74.0 (2021-01-04)

#### Features

* include the consumer version selectors in the metadata of the 'pact for verification' URL	 ([32bbe1c3](https://github.com/pact-foundation/pact_broker/commit/32bbe1c3))

#### Bug Fixes

* **deps**
  * update nokogiri for CVE-2020-26247	 ([336ec897](https://github.com/pact-foundation/pact_broker/commit/336ec897))

<a name="v2.73.0"></a>

### v2.73.0 (2020-12-16)

#### Features

* **wip**
  * permenently enable feature that keeps pacts as WIP when verified via the URL from a webhook triggered by pact publication	 ([70071373](https://github.com/pact-foundation/pact_broker/commit/70071373))

* allow error causes to be configured to log at warning level	 ([3a7bf5ea](https://github.com/pact-foundation/pact_broker/commit/3a7bf5ea))
* add self relations for tags in matrix resource	 ([727cee99](https://github.com/pact-foundation/pact_broker/commit/727cee99))
* add self relation to tags in extended pact and verification resources	 ([a560ce6d](https://github.com/pact-foundation/pact_broker/commit/a560ce6d))

* **metrics**
  * timeout matrix count	 ([43091b57](https://github.com/pact-foundation/pact_broker/commit/43091b57))

#### Bug Fixes

* url encode tag name in tag URL	 ([80df832d](https://github.com/pact-foundation/pact_broker/commit/80df832d))

<a name="v2.72.0"></a>

### v2.72.0 (2020-12-02)

#### Features

* allow overwritten data deletion to be configured with extra options	 ([fd809737](https://github.com/pact-foundation/pact_broker/commit/fd809737))
* use the consumer version number in the metadata to select the correct consumer version for a pact version resource	 ([422c87fc](https://github.com/pact-foundation/pact_broker/commit/422c87fc))
* return link to latest pact if more pacts exist when deleting pacts by tag	 ([b87ea704](https://github.com/pact-foundation/pact_broker/commit/b87ea704))
* update output for clean dry run	 ([681a5ddd](https://github.com/pact-foundation/pact_broker/commit/681a5ddd))
* update metrics output	 ([0617e9df](https://github.com/pact-foundation/pact_broker/commit/0617e9df))

<a name="v2.71.0"></a>

### v2.71.0 (2020-11-28)

#### Features

* allow clean to be performed in dry run mode	 ([a7a18fde](https://github.com/pact-foundation/pact_broker/commit/a7a18fde))

<a name="v2.70.0"></a>

### v2.70.0 (2020-11-28)

#### Features

* allow limit to be applied to clean task	 ([d29e5c62](https://github.com/pact-foundation/pact_broker/commit/d29e5c62))
* optimise the query to load the tags with latest flags	 ([bc47613f](https://github.com/pact-foundation/pact_broker/commit/bc47613f))
* optimise query to find head tags for a pact	 ([67309e37](https://github.com/pact-foundation/pact_broker/commit/67309e37))

* **wip pacts**
  * experimental feature - if no provider versions exist, consider all head pacts wip	 ([a635cc53](https://github.com/pact-foundation/pact_broker/commit/a635cc53))

#### Bug Fixes

* return empty body when group csv is requested for a pacticipant that does not have any integrations	 ([fb4e28ce](https://github.com/pact-foundation/pact_broker/commit/fb4e28ce))

<a name="v2.69.0"></a>

### v2.69.0 (2020-11-24)

#### Features

* **wip**
  * keep pacts as WIP when verified via the pactUrl passed though the webhook template parameters - experimental.	 ([a9b3fef0](https://github.com/pact-foundation/pact_broker/commit/a9b3fef0))

* add link to the pact content version	 ([8eefba5f](https://github.com/pact-foundation/pact_broker/commit/8eefba5f))
* display V3 provider states in HTML (#357)	 ([8e06a7f2](https://github.com/pact-foundation/pact_broker/commit/8e06a7f2))
* optimise query for determining latest verification for consumer and provider	 ([7889b051](https://github.com/pact-foundation/pact_broker/commit/7889b051))

#### Bug Fixes

* return a 404 when the base pact for a pact diff doesn't exist	 ([74d3644d](https://github.com/pact-foundation/pact_broker/commit/74d3644d))
* Add consumer name to inclusion reason log (#358)	 ([82901891](https://github.com/pact-foundation/pact_broker/commit/82901891))

<a name="v2.68.1"></a>

### v2.68.1 (2020-10-24)

#### Bug Fixes

* set default User-Agent header in webhook requests	 ([caa71f9b](https://github.com/pact-foundation/pact_broker/commit/caa71f9b))

<a name="v2.68.0"></a>

### v2.68.0 (2020-10-23)

#### Features

* use a sequence for the version order on postgres	 ([da497a76](https://github.com/pact-foundation/pact_broker/commit/da497a76))
* only cascade apps for 404s (not 405s)	 ([4e1b3083](https://github.com/pact-foundation/pact_broker/commit/4e1b3083))
* use a sequence for the verification number on postgres	 ([b8f029ee](https://github.com/pact-foundation/pact_broker/commit/b8f029ee))
* optimise query to find latest verification for pact	 ([db17ef5a](https://github.com/pact-foundation/pact_broker/commit/db17ef5a))

<a name="v2.67.0"></a>

### v2.67.0 (2020-10-16)

#### Features

* **wip pacts**
  * if a pact was successfully verified because it was included as a WIP pact, keep it as WIP	 ([16cae55d](https://github.com/pact-foundation/pact_broker/commit/16cae55d))
  * add 'wip' column to verification results	 ([34f98592](https://github.com/pact-foundation/pact_broker/commit/34f98592))

#### Bug Fixes

* typo when rendering created webhook for old webhooks path	 ([1e6a06a0](https://github.com/pact-foundation/pact_broker/commit/1e6a06a0))
* include can-i-deploy badge in is_badge_path? logic	 ([31ea5f34](https://github.com/pact-foundation/pact_broker/commit/31ea5f34))

* **pacts for verification**
  * gracefully log empty request body	 ([0e48d13a](https://github.com/pact-foundation/pact_broker/commit/0e48d13a))

* **can-i-deploy**
  * gracefully handle pacticipant not found	 ([f6903b23](https://github.com/pact-foundation/pact_broker/commit/f6903b23))

<a name="v2.66.0"></a>

### v2.66.0 (2020-10-01)

#### Features

* paginate pacticipant versions	 ([f489ba7b](https://github.com/pact-foundation/pact_broker/commit/f489ba7b))

* **webhooks**
  * add event name to group by clause when selecting latest triggered webhooks	 ([134f12c8](https://github.com/pact-foundation/pact_broker/commit/134f12c8))

#### Bug Fixes

* maintain latest and tag params when submitting page after following link from can-i-deploy debug logs	 ([6e2f1a85](https://github.com/pact-foundation/pact_broker/commit/6e2f1a85))

<a name="v2.65.0"></a>

### v2.65.0 (2020-09-25)

#### Features

* **pacts for verification**
  * allow API to be disabled by setting PACT_BROKER_FEATURES=disable_pacts_for_verification	 ([bab116b3](https://github.com/pact-foundation/pact_broker/commit/bab116b3))
  * update wording for inclusion notice when selector has a consumer specified	 ([61370d1f](https://github.com/pact-foundation/pact_broker/commit/61370d1f))

<a name="v2.64.0"></a>

### v2.64.0 (2020-09-25)

#### Features

* add API endpoint for can-i-deploy for latest tagged pacticipant version	 ([88fdc60a](https://github.com/pact-foundation/pact_broker/commit/88fdc60a))
* render matrix UI page for can-i-deploy endpoint	 ([463e9cfd](https://github.com/pact-foundation/pact_broker/commit/463e9cfd))
* change text on can-i-deploy badge	 ([f9e183e9](https://github.com/pact-foundation/pact_broker/commit/f9e183e9))

<a name="v2.63.0"></a>

### v2.63.0 (2020-09-25)

#### Features

* allow label of can-i-deploy badge to be customised by setting the label query parameter	 ([ed544f94](https://github.com/pact-foundation/pact_broker/commit/ed544f94))
* add badges for can-i-deploy	 ([887a9ca3](https://github.com/pact-foundation/pact_broker/commit/887a9ca3))

<a name="v2.62.0"></a>

### v2.62.0 (2020-09-23)

#### Features

* **webhooks**
  * remove user-agent and accept-encoding headers which the Ruby HTTP library adds by default	 ([ef25b88c](https://github.com/pact-foundation/pact_broker/commit/ef25b88c))

* add event name to triggered webhook	 ([ecce16fd](https://github.com/pact-foundation/pact_broker/commit/ecce16fd))

#### Bug Fixes

* **webhooks**
  * use path to initialise http request, rather than full URL	 ([ecbac9a6](https://github.com/pact-foundation/pact_broker/commit/ecbac9a6))

* gracefully handle corrupt webhook metadata in pact URL	 ([ba94c355](https://github.com/pact-foundation/pact_broker/commit/ba94c355))

<a name="v2.61.0"></a>

### v2.61.0 (2020-09-12)

#### Features

* add back support for GET requests to the 'pacts for verification' API with a deprecation notice in the response	 ([8f45cc9f](https://github.com/pact-foundation/pact_broker/commit/8f45cc9f))

<a name="v2.60.1"></a>

### v2.60.1 (2020-09-10)

#### Bug Fixes

* href for beta:provider-pacts-for-verification	 ([3949fdd1](https://github.com/pact-foundation/pact_broker/commit/3949fdd1))

<a name="v2.60.0"></a>

### v2.60.0 (2020-09-08)

#### Features

* **pacts for verification**
  * add deprecation title to beta:provider-pacts-for-verification relation	 ([47a61f69](https://github.com/pact-foundation/pact_broker/commit/47a61f69))
  * do not require environment variable feature toggle to enable feature	 ([7d0fe1ea](https://github.com/pact-foundation/pact_broker/commit/7d0fe1ea))
  * allow consumer to be specified with fallback tags, and overall latest to be specified with or without a consumer	 ([2d52d173](https://github.com/pact-foundation/pact_broker/commit/2d52d173))

#### Bug Fixes

* correctly handle new test results format when merging test results with pact contents	 ([b35ab71b](https://github.com/pact-foundation/pact_broker/commit/b35ab71b))

<a name="v2.59.2"></a>

### v2.59.2 (2020-08-06)

#### Bug Fixes

* gracefully handle contracts without interactions or messages in deployment status warnings	 ([6c223e69](https://github.com/pact-foundation/pact_broker/commit/6c223e69))
* add missing info level log for business level errors	 ([80a895bf](https://github.com/pact-foundation/pact_broker/commit/80a895bf))

<a name="v2.59.1"></a>

### v2.59.1 (2020-08-04)

#### Bug Fixes

* fix error rendering relationships diagram when the number of index items is greater than one page	 ([93a19982](https://github.com/pact-foundation/pact_broker/commit/93a19982))

<a name="v2.59.0"></a>

### v2.59.0 (2020-07-30)

#### Features

* add timestamps to version resource	 ([818a0c2c](https://github.com/pact-foundation/pact_broker/commit/818a0c2c))

<a name="v2.58.3"></a>

### v2.58.3 (2020-07-25)

#### Bug Fixes

* correctly encode user entered data in attributes, Javascript, and HTML	 ([523980e2](https://github.com/pact-foundation/pact_broker/commit/523980e2))

<a name="v2.58.2"></a>

### v2.58.2 (2020-07-17)

#### Bug Fixes

* update CSP to allow badges to be loaded from shields.io	 ([a87e5274](https://github.com/pact-foundation/pact_broker/commit/a87e5274))
* add missing URL encoding in various URLs	 ([276094bc](https://github.com/pact-foundation/pact_broker/commit/276094bc))

<a name="v2.58.0"></a>

### v2.58.0 (2020-06-19)


#### Features

* log foreign key constraint errors as warn as 99% of the time they are transitory and unreproducible and should not cause alarms to be raised	 ([71fd0270](https://github.com/pact-foundation/pact_broker/commit/71fd0270))
* use structured logs for logging errors	 ([1e097b37](https://github.com/pact-foundation/pact_broker/commit/1e097b37))


#### Bug Fixes

* fix: update sanitize gem for CVE-2020-4054	 ([2af4bf9d](https://github.com/pact-foundation/pact_broker/commit/2af4bf9d))
* do not parse the provider version as a semantic version when order_versions_by_date is true	 ([bf30024f](https://github.com/pact-foundation/pact_broker/commit/bf30024f))


<a name="v2.57.0"></a>

### v2.57.0 (2020-06-16)


#### Features

* add Content Security Policy header	 ([fd2e81fb](https://github.com/pact-foundation/pact_broker/commit/fd2e81fb))


#### Bug Fixes

* upgrade Rack for vulnerability CVE-2020-8184	 ([99b78b3c](https://github.com/pact-foundation/pact_broker/commit/99b78b3c))
* fix Home link on pact page	 ([081d1586](https://github.com/pact-foundation/pact_broker/commit/081d1586))
* return a 422 if the URL path contains a new line or tab	 ([db9f7f4d](https://github.com/pact-foundation/pact_broker/commit/db9f7f4d))


<a name="v2.56.1"></a>

### v2.56.1 (2020-06-01)


#### Bug Fixes

* **matrix ui**
  * fix home link	 ([67065b7d](https://github.com/pact-foundation/pact_broker/commit/67065b7d))


<a name="v2.56.0"></a>

### v2.56.0 (2020-06-01)


#### Features

* **database**
  * log schema versions and migration info on startup	 ([b385e535](https://github.com/pact-foundation/pact_broker/commit/b385e535))
  * allow options to be passed to Sequel migrate via the MigrationTask	 ([143613e7](https://github.com/pact-foundation/pact_broker/commit/143613e7))

* allow Pactflow messages in logs to be hidden by setting PACT_BROKER_HIDE_PACTFLOW_MESSAGES=true	 ([a7550105](https://github.com/pact-foundation/pact_broker/commit/a7550105))

* **can-i-deploy**
  * experimental - add a warning message if there are interactions missing verification test results.	 ([f7ab8cc5](https://github.com/pact-foundation/pact_broker/commit/f7ab8cc5))


#### Bug Fixes

* use relative URLs when base_url not explictly set to ensure app is not vulnerable to host header attacks	 ([92c45a0a](https://github.com/pact-foundation/pact_broker/commit/92c45a0a))
* raise PactBroker::Error when either pacticipant is not found in the business layer while attempting to delete an integration	 ([3c209a46](https://github.com/pact-foundation/pact_broker/commit/3c209a46))


<a name="v2.55.0"></a>

### v2.55.0 (2020-05-22)


#### Features

* support non root context (#344)	 ([dc480499](https://github.com/pact-foundation/pact_broker/commit/dc480499))


<a name="v2.54.0"></a>

### v2.54.0 (2020-05-13)


#### Features

* **hal browser**
  * update to latest code	 ([a79ad290](https://github.com/pact-foundation/pact_broker/commit/a79ad290))


#### Bug Fixes

* update rack for CVE-2020-8161	 ([96c3386a](https://github.com/pact-foundation/pact_broker/commit/96c3386a))

* **hal browser**
  * fix xss vulnerability	 ([ac564412](https://github.com/pact-foundation/pact_broker/commit/ac564412))

* **webhooks**
  * add missing validation for event names when creating webhooks	 ([5fc0563c](https://github.com/pact-foundation/pact_broker/commit/5fc0563c))


<a name="v2.53.0"></a>

### v2.53.0 (2020-05-12)


#### Features

* **badge**
  * include tag names in matrix badge	 ([cce7cd01](https://github.com/pact-foundation/pact_broker/commit/cce7cd01))


#### Bug Fixes

* **pacts for verification**
  * ensure a separate pact URL is returned for each consumer when multiple consumers share the same pact json content	 ([13e7b640](https://github.com/pact-foundation/pact_broker/commit/13e7b640))

* gracefully handle fetching matrix badge when specified pact does not exist	 ([e8ec4101](https://github.com/pact-foundation/pact_broker/commit/e8ec4101))
* include the base URL in the link to the webhook docs	 ([5363ab2e](https://github.com/pact-foundation/pact_broker/commit/5363ab2e))


<a name="v2.52.2"></a>

### v2.52.2 (2020-04-16)


#### Bug Fixes

* pact URL in matrix page	 ([5ed046f1](https://github.com/pact-foundation/pact_broker/commit/5ed046f1))


<a name="v2.52.1"></a>

### v2.52.1 (2020-03-30)


#### Bug Fixes

* set consumer and provider to nil on the underlying webhook when they are not specified in the incoming webhook JSON	 ([f85b6ea2](https://github.com/pact-foundation/pact_broker/commit/f85b6ea2))


<a name="v2.52.0"></a>

### v2.52.0 (2020-03-25)


#### Features

* **pact ui**
  * update matrix URL to specify the latest provider version	 ([23b02c80](https://github.com/pact-foundation/pact_broker/commit/23b02c80))

* **matrix ui**
  * highlight rows with the same consumer/provider/consumer version/provider version	 ([99b36d50](https://github.com/pact-foundation/pact_broker/commit/99b36d50))

* **matrix**
  * speed up query for UI by reducing the number of joins and removing unncessary criteria (#332)	 ([9e5ea8be](https://github.com/pact-foundation/pact_broker/commit/9e5ea8be))

* **pacts for verification**
  * add validation to only allow consumer to be specified for 'all' versions for a tag	 ([b39ad193](https://github.com/pact-foundation/pact_broker/commit/b39ad193))
  * update inclusion messages to specify consumer name when selecting all pacts for a given consumer	 ([fdff0c58](https://github.com/pact-foundation/pact_broker/commit/fdff0c58))
  * support finding all pacts with a given tag for a specified consumer	 ([749e708d](https://github.com/pact-foundation/pact_broker/commit/749e708d))


#### Bug Fixes

* ensure requests for text/plain go to the API rather than the UI	 ([1cf28009](https://github.com/pact-foundation/pact_broker/commit/1cf28009))


<a name="v2.51.0"></a>

### v2.51.0 (2020-03-11)


#### Features

* **clean**
  * all the latest version for all tags to be kept	 ([9ff7bbec](https://github.com/pact-foundation/pact_broker/commit/9ff7bbec))
  * allow a maximum age to be specified for the versions to keep	 ([bc457492](https://github.com/pact-foundation/pact_broker/commit/bc457492))
  * support specifying which versions to keep using selectors	 ([a06899eb](https://github.com/pact-foundation/pact_broker/commit/a06899eb))


#### Bug Fixes

* set consumer and provider relationships when a webhook is created and consumer/provider are set in the body of the request rather than the URL	 ([5ccdd31c](https://github.com/pact-foundation/pact_broker/commit/5ccdd31c))
* sort matrix rows by last action date	 ([f625c9ad](https://github.com/pact-foundation/pact_broker/commit/f625c9ad))
* gracefully handle badge redirects when the pact is not found	 ([2da36574](https://github.com/pact-foundation/pact_broker/commit/2da36574))


<a name="v2.50.1"></a>

### v2.50.1 (2020-02-27)


#### Bug Fixes

* **webhooks**
  * make consumer_version_tags an array when creating metadata for latest [tagged] pact	 ([59b9e4c5](https://github.com/pact-foundation/pact_broker/commit/59b9e4c5))


<a name="v2.50.0"></a>

### v2.50.0 (2020-02-27)


#### Features

* **deps**
  * upgrade to pact-support 1.14.1	 ([47c23b7d](https://github.com/pact-foundation/pact_broker/commit/47c23b7d))

* **ui**
  * display repository URL on the pacticipant relationships page	 ([5d285e95](https://github.com/pact-foundation/pact_broker/commit/5d285e95))

* expose configuration option to allow missing migrations files on startup	 ([58dea9ab](https://github.com/pact-foundation/pact_broker/commit/58dea9ab))
* add rake task to clean overwritten pact publications and verifications	 ([942dfbd0](https://github.com/pact-foundation/pact_broker/commit/942dfbd0))
* include tag and consumer version number in metadata parameter of verification creation URL when verifying latest pact for a tag	 ([3b59e824](https://github.com/pact-foundation/pact_broker/commit/3b59e824))

* **pact**
  * add relation to view matrix rows for the consumer version	 ([13cb20b1](https://github.com/pact-foundation/pact_broker/commit/13cb20b1))


<a name="v2.49.0"></a>

### v2.49.0 (2020-02-13)


#### Features

* **webhooks**
  * support upsert of webhook via a PUT to /webhooks/{uuid}	 ([f9ba9ab5](https://github.com/pact-foundation/pact_broker/commit/f9ba9ab5))

* don't double parse the incoming JSON body when checking if it is invalid.	 ([bd74b82c](https://github.com/pact-foundation/pact_broker/commit/bd74b82c))
* support saving symbol configuration settings	 ([73db9c2b](https://github.com/pact-foundation/pact_broker/commit/73db9c2b))
* allow verification status badges to be served via a redirect instead of proxying the response	 ([a34d5f7f](https://github.com/pact-foundation/pact_broker/commit/a34d5f7f))


<a name="v2.48.0"></a>

### v2.48.0 (2020-02-07)


#### Features

* **pacts for verification**
  * include a short description of the pact's selectors in the response	 ([41c6d91f](https://github.com/pact-foundation/pact_broker/commit/41c6d91f))
  * update inclusion reason to support fallback tag explanation	 ([43081170](https://github.com/pact-foundation/pact_broker/commit/43081170))
  * allow a fallback tag to be specified	 ([113180c1](https://github.com/pact-foundation/pact_broker/commit/113180c1))
  * update the inclusion notice text to handle 'all pacts for tag'	 ([59ec8c8a](https://github.com/pact-foundation/pact_broker/commit/59ec8c8a))

* support DELETE for verification results	 ([70392e53](https://github.com/pact-foundation/pact_broker/commit/70392e53))


#### Bug Fixes

* a url typo (#328)	 ([482264fa](https://github.com/pact-foundation/pact_broker/commit/482264fa))
* correct URL of tag relation in pacticipant version resource	 ([ec24e999](https://github.com/pact-foundation/pact_broker/commit/ec24e999))


<a name="v2.47.1"></a>

### v2.47.1 (2020-02-01)


#### Bug Fixes

* ensure latest verification is loaded on pact object before executing webhook	 ([41eb25d8](https://github.com/pact-foundation/pact_broker/commit/41eb25d8))


<a name="v2.47.0"></a>

### v2.47.0 (2020-01-31)


#### Features

* include the webhook context in the execution logs	 ([29f65bef](https://github.com/pact-foundation/pact_broker/commit/29f65bef))


<a name="v2.46.0"></a>

### v2.46.0 (2020-01-30)


#### Features

* allow the base URL of the application to be set for the API	 ([73bd4c44](https://github.com/pact-foundation/pact_broker/commit/73bd4c44))
* correct logs relation to pb:logs in the triggered webhooks resource	 ([89ea1a58](https://github.com/pact-foundation/pact_broker/commit/89ea1a58))

* **pacts for verification**
  * add pre and post verification messages that can be displayed to the user based on whether or not the verification has passed or failed	 ([bb079858](https://github.com/pact-foundation/pact_broker/commit/bb079858))
  * allow all versions for a particular tag to be verified (eg. all prod versions of a mobile consumer)	 ([e16feef6](https://github.com/pact-foundation/pact_broker/commit/e16feef6))
  * optimise queries for determining which provider version tags are pending	 ([b4e1461a](https://github.com/pact-foundation/pact_broker/commit/b4e1461a))


#### Bug Fixes

* **pacts for verification**
  * set includePendingStatus to false by default	 ([9b3162ac](https://github.com/pact-foundation/pact_broker/commit/9b3162ac))


<a name="v2.45.0"></a>

### v2.45.0 (2020-01-30)


#### Features

* expose the data migrations code as a rake task	 ([00ee00d5](https://github.com/pact-foundation/pact_broker/commit/00ee00d5))

* **pacts for verification**
  * include URL of pact in inclusion message	 ([5a85a5a4](https://github.com/pact-foundation/pact_broker/commit/5a85a5a4))


#### Bug Fixes

* **can-i-deploy**
  * when multiple selectors are specified, do not infer integrations unless the "latest" or "tag" are specified	 ([c5819299](https://github.com/pact-foundation/pact_broker/commit/c5819299))


<a name="v2.44.0"></a>

### v2.44.0 (2020-01-22)


#### Features

* **matrix**
  * optimise query to determine integrations, again	 ([44e78ad2](https://github.com/pact-foundation/pact_broker/commit/44e78ad2))
  * add indexes to optimise queries	 ([cdc9aad7](https://github.com/pact-foundation/pact_broker/commit/cdc9aad7))
  * optimise query to determine integrations	 ([9e874f3b](https://github.com/pact-foundation/pact_broker/commit/9e874f3b))

* add hal relation for creating a tag on the pacticipant version resource	 ([dca0ad4f](https://github.com/pact-foundation/pact_broker/commit/dca0ad4f))


#### Bug Fixes

* update pact-support to fix bug caused by missing require	 ([416ecdf5](https://github.com/pact-foundation/pact_broker/commit/416ecdf5))
* correct logic for finding pacticipants by name when the name contains an underscore	 ([6d975ebe](https://github.com/pact-foundation/pact_broker/commit/6d975ebe))
* correct logic for finding pacticipants by name when the name contains an underscore	 ([2db59797](https://github.com/pact-foundation/pact_broker/commit/2db59797))

* **matrix**
  * correctly infer selectors when multiple selectors have been specified	 ([4288c282](https://github.com/pact-foundation/pact_broker/commit/4288c282))


<a name="v2.43.0"></a>

### v2.43.0 (2020-01-06)


#### Features

* support DELETE /integrations for deleting all integration related data at once (pacticipants, pacts, verifications and webhooks)	 ([d7e2ef27](https://github.com/pact-foundation/pact_broker/commit/d7e2ef27))
* optimise query to automatically determine integrations	 ([147cbfb6](https://github.com/pact-foundation/pact_broker/commit/147cbfb6))
* change badge timeout message from error to warning	 ([e34f5676](https://github.com/pact-foundation/pact_broker/commit/e34f5676))

* **matrix**
  * optimise the query that determines the integrations	 ([704944b6](https://github.com/pact-foundation/pact_broker/commit/704944b6))


#### Bug Fixes

* update rack for https://github.com/advisories/GHSA-hrqr-hxpp-chr3	 ([c9352fde](https://github.com/pact-foundation/pact_broker/commit/c9352fde))
* correctly identify missing verification for bi-directional pacts	 ([3577968a](https://github.com/pact-foundation/pact_broker/commit/3577968a))


<a name="v2.42.0"></a>

### v2.42.0 (2019-12-05)


#### Features

* **pacts for verification**
  * include list of notices to print rather than inclusionReason and pendingReason	 ([eed0120e](https://github.com/pact-foundation/pact_broker/commit/eed0120e))
  * only include WIP pacts that were published after the provider tag was first used	 ([673fcb8c](https://github.com/pact-foundation/pact_broker/commit/673fcb8c))

* **webhooks**
  * allow webhooks to be triggered for verification successes and failures	 ([6735da32](https://github.com/pact-foundation/pact_broker/commit/6735da32))


<a name="v2.41.0"></a>

### v2.41.0 (2019-11-21)


#### Features

* **pacts for verification**
  * make latest flag required and true for now, until the 'all pacts for tag' is implemented	 ([ebbbbec9](https://github.com/pact-foundation/pact_broker/commit/ebbbbec9))
  * include WIP pacts in list of pacts to verify	 ([04a0f40c](https://github.com/pact-foundation/pact_broker/commit/04a0f40c))
  * allow pending status information to be optionall included	 ([a80f2fd6](https://github.com/pact-foundation/pact_broker/commit/a80f2fd6))
  * support querying by POST	 ([5556b814](https://github.com/pact-foundation/pact_broker/commit/5556b814))

* **matrix**
  * show pact version SHA in popup text, and highlight pact publications with the same pact version	 ([0d539093](https://github.com/pact-foundation/pact_broker/commit/0d539093))
  * update 'pre-verifed' pop up text, and add icon to indicate when a pact is pre-verified	 ([a86010e5](https://github.com/pact-foundation/pact_broker/commit/a86010e5))
  * add tags to json response	 ([6d099f59](https://github.com/pact-foundation/pact_broker/commit/6d099f59))

* **example data**
  * include a pre-verified pact	 ([49fd5004](https://github.com/pact-foundation/pact_broker/commit/49fd5004))

* **index**
  * enable pagination feature	 ([9bb87eca](https://github.com/pact-foundation/pact_broker/commit/9bb87eca))
  * add pagination controls to the bottom of the page	 ([9d9e6378](https://github.com/pact-foundation/pact_broker/commit/9d9e6378))
  * optimise query, feature toggled	 ([e238749e](https://github.com/pact-foundation/pact_broker/commit/e238749e))
  * optimise server side rendered page	 ([1f54ccf4](https://github.com/pact-foundation/pact_broker/commit/1f54ccf4))

* **diagnostic**
  * remove before_resource and after_resource hook calls from diagnostics endpoints	 ([b1dac2bd](https://github.com/pact-foundation/pact_broker/commit/b1dac2bd))

* add missing super calls in BaseResource child classes	 ([1071ca8a](https://github.com/pact-foundation/pact_broker/commit/1071ca8a))
* optimise latest_verification_ids_for_consumer_version_tags	 ([9e84ce7d](https://github.com/pact-foundation/pact_broker/commit/9e84ce7d))
* optimise latest_pact_publications_by_consumer_versions	 ([86846271](https://github.com/pact-foundation/pact_broker/commit/86846271))
* optimise latest_pact_consumer_version_orders	 ([c4febeaa](https://github.com/pact-foundation/pact_broker/commit/c4febeaa))
* optimise latest_tagged_pact_consumer_version_orders view	 ([d92cb8f2](https://github.com/pact-foundation/pact_broker/commit/d92cb8f2))


<a name="v2.40.0"></a>

### v2.40.0 (2019-10-26)


#### Features

* **matrix**
  * default page to showing 'latest by consumer version and provider' as it is much quicker and less confusing.	 ([dd879250](https://github.com/pact-foundation/pact_broker/commit/dd879250))

* optimise query to find latest verification for consumer version tag	 ([301b30ca](https://github.com/pact-foundation/pact_broker/commit/301b30ca))

* **matrix badge**
  * optimise database query	 ([2b7f8e23](https://github.com/pact-foundation/pact_broker/commit/2b7f8e23))


#### Bug Fixes

* **matrix**
  * exceptions on matrix page due to recent query optimisation	 ([3c504ba5](https://github.com/pact-foundation/pact_broker/commit/3c504ba5))

* **frontend**
  * remove 'v' prefix on versions during render (#313)	 ([e109a8cd](https://github.com/pact-foundation/pact_broker/commit/e109a8cd))


<a name="v2.39.0"></a>

### v2.39.0 (2019-10-21)


#### Features

* **matrix**
  * optimise query for can-i-deploy, again	 ([78b8a5d5](https://github.com/pact-foundation/pact_broker/commit/78b8a5d5))
  * handle overwritten revisions in database rather than code	 ([1459b46a](https://github.com/pact-foundation/pact_broker/commit/1459b46a))

* **clean**
  * allow date to be specified for data to clean and return counts of deleted and kept rows	 ([29dcbacd](https://github.com/pact-foundation/pact_broker/commit/29dcbacd))

* update db clean to remove webhooks triggered by verifications	 ([f38eeaea](https://github.com/pact-foundation/pact_broker/commit/f38eeaea))
* add revisions per consumer version and verifications per pact version to metrics	 ([f764fbca](https://github.com/pact-foundation/pact_broker/commit/f764fbca))
* show more helpful error message when someone tries to get /all verifications for a pact	 ([bea59518](https://github.com/pact-foundation/pact_broker/commit/bea59518))
* add missing HAL docs for various relations and correct test that should have identified their absence	 ([a057427c](https://github.com/pact-foundation/pact_broker/commit/a057427c))
* add can-i-deploy endpoint to expose a simplified interface to the /matrix resource that accepts the same parameters as the can-i-deploy CLI.	 ([02443f39](https://github.com/pact-foundation/pact_broker/commit/02443f39))
* add 'pacts for verification' endpoint (#308)	 ([31fb8aa7](https://github.com/pact-foundation/pact_broker/commit/31fb8aa7))

* **metrics**
  * add revision count	 ([4369f227](https://github.com/pact-foundation/pact_broker/commit/4369f227))
  * add matrix and head matrix row counts	 ([5fb705ec](https://github.com/pact-foundation/pact_broker/commit/5fb705ec))

* **dashboard api**
  * eager load the pact_version	 ([b6b5c900](https://github.com/pact-foundation/pact_broker/commit/b6b5c900))

* **integrations**
  * sort by integration with most recent activity first	 ([35bdbb92](https://github.com/pact-foundation/pact_broker/commit/35bdbb92))
  * add verification status to integrations endpoint	 ([437ba769](https://github.com/pact-foundation/pact_broker/commit/437ba769))


#### Bug Fixes

* typos on ISSUE_TEMPLATE (#311)	 ([a10b4792](https://github.com/pact-foundation/pact_broker/commit/a10b4792))
* add endpoints to get latest verification for latest pact	 ([73413727](https://github.com/pact-foundation/pact_broker/commit/73413727))
* support application/vnd.pactbrokerextended.v1+json for latest pact resource	 ([476ff595](https://github.com/pact-foundation/pact_broker/commit/476ff595))

* **matrix**
  * undefined method	 ([b365c64b](https://github.com/pact-foundation/pact_broker/commit/b365c64b))

* **dashboard api**
  * remove expensive queries for unused data	 ([07206559](https://github.com/pact-foundation/pact_broker/commit/07206559))


<a name="v2.38.1"></a>

### v2.38.1 (2019-09-23)


#### Bug Fixes

* add missing require	 ([36500e04](https://github.com/pact-foundation/pact_broker/commit/36500e04))


<a name="v2.38.0"></a>

### v2.38.0 (2019-09-20)


#### Features

* add pactflow message to start up and error logs	 ([530dbfe9](https://github.com/pact-foundation/pact_broker/commit/530dbfe9))
* allow interaction ids to be manually set for test data	 ([4e256102](https://github.com/pact-foundation/pact_broker/commit/4e256102))

* **dashboard**
  * use 'refreshable' link for latest verification result so pact can be refreshed and display the latest result	 ([1ab8a5d9](https://github.com/pact-foundation/pact_broker/commit/1ab8a5d9))


#### Bug Fixes

* don't drop column from view in down step, because you can't remove a column from a view in posgres	 ([045f3f38](https://github.com/pact-foundation/pact_broker/commit/045f3f38))
* add test results to all verifications views	 ([9bc1eab1](https://github.com/pact-foundation/pact_broker/commit/9bc1eab1))


<a name="v2.37.0"></a>

### v2.37.0 (2019-09-02)


#### Bug Fixes

* delete triggered webhook data when deleting pacticipant version	 ([77265c30](https://github.com/pact-foundation/pact_broker/commit/77265c30))

* **index with tags**
  * sort pact publication by date, not string (#301)	 ([e92bde5f](https://github.com/pact-foundation/pact_broker/commit/e92bde5f))

* **index**
  * sort pact publication by date, not string	 ([75d35802](https://github.com/pact-foundation/pact_broker/commit/75d35802))


<a name="v2.36.1"></a>

### v2.36.1 (2019-08-30)


#### Bug Fixes

* do not show clipboard icon if version is blank (#297)	 ([36948fe1](https://github.com/pact-foundation/pact_broker/commit/36948fe1))


<a name="v2.36.0"></a>

### v2.36.0 (2019-08-30)


#### Features

* add resource to get latest verification for a pact	 ([f02a1ca0](https://github.com/pact-foundation/pact_broker/commit/f02a1ca0))
* add /metrics endpoint	 ([9bcbc1bd](https://github.com/pact-foundation/pact_broker/commit/9bcbc1bd))
* add tags to verification resource	 ([830632a2](https://github.com/pact-foundation/pact_broker/commit/830632a2))
* add content type to return pact with extra metadata (eg tags)	 ([76668639](https://github.com/pact-foundation/pact_broker/commit/76668639))
* remove use of 'stale' for dashboard resource	 ([e173f5cf](https://github.com/pact-foundation/pact_broker/commit/e173f5cf))


#### Bug Fixes

* pact broker client issue 53 (#299)	 ([aa27cef3](https://github.com/pact-foundation/pact_broker/commit/aa27cef3))
* version column resize when clipboard icon appears (#292)	 ([5aa668e9](https://github.com/pact-foundation/pact_broker/commit/5aa668e9))


<a name="v2.35.0"></a>

### v2.35.0 (2019-08-08)


#### Features

* **webhooks**
  * do not redact a password with a parameter in it	 ([47c602ef](https://github.com/pact-foundation/pact_broker/commit/47c602ef))
  * update parameter text	 ([7fa518cb](https://github.com/pact-foundation/pact_broker/commit/7fa518cb))
  * do not redact header if it contains a parameter	 ([5787e0d1](https://github.com/pact-foundation/pact_broker/commit/5787e0d1))
  * support template parameters in header values, username and password	 ([a800ac2e](https://github.com/pact-foundation/pact_broker/commit/a800ac2e))
  * simplify request logger format	 ([c52ade2f](https://github.com/pact-foundation/pact_broker/commit/c52ade2f))
  * add the logs and success flag to the execution result	 ([96769a88](https://github.com/pact-foundation/pact_broker/commit/96769a88))
  * allow testing of an unsaved webhook	 ([a436e42d](https://github.com/pact-foundation/pact_broker/commit/a436e42d))
  * gracefully handle scenario where triggered webhook has been deleted while webhook was being executed	 ([052055d4](https://github.com/pact-foundation/pact_broker/commit/052055d4))
  * use consumer/provider names in webhook title	 ([2b5d2498](https://github.com/pact-foundation/pact_broker/commit/2b5d2498))

* add copy to clipboard for version numbers (#283)	 ([c10a6f28](https://github.com/pact-foundation/pact_broker/commit/c10a6f28))
* update redact logs	 ([51aa13c0](https://github.com/pact-foundation/pact_broker/commit/51aa13c0))
* use hardcoded error message when error class has a nil message	 ([03a3b63c](https://github.com/pact-foundation/pact_broker/commit/03a3b63c))
* ensure clean up script handles pact versions for left over verifications	 ([116f8eaa](https://github.com/pact-foundation/pact_broker/commit/116f8eaa))
* added clean up sql script	 ([388b441e](https://github.com/pact-foundation/pact_broker/commit/388b441e))
* add Vary header to avoid browser returning the wrong cached content type for a resource	 ([6d30baa2](https://github.com/pact-foundation/pact_broker/commit/6d30baa2))
* change logging level from error to info for JSON parsing errors	 ([cc144062](https://github.com/pact-foundation/pact_broker/commit/cc144062))


#### Bug Fixes

* inefficient SQL loading latest verification for pact version	 ([301d9a58](https://github.com/pact-foundation/pact_broker/commit/301d9a58))

* **publish pacts**
  * handle race condition when creating pact version	 ([de0d3b7f](https://github.com/pact-foundation/pact_broker/commit/de0d3b7f))


<a name="v2.34.0"></a>

### v2.34.0 (2019-06-14)


#### Features

* **webhooks**
  * provide mapping to bitbucket build status names (#277)	 ([7bdf0c47](https://github.com/pact-foundation/pact_broker/commit/7bdf0c47))

* change log level for webhook triggering logs from debug to info	 ([2dca79c1](https://github.com/pact-foundation/pact_broker/commit/2dca79c1))


#### Bug Fixes

* gracefully handle two requests coming in at the same time to create the same pacticipant	 ([78d92ada](https://github.com/pact-foundation/pact_broker/commit/78d92ada))
* gracefully handle pact webhook status when there is no pact yet	 ([ba1f6bc7](https://github.com/pact-foundation/pact_broker/commit/ba1f6bc7))
* do not overwrite existing pactbroker.database_connector in rack env	 ([0da5d070](https://github.com/pact-foundation/pact_broker/commit/0da5d070))


<a name="v2.33.0"></a>

### v2.33.0 (2019-06-07)


#### Features

* add pb:pacticipant and pb:pacticipant-version-tag relations to the index resource	 ([2c4c258c](https://github.com/pact-foundation/pact_broker/commit/2c4c258c))


#### Bug Fixes

* correctly remove webhook consumer/provider when update params do not contain a consumer/provider	 ([118bbee1](https://github.com/pact-foundation/pact_broker/commit/118bbee1))
* duplicate key value violates unique constraint "cv_prov_revision_unq" error when publishing identical pact resources at the same time	 ([6c8e38fb](https://github.com/pact-foundation/pact_broker/commit/6c8e38fb))

* **matrix**
  * ensure unrelated dependencies are not included in a matrix result when three pacticipants each have dependencies on each other	 ([a086ffec](https://github.com/pact-foundation/pact_broker/commit/a086ffec))


<a name="v2.32.0"></a>

### v2.32.0 (2019-05-28)


#### Features

* **webhooks**
  * maintain starred out Authorization header value	 ([cc978582](https://github.com/pact-foundation/pact_broker/commit/cc978582))
  * don't use username if empty string	 ([9327271d](https://github.com/pact-foundation/pact_broker/commit/9327271d))
  * do not show backtrace in webhook test execution response	 ([c8a8194e](https://github.com/pact-foundation/pact_broker/commit/c8a8194e))
  * return a 200 status for webhook test execution response even when execution has failed	 ([d90c4552](https://github.com/pact-foundation/pact_broker/commit/d90c4552))
  * do not require basic auth password to be re-submitted when a webhook is updated - maintain existing value if not present	 ([55d7f4ad](https://github.com/pact-foundation/pact_broker/commit/55d7f4ad))
  * allow description to be edited	 ([302d70f6](https://github.com/pact-foundation/pact_broker/commit/302d70f6))
  * only trigger enabled webhooks	 ([cb2b0321](https://github.com/pact-foundation/pact_broker/commit/cb2b0321))
  * add enabled column to model and database schema	 ([ce452ec8](https://github.com/pact-foundation/pact_broker/commit/ce452ec8))

* add metadata to webhook and verification URLs to correctly track relevant versions and tags (#274)	 ([426b0b19](https://github.com/pact-foundation/pact_broker/commit/426b0b19))
* add group url to /integrations _links	 ([e2584f53](https://github.com/pact-foundation/pact_broker/commit/e2584f53))
* add matrix URL to /integration _links	 ([344d3e18](https://github.com/pact-foundation/pact_broker/commit/344d3e18))
* allow dashboard resource to be filtered by consumer/provider	 ([a2408520](https://github.com/pact-foundation/pact_broker/commit/a2408520))
* add hal+json endpoint for listing integrations	 ([40f3e021](https://github.com/pact-foundation/pact_broker/commit/40f3e021))
* allow a custom API to be configured	 ([1c371163](https://github.com/pact-foundation/pact_broker/commit/1c371163))

* **webhook**
  * show user specified description instead of generated one in collection resource	 ([2643d957](https://github.com/pact-foundation/pact_broker/commit/2643d957))

* **matrix**
  * do not default to latestby=cvpv for consumer/provider matrix	 ([742d506c](https://github.com/pact-foundation/pact_broker/commit/742d506c))


#### Bug Fixes

* **webhooks**
  * correctly set updated consumer and provider	 ([d865a429](https://github.com/pact-foundation/pact_broker/commit/d865a429))

* default matrix limit for /matrix/provider/PROVIDER/consumer/CONSUMER endpoint to 100	 ([7ccc9b6f](https://github.com/pact-foundation/pact_broker/commit/7ccc9b6f))
* gracefully handle situation where webhook is deleted before execution	 ([634ccd53](https://github.com/pact-foundation/pact_broker/commit/634ccd53))
* duplicate key value violates unique constraint uq_ver_ppt_ord	 ([4303e4f7](https://github.com/pact-foundation/pact_broker/commit/4303e4f7))


<a name="v2.31.0"></a>

### v2.31.0 (2019-04-30)


#### Features

* display times in UTC in API responses	 ([a4231117](https://github.com/pact-foundation/pact_broker/commit/a4231117))
* log the reason why a webhook has been triggered	 ([30522c0d](https://github.com/pact-foundation/pact_broker/commit/30522c0d))
* add _ids to interactions added via the TestDataBuilder	 ([d21e7092](https://github.com/pact-foundation/pact_broker/commit/d21e7092))
* update names of example apps	 ([2b2a3f81](https://github.com/pact-foundation/pact_broker/commit/2b2a3f81))
* ignore order of keys when generating interaction sha	 ([e6a0e8d8](https://github.com/pact-foundation/pact_broker/commit/e6a0e8d8))
* use _id instead of id for the interaction identifier	 ([010a14ab](https://github.com/pact-foundation/pact_broker/commit/010a14ab))
* add ids to interactions when pacts are published	 ([cd377850](https://github.com/pact-foundation/pact_broker/commit/cd377850))
* remove whitespace from pact content when saving to database	 ([1f53682e](https://github.com/pact-foundation/pact_broker/commit/1f53682e))
* monkeypatch webmachine to make the rack env available on the request	 ([40be97db](https://github.com/pact-foundation/pact_broker/commit/40be97db))
* ensure index page is not cached	 ([0cfa9bbf](https://github.com/pact-foundation/pact_broker/commit/0cfa9bbf))
* correct provider state matching for merging	 ([41ff6e5d](https://github.com/pact-foundation/pact_broker/commit/41ff6e5d))
* only seed example data when database is empty	 ([0f2d00a6](https://github.com/pact-foundation/pact_broker/commit/0f2d00a6))
* seed app with example data on first startup	 ([cf27ad8c](https://github.com/pact-foundation/pact_broker/commit/cf27ad8c))
* batch delete versions and tags using delete instead of destroy for efficiency	 ([1315e0b1](https://github.com/pact-foundation/pact_broker/commit/1315e0b1))
* allow pact to be deleted through the UI	 ([df0f35cb](https://github.com/pact-foundation/pact_broker/commit/df0f35cb))
* upgrade bootstrap	 ([1be9f1b2](https://github.com/pact-foundation/pact_broker/commit/1be9f1b2))
* allow an integration to be deleted via the UI	 ([f520520e](https://github.com/pact-foundation/pact_broker/commit/f520520e))
* add delete integration which deletes all objects pertaining to an integration that are not referenced by other objects	 ([718f0218](https://github.com/pact-foundation/pact_broker/commit/718f0218))
* simplify the logic that determines if the request is for the UI or the API	 ([73ae0fc2](https://github.com/pact-foundation/pact_broker/commit/73ae0fc2))
* change pact rendering log message from warn to info	 ([93229103](https://github.com/pact-foundation/pact_broker/commit/93229103))
* upgrade jquery version to 3.3.1	 ([82b830cf](https://github.com/pact-foundation/pact_broker/commit/82b830cf))

* **dashboard**
  * sort items by most recent activity	 ([f6f8fb20](https://github.com/pact-foundation/pact_broker/commit/f6f8fb20))

* **index**
  * add button to delete all pact versions	 ([b5d15d5d](https://github.com/pact-foundation/pact_broker/commit/b5d15d5d))


#### Bug Fixes

* ensure datetime tests run correctly regardless of timezone	 ([0506be30](https://github.com/pact-foundation/pact_broker/commit/0506be30))
* correct logic for filtering ui/api requests	 ([725c6ccb](https://github.com/pact-foundation/pact_broker/commit/725c6ccb))
* ensure that the templating in the webhook body uses the correct base URL for the broker	 ([3d5a5380](https://github.com/pact-foundation/pact_broker/commit/3d5a5380))
* handle deleting integration when consumer and provider are the same pacticipant	 ([f31e8df2](https://github.com/pact-foundation/pact_broker/commit/f31e8df2))
* correct tbody in show-with-tags index page	 ([325a98ed](https://github.com/pact-foundation/pact_broker/commit/325a98ed))
* delete overwritten pact publications when deleting all pact publications between a consumer and provider	 ([5456eda5](https://github.com/pact-foundation/pact_broker/commit/5456eda5))
* escape html on index pages	 ([6ee34afe](https://github.com/pact-foundation/pact_broker/commit/6ee34afe))
* sanitize html in matrix	 ([c4d74d87](https://github.com/pact-foundation/pact_broker/commit/c4d74d87))
* sanitize fields when rendering pact html	 ([dca76506](https://github.com/pact-foundation/pact_broker/commit/dca76506))

* **readme**
  * Change gitter link to slack. + Minor typo	 ([6b1c7843](https://github.com/pact-foundation/pact_broker/commit/6b1c7843))


<a name="v2.30.0"></a>

### v2.30.0 (2019-03-29)


#### Features

* add helper text on index page for getting started	 ([cdeb2cd9](https://github.com/pact-foundation/pact_broker/commit/cdeb2cd9))
* allow rack protection to be turned off so that the headers can be managed in nginx	 ([941371ec](https://github.com/pact-foundation/pact_broker/commit/941371ec))
* allow all pacts between a given consumer and provider to be deleted at once	 ([9f1ce9c3](https://github.com/pact-foundation/pact_broker/commit/9f1ce9c3))
* correctly identify javascript and css content types	 ([6470d199](https://github.com/pact-foundation/pact_broker/commit/6470d199))
* add .css and .js file extensions to middleware that sets the accept header	 ([eb1cd323](https://github.com/pact-foundation/pact_broker/commit/eb1cd323))
* add helper text on index page for getting started	 ([222d8965](https://github.com/pact-foundation/pact_broker/commit/222d8965))
* allow rack protection to be turned off so that the headers can be managed in nginx	 ([b43e60ee](https://github.com/pact-foundation/pact_broker/commit/b43e60ee))
* allow all pacts between a given consumer and provider to be deleted at once	 ([0c8106b6](https://github.com/pact-foundation/pact_broker/commit/0c8106b6))
* correctly identify javascript and css content types	 ([03e156cb](https://github.com/pact-foundation/pact_broker/commit/03e156cb))
* add .css and .js file extensions to middleware that sets the accept header	 ([2aa533dc](https://github.com/pact-foundation/pact_broker/commit/2aa533dc))
* add a new webhook event for contract_published	 ([2e2a2034](https://github.com/pact-foundation/pact_broker/commit/2e2a2034))

* **matrix**
  * improve reasons in response when pacticipant cannot be deployed	 ([85e11616](https://github.com/pact-foundation/pact_broker/commit/85e11616))
  * allow provider to be deployed to an environment without the consumer having to be deployed there already	 ([125c2722](https://github.com/pact-foundation/pact_broker/commit/125c2722))


<a name="v2.29.0"></a>

### v2.29.0 (2019-03-15)


#### Features

* **matrix**
  * improve reasons in response when pacticipant cannot be deployed	 ([e96544f6](https://github.com/pact-foundation/pact_broker/commit/e96544f6))
  * allow provider to be deployed to an environment without the consumer having to be deployed there already	 ([475a4010](https://github.com/pact-foundation/pact_broker/commit/475a4010))

* change webhook execution failure log to info	 ([7238bc49](https://github.com/pact-foundation/pact_broker/commit/7238bc49))
* remove db/pact_broker_database.sqlite3 so we don't have conflicts in fork	 ([f68fce8b](https://github.com/pact-foundation/pact_broker/commit/f68fce8b))
* change error logs to info logs	 ([700f6992](https://github.com/pact-foundation/pact_broker/commit/700f6992))
* lock dry-logic to version that works	 ([28769040](https://github.com/pact-foundation/pact_broker/commit/28769040))
* allow a custom UI to be configured	 ([23695b08](https://github.com/pact-foundation/pact_broker/commit/23695b08))


#### Bug Fixes

* gracefully handle race conditions when publishing a new revision of a pact	 ([012c54f0](https://github.com/pact-foundation/pact_broker/commit/012c54f0))


<a name="v2.28.0"></a>

### v2.28.0 (2019-01-15)


#### Features

* enable file list in gemspec to work without git	 ([6dd27e26](https://github.com/pact-foundation/pact_broker/commit/6dd27e26))
* allow the database connection to be configured for async jobs	 ([6a745d4b](https://github.com/pact-foundation/pact_broker/commit/6a745d4b))
* add error reference to API error response and ensure potentially sensitive details from the exception message are not exposed	 ([e7bb4a01](https://github.com/pact-foundation/pact_broker/commit/e7bb4a01))


#### Bug Fixes

* show consumer/provider/global webhooks in webhook column on index page	 ([35f8bfc1](https://github.com/pact-foundation/pact_broker/commit/35f8bfc1))


<a name="v2.27.6"></a>

### v2.27.6 (2018-11-23)


#### Bug Fixes

* URL encode consumer version number in pact URL	 ([b58f4fbf](https://github.com/pact-foundation/pact_broker/commit/b58f4fbf))


<a name="v2.27.5"></a>

### v2.27.5 (2018-11-15)


#### Bug Fixes

* handle race conditions when creating a pacticipant on postgres	 ([2c83985f](https://github.com/pact-foundation/pact_broker/commit/2c83985f))
* ensure latest version of rack is used to avoid vulnerability CVE-2018-16471	 ([996953f8](https://github.com/pact-foundation/pact_broker/commit/996953f8))


<a name="v2.27.4"></a>

### v2.27.4 (2018-11-15)


#### Bug Fixes

* handle race conditions when creating a pacticipant	 ([b3799670](https://github.com/pact-foundation/pact_broker/commit/b3799670))
* correct order of arguments for merging pacts	 ([f6cfb197](https://github.com/pact-foundation/pact_broker/commit/f6cfb197))


<a name="v2.27.3"></a>

### v2.27.3 (2018-11-01)


#### Features

* add LogQuietener to example config.ru	 ([2f014f07](https://github.com/pact-foundation/pact_broker/commit/2f014f07))
* Rename database logger delegate to LogQuietener	 ([34f44bcb](https://github.com/pact-foundation/pact_broker/commit/34f44bcb))
* create delegate for database logger to tone down the 'table does not exist' errors that freak people out at startup	 ([573d204b](https://github.com/pact-foundation/pact_broker/commit/573d204b))

* **semantic-logging**
  * set logger for SuckerPunch and tests	 ([201eb331](https://github.com/pact-foundation/pact_broker/commit/201eb331))
  * allow ruby standard logger to be configured to ensure backwards compatibility	 ([cfbb704c](https://github.com/pact-foundation/pact_broker/commit/cfbb704c))

* **tagged-pact-versions**
  * ensure triggered webhooks are deleted when pact versions are deleted	 ([288475f1](https://github.com/pact-foundation/pact_broker/commit/288475f1))
  * add endpoint to view and delete a collection of pact versions by tag	 ([615025e9](https://github.com/pact-foundation/pact_broker/commit/615025e9))

* **logging**
  * implement structured logging	 ([a9133bd5](https://github.com/pact-foundation/pact_broker/commit/a9133bd5))


#### Bug Fixes

* correct foreign key between AllPactPublications and PactVersion	 ([59f76c74](https://github.com/pact-foundation/pact_broker/commit/59f76c74))
* ensure bundle install for pact_broker:dev:setup uses correct Gemfile	 ([94f3a5f2](https://github.com/pact-foundation/pact_broker/commit/94f3a5f2))
* Fix some invalid HTML	 ([0c9a08a8](https://github.com/pact-foundation/pact_broker/commit/0c9a08a8))

* **openssl**
  * simplify certificate test for latest LibreSSL/OpenSSL libs	 ([cce79390](https://github.com/pact-foundation/pact_broker/commit/cce79390))


<a name="v2.27.2"></a>

### v2.27.2 (2018-09-14)


#### Features

* use application/yaml instead of application/x-yaml to match Swaggerhub	 ([067d6ac7](https://github.com/pact-foundation/pact_broker/commit/067d6ac7))
* treat .yaml requests as having header Accept: application/x-yaml	 ([1c8e199f](https://github.com/pact-foundation/pact_broker/commit/1c8e199f))

* **webhook whitelist**
  * allow hosts to be whitelisted using * domains	 ([150858a1](https://github.com/pact-foundation/pact_broker/commit/150858a1))


#### Bug Fixes

* **content-type**
  * convert 404 content-type to application/hal+json #235	 ([83958db7](https://github.com/pact-foundation/pact_broker/commit/83958db7))


<a name="v2.27.0"></a>

### v2.27.0 (2018-09-07)


#### Features

* add ${pactbroker.consumerLabels} and ${pactbroker.providerLabels} to webhook templates	 ([afebbc5a](https://github.com/pact-foundation/pact_broker/commit/afebbc5a))


<a name="v2.26.1"></a>

### v2.26.1 (2018-09-07)


#### Features

* allow integrations to be exported in dot format (text/vnd.graphviz)	 ([ac609081](https://github.com/pact-foundation/pact_broker/commit/ac609081))
* eager load latest version for /pacticipants resource	 ([9ac2ba9b](https://github.com/pact-foundation/pact_broker/commit/9ac2ba9b))
* eager load pacticipant labels for /pacticipants resource	 ([01dd8669](https://github.com/pact-foundation/pact_broker/commit/01dd8669))


#### Bug Fixes

* **matrix**
  * gracefully handle and log when version is unresolved	 ([82fe19f1](https://github.com/pact-foundation/pact_broker/commit/82fe19f1))

* gracefully handle attempt to create a duplicate tag	 ([53bea8b4](https://github.com/pact-foundation/pact_broker/commit/53bea8b4))
* correct :false to false in verification decorator to correctly handle read only property providerName	 ([4af4ed1c](https://github.com/pact-foundation/pact_broker/commit/4af4ed1c))
* gracefully handle scenario where URL supplied in JSON body is not a String	 ([b0bb6044](https://github.com/pact-foundation/pact_broker/commit/b0bb6044))


<a name="v2.26.0"></a>

### v2.26.0 (2018-08-23)


#### Features

* change default value of base_equality_only_on_content_that_affects_verification_results to true	 ([615f0c90](https://github.com/pact-foundation/pact_broker/commit/615f0c90))
* renamed 'wip pacts' to 'pending pacts'	 ([11a56b5c](https://github.com/pact-foundation/pact_broker/commit/11a56b5c))


<a name="v2.25.0"></a>

### v2.25.0 (2018-08-09)


#### Features

* make contract_content_changed tag aware	 ([8e7d0e47](https://github.com/pact-foundation/pact_broker/commit/8e7d0e47))
* move "latest id" upsert logic into own class	 ([360d236f](https://github.com/pact-foundation/pact_broker/commit/360d236f))
* replace latest_verifications view with latest_verifications_for_provider_versions	 ([ee4fef99](https://github.com/pact-foundation/pact_broker/commit/ee4fef99))
* sort tags in text/plain version of /dashboard	 ([0a821490](https://github.com/pact-foundation/pact_broker/commit/0a821490))
* optimise data migrations that set pacticipant ids	 ([9a148b80](https://github.com/pact-foundation/pact_broker/commit/9a148b80))
* add pact_version_id to latest_pact_publication_ids table	 ([627ce6db](https://github.com/pact-foundation/pact_broker/commit/627ce6db))
* optimise query for loading latest verification for the latest pacts for each tag on index page	 ([8bc58442](https://github.com/pact-foundation/pact_broker/commit/8bc58442))
* add consumer_id to pact_publications table	 ([d520e228](https://github.com/pact-foundation/pact_broker/commit/d520e228))
* add consumer id and provider id to verifications table to speed up queries	 ([d5698901](https://github.com/pact-foundation/pact_broker/commit/d5698901))
* run data migrations on startup to ensure data created by old nodes is migrated when performing a rolling update	 ([ec59ba5b](https://github.com/pact-foundation/pact_broker/commit/ec59ba5b))
* move migrations on feature branch to run last	 ([78d31c49](https://github.com/pact-foundation/pact_broker/commit/78d31c49))
* remove refresh of materialized_matrix and materialized_head_matrix	 ([262af756](https://github.com/pact-foundation/pact_broker/commit/262af756))
* keep track of the latest verification for a pact version for each provider version, rather than calculating it	 ([110495a9](https://github.com/pact-foundation/pact_broker/commit/110495a9))
* store latest pact publication ids for each consumer version	 ([d239bfdf](https://github.com/pact-foundation/pact_broker/commit/d239bfdf))
* keep track of latest pact revision in table rather than calculating it	 ([e9cd9e1b](https://github.com/pact-foundation/pact_broker/commit/e9cd9e1b))
* move pb:wip-provider-pacts to beta:wip-provider-pacts	 ([3008140a](https://github.com/pact-foundation/pact_broker/commit/3008140a))
* make feature toggles case insensitive and space aware	 ([f4a03c0c](https://github.com/pact-foundation/pact_broker/commit/f4a03c0c))
* add feature toggle via environment variable PACT_BROKER_FEATURES	 ([f0737b97](https://github.com/pact-foundation/pact_broker/commit/f0737b97))
* keep track of the latest verification for a pact version for each provider version, rather than calculating it	 ([b4f18770](https://github.com/pact-foundation/pact_broker/commit/b4f18770))
* store latest pact publication ids for each consumer version	 ([c8fa5545](https://github.com/pact-foundation/pact_broker/commit/c8fa5545))
* keep track of latest pact revision in table rather than calculating it	 ([1db5b7ba](https://github.com/pact-foundation/pact_broker/commit/1db5b7ba))

* **index**
  * eager load latest verification for consumer and provider	 ([1bf61afc](https://github.com/pact-foundation/pact_broker/commit/1bf61afc))


#### Bug Fixes

* **index page**
  * correct pact URL when showing index with tags	 ([a5bda98f](https://github.com/pact-foundation/pact_broker/commit/a5bda98f))


<a name="v2.24.0"></a>

### v2.24.0 (2018-07-08)


#### Features

* disable wip-provider-pacts in production until the feature is passed alpha testing	 ([3f9a1c7](https://github.com/pact-foundation/pact_broker/commit/3f9a1c7))
* allow HAL docs to specify a context so that two relations with the same name in different resources don't clash	 ([fe85b0b](https://github.com/pact-foundation/pact_broker/commit/fe85b0b))
* add pb:diff relation to pact resource to view a diff with an arbitrary pact version	 ([3eaa79c](https://github.com/pact-foundation/pact_broker/commit/3eaa79c))
* add HAL documentation for the relations that were missing documentation	 ([6b04d70](https://github.com/pact-foundation/pact_broker/commit/6b04d70))
* add resource for "work in progress" pacts for a provider	 ([50c003b](https://github.com/pact-foundation/pact_broker/commit/50c003b))
* deprecate pacts relation in favour of pb:pacts in latest pacts resource	 ([ccdd46f](https://github.com/pact-foundation/pact_broker/commit/ccdd46f))
* add bash script to migrate pacts from one broker to another	 ([7d587d9](https://github.com/pact-foundation/pact_broker/commit/7d587d9))


<a name="v2.23.4"></a>

### v2.23.4 (2018-07-04)


#### Features

* deprecate provider relation in provider pacts resource in preference for pb:provider	 ([eda8cbf](https://github.com/pact-foundation/pact_broker/commit/eda8cbf))


#### Bug Fixes

* correct the logic for determining the deployment status in the matrix resource	 ([ad85db4](https://github.com/pact-foundation/pact_broker/commit/ad85db4))
* delete associated verification results when a pacticipant version is deleted	 ([ddec810](https://github.com/pact-foundation/pact_broker/commit/ddec810))


<a name="v2.23.3"></a>

### v2.23.3 (2018-06-27)


#### Bug Fixes

* add missing require in triggered_webhooks_decorator.rb	 ([c4adeaf](https://github.com/pact-foundation/pact_broker/commit/c4adeaf))


<a name="v2.23.2"></a>

### v2.23.2 (2018-06-25)


#### Bug Fixes

* ensure configured webhook headers are used when making request	 ([50c876f](https://github.com/pact-foundation/pact_broker/commit/50c876f))


<a name="v2.23.1"></a>

### v2.23.1 (2018-06-23)


#### Features

* respond correctly to OPTIONS requests	 ([c5d3937](https://github.com/pact-foundation/pact_broker/commit/c5d3937))


#### Bug Fixes

* add missing require to pact_triggered_webhooks	 ([aaf1755](https://github.com/pact-foundation/pact_broker/commit/aaf1755))


<a name="v2.23.0"></a>

### v2.23.0 (2018-06-20)


#### Features

* include test webhook request in execution response body	 ([7518098](https://github.com/pact-foundation/pact_broker/commit/7518098))
* use the latest matching pact or verification to test webhook execution, or a placeholder if either is not found	 ([273078b](https://github.com/pact-foundation/pact_broker/commit/273078b))
* add resource to view the triggered webhooks for a verification result	 ([c3e8df0](https://github.com/pact-foundation/pact_broker/commit/c3e8df0))
* add resource to view the triggered webhooks for a pact publication	 ([00f60c1](https://github.com/pact-foundation/pact_broker/commit/00f60c1))
* allow "global" webhooks (matching all consumers and providers) to be triggered by pact or verification publication	 ([19f7060](https://github.com/pact-foundation/pact_broker/commit/19f7060))
* allow webhook with optional consumer and/or provider to be created by posting to /webhooks	 ([b15ba85](https://github.com/pact-foundation/pact_broker/commit/b15ba85))
* add consumer and provider objects to webhook resource	 ([e60460e](https://github.com/pact-foundation/pact_broker/commit/e60460e))
* move $.message to $.error.message in error response body	 ([803c025](https://github.com/pact-foundation/pact_broker/commit/803c025))
* only show backtrace in error response for non production environments	 ([665ac23](https://github.com/pact-foundation/pact_broker/commit/665ac23))
* change version ordering to sort by date by default	 ([6552b46](https://github.com/pact-foundation/pact_broker/commit/6552b46))
* raise explicit error if a matrix query is done for a version with a tag that does not exist	 ([8f64288](https://github.com/pact-foundation/pact_broker/commit/8f64288))

* **consumer or provider webhooks**
  * refactor webhooks resource classes and add consumer and provider webhook links to pact resource	 ([9321c73](https://github.com/pact-foundation/pact_broker/commit/9321c73))
  * change pact webhook status URL	 ([2445b1e](https://github.com/pact-foundation/pact_broker/commit/2445b1e))
  * allow a webhook to be defined for either a consumer OR provider	 ([37a62be](https://github.com/pact-foundation/pact_broker/commit/37a62be))


#### Bug Fixes

* ensure non utf-8 characters in the webook response do not cause an error in the Pact Broker response body	 ([a5ae5bf](https://github.com/pact-foundation/pact_broker/commit/a5ae5bf))
* update sintra to >= 2.0.2 to fix css vulnerability	 ([3023408](https://github.com/pact-foundation/pact_broker/commit/3023408))


<a name="v2.22.0"></a>

### v2.22.0 (2018-06-11)


#### Features

* allow whitelist configurations to be loaded from database	 ([19cb83f](https://github.com/pact-foundation/pact_broker/commit/19cb83f))


<a name="v2.21.0"></a>

### v2.21.0 (2018-06-10)


#### Features

* add ${pactbroker.consumerVersionTags} and ${pactbroker.providerVersionTags} to webhook templates	 ([e5121b1](https://github.com/pact-foundation/pact_broker/commit/e5121b1))
* add ${pactbroker.verificationResultUrl} to webhook templates	 ([e19c9c9](https://github.com/pact-foundation/pact_broker/commit/e19c9c9))
* redact potentially sensitive headers in the webhook resource	 ([619c7e9](https://github.com/pact-foundation/pact_broker/commit/619c7e9))
* add ${pactbroker.githubVerificationStatus} to webhook templates	 ([abccf7a](https://github.com/pact-foundation/pact_broker/commit/abccf7a))
* add ${pactbroker.providerVersionNumber} to webhook templates	 ([86bc1ec](https://github.com/pact-foundation/pact_broker/commit/86bc1ec))


#### Bug Fixes

* correctly trigger contract_content_changed webhooks when first version of a pact is published	 ([73a06ff](https://github.com/pact-foundation/pact_broker/commit/73a06ff))
* correctly handle template parameters in URL when rendering webhook resource	 ([a4b69db](https://github.com/pact-foundation/pact_broker/commit/a4b69db))
* correct call to execute webhooks when pact changes	 ([076afe6](https://github.com/pact-foundation/pact_broker/commit/076afe6))
* ensure webhook hosts cannot contain templated parameters	 ([fe05919](https://github.com/pact-foundation/pact_broker/commit/fe05919))
* allow pact broker template parameter in URL	 ([c91d04e](https://github.com/pact-foundation/pact_broker/commit/c91d04e))
* correct logic for showing webhook response bodies in logs when a whitelist is configured	 ([db2f9d1](https://github.com/pact-foundation/pact_broker/commit/db2f9d1))


<a name="v2.20.0"></a>

### v2.20.0 (2018-06-03)


#### Features

* only log webhook response details when a webhook host whitelist has been configured	 ([3e1c562](https://github.com/pact-foundation/pact_broker/commit/3e1c562))
* validate webhook host against configurable list on creation	 ([077e37f](https://github.com/pact-foundation/pact_broker/commit/077e37f))
* validate webhook scheme and http method against configurable lists on creation	 ([d7a2b0a](https://github.com/pact-foundation/pact_broker/commit/d7a2b0a))
* add ${pactbroker.consumerVersionNumber} to webhook templates	 ([d525527](https://github.com/pact-foundation/pact_broker/commit/d525527))


#### Bug Fixes

* correct all content types that were application/json to application/hal+json	 ([690e39b](https://github.com/pact-foundation/pact_broker/commit/690e39b))


<a name="v2.19.2"></a>

### v2.19.2 (2018-05-29)


#### Features

* load latest verification for consumer/provider via relationship rather than repository	 ([13b7c6e](https://github.com/pact-foundation/pact_broker/commit/13b7c6e))
* include more columns in latest_verifications_for_consumer_version_tags to avoid having to do extra queries for pact_versions and provider_versions	 ([e366af4](https://github.com/pact-foundation/pact_broker/commit/e366af4))
* optimise queries for index page with tags	 ([524e08d](https://github.com/pact-foundation/pact_broker/commit/524e08d))
* create view for latest verifications for consumer version tags	 ([eb67511](https://github.com/pact-foundation/pact_broker/commit/eb67511))
* log pact content as debug instead of info when publishing	 ([d116157](https://github.com/pact-foundation/pact_broker/commit/d116157))
* allow pact equality to be based only on the content that affects verification results	 ([bf8130f](https://github.com/pact-foundation/pact_broker/commit/bf8130f))


#### Bug Fixes

* temporarily redact webhook response body from UI for security purposes	 ([becf20c](https://github.com/pact-foundation/pact_broker/commit/becf20c))
* handle race condition causing unique constraint violation when creating pacticipant versions	 ([6c75ebd](https://github.com/pact-foundation/pact_broker/commit/6c75ebd))


<a name="v2.19.1"></a>

### v2.19.1 (2018-05-18)


#### Features

* rename relations in pact diff view	 ([8c3c62e](https://github.com/pact-foundation/pact_broker/commit/8c3c62e))


#### Bug Fixes

* add pact name back into title of deprecated pacts relation of provider pacts resource	 ([f5f002a](https://github.com/pact-foundation/pact_broker/commit/f5f002a))
* set correct content type for verification result resources	 ([c177fdd](https://github.com/pact-foundation/pact_broker/commit/c177fdd))


<a name="v2.19.0"></a>

### v2.19.0 (2018-05-03)


#### Features

* create endpoint to compare arbitrary pact versions, ignoring interaction/message order	 ([15f0688](https://github.com/pact-foundation/pact_broker/commit/15f0688))
* add endpoint to retrieve a pact version by its pact content sha	 ([a519731](https://github.com/pact-foundation/pact_broker/commit/a519731))
* include pact revision number and verification number in badge svg comment	 ([82b59ef](https://github.com/pact-foundation/pact_broker/commit/82b59ef))
* add pb:version-tag relation to pacticipant resource	 ([0704772](https://github.com/pact-foundation/pact_broker/commit/0704772))
* create endpoints for retrieving all pact versions for a provider, with and without a tag.	 ([d7011b2](https://github.com/pact-foundation/pact_broker/commit/d7011b2))
* update matrix UI to allow _all_ versions with a particular tag to be specified	 ([278b3ea](https://github.com/pact-foundation/pact_broker/commit/278b3ea))
* allow matrix to be queried for _all_ versions with a given tag	 ([cac3023](https://github.com/pact-foundation/pact_broker/commit/cac3023))


#### Bug Fixes

* correct logic for finding latest verification for revised pacts	 ([8fb28ee](https://github.com/pact-foundation/pact_broker/commit/8fb28ee))
* do not invoke error reporters for validation errors	 ([57eed65](https://github.com/pact-foundation/pact_broker/commit/57eed65))


<a name="v2.18.0"></a>

### v2.18.0 (2018-04-05)


#### Features

* add link to matrix from HTML pact page	 ([f9e3c23](https://github.com/pact-foundation/pact_broker/commit/f9e3c23))
* sort tags in dashboard API response	 ([d2fd090](https://github.com/pact-foundation/pact_broker/commit/d2fd090))
* add rake task to clean unused data to improve performance	 ([fc705a2](https://github.com/pact-foundation/pact_broker/commit/fc705a2))


#### Bug Fixes

* show JSON view when *any* error occurs creating the HTML view for a pact.	 ([e4342f0](https://github.com/pact-foundation/pact_broker/commit/e4342f0))
* only show verification matrix number when verification is present	 ([766f7c0](https://github.com/pact-foundation/pact_broker/commit/766f7c0))
* correctly display interaction with nil description in HTML view	 ([56528d3](https://github.com/pact-foundation/pact_broker/commit/56528d3))


<a name="v2.17.1"></a>

### v2.17.1 (2018-03-30)


#### Bug Fixes

* refresh matrix and head_matrix tables	 ([bf36c61](https://github.com/pact-foundation/pact_broker/commit/bf36c61))


<a name="v2.17.0"></a>

### v2.17.0 (2018-03-30)


#### Features

* ensure migrations in optimise_head_matrix work on mysql	 ([35874a9](https://github.com/pact-foundation/pact_broker/commit/35874a9))
* show verification number in matrix when viewing all results	 ([5693430](https://github.com/pact-foundation/pact_broker/commit/5693430))
* redact auth headers from rack env used to report errors	 ([94f8f13](https://github.com/pact-foundation/pact_broker/commit/94f8f13))
* add api error reporters	 ([579fa39](https://github.com/pact-foundation/pact_broker/commit/579fa39))
* log debug message when loading configuration setting from database	 ([9ffcc1a](https://github.com/pact-foundation/pact_broker/commit/9ffcc1a))
* optimise head matrix refresh when adding or deleting tags	 ([263c2a4](https://github.com/pact-foundation/pact_broker/commit/263c2a4))
* disable sinatra dump_errors	 ([d59c7e5](https://github.com/pact-foundation/pact_broker/commit/d59c7e5))
* send padrino logs to a file in the log dir by default	 ([7408be0](https://github.com/pact-foundation/pact_broker/commit/7408be0))

* **matrix ui**
  * add tooltip explaining the situation when verification date is before pact publication date	 ([fd6e1c9](https://github.com/pact-foundation/pact_broker/commit/fd6e1c9))
  * change default to show all results	 ([f7bea07](https://github.com/pact-foundation/pact_broker/commit/f7bea07))


#### Bug Fixes

* ensure publishing a verification does not cause a unique constraint violation	 ([ecfb385](https://github.com/pact-foundation/pact_broker/commit/ecfb385))
* optimize matrix query to speed up lengthy pact publication times	 ([e09d528](https://github.com/pact-foundation/pact_broker/commit/e09d528))
* ensure matrix is updated when pacticipant is deleted	 ([6c11cbe](https://github.com/pact-foundation/pact_broker/commit/6c11cbe))
* delete pacticipant labels before deleting pacticipant	 ([18b9b7e](https://github.com/pact-foundation/pact_broker/commit/18b9b7e))


<a name="v2.16.1"></a>

### v2.16.1 (2018-03-08)


#### Features

* turn off sinatra show_exceptions when rack_env is production	 ([e961afe](https://github.com/pact-foundation/pact_broker/commit/e961afe))
* add error testing endpoints	 ([4e01407](https://github.com/pact-foundation/pact_broker/commit/4e01407))


<a name="v2.16.0"></a>

### v2.16.0 (2018-03-05)

#### Features

* upgrade haml to 5.0	 ([4415686](https://github.com/pact-foundation/pact_broker/commit/4415686))
* upgrade sequel to 5.6	 ([a37c59a](https://github.com/pact-foundation/pact_broker/commit/a37c59a))
* abbreviate git shas in index and matrix UIs	 ([9a21e10](https://github.com/pact-foundation/pact_broker/commit/9a21e10))
* add latest provider version tag names to dashboard UI	 ([de179d7](https://github.com/pact-foundation/pact_broker/commit/de179d7))
* created dashboard API	 ([044bab7](https://github.com/pact-foundation/pact_broker/commit/044bab7))

* **matrix**
  * make index refresh happen synchronously to prevent data corruption	 ([acd64e6](https://github.com/pact-foundation/pact_broker/commit/acd64e6))
  * speed up query to refresh index	 ([011d7c9](https://github.com/pact-foundation/pact_broker/commit/011d7c9))
  * refresh head matrix asynchronously to speed up pact publishing and tagging	 ([989e6e3](https://github.com/pact-foundation/pact_broker/commit/989e6e3))
  * speed up matrix query for latestby=cvpv and latestby=cvp	 ([6ae039d](https://github.com/pact-foundation/pact_broker/commit/6ae039d))

* **index**
  * sort verifications by execution date	 ([2523982](https://github.com/pact-foundation/pact_broker/commit/2523982))
  * show tag names as slugs	 ([117c89b](https://github.com/pact-foundation/pact_broker/commit/117c89b))

* **matrix ui**
  * rename "rows" to "results"	 ([2023265](https://github.com/pact-foundation/pact_broker/commit/2023265))
  * show row count	 ([b50bd9a](https://github.com/pact-foundation/pact_broker/commit/b50bd9a))
  * remove logic for hiding links until I can get it right	 ([107fca2](https://github.com/pact-foundation/pact_broker/commit/107fca2))
  * correct logic for hiding pact links	 ([825af6d](https://github.com/pact-foundation/pact_broker/commit/825af6d))
  * don't show potentially confusing links for overwritten pact revisions	 ([ed7498a](https://github.com/pact-foundation/pact_broker/commit/ed7498a))
  * add links to all resources referenced in matrix	 ([2958ae8](https://github.com/pact-foundation/pact_broker/commit/2958ae8))
  * add tags	 ([869d49d](https://github.com/pact-foundation/pact_broker/commit/869d49d))

* **dashboard api**
  * correct latest verification results	 ([d02ea24](https://github.com/pact-foundation/pact_broker/commit/d02ea24))
  * fix query for displaying dashboard with tags	 ([924aaae](https://github.com/pact-foundation/pact_broker/commit/924aaae))
  * optimise dashboard query by creating manual materialized views for the matrix	 ([494f553](https://github.com/pact-foundation/pact_broker/commit/494f553))
  * add plain text content type for easy debugging	 ([317a64d](https://github.com/pact-foundation/pact_broker/commit/317a64d))
  * speed up loading of verification tags	 ([a3aea48](https://github.com/pact-foundation/pact_broker/commit/a3aea48))
  * include verification tags	 ([e8d0fae](https://github.com/pact-foundation/pact_broker/commit/e8d0fae))
  * add pact tags	 ([0c79440](https://github.com/pact-foundation/pact_broker/commit/0c79440))

#### Bug Fixes

* **matrix**
  * correct logic for selecting matrix rows on MySQL	 ([06f6dd4](https://github.com/pact-foundation/pact_broker/commit/06f6dd4))
  * ensure matrix for latest consumer version/provider version shows correct results when a pact is published, published again for the same version with different content, then published again for the same version with the original content.	 ([679eec1](https://github.com/pact-foundation/pact_broker/commit/679eec1))

* **matrix ui**
  * fix provider version sorting	 ([611ab7e](https://github.com/pact-foundation/pact_broker/commit/611ab7e))

<a name="v2.15.0"></a>

### v2.15.0 (2018-02-26)

#### Features

* upgrade to latest versions of padrino-core and sinatra to fix CVE-2018-7212	 ([08ba1cb](https://github.com/pact-foundation/pact_broker/commit/08ba1cb))

* **http**
  * set http options globally	 ([cdf36ba](https://github.com/pact-foundation/pact_broker/commit/cdf36ba))

* **ssl**
  * allow single certificates to be uploaded	 ([9417f10](https://github.com/pact-foundation/pact_broker/commit/9417f10))

<a name="v2.14.0"></a>

### v2.14.0 (2018-02-15)

#### Features

* **matrix ui**
  * add home link	 ([3f74e7e](https://github.com/pact-foundation/pact_broker/commit/3f74e7e))

* **index**
  * add link to show/hide latest tags	 ([412a2d3](https://github.com/pact-foundation/pact_broker/commit/412a2d3))

* change URL for retrieving latest version so that it does not clash with a version called "latest"	 ([8e45062](https://github.com/pact-foundation/pact_broker/commit/8e45062))
* add endpoints to get latest pacticipant version and latest tagged version	 ([aa60a85](https://github.com/pact-foundation/pact_broker/commit/aa60a85))
* elegantly handle long service names in index.	 ([ad8da50](https://github.com/pact-foundation/pact_broker/commit/ad8da50))

#### Bug Fixes

* return overwritten pact publication as latest if non exists as a latest version when rendering verification	 ([8217209](https://github.com/pact-foundation/pact_broker/commit/8217209))
* #184 Escape username before asigning it to URI userinfo attribute	 ([81bb779](https://github.com/pact-foundation/pact_broker/commit/81bb779))
* remove non UTF-8 chars from webhook response bodies before saving the logs to the (UTF-8 encoded) database table	 ([0ee5b0b](https://github.com/pact-foundation/pact_broker/commit/0ee5b0b))
* ensure webhook dependencies are saved before executing	 ([9a89d07](https://github.com/pact-foundation/pact_broker/commit/9a89d07))

* **matrix badge**
  * correct status of pact when consumer and provider version tags are specified	 ([0eb7429](https://github.com/pact-foundation/pact_broker/commit/0eb7429))

<a name="v2.13.1"></a>

### v2.13.1 (2018-01-12)

#### Features

* remove runtime dependency on webrick	 ([1ae7a6e](https://github.com/pact-foundation/pact_broker/commit/1ae7a6e))

<a name="v2.13.0"></a>

### v2.13.0 (2018-01-11)

#### Features

* ensure latest pact version is returned when searching by pact version sha	 ([1d2adc6](https://github.com/pact-foundation/pact_broker/commit/1d2adc6))
* rename 'pact_publication' trigger type to 'publication'	 ([9fe0ff0](https://github.com/pact-foundation/pact_broker/commit/9fe0ff0))

* **certificates**
  * load webhook certificates from database	 ([c72ab28](https://github.com/pact-foundation/pact_broker/commit/c72ab28))

* **matrix ui**
  * add checkbox for latest version	 ([7743ecc](https://github.com/pact-foundation/pact_broker/commit/7743ecc))
  * add limit and latestby to form	 ([c4136bd](https://github.com/pact-foundation/pact_broker/commit/c4136bd))
  * do not log validation errors	 ([f201d1d](https://github.com/pact-foundation/pact_broker/commit/f201d1d))
  * add form	 ([cbf0837](https://github.com/pact-foundation/pact_broker/commit/cbf0837))

* **matrix badges**
  * add badge for provider/tag and consumer/tag	 ([d69c8e6](https://github.com/pact-foundation/pact_broker/commit/d69c8e6))

* **verification webhooks**
  * update hal browser documentation	 ([c2b31b4](https://github.com/pact-foundation/pact_broker/commit/c2b31b4))
  * invoke verification webhooks on publication of verification	 ([04ed1cc](https://github.com/pact-foundation/pact_broker/commit/04ed1cc))
  * alter logic to select only the relevant webhooks when the pact has changed	 ([ec18943](https://github.com/pact-foundation/pact_broker/commit/ec18943))
  * default to contract changed event when no events specified, for backwards compatibility	 ([9fe8d47](https://github.com/pact-foundation/pact_broker/commit/9fe8d47))
  * add events to webhooks to allow differentiation between pact and verification webhooks	 ([356c023](https://github.com/pact-foundation/pact_broker/commit/356c023))

* **publish test result**
  * allow json test results to be published with the verification result	 ([528034c](https://github.com/pact-foundation/pact_broker/commit/528034c))

#### Bug Fixes

* create selector objects when viewing matrix URL with consumer and provider	 ([e733bae](https://github.com/pact-foundation/pact_broker/commit/e733bae))

<a name="v2.12.0"></a>

### v2.12.0 (2017-11-29)

#### Features
* changed date published to time ago in words, with full date as mouseover (#145) ([b28f9c3](https://github.com/pact-foundation/pact_broker/commit/b28f9c3))

#### Bug Fixes

* fixed issue that caused uninitialized constant PactBroker::Api::Resources::BaseResource (NameError) when running pact_broker with passenger..	 ([0b21a62](https://github.com/pact-foundation/pact_broker/commit/0b21a62))

<a name="v2.10.0"></a>

### v2.10.0 (2017-11-11)

#### Features

* **prod pacts in index**
  * allow all tags to be shown on index	 ([0a1f0ee](https://github.com/pact-foundation/pact_broker/commit/0a1f0ee))
  * allow tags shown in index to be configured via query string	 ([4eca8ee](https://github.com/pact-foundation/pact_broker/commit/4eca8ee))
  * show pacts tagged as the 'prod' or 'production' versions on the index page	 ([b58b7a3](https://github.com/pact-foundation/pact_broker/commit/b58b7a3))

* **index page**
  * truncate git shas in table	 ([94da4c7](https://github.com/pact-foundation/pact_broker/commit/94da4c7))

<a name="v2.9.0"></a>

### v2.9.0 (2017-11-09)

#### Features

* **webhook templating**
  * add support for ${pactbroker.pactUrl} in query and body	 ([0eed596](https://github.com/pact-foundation/pact_broker/commit/0eed596))

* **matrix** _(note that the matrix resource is still in beta, and there may be breaking changes in the future)_
  * allow query to determine if a particular pacticipant version is compatible with the latest tagged versions of all its dependencies	 ([ba4a1cc](https://github.com/pact-foundation/pact_broker/commit/ba4a1cc))

<a name="v2.8.0.beta.5"></a>

### v2.8.0.beta.5 (2017-11-06)

#### Features

* **matrix**
  * fix matrix data types for MySQL	 ([42c5478](https://github.com/pact-foundation/pact_broker/commit/42c5478))
  * improve reason when no results are found	 ([473abbe](https://github.com/pact-foundation/pact_broker/commit/473abbe))
  * change groupby param to latestby	 ([a6a8ba2](https://github.com/pact-foundation/pact_broker/commit/a6a8ba2))
  * ensure correct row is returned when a pact is revised, then verified	 ([7f37644](https://github.com/pact-foundation/pact_broker/commit/7f37644))
  * return most recent rows first	 ([cfa2109](https://github.com/pact-foundation/pact_broker/commit/cfa2109))
  * allow a limit to be specified	 ([2a11334](https://github.com/pact-foundation/pact_broker/commit/2a11334))
  * return most recent rows first	 ([e896b7b](https://github.com/pact-foundation/pact_broker/commit/e896b7b))
  * use views to create matrix query	 ([8488212](https://github.com/pact-foundation/pact_broker/commit/8488212))
  * add matrix view	 ([852324a](https://github.com/pact-foundation/pact_broker/commit/852324a))

<a name="v2.8.0.beta.4"></a>

### v2.8.0.beta.4 (2017-11-03)

#### Bug Fixes

* add missing require	 ([14d7d02](https://github.com/pact-foundation/pact_broker/commit/14d7d02))

<a name="v2.7.0.beta.3"></a>

### v2.7.0.beta.3 (2017-11-01)

#### Features

* **matrix**
  * implement querying by latest without a tag	 ([3d78f79](https://github.com/pact-foundation/pact_broker/commit/3d78f79))
  * update query to handle tag and latest flag	 ([c5c800f](https://github.com/pact-foundation/pact_broker/commit/c5c800f))
  * update validation of selectors to allow tag and latest flag to be specified	 ([0fa33f1](https://github.com/pact-foundation/pact_broker/commit/0fa33f1))
  * parse latest=true and tag=TAG in matrix query	 ([abcab9e](https://github.com/pact-foundation/pact_broker/commit/abcab9e))
  * update validation to allow latest tag to be specified	 ([6da6e02](https://github.com/pact-foundation/pact_broker/commit/6da6e02))
  * allow version to be specified by latest_tag	 ([fe498a7](https://github.com/pact-foundation/pact_broker/commit/fe498a7))

* **pacticipant**
  * expose repositoryUrl in resource	 ([8f0f16a](https://github.com/pact-foundation/pact_broker/commit/8f0f16a))

#### Bug Fixes

* correct captialization in require	 ([db2e676](https://github.com/pact-foundation/pact_broker/commit/db2e676))

<a name="v2.7.0.beta.2"></a>

### v2.7.0.beta.2 (2017-10-31)

#### Features

* **matrix**
  * add reason text to summary	 ([f979210](https://github.com/pact-foundation/pact_broker/commit/f979210))
  * add text/plain content type for easier visualisation of matrix resource in terminal	 ([bab7720](https://github.com/pact-foundation/pact_broker/commit/bab7720))
  * allow matrix rows to be returned for all versions of a pacticipant	 ([6d37545](https://github.com/pact-foundation/pact_broker/commit/6d37545))
  * allow multiple verification statuses to be queried for using status[]=	 ([fba2771](https://github.com/pact-foundation/pact_broker/commit/fba2771))
  * allow success param to be specified in query params	 ([2fb5817](https://github.com/pact-foundation/pact_broker/commit/2fb5817))
  * change query params for matrix to use q[][pacticipant]=? and q[][version]=?	 ([e3913f7](https://github.com/pact-foundation/pact_broker/commit/e3913f7))
  * return failure and success lines in matrix response, and a summary indicating whether the specified versions are compatible or not	 ([8783ef8](https://github.com/pact-foundation/pact_broker/commit/8783ef8))
  * add method to find all matrix lines for a list of versions, regardless of verification status	 ([52755fd](https://github.com/pact-foundation/pact_broker/commit/52755fd))
  * add pact publication and verification dates to response	 ([f0cc32b](https://github.com/pact-foundation/pact_broker/commit/f0cc32b))
  * add validation errors to matrix resource	 ([7f91710](https://github.com/pact-foundation/pact_broker/commit/7f91710))
  * allow matrix columns to be sorted	 ([7d22eb8](https://github.com/pact-foundation/pact_broker/commit/7d22eb8))
  * add simple ui	 ([36f9480](https://github.com/pact-foundation/pact_broker/commit/36f9480))
  * add endpoint for consumer/provider verification matrix	 ([6925dcb](https://github.com/pact-foundation/pact_broker/commit/6925dcb))

* rename 'hal browser' links to 'api browser'	 ([11d3464](https://github.com/pact-foundation/pact_broker/commit/11d3464))
* use timestamp migrator during app startup	 ([a87f393](https://github.com/pact-foundation/pact_broker/commit/a87f393))
* convert paths ending in .json to Accept: application/hal+json	 ([d81f129](https://github.com/pact-foundation/pact_broker/commit/d81f129))

* **auth**
  * cascade UI before diagnostic api and broker api	 ([1b95461](https://github.com/pact-foundation/pact_broker/commit/1b95461))

* **verifications**
  * create and link provider version resource when verification is published	 ([3014a8b](https://github.com/pact-foundation/pact_broker/commit/3014a8b))

#### Bug Fixes

* show webhook status as not_run when all triggered webhooks are not_run	 ([2d014b2](https://github.com/pact-foundation/pact_broker/commit/2d014b2))

<a name="v2.7.0.beta.1"></a>

### v2.7.0.beta.1 (2017-10-16)

#### Features

* **prod pacts in index**
  * show pacts tagged as the 'prod' or 'production' versions on the index page	 ([b58b7a3](https://github.com/pact-foundation/pact_broker/commit/b58b7a3))

<a name="v2.6.0"></a>

### v2.6.0 (2017-10-06)

#### Features

* add configuration option for check_for_potential_duplicate_pacticipant_names	 ([6ab3fda](https://github.com/pact-foundation/pact_broker/commit/6ab3fda))

#### Bug Fixes

* add webhook_retry_schedule and semver_formats to list of configuration options that can be saved to the database	 ([5bab062](https://github.com/pact-foundation/pact_broker/commit/5bab062))
* delete related triggered webhooks when webhook is deleted	 ([48f9853](https://github.com/pact-foundation/pact_broker/commit/48f9853))
* use strict mode when using mysql	 ([f991e15](https://github.com/pact-foundation/pact_broker/commit/f991e15))

<a name="v2.5.1"></a>

### v2.5.1 (2017-09-26)

#### Bug Fixes

* **badges**
  * do not allow caching	 ([d7e73c3](https://github.com/pact-foundation/pact_broker/commit/d7e73c3))

<a name="v2.5.0"></a>

### v2.5.0 (2017-09-25)

#### Features

* **heartbeat resource**
  * cache json response body	 ([f2ac0f5](https://github.com/pact-foundation/pact_broker/commit/f2ac0f5))

* **webhook status**
  * delete webhook objects related to previous revisions of a pact when deleting a pact publication	 ([a053623](https://github.com/pact-foundation/pact_broker/commit/a053623))
  * delete related triggered webhooks and executions when pact publication is deleted	 ([3dc590c](https://github.com/pact-foundation/pact_broker/commit/3dc590c))
  * set any triggered webhooks in 'retrying' status to 'failed' on startup	 ([1f2305b](https://github.com/pact-foundation/pact_broker/commit/1f2305b))
  * migrate webhook execution data to triggered webhooks	 ([9f46d86](https://github.com/pact-foundation/pact_broker/commit/9f46d86))
  * consider http status < 300 to be a webhook failure	 ([7ef595a](https://github.com/pact-foundation/pact_broker/commit/7ef595a))
  * log unhandled suckerpunch errors	 ([4cc779d](https://github.com/pact-foundation/pact_broker/commit/4cc779d))
  * log number of seconds until next webhook attempt in webhook logs	 ([5d16330](https://github.com/pact-foundation/pact_broker/commit/5d16330))
  * display attempts made and attempts remaining in webhook status resource	 ([648e1c3](https://github.com/pact-foundation/pact_broker/commit/648e1c3))
  * move webhook retry schedule to configuration	 ([f2d92f3](https://github.com/pact-foundation/pact_broker/commit/f2d92f3))
  * ensure triggered webhook and webhook execution objects are saved to database even when webhook fails and response code is 500	 ([88ba2ac](https://github.com/pact-foundation/pact_broker/commit/88ba2ac))
  * redact authorization headers in webhook logs	 ([10efddb](https://github.com/pact-foundation/pact_broker/commit/10efddb))
  * implement PUT for webhook resource	 ([7266b1e](https://github.com/pact-foundation/pact_broker/commit/7266b1e))
  * add endpoint for triggered webhook execution logs	 ([ad81d20](https://github.com/pact-foundation/pact_broker/commit/ad81d20))

* **hal browser**
  * use name over title in embedded resource heading	 ([6c61da7](https://github.com/pact-foundation/pact_broker/commit/6c61da7))
  * improve readability of link collections	 ([0a9bc8c](https://github.com/pact-foundation/pact_broker/commit/0a9bc8c))
  * use name and title from self link when not specified in embedded resource	 ([354374c](https://github.com/pact-foundation/pact_broker/commit/354374c))

* **versions resource**
  * deprecate versions and pacticipant links in favour of pb:versions and pb:pacticipants	 ([94f395e](https://github.com/pact-foundation/pact_broker/commit/94f395e))

* **badges**
  * only cache successful badge responses from shields.io	 ([e5f08ad](https://github.com/pact-foundation/pact_broker/commit/e5f08ad))
  * use simple in-memory cache for badges	 ([2453c55](https://github.com/pact-foundation/pact_broker/commit/2453c55))
  * show message about enabling public badge access when disabled	 ([6fc78ff](https://github.com/pact-foundation/pact_broker/commit/6fc78ff))
  * show badge in HTML pact and display markdown when clicked	 ([e9b632a](https://github.com/pact-foundation/pact_broker/commit/e9b632a))
  * changed configuration property name from 'enable_badge_resources' to 'enable_public_badge_access'	 ([83540e5](https://github.com/pact-foundation/pact_broker/commit/83540e5))

* **resources**
  * improve usage of title and name attributes	 ([915a7ee](https://github.com/pact-foundation/pact_broker/commit/915a7ee))

* **pact resource**
  * improve usage of name and title fields	 ([3a9a178](https://github.com/pact-foundation/pact_broker/commit/3a9a178))
  * add link relation for all pact versions	 ([d5ea068](https://github.com/pact-foundation/pact_broker/commit/d5ea068))

* **gems**
  * upgrade webmachine to 1.5.0	 ([d23fedc](https://github.com/pact-foundation/pact_broker/commit/d23fedc))

#### Bug Fixes

* return correct "latest" verification when a verification has been published for a pact with a revision	 ([f2b4c9f](https://github.com/pact-foundation/pact_broker/commit/f2b4c9f))
* sequel migration 25 for mysql	 ([920c363](https://github.com/pact-foundation/pact_broker/commit/920c363))
* sequel migration 19 for mysql	 ([0ee48e1](https://github.com/pact-foundation/pact_broker/commit/0ee48e1))

<a name="v2.4.2"></a>

### v2.4.2 (2017-09-07)

#### Bug Fixes

* add missing require	 ([92bf349](https://github.com/pact-foundation/pact_broker/commit/92bf349))

<a name="v2.4.1"></a>

### v2.4.1 (2017-09-07)

#### Bug Fixes

* allow resource identifiers to contain escaped forward slashes	 ([d875079](https://github.com/pact-foundation/pact_broker/commit/d875079))

<a name="v2.4.0"></a>

### v2.4.0 (2017-07-31)
* 3a03f41 - fix(publish verification result): Fix Location header for newly created resource (Beth Skurrie, Mon Jul 31 10:49:37 2017 +1000)
* 3b0f390 - feat(pacticipant labels): Add HAL link to pacticipants resource to find pacticipants by label. (Beth Skurrie, Mon Jul 24 08:17:36 2017 +1000)
* 588d2ad - fix(pacticipant and pacticipants resources): Add correctly capitalised and namespaced properties and relations. Added deprecation warnings to existing incorrect properties and relations. (Beth Skurrie, Mon Jul 24 08:14:52 2017 +1000)
* ab11f56 - feat(pacticipant labels): Adds embedded label resources to pacticipant resource. (Beth Skurrie, Fri Jul 21 18:03:15 2017 +1000)
* 57086cf - feat(pacticipant labels): Adds /pacticipants/label/LABEL_NAME resource to retrieve pacticipants by label. (Beth Skurrie, Fri Jul 21 14:07:08 2017 +1000)
* 4b44331 - feat(pacticipant labels): Adds pacticipant label resource with GET, PUT and DELETE (Beth Skurrie, Fri Jul 21 13:18:18 2017 +1000)
* c5af7e1 - feat(badges): Allow badge config settings to be saved to/loaded from database (Beth Skurrie, Fri Jul 14 20:50:02 2017 +1000)

#### 2.3.0 (2017-07-14)
* 3ac4351 - fix(potential duplicate pacticipant names): Make duplicate logic smarter. Fixes https://github.com/pact-foundation/pact_broker/issues/35 (Beth Skurrie, Tue Jul 11 10:30:11 2017 +1000)
* 81979b1 - add basic auth example to duplicate pacticipant error/help message (Fitzgerald, Andrew, Mon Jul 10 00:11:25 2017 -0400)
* bc54321 - feat(badges): Add endpoint to retrieve badge for latest untagged pact (Beth Skurrie, Fri Jul 7 10:15:29 2017 +1000)
* 5a3b149 - feat(badges): Add endpoint to retrieve badge for latest tagged pact (Beth Skurrie, Fri Jul 7 09:32:24 2017 +1000)
* 78c888b - feat(badges): Use static images when shields.io base URL is not configured. (Beth Skurrie, Fri Jul 7 08:41:35 2017 +1000)
* b30c368 - feat(badges): Allow shields.io base URL to be configured (Beth Skurrie, Fri Jul 7 08:31:47 2017 +1000)
* d8b2cec - feat(badges): Added configuration for turning badge resources on or off (Beth Skurrie, Fri Jul 7 08:25:48 2017 +1000)
* 2e43b5f - feat(badges): Added read timeout of 1000ms for HTTP call to create badge. (Beth Skurrie, Thu Jul 6 07:48:39 2017 +1000)
* 6bdae00 - fix(publish verification): Corrected pact finding params when publishing a verification. (Beth Skurrie, Thu Jul 6 07:30:38 2017 +1000)
* 2508eba - feat(badges): Allow pacticipant initials to be used where names are too long for the badge (Beth Skurrie, Wed Jul 5 14:49:07 2017 +1000)
* f7a36b7 - feat(badges): Return static badge when there is an error creating a dynamic one (Beth Skurrie, Wed Jul 5 10:14:18 2017 +1000)
* 24860b3 - feat(badges): Add badge svg endpoint for latest pact (Beth Skurrie, Tue Jul 4 15:28:28 2017 +1000)

#### 2.2.0 (2017-07-04)
* 788c5d0 - chore(gems): Lock rack and red-carpet gem versions for hakiri (Beth Skurrie, Tue Jul 4 10:28:15 2017 +1000)
* f1abebe - chore(gems): Upgrade pact gems (Beth Skurrie, Tue Jul 4 10:10:55 2017 +1000)
* 5bccca2 - chore(gems): Upgrade rack-protection and padrino-core gems (Beth Skurrie, Tue Jul 4 10:07:58 2017 +1000)
* 5c1392d - chore(build): Add code climate test coverage reporter (Beth Skurrie, Tue Jul 4 09:02:09 2017 +1000)
* 6e73420 - chore(build): Add bundle-audit to build (Beth Skurrie, Tue Jul 4 08:09:49 2017 +1000)
* de9f493 - fix(pact versions decorator): Corrected use of title and name (Beth Skurrie, Mon Jul 3 19:45:28 2017 +1000)
* 90d4410 - feat(HTML pact): Add home link to HTML pact (Beth Skurrie, Mon Jul 3 16:57:57 2017 +1000)
* 4eb2095 - feat(HTML pact): Add tag names next to consumer version number (Beth Skurrie, Mon Jul 3 16:56:56 2017 +1000)
* 1f66b6d - feat(version): Add HAL links to pacts from version resource (Beth Skurrie, Mon Jul 3 16:34:34 2017 +1000)
* 3f61fb3 - feat(retrieve latest pact): Add HAL links for latest-untagged and latest/{tag} (Beth Skurrie, Mon Jul 3 16:17:54 2017 +1000)

#### 2.1.1 (2017-07-03)
* f7af21a - fix(gemspec) (Beth Skurrie, Mon Jul 3 09:53:02 2017 +1000)

#### 2.1.0 (2017-07-03)
* 53f0b5e - feat(get latest untagged pact): Add /latest-untagged endpoint to return the latest untagged pact (Beth Skurrie, Mon Jul 3 08:31:18 2017 +1000)
* a963fce - Add pact_broker:db:version task. (Beth Skurrie, Thu Jun 29 20:29:55 2017 +1000)
* 7ee134f - Add basic auth (authentication) to the UI, but no authorization (Beth Skurrie, Mon Jun 26 10:44:07 2017 +1000)

#### 2.0.5 (2017-06-15)
* e924c96 - Fixed webhook deletion bug (Beth Skurrie, Tue Jun 13 10:04:33 2017 +1000)

#### 2.0.4 (2017-06-02)
* 99e1c25 - Turn off http_origin checking for https://github.com/pact-foundation/pact_broker/issues/108 (Beth Skurrie, Fri Jun 2 16:27:38 2017 +1000)
* e58f609 - Add favicon.ico (Beth Skurrie, Mon May 29 15:02:22 2017 +1000)
* 2780f0a - Add pull request guidelines. (Beth Skurrie, Mon May 29 11:45:04 2017 +1000)

#### 2.0.3 (2017-05-17)
* c03b871 - Make specs pass for sqlite, postgres and mysql. At the same time. Amazing. (Beth Skurrie, Sun May 28 10:22:20 2017 +1000)
* ae2b62f - Remove inner query from latest_verifications definition for MySQL (#105) (Beth Skurrie, Sat May 27 15:11:26 2017 +1000)
* f451d35 - Add mysql build to travis for #106 (Beth Skurrie, Sat May 27 15:09:42 2017 +1000)
* 91178c2 - Altering config and travis to run against sqlite and postgres. (Beth Skurrie, Sat May 27 14:08:34 2017 +1000)
* 4c52061 - Use a simpler and more efficient algorithm for updating version orders. (Beth Skurrie, Mon May 22 13:29:07 2017 +1000)
* ba5b60c - Created indexes on pacticipant, version and tag tables. #87 (Beth Skurrie, Sun May 21 16:18:49 2017 +1000)
* 0ffad10 - Do not validate incoming consumer version number if order_versions_by_date is true. (Beth Skurrie, Sun May 21 15:46:54 2017 +1000)

#### 2.0.2 (2017-05-17)
* 0e4d4bf - Add missing require for migration_helper (Beth Skurrie, Fri May 19 14:16:38 2017 +1000)

#### 2.0.1 (2017-05-17)
* 8d105aa - Allow an application version to be deleted via the API. (Beth Skurrie, Fri May 19 10:39:16 2017 +1000)
* 025b0f7 - Ensure version numbers that don't conform to the semver2 spec don't cause errors when sorting versions. #103 (Beth Skurrie, Fri May 19 09:58:50 2017 +1000)
* ca6d88e - Corrected hal link rels that had missing curies (prepended "pb:") (Beth Skurrie, Thu May 18 10:20:06 2017 +1000)
* 1cabd5e - Use Rack::Protection. (Beth Skurrie, Tue May 16 10:13:40 2017 +1000)
* 2a3bbd1 - Return 404 instead of 500 when Ruby standard URI lib can't parse the URI. https://github.com/pact-foundation/pact_broker/issues/101 (Beth Skurrie, Tue May 16 09:45:37 2017 +1000)

#### 2.0.0 (2017-05-16)

#### 2.0.0.beta.8 (2017-05-15)
* e931b48 - Enable configuration settings to be saved to and loaded from the database. (Beth Skurrie, Mon May 15 12:34:44 2017 +1000)
* c3976e4 - Set timezones so dates in the UI and API are shown in the configured local time. (Beth Skurrie, Mon May 15 08:53:13 2017 +1000)
* 4da62e8 - Add publication date of latest pact to UI front page. (Beth Skurrie, Sun May 14 08:38:42 2017 +1000)
* 8633b08 - Set X-Pact-Broker-Version header in all responses (Beth Skurrie, Fri May 12 16:39:09 2017 +1000)

#### 2.0.0.beta.7 (2017-05-12)
* 741bf96 - Include information about missing verifications in the latest verifications resource. Only set success to be true when all pacts have been successfully verified. (Beth Skurrie, Fri May 12 14:59:48 2017 +1000)
* 64f20c6 - Allow one, two or three "parts" in the application version number. Eg. 12, 3.4 and 1.2.400 are all valid. (Beth Skurrie, Wed May 10 16:19:07 2017 +1000)

#### 2.0.0.beta.6 (2017-05-09)
* 8f1c911 - Ensure all resources provide application/hal+json. (Beth Skurrie, Tue May 9 18:32:37 2017 +1000)

#### 2.0.0.beta.5 (2017-05-08)
* 4b88c4d - Add success flag to the resource for the latest verifications for a consumer version to indicate the overall success or failure of the verification results for that version. (Beth Skurrie, Mon May 8 10:54:31 2017 +1000)

#### 2.0.0.beta.4 (2017-05-02)
* e5c14d1 - Renamed verification to verification-result in link relations and URLs (Beth Skurrie, Tue May 2 13:04:01 2017 +1000)
* 803ea44 - Add endpoint to show a verification. (Beth Skurrie, Mon May 1 08:52:12 2017 +1000)

#### 2.0.0.beta.3 (2017-04-29)
* 7059a7e - Insert pact_publications without a specified ID so that the inbuilt sequence is kept in sync. (Beth Skurrie, Sat Apr 29 15:16:12 2017 +1000)

#### 2.0.0.beta.2 (2017-04-29)
* 1dfef17 - Cleaned up migrations and ensured migrations run on postgresql. (Beth Skurrie, Fri Apr 28 21:24:20 2017 +1000)

#### 2.0.0.beta.1 (2017-04-28)
* 049bc5c - Added tooltip to verification date to show provider version. (Beth Skurrie, Fri Apr 28 10:05:13 2017 +1000)
* 4287c99 - Add tooltip text to last verified date when pact has changed since last verification. (Beth Skurrie, Fri Apr 28 09:02:59 2017 +1000)
* 7351ec8 - Add restrictions for all gem versions in gemspec. Fix formatting in haml file. (Beth Skurrie, Thu Apr 27 19:55:04 2017 +1000)
* a836b56 - Add last verified date for each pact to landing page of application UI. (Beth Skurrie, Tue Apr 25 17:03:06 2017 +1000)
* c7589c9 - Use latest ruby-2.3.4 for development. (Tan Le, Mon Apr 24 23:05:27 2017 +1000)
* 46b87f9 - Use latest ruby patches for CI. (Tan Le, Mon Apr 24 23:00:12 2017 +1000)
* 7c17c62 - Required at least ruby-2.2.0 as we move along ruby release schedule. (Tan Le, Mon Apr 24 22:54:52 2017 +1000)
* 66a2f3b - Added pb:publish-verification HAL link to pact resource. (Beth Skurrie, Fri Apr 21 16:09:55 2017 +1000)
* f2110ac - Replacing versionomy with semver2 for parsing version numbers according to semver 2.0.0 (http://semver.org) (Danilo Sato, Thu Apr 20 11:48:49 2017 -0400)
* 1f6045a - Added DEVELOPER_DOCUMENTATION.md with information about the tables and views. (Beth Skurrie, Tue Apr 18 11:35:39 2017 +1000)
* 77eaf7b - Added pb:latest-verifications link to version resource. (Beth Skurrie, Tue Apr 11 16:25:45 2017 +1000)
* aaf44d9 - Added endpoint to view the latest verifications for a given consumer version. (Beth Skurrie, Tue Apr 11 11:16:03 2017 +1000)

#### 1.18.0 (2017-05-09)
* 397060b - Display application versions in reverse order in the Versions resource. (Beth Skurrie, Tue May 9 13:59:54 2017 +1000)
* 251c878 - Allow application versions to be ordered by creation date where no consistent orderable object can be extracted from the consumer application version. (Beth Skurrie, Tue May 9 13:22:36 2017 +1000)
* 68bb6d9 - Execute webhooks using sucker punch. (Beth Skurrie, Mon May 8 10:32:45 2017 +1000)

#### 1.17.2 (2017-05-04)
* b8f45e1 - fix issue with pact document link not displaying #94 (Matt Fellows, Wed May 3 11:23:09 2017 +1000)

#### 1.17.1 (2017-05-02)
* 7576bc2 - Fix 500 error in webhooks endpoint. (Beth Skurrie, Tue May 2 14:35:06 2017 +1000)
* 7351ec8 - Add restrictions for all gem versions in gemspec. Fix formatting in haml file. (Beth Skurrie, Thu Apr 27 19:55:04 2017 +1000)

#### 1.17.0 (2017-04-26)
* 5cbb9da - Added pb:publish-pact to HAL index (Beth Skurrie, Wed Apr 26 08:39:15 2017 +1000)
* 36842d1 - Set database connection timezone to UTC in example config.ru (Beth Skurrie, Tue Apr 25 16:18:58 2017 +1000)
* c7589c9 - Use latest ruby-2.3.4 for development. (Tan Le, Mon Apr 24 23:05:27 2017 +1000)
* 46b87f9 - Use latest ruby patches for CI. (Tan Le, Mon Apr 24 23:00:12 2017 +1000)
* 7c17c62 - Required at least ruby-2.2.0 as we move along ruby release schedule. (Tan Le, Mon Apr 24 22:54:52 2017 +1000)

#### 1.16.0 (2017-04-10)
* 990575f - Added HTML content type for request to get a specific version of a pact. As per request in https://github.com/pact-foundation/pact_broker/issues/82 (Beth Skurrie, Mon Apr 10 15:34:28 2017 +1000)
* b47b8d8 - Use /versions rather than /version in test endpoint. Singular will be deprecated. (Beth Skurrie, Fri Apr 7 16:03:19 2017 +1000)
* dd4daee - Removed version restriction for pact_broker gem in the example Gemfile. This will avoid a repetition of the twisted dependencies fixed by https://github.com/pact-foundation/pact_broker/pull/84 (Beth Skurrie, Tue Apr 4 09:53:39 2017 +1000)
* e447b3f - Updated sqlite database. (Beth Skurrie, Mon Apr 3 08:25:41 2017 +1000)
* 149efc0 - Update REAME to reflect 2.4 support. (Tan Le, Fri Mar 31 21:42:47 2017 +1100)

#### 1.15.0 (2017-03-28)
* 588c33e - Adds versions decorator spec (Ivan Vojinovic, Wed Feb 22 00:00:46 2017 -0500)
* c4a7daf - Adds pacticipant versions endpoint (Ivan Vojinovic, Tue Feb 21 21:15:39 2017 -0500)
* 06bcbc8 - Added ruby 2.4.0 to travis.yml (Beth Skurrie, Tue Mar 28 19:09:06 2017 +1100)
* 6d7653b - Bump pact_broker version to 1.14.0 to resolve twisted dependencies. (Tan Le, Mon Mar 27 22:36:22 2017 +1100)
* c8eeab4 - Remove trailblazer dependency. (Tan Le, Mon Mar 27 21:56:43 2017 +1100)
* e62c5ec - Added copyright year and owner. (Beth Skurrie, Fri Mar 24 10:39:39 2017 +1100)
* 5007f5b - Bump trailblazer version due to roar compatibility. (Tan Le, Mon Feb 20 10:22:41 2017 +1100)
* 4865948 - Bump reform and friends versions. (Tan Le, Wed Feb 15 09:16:29 2017 +1100)
* 0920e45 - Add hosted pact broker to usage section in README (Matt Fellows, Sat Feb 4 11:28:36 2017 +1100)

#### 1.14.0 (2017-01-30)
* 83ac7a5 - Adds ability to delete tags (Ivan Vojinovic, Fri Jan 27 15:19:51 2017 -0500)

#### 1.13.0 (2017-01-18)
* b9b67b3 - Adds the spec for pact versions endpoint, and corrects the file name for the provider pacts spec (Ivan Vojinovic, Tue Jan 17 23:43:03 2017 -0500)
* ace427e - Adds the spec for pact versions endpoint, and corrects the file name for the provider pacts spec (Ivan Vojinovic, Tue Jan 17 23:36:33 2017 -0500)
* 8b14b35 - Adds endpoint for (and fixes) pact_versions (Ivan Vojinovic, Mon Jan 16 21:12:02 2017 -0500)

#### 1.12.0 (2016-12-09)
* 67779ac - add pb:latest-provider-pacts-with-tag to index.rb (Olga Vasylchenko, Thu Dec 8 16:02:19 2016 +0100)
* cdfa17b - upgrade default sqlite db to current migration level (Bo Daley, Wed Nov 30 14:37:54 2016 -0500)

#### 1.11.2 (2016-11-25)
* 43f2373 - Added require to hopefully fix broken build. https://travis-ci.org/pact-foundation/pact_broker/jobs/174397806 (Bethany Skurrie, Thu Nov 24 07:47:07 2016 +1100)
* f747e09 - Removed ruby 2.1 build as it is failing (Beth Skurrie, Wed Nov 9 13:42:08 2016 +1100)
* 2dd77a5 - Added extra pact version to example database so that the diff feature could be explored. (Beth, Wed Nov 9 10:07:33 2016 +1100)
* 5c04c59 - Updated trailblazer gem to ~>0.3.0 and fixed pact diff spec. (Beth, Wed Nov 9 10:05:53 2016 +1100)
* 8102ac9 - Use respond_to?(:acts_like_time?) instead of acts_like?(:time) as it blows up (Beth, Sun Nov 6 12:00:30 2016 +1100)

#### 1.11.1 (2016-10-13)
* 14381ac - Fix issue #59 Error when executing web hook with body. (Beth Skurrie, Thu Oct 13 12:50:17 2016 +1100)

#### 1.11.0 (2016-08-13)
* 18ffc4a - Add conflict guards to pact merger (Steve Pletcher, Fri Aug 5 12:31:30 2016 -0400)

#### 1.10.0 (2016-08-01)
* efdde13 - Add ability to merge pacts via PATCH requests (Steve Pletcher, Thu Jul 28 16:29:22 2016 -0400)

#### 1.9.3 (2016-06-27)
* f57db36 - Clarify that pact_broker will only work with ruby >= 2.0 (Sergei Matheson, Mon Jun 27 11:06:40 2016 +1000)
* a1742b8 - Correct release instructions (Sergei Matheson, Mon Jun 27 11:03:03 2016 +1000)
* 7d0f362 - Update default dev ruby version to 2.3.1 (Sergei Matheson, Mon Jun 27 11:00:40 2016 +1000)
* 42dc7fe - Update to ruby 2.3.1 in travis (Sergei Matheson, Tue May 3 10:46:46 2016 +1000)
* df9a910 - Fix for Webmock 2.0.0 behaviour change. (Sergei Matheson, Fri Apr 29 13:19:57 2016 +1000)

#### 1.9.2 (2016-04-29)
* 6d4ce4f - Update default dev ruby version to 2.3.0 (Sergei Matheson, Fri Apr 29 11:39:59 2016 +1000)
* 039fce9 - Add release instructions (Sergei Matheson, Fri Apr 29 10:42:17 2016 +1000)
* d48a1fa - Append `charset=utf-8` in json error response (Taiki Ono, Tue Mar 15 21:11:59 2016 +0900)
* 7f34940 - Remove unused variable (Taiki Ono, Tue Mar 15 21:06:23 2016 +0900)
* e932c28 - Append `charset=utf-8` to `Content-Type` header (Taiki Ono, Tue Mar 15 17:54:48 2016 +0900)
* 6252c1c - Does not change YAML::ENGINE.yamler (Taiki Ono, Sun Mar 13 22:03:41 2016 +0900)
* 9f02474 - Update Travis CI setting with new Rubies (Taiki Ono, Sun Mar 13 21:19:17 2016 +0900)
* 5a506dc - Belatedly, updated changelog (Sergei Matheson, Fri Feb 26 09:30:46 2016 +1100)

#### 1.9.1 (2016-02-26)
* e6e6d49 - Release version 1.9.1 (Sergei Matheson, Fri Feb 26 09:26:52 2016 +1100)
* 5ea7607 - Merge pull request #44 from sigerber/master (Beth Skurrie, Thu Feb 25 14:39:17 2016 +1100)
* ade2599 - Fix performance of groupify (Horia Musat and Simon Gerber, Wed Feb 24 14:50:39 2016 +1100)
* 38869ad - Return a 409 when there is a potential duplicate pacticipant name when publishing a pact. (Beth, Thu Nov 5 17:43:32 2015 +1100)
* 2991441 - Merge pull request #42 from bethesque/issue-41 (Beth Skurrie, Fri Oct 23 15:52:39 2015 +1100)
* 933981c - Now supports HTTPS webhooks (Warner Godfrey, Fri Oct 23 14:48:28 2015 +1100)
* 2123ff1 - Merge pull request #40 from elgalu/travis-badge (Beth Skurrie, Thu Oct 15 06:40:09 2015 +1100)
* 88cea3f - Add TravisCI badge in README.md (Leo Gallucci, Wed Oct 14 17:02:52 2015 +0200)
* b54c5c6 - Merge pull request #38 from gitter-badger/gitter-badge (Beth Skurrie, Tue Sep 29 15:37:27 2015 +1000)
* 42e9bc2 - Add Gitter badge (The Gitter Badger, Tue Sep 29 04:51:17 2015 +0000)
* 711ac85 - Merge pull request #37 from elgalu/ruby-2.1.3 (Beth Skurrie, Fri Sep 18 06:42:47 2015 +1000)
* 40ddb97 - Add ruby 2.1.3 and set as default (Leo Gallucci, Thu Sep 17 16:19:09 2015 +0200)
* a1fa248 - Updated example with postgres details (Beth, Thu Sep 17 09:25:09 2015 +1000)
* 383d137 - Create LICENSE.txt (Beth Skurrie, Mon Aug 24 06:29:50 2015 +1000)

#### 1.9.0 (2015-08-19)

* eda171e - Allow pact broker API to be run using Rack map at an arbitrary path. e.g. "/foo/pacts". Note, this does not work for the UI. (Beth, Wed Aug 19 08:44:21 2015 +1000)

#### 1.9.0.rc1 (2015-07-19)

* c855a2c - Support case insensitive resource names (Beth Skurrie, Sun Jul 19 17:28:55 2015 +1000)
* 7ea3e61 - Update pact_broker.gemspec (Beth Skurrie, Tue Jul 14 09:02:30 2015 +1000)
* f299cfd - Added logging for publishing and deleting pacts (Beth Skurrie, Wed Jul 8 16:00:58 2015 +1000)
* 67f0edb - Log error when contract cannot be parsed to a Pact (Beth Skurrie, Wed Jul 8 15:54:29 2015 +1000)
* 57caf63 - Double ensure that tables are created with UTF-8 encoding https://github.com/pact-foundation/pact_broker/issues/24 (Beth Skurrie, Fri Jul 3 15:46:46 2015 +1000)

#### 1.8.1 (2015-06-30)

* d0d466d - Avoid making a query for tags for each pact shown on the Pacts page (Beth Skurrie, Tue Jun 30 06:42:09 2015 +1000)

#### 1.8.0 (2015-05-28)

* 6c40e9c - Added ability to specify a tag when retrieving pacts for a given provider (Beth Skurrie, Thu May 28 09:03:46 2015 +1000)
* dda9f1d - Added endpoint to retrieve latest pacts by provider (Beth Skurrie, Sun May 10 21:28:33 2015 +1000)
* 21e676a - Pact broker example for heroku with basic auth (BrunoChauvet, Sat Apr 25 13:04:54 2015 +1000)

#### 1.7.0 (2015-03-20)

* a26402c - Allow configuration of version parsing. (Beth Skurrie, Tue Apr 14 09:39:05 2015 +1000)

#### 1.6.0 (2015-03-20)

* e20e657 - Added support for JSON contracts that are not in the Pact format (e.g. top level is an array) (Beth Skurrie, Fri Mar 20 19:12:46 2015 +1100)

#### 1.5.0 (2015-02-20)

* b848ce3 - Added healthcheck endpoint for database dependency. /diagnostic/status/dependencies (Beth, Fri Feb 20 09:41:16 2015 +1100)
* 56ea4a6 - Added heartbeat endpoint for monitoring. /diagnostic/status/heartbeat (Beth, Fri Feb 20 08:49:51 2015 +1100)
* dbdb4fb - Upgraded webmachine gem to 1.3.1 (Beth, Wed Feb 11 21:49:55 2015 +1100)
* 111f088 - Added validation to ensure that the encoding for the database connection is set to UTF8. This is required to ensure the pact_version_content_sha foreign key works. (Beth, Wed Feb 11 20:03:34 2015 +1100)

#### 1.4.0 (2015-01-20)

* d740fb0 - Removed pact-versions rel from pact resource. Pact versions resource is not implemented yet. (Beth, Tue Jan 20 09:20:52 2015 +1100)
* bd6e63e - Handle case where there is no previous distinct version when displaying diff (Beth, Tue Jan 20 09:17:21 2015 +1100)
* d032ce1 - Changed pact icon on Pacts page to look more like a pact. (Beth, Wed Dec 24 09:58:35 2014 +1100)
* dbf67aa - Added endpoint for previous distinct pact version. (Beth, Mon Dec 22 14:08:07 2014 +1100)
* bde72f9 - Added migration to change pacts table to UTF8 (Beth, Mon Dec 22 11:45:09 2014 +1100)
* 8f587b7 - Modified pact HAL rels. (Beth, Mon Dec 22 11:41:10 2014 +1100)
* b813c0d - Renamed Relationships to Pacts. It was confusing. (Beth, Mon Dec 22 10:25:27 2014 +1100)
* 00d81aa - Changed diff resource to text/plain, added dates (Beth, Sun Dec 14 17:05:18 2014 +1100)
* 8f05772 - Set timezone to utc for test db connection (Beth, Sun Dec 14 17:04:16 2014 +1100)
* 407fa74 - Added link from HAL browser to home (Beth, Sat Dec 13 19:54:53 2014 +1100)
* a62faa9 - Adding missing docs (Beth, Sat Dec 13 19:51:36 2014 +1100)
* ec04e77 - Added HAL link to diff with previous distinct version (Beth, Fri Dec 12 08:31:12 2014 +1100)
* fe5f1d6 - Added endpoint to see the diff between a pact and the previous distinct version. (Beth, Thu Dec 11 17:35:22 2014 +1100)
* f802641 - Added version endpoint. (Beth, Wed Dec 10 13:06:13 2014 +1100)
* 715f49d - Force documentation window in HAL browser to be longer. This used to display correctly, but has somehow become quite short. Don't know what changed. (Beth, Tue Dec 9 18:47:53 2014 +1100)
* 25e612b - Removed curie from self links (Beth, Wed Dec 3 21:14:23 2014 +1100)
* 5cc922e - Added script to publish test pact. (Beth, Wed Dec 3 20:26:31 2014 +1100)
* f468b2c - Changed Padrino to log to stdout. :null creates a StringIO, don't want to hog memory. (Beth, Wed Dec 3 20:25:05 2014 +1100)

#### 1.3.2.rc1 (2014-12-03)

* a2413f4 - Stop Padrino trying to create a log file in the gem directory https://github.com/pact-foundation/pact_broker/issues/13 (Beth, Wed Dec 3 13:16:06 2014 +1100)
* abf9459 - Added DELETE endpoint for pact resource (Beth, Wed Nov 19 17:45:34 2014 +1100)
* 1d01937 - Set default encoding to utf-8 in example app. This is required for the sha foreign key to work between the pact table and the pact_version_content table. (Beth, Tue Nov 18 22:35:51 2014 +1100)
* 9e3401e - Save all the space! Reuse the same pact_version_content when one with the same sha1 already exists in the database. (Beth, Tue Nov 18 20:27:59 2014 +1100)
* 84ab8ad - Creating example pact_broker_database.sqlite3 with the Zoo App/Animal Service pact (Beth, Tue Nov 18 17:30:25 2014 +1100)
* d767b0d - Fixed query for all pacts when pact has more than one tag (Beth, Mon Nov 17 20:44:01 2014 +1100)
* 21563c6 - Changed date to use day name and month name instead of numbers (Beth, Wed Nov 12 16:19:19 2014 +1100)
* 7766b77 - Added count to relationships page. (Beth, Mon Nov 3 11:06:05 2014 +1100)

#### 1.3.1 (2014-10-23)

* e61b40e - Added Travis configuration. (Beth, Fri Oct 17 16:32:26 2014 +1100)
* b320fe4 - Fixed pact publish validation for ruby 1.9.3 (Beth, Fri Oct 17 16:31:41 2014 +1100)
* b9b4d2b - Added validation to ensure that the participant names in the path match the participant names in the pact. (Beth, Thu Oct 16 20:21:10 2014 +1100)

#### 1.3.0 (2014-10-14)

* ed08811 - Converted raw SQL create view statements to Sequel so they will run on Postgres (Beth, Sat Oct 11 22:07:37 2014 +1100)
* 457edf4 - Added syntax highlighting to JSON in autogenerated HTML docs. (Beth, Wed Sep 24 22:12:14 2014 +1000)

#### 1.2.0 (2014-09-22)

* 0ccde50 - Made webhook creation code more Webmachiney. (Beth, Tue Sep 16 10:07:56 2014 +1000)
* 4c628e5 - Using localtime to display dates. (Beth, Fri Aug 29 13:32:20 2014 +1000)
* 7d99c51 - Fixed HAL Browser link - page title was stopping it being clickable (Beth, Fri Sep 5 16:41:03 2014 +1000)
* 8ba3be0 - Updating spec task for latest rspec (Beth, Fri Sep 5 16:40:10 2014 +1000)
* fcc25eb - Updated pact gem (Beth, Tue Aug 26 18:45:31 2014 +1000)
* 5d0d3dc - Added pact versions link to the pact response (Beth, Tue Aug 26 07:54:26 2014 +1000)
* 16971ff - Added method to find distinct pacts between a consumer and provider (Beth, Tue Aug 26 07:41:54 2014 +1000)
* 4798c09 - Added pact versions endpoint. (Beth, Mon Aug 25 22:23:48 2014 +1000)
* e1f8c97 - Changed 'Date published' to display pact.updated_at date instead of created_at date (Beth, Mon Aug 25 07:37:58 20
* 39eac31 - Fixed pact-webhooks rel title (Beth, Sun Aug 24 17:54:05 2014 +1000)
* f6fc9f7 - Added latest-pact rel to pact representation (Beth, Sun Aug 24 17:51:08 2014 +1000)
* 08b088c - Added method to pacticipant_service to find potentially duplicated pacticipants (Beth, Sat Aug 23 08:32:34 2014 +
* 24e8d5d - Adding support for creating a pacticipant through the API (as distinct from it being auto created by publishing a
* dc4d4aa - Set DB timezone to UTC. (Beth, Thu Aug 21 17:30:41 2014 +1000)
* 19693fa - Added pact metadata to HTML view (Beth, Thu Aug 21 17:30:23 2014 +1000)

#### 1.1.0 (2014-08-21)

* d25395b - Fixed pacts failing to publish because of too deeply nested JSON (Beth, Tue Aug 19 11:13:02 2014 +1000)
* 9288c98 - Saving password in Base64 just so it is not plain text. WIP (Beth, Tue Aug 19 09:14:53 2014 +1000)
* 6a40151 - Added username and password to webhook request (Beth, Mon Aug 18 22:02:48 2014 +1000)
* 6eb0d70 - Added mouseover for relationship paths (Beth, Fri Aug 15 15:38:56 2014 +1000)
* 8e916fc - Added clickable relationship links (Beth, Fri Aug 15 11:37:57 2014 +1000)
* 7fc6418 - Added webhook HAL documentation. (Beth, Tue Aug 12 17:17:08 2014 +1000)
* 434fbe8 - Added useful rels to help navigate between webhook resources. (Beth, Tue Aug 12 09:14:08 2014 +1000)
* 959675b - Adding description to webhooks link (Beth, Mon Aug 11 21:46:39 2014 +1000)
* 9cbf2b1 - Added webhook test execution endpoint. (Beth, Mon Aug 11 21:37:47 2014 +1000)
* 6bdfd16 - Webhooks belonging to a pacticipant will be deleted when the pacticipant is deleted. (Beth, Mon Aug 11 14:16:50 2014 +1000)
* 27572e2 - WIP - ensuring webhook executes when a pact version is overridden and changed. (Beth, Fri Aug 8 16:59:48 2014 +1000)
* 2469ad5 - Adding webhook DELETE (Beth, Fri Aug 8 16:45:48 2014 +1000)
* 7ae9b59 - Adding code to execte webhook and to detect when pact content has changed (Beth, Fri Aug 8 10:13:16 2014 +1000)
* c8289fb - Adding /webhooks resource (Beth, Thu Aug 7 16:57:27 2014 +1000)
* 2d818ee - Added endpoint to retrieve webhook by UUID (Beth, Thu Aug 7 14:35:04 2014 +1000)
* 25c3866 - Completed web hooks resource. (Beth, Wed Aug 6 11:38:39 2014 +1000)
* a59e46e - Started work on webhooks (Beth, Sat Aug 2 18:12:16 2014 +1000)
* 56d9ae5 - Return 400 error for pacts with invalid JSON (Beth, Sat Aug 2 07:08:39 2014 +1000)
* 884aa06 - Added links from relationship page to group. (Beth, Thu Jul 31 20:05:55 2014 +1000)
* 642570e - Adding group UI endpoint. (Beth, Thu Jul 31 17:36:37 2014 +1000)
* 3609028 - Adding a group resource (Beth, Mon Jul 28 09:11:46 2014 +1000)
* 437df9e - Added created_at and updated_at timestamps to all objects. (Beth, Fri Jul 25 16:53:46 2014 +1000)
* 594f160 - Turning exception showing on (Beth, Fri Jul 25 08:59:57 2014 +1000)
* 7250a51 - Updated to pact 1.3.0 (Beth, Thu Jul 24 12:13:38 2014 +1000)
* 9824247 - Implemented DELETE for pacticipant resource (Beth, Tue Jun 10 17:32:26 2014 +1000)
* 1c65600 - Swapped links and properties order in the HAL browser, because the documents are large, and scrolling to the bottom of the page to click around is annoying. (Beth, Fri Jun 6 10:19:47 2014 +1000)

#### 1.0.0 (2014-06-06)

* ed25adb - Sorting relationships by consumer name, then provider name. (Beth, Wed May 21 15:13:39 2014 +1000)
* 7aae530 - Releasing version 1.0.0.alpha3 (Beth, Mon May 19 15:44:33 2014 +1000)
* 53e24cb - Increased json_content size from text to mediumtext (16MB) (Beth, Mon May 19 15:43:32 2014 +1000)
* 1f65546 - Releasing 1.0.0.alpha2 (Beth, Mon May 19 12:49:42 2014 +1000)
* 3714ab5 - Adding network graph spike files (Beth, Sat May 17 21:12:04 2014 +1000)
* 73e2b81 - Implemented finding latest pact by tag (Beth, Sat May 17 17:56:58 2014 +1000)
* bfa62cc - Changed /pact to /pacts because it is more RESTy (Beth, Sat May 17 12:22:55 2014 +1000)
* 91c8fab - Releasing 1.0.0.alpha1 (Beth, Fri May 9 15:21:13 2014 +1000)
* f497f13 - Made HtmlPactRenderer configurable in case shokkenki want to use the PactBroker ;) (Beth, Fri May 9 14:20:38 2014 +1000)
* 5343019 - Added Relationship UI (Beth, Fri May 9 12:23:30 2014 +1000)
* f7270a6 - Added HTML rendering of latest pact. Added /relationships CSV endpoint. (Beth, Thu May 8 16:17:52 2014 +1000)
* 264e16b - Created nice interface for making a pact_broker instance (Beth, Sat Apr 26 16:43:07 2014 +1000)
* 8001792 - Added HAL browser (Beth, Wed Apr 23 13:31:25 2014 +1000)
* 8c94d1f - Creating example app (Beth, Wed Apr 23 13:06:40 2014 +1000)

#### 0.0.10 (2014-06-06)

  * 24daeea - Added task to delete pacticipant (bethesque Tue May 20 11:59:10 2014 +1000)
  * 53e24cb - Increased json_content size from text to mediumtext (16MB) (bethesque Mon May 19 15:43:32 2014 +1000)
  * 73e2b81 - Implemented finding latest pact by tag (bethesque Sat May 17 17:56:58 2014 +1000)
  * bfa62cc - Changed /pact to /pacts because it is more RESTy (bethesque Sat May 17 12:22:55 2014 +1000)
  * a7a8e0d - Upgraded padrino (bethesque Sat May 17 12:20:57 2014 +1000)
  * 94c7c38 - Setting gem versions in gemspec (bethesque Fri May 9 15:22:37 2014 +1000)
  * f497f13 - Made HtmlPactRenderer configurable in case shokkenki want to use the PactBroker ;) (bethesque Fri May 9 14:20:38 2014 +1000)
  * 1d35da4 - Added sort to relationships list (bethesque Fri May 9 13:56:55 2014 +1000)
  * 000f8a6 - Added HAL Browser link (bethesque Fri May 9 13:39:56 2014 +1000)
  * 85e0a1d - Redirecting index to relationships page (bethesque Fri May 9 13:15:55 2014 +1000)
  * 5343019 - Added Relationship UI (bethesque Fri May 9 12:23:30 2014 +1000)
  * f7270a6 - Added HTML rendering of latest pact. (bethesque Thu May 8 16:17:52 2014 +1000)

#### 0.0.10 (2014-03-24)

* 7aee2ae - Implemented version tagging (bethesque 2 days ago)
* cc78f92 - Added 'latest' pact url to pact representation in the 'latest pacts' response (bethesque 2 days ago)

#### 0.0.9 (2014-02-27)

* d07f4b7 - Using default gem publish tasks (bethesque 4 weeks ago)
* d60b7ee - Comment (bethesque 7 weeks ago)
* 836347c - Using local pacts (bethesque 7 weeks ago)
* a2cb2bb - Fixed bug querying mysql DB, rather than sqlite (bethesque 7 weeks ago)
* 9d5f83b - Using the to_json options to pass in the base_url instead of the nasty hack. (bethesque 4 months ago)
* adb6148 - Changed 'last' to 'latest' (bethesque 4 months ago)

#### 0.0.8 (2013-11-18)

* 6022baa - Changed name to title in list pacticipants response (bethesque 7 hours ago)
* 13fde52 - Moving resources module under the Api module. (bethesque 8 hours ago)
* f52c572 - Added HAL index (bethesque 8 hours ago)

#### 0.0.7 (2013-11-15)

* 7984d86 - Added title to each item in the pacts/latest links array (bethesque 83 seconds ago)

#### 0.0.6 (2013-11-15)

* 021faae - Refactoring resources to DRY out code (bethesque 18 hours ago)
* bab0367 - Cleaning up the base_url setting hack. (bethesque 19 hours ago)
* f6df613 - Renamed representors to decorators (bethesque 19 hours ago)
* 3e89c20 - Created BaseDecorator (bethesque 19 hours ago)
* e5c3f88 - Changing from representors to decorators (bethesque 19 hours ago)
* b2eeb6f - Added back resource_exists? implementation in pacticipant resource - accidental deletion. (bethesque 19 hours ago)
* 1962a05 - Ever so slightly less hacky way of handling PATCH (bethesque 21 hours ago)
* 587e9c1 - First go at trying to use a dynamic base URL - to be continued (bethesque 2 days ago)
* ab9c185 - Including URLs for the dynamically calculated latest pact, not the hard link to the latest pact. (bethesque 2 days ago)
* 5621e41 - Beginning change from Roar Representor to Decoractor. Updating to new 'latest pact' URL (bethesque 2 days ago)
* d1bd995 - Adding missing PactBroker::Logging require (bethesque 2 days ago)

#### 0.0.5 (2013-11-13)

* 2cf987c - Added data migration to script which adds order column (bethesque 56 minutes ago)
* 9c709a9 - Changing queries to use new order column. (bethesque 61 minutes ago)
* 173f231 - Renaming var (bethesque 65 minutes ago)
* f9be93d - Renamed SortVersions to OrderVersions (bethesque 66 minutes ago)
* ca6e479 - Added SortVersions as an after version save hook (bethesque 69 minutes ago)
* 23cd1a3 - Adding order column to version table (bethesque 11 hours ago)
* c504e5f - Fixing application/json+hal to application/hal+json (bethesque 2 days ago)
* 1d24b9b - Removing old sinatra API (bethesque 2 days ago)
* fd1832c - WIP. Converting to use Webmachine (bethesque 2 days ago)
* 0b096a4 - Redoing the the URLs yet again (bethesque 3 days ago)
* 0934d89 - Implementing list latest pacts (bethesque 3 days ago)
* ed2d354 - Changed one_to_one associations to many_to_one (bethesque 4 days ago)
* 28de0ea - WIP implementing pacts/latest. (bethesque 6 days ago)
* 1cd36e6 - Changing to new /pacts/latest URL format (bethesque 6 days ago)
* 54f8fc3 - Writing underlying code to find the latest pact for each consumer/provider pair. (bethesque 6 days ago)
