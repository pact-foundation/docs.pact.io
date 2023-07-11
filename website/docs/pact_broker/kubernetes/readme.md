---
title: Deploy with Helm
custom_edit_url: https://github.com/pact-foundation/pact-broker-chart/edit/master/charts/pact-broker/README.md
slug: ./readme
---
<!-- This file has been synced from the pact-foundation/pact-broker-chart repository. Please do not edit it directly. The URL of the source file can be found in the custom_edit_url value above -->

![Version: 0.10.1](https://img.shields.io/badge/Version-0.10.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 2.105.0.1](https://img.shields.io/badge/AppVersion-2.105.0.1-informational?style=flat-square)

The Pact Broker is an application for sharing for Pact contracts and verification results.

## TL;DR

```console
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo add pact-broker https://pact-foundation.github.io/pact-broker-chart/

helm install pact-broker pact-broker/pact-broker
```

## Usage

The Pact Broker Chart is available in the following formats:
- [Chart Repository](https://helm.sh/docs/topics/chart_repository/)
- [OCI Artifacts](https://helm.sh/docs/topics/registries/)

### Installing from Chart Repository

The following command can be used to add the chart repository:

```console
helm repo add pact-broker https://pact-foundation.github.io/pact-broker-chart/
```

Once the chart has been added, install one of the available charts:

```console
helm install pact-broker pact-broker/pact-broker
```

### Installing from an OCI Registry

Charts are also available in OCI format. The list of available charts can be found [here](https://github.com/pact-foundation/pact-broker-chart/).

Install one of the available charts:

```shell
helm upgrade -i <release_name> oci://ghcr.io/pact-foundation/pact-broker-chart/pact-broker --version=<version>
```

## Source Code

* <https://github.com/pact-foundation/pact_broker>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | common | 1.x.x |
| https://charts.bitnami.com/bitnami | postgresql | 11.x.x |

## Values

| Key | Description | Type | Default |
|-----|-------------|------|---------|
| broker.affinity | Pact Broker [Affinity](https://kubernetes.io/docs/concepts/configuration/assign-pod-node/#affinity-and-anti-affinity) | object | `{}` |
| broker.annotations | Additional annotations that can be added to the Broker deployment | object | `{}` |
| broker.config.allowDangerousContractModification | Whether or not to allow the pact content for an existing consumer version to be modified. It is strongly recommended that this is set to false, as allowing modification makes the results of can-i-deploy unreliable. | bool | `false` |
| broker.config.allowMissingMigrationFiles | If true, will not raise an error if a database migration is recorded in the database that does not have an equivalent file in the codebase. If this is true, an older version of the code may be used with a newer version of the database, however, data integrity issues may occur. | bool | `true` |
| broker.config.autoDetectMainBranch | When true and a pacticipant version is created with a tag or a branch that matches one of the names in main_branch_candidates, the mainBranch property is set for that pacticipant if it is not already set. | bool | `true` |
| broker.config.autoMigrateDb | Whether or not to run the database schema migrations on start up. It is recommended to set this to true. | bool | `true` |
| broker.config.autoMigrateDbData | Whether or not to run the database data migrations on start up. It is recommended to set this to true. | bool | `true` |
| broker.config.badgeProviderMode | The method by which the badges are generated. Allowed values: redirect, proxy | string | `"redirect"` |
| broker.config.baseUrls | Base URLs can be configured for architectures that use gateways or proxies that allow the same Pact Broker instance to be addressed with different base URLs.  The application may run correctly without this attribute, however, it is strongly recommended to set it when deploying the Pact Broker to production as it prevents cache poisoning security vulnerabilities | string | `nil` |
| broker.config.basicAuth.allowPublicRead | Set to true if you want public read access, but still require credentials for writing.  | bool | `false` |
| broker.config.basicAuth.enablePublicBadgeAccess | Set this to true to allow status badges to be embedded in README files without requiring a hardcoded password. | bool | `false` |
| broker.config.basicAuth.enabled | Set to true if you basic authentication to be enabled  | bool | `false` |
| broker.config.basicAuth.publicHeartbeat | Set to true if you want the heartbeat endpoint to be publicly accessible. This will have to be true if you have enabled basic auth. | bool | `true` |
| broker.config.basicAuth.readUser.existingSecret | Name of an existing Kubernetes secret containing credentials to access the Pact Broker | string | `""` |
| broker.config.basicAuth.readUser.existingSecretPasswordKey | The key to which holds the value of the password within the existingSecret | string | `""` |
| broker.config.basicAuth.readUser.existingSecretUsernameKey | The key to which holds the value of the username within the existingSecret | string | `""` |
| broker.config.basicAuth.readUser.password | Password for read access to the Pact Broker | string | `""` |
| broker.config.basicAuth.readUser.username | Username for read access to the Pact Broker | string | `""` |
| broker.config.basicAuth.writeUser.existingSecret | Name of an existing Kubernetes secret containing credentials to access the Pact Broker | string | `""` |
| broker.config.basicAuth.writeUser.existingSecretPasswordKey | The key to which holds the value of the password within the existingSecret | string | `""` |
| broker.config.basicAuth.writeUser.existingSecretUsernameKey | The key to which holds the value of the username within the existingSecret | string | `""` |
| broker.config.basicAuth.writeUser.password | Password for write access to the Pact Broker | string | `""` |
| broker.config.basicAuth.writeUser.username | Username for write access to the Pact Broker | string | `""` |
| broker.config.checkForPotentialDuplicatePacticipantNames | When a pact is published, the consumer, provider and consumer version resources are automatically created. To prevent a pacticipant (consumer or provider) being created multiple times with slightly different name variants (eg. FooBar/foo-bar/foo bar/Foo Bar Service), a check is performed to determine if a new pacticipant name is likely to be a duplicate of any existing applications. If it is deemed similar enough to an existing name, a 409 will be returned. | bool | `true` |
| broker.config.createDeployedVersionsForTags | When true and a tag is created, if there is an environment with the name of the newly created tag, a deployed version is also created for the pacticipant version. | bool | `true` |
| broker.config.databaseClean.cronSchedule | Set to a cron schedule that will run when your Broker is under the least operational load. | string | `"15 2 * * *"` |
| broker.config.databaseClean.deletionLimit | The maximum number of records to delete at a time for each of the removable data categories. | int | `500` |
| broker.config.databaseClean.dryRun | Defaults to false. Set to true to see the output of what would have been deleted if the task had run. | bool | `false` |
| broker.config.databaseClean.enabled | Set to true to enable the automatic data cleanup. | bool | `false` |
| broker.config.databaseClean.keepVersionSelectors | A JSON string containing a list of the "keep" selectors. | string | `"[{\"latest\": true}, { \"max_age\": 180 }]"` |
| broker.config.databaseClean.mode | Set the mode of the cleanup task. Can either be `embedded` or `external`. Setting the mode to `external` will create a Kubernetes `CronJob` to handle the cleanup; thus implementing https://docs.pact.io/pact_broker/docker_images/pactfoundation#running-the-clean-task-from-an-external-source | string | `"embedded"` |
| broker.config.databaseClean.overwrittenDataMaxAge | The maximum number of days to keep "overwritten" data. | int | `90` |
| broker.config.databaseConnectMaxRetries | Setting the max retries to a non-zero number will allow it to retry the connection the configured number of times, waiting 3 seconds between attempts. | int | `0` |
| broker.config.databaseConnectionValidationTimeout |  | int | `3600` |
| broker.config.databaseMaxConnections | The maximum size of the connection pool (4 connections by default on most databases) | int | `4` |
| broker.config.databasePoolTimeout | The number of seconds to wait if a connection cannot be acquired before raising an error | int | `5` |
| broker.config.databaseSslmode | The Postgresql ssl mode. Allowed values: disable, allow, prefer, require, verify-ca, verify-full | string | `"prefer"` |
| broker.config.databaseStatementTimeout | The number of seconds after which an SQL query will be aborted. Only supported for Postgresql connections. | int | `15` |
| broker.config.disable_ssl | If set to true, SSL verification will be disabled for the HTTP requests made by the webhooks | bool | `false` |
| broker.config.enableDiagnosticEndpoints | Whether or not to enable the diagnostic endpoints at /diagnostic/status/heartbeat and "diagnostic/status/dependencies | bool | `true` |
| broker.config.features | A list of features to enable in the Pact Broker for beta testing before public release. | string | `nil` |
| broker.config.hidePactflowMessages | Set to true to hide the messages in the logs about PactFlow | bool | `true` |
| broker.config.httpDebugLoggingEnabled | Enable this setting to print the entire request and response to the logs at debug level. Do not leave this on permanently, as it will have performance and security issues. Ensure the application log_level is set to debug when this setting is enabled. | bool | `false` |
| broker.config.logFormat | The application log format. Can be any value supported by Semantic Logger. Allowed values: default, json, color | string | `"default"` |
| broker.config.logLevel | The application log level Allowed values: debug, info, warn, error, fatal | string | `"info"` |
| broker.config.mainBranchCandidates | An array of potential main branch names used when automatically detecting the main branch for a pacticipant. | string | `"develop main master"` |
| broker.config.metricsSqlStatementTimeout | The number of seconds after which the SQL queries used for the metrics endpoint will be aborted. This is configurable separately from the standard database_statement_timeout as it may need to be significantly longer than the desired value for standard queries. | int | `30` |
| broker.config.pactContentDiffTimeout | The maximum amount of time in seconds to attempt to generate the diff between two pacts before aborting the request. | int | `15` |
| broker.config.shieldsIoBaseUrl | The URL of the shields.io server used to generate the README badges. | string | `"https://img.shields.io"` |
| broker.config.sqlEnableCallerLogging | When enabled it logs source path that caused SQL query. | bool | `false` |
| broker.config.sqlLogLevel | The log level that will be used when the SQL query statements are logged. Allowed values: none, debug, info, warn, error, fatal | string | `"none"` |
| broker.config.sqlLogWarnDuration | The number of seconds after which to log an SQL query at warn level. Use this for detecting slow queries. | int | `5` |
| broker.config.useFirstTagAsBranch | When true, the first tag applied to a version within the use_first_tag_as_branch_time_limit (10 seconds) will be used to populate the branch property of the version. | bool | `true` |
| broker.config.useHalBrowser | Whether or not to enable the embedded HAL Browser. | bool | `true` |
| broker.config.webhookHostWhitelist | A list of hosts, network ranges, or host regular expressions. | string | `nil` |
| broker.config.webhookHttpCodeSuccess | If webhook call returns the response with an HTTP code that is listed in the success codes then the operation is considered a success, otherwise the webhook will be re-triggered based on the webhook_retry_schedule configuration. | string | `"200 201 202 203 204 205 206"` |
| broker.config.webhookHttpMethodWhitelist | The allowed HTTP methods for webhooks. It is highly recommended that only POST requests are allowed to ensure that webhooks cannot be used to retrieve sensitive information from hosts within the same network. | string | `"POST"` |
| broker.config.webhookRetrySchedule | The schedule of seconds to wait between webhook execution attempts. The default schedule is 10 sec, 1 min, 2 min, 5 min, 10 min, 20 min (38 minutes in total). | string | `"10 60 120 300 600 1200"` |
| broker.config.webhookSchemeWhitelist | The allowed URL schemes for webhooks. | string | `"https"` |
| broker.containerPorts.http | http port | int | `9292` |
| broker.containerPorts.https | http port | int | `8443` |
| broker.containerSecurityContext.enabled | Enable Pact Broker containers' Security Context | bool | `true` |
| broker.containerSecurityContext.runAsNonRoot | Set Pact Broker container's Security Context runAsNonRoot | bool | `true` |
| broker.containerSecurityContext.runAsUser | Set Pact Broker container's Security Context runAsUser | int | `1001` |
| broker.extraContainers | Additional containers to add to the Pact Broker pods | list | `[]` |
| broker.labels | Additional labels that can be added to the Broker deployment | object | `{}` |
| broker.livenessProbe.enabled | Enable livenessProbe on Pact Broker containers | bool | `true` |
| broker.livenessProbe.failureThreshold | Failure threshold for livenessProbe | int | `3` |
| broker.livenessProbe.initialDelaySeconds | Initial delay seconds for livenessProbe | int | `300` |
| broker.livenessProbe.periodSeconds | Period seconds for livenessProbe | int | `1` |
| broker.livenessProbe.successThreshold | Success threshold for livenessProbe | int | `1` |
| broker.livenessProbe.timeoutSeconds | Timeout seconds for livenessProbe | int | `5` |
| broker.nodeSelector | Pact Broker [Node Selector](https://kubernetes.io/docs/user-guide/node-selection/) | object | `{}` |
| broker.podDisruptionBudget.maxUnavailable | Max Unavailable Pods (alternatively one can define `minAvailable`) | int | `1` |
| broker.podSecurityContext.enabled | Enable Pact Broker pods' Security Context | bool | `true` |
| broker.podSecurityContext.fsGroup | Set Pact Broker pod's Security Context fsGroup | int | `1001` |
| broker.readinessProbe.enabled | Enable readinessProbe on Pact Broker containers | bool | `true` |
| broker.readinessProbe.failureThreshold | Failure threshold for readinessProbe | int | `3` |
| broker.readinessProbe.initialDelaySeconds | Initial delay seconds for readinessProbe | int | `30` |
| broker.readinessProbe.periodSeconds | Period seconds for readinessProbe | int | `10` |
| broker.readinessProbe.successThreshold | Success threshold for readinessProbe | int | `1` |
| broker.readinessProbe.timeoutSeconds | Timeout seconds for readinessProbe | int | `1` |
| broker.replicaCount | Number of Pact Broker replicas to deploy | int | `1` |
| broker.resources.limits.cpu |  | string | `"2500m"` |
| broker.resources.limits.memory |  | string | `"1024Mi"` |
| broker.resources.requests.cpu |  | string | `"100m"` |
| broker.resources.requests.memory |  | string | `"512Mi"` |
| broker.revisionHistoryLimit | Number of Deployment Revisions to set | int | `10` |
| broker.tolerations | Pact Broker [Tolerations](https://kubernetes.io/docs/concepts/configuration/taint-and-toleration/) | list | `[]` |
| broker.volumeMounts | Volume mounts | list | `[]` |
| broker.volumes | Volumes to mount | list | `[]` |
| externalDatabase.config.adapter | Database engine to use. Only allowed values are `postgres` or `sqlite`. More info [here](https://docs.pact.io/pact_broker/docker_images/pactfoundation#getting-started) | string | `""` |
| externalDatabase.config.auth.existingSecret | Name of an existing Kubernetes secret containing the database credentials | string | `""` |
| externalDatabase.config.auth.existingSecretPasswordKey | The key to which the password will be stored under within existing secret. | string | `"user-password"` |
| externalDatabase.config.auth.password | Password for the non-root username for the Pact Broker | string | `""` |
| externalDatabase.config.auth.username | Non-root username for the Pact Broker | string | `""` |
| externalDatabase.config.databaseName | External database name | string | `""` |
| externalDatabase.config.host | Database host | string | `""` |
| externalDatabase.config.port | Database port number | string | `""` |
| externalDatabase.enabled | Switch to enable or disable the externalDatabase connection | bool | `false` |
| image.pullPolicy | Specify a imagePullPolicy Defaults to 'Always' if image tag is 'latest', else set to 'IfNotPresent' more info [here](https://kubernetes.io/docs/user-guide/images/#pre-pulling-images)  | string | `"IfNotPresent"` |
| image.pullSecrets | Array of imagePullSecrets to allow pulling the Pact Broker image from private registries. PS: Secret's must exist in the namespace to which you deploy the Pact Broker. more info [here](https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/)  Example:   pullSecrets:    - mySecretName  | list | `[]` |
| image.registry | Pact Broker image registry | string | `"docker.io"` |
| image.repository | Pact Broker image repository | string | `"pactfoundation/pact-broker"` |
| image.tag | Pact Broker image tag (immutable tags are recommended) | string | `"2.105.0.1"` |
| ingress.annotations | ingress.annotations Additional annotations for the Ingress resource | object | `{}` |
| ingress.className | ingress.className Name of the IngressClass cluster resource which defines which controller will implement the resource (e.g nginx) | string | `""` |
| ingress.enabled | ingress.enabled Enable the creation of the ingress resource | bool | `true` |
| ingress.host | host Hostname to be used to expose the route to access the Pact Broker | string | `""` |
| ingress.tls.enabled | ingress.tls.enabled Enable TLS configuration for the host defined at `ingress.host` parameter | bool | `false` |
| ingress.tls.secretName | ingress.tls.secretName The name to which the TLS Secret will be called | string | `""` |
| postgresql.architecture | PostgreSQL architecture (`standalone` or `replication`) | string | `"standalone"` |
| postgresql.auth.database | Name for a custom database to create | string | `"bitnami_broker"` |
| postgresql.auth.existingSecret | Name of existing secret to use for PostgreSQL credentials | string | `""` |
| postgresql.auth.password | Password for the custom user to create | string | `""` |
| postgresql.auth.secretKeys.adminPasswordKey | The key in which Postgres well look for, for the admin password, in the existing Secret | string | `"admin-password"` |
| postgresql.auth.secretKeys.replicationPasswordKey | The key in which Postgres well look for, for the replication password, in the existing Secret | string | `"replication-password"` |
| postgresql.auth.secretKeys.userPasswordKey | The key in which Postgres well look for, for the user password, in the existing Secret | string | `"user-password"` |
| postgresql.auth.username | Name for a custom user to create | string | `"bn_broker"` |
| postgresql.enabled | Switch to enable or disable the PostgreSQL helm chart | bool | `true` |
| service.clusterIP | Pact Broker service clusterIP | string | `""` |
| service.loadBalancerIP | Pact Broker Service [loadBalancerIP](https://kubernetes.io/docs/user-guide/services/#type-loadbalancer) | string | `""` |
| service.nodePorts.http | http nodePort | string | `""` |
| service.nodePorts.https | https nodePort | string | `""` |
| service.ports.http | Pact service HTTP port | int | `80` |
| service.ports.https | Pact service HTTPS port | int | `443` |
| service.type | Kubernetes service type  | string | `"ClusterIP"` |
| serviceAccount.annotations | Additional custom annotations for the ServiceAccount. | object | `{}` |
| serviceAccount.automountServiceAccountToken | Auto-mount the service account token in the pod | bool | `true` |
| serviceAccount.create | Enable the creation of a ServiceAccount for Pact Broker pods | bool | `true` |
| serviceAccount.imagePullSecrets | Name of image pull secrets that should be attached to the service account | list | `[]` |
| serviceAccount.labels | Additional custom labels to the service ServiceAccount. | object | `{}` |
| serviceAccount.name | Name of the ServiceAccount If `serviceAccount.create` is `true` and `serviceAccount.name` is not set, a name is generated based on the release name. If `serviceAccount.create` is `true` and `serviceAccount.name` is set, a service account is created and named after value set in `serviceAccount.name` If `serviceAccount.create` is `false` and `serviceAccount.name` is not set, the `default` service account is used for the Deployment. If `serviceAccount.create` is `false` and `serviceAccount.name` is set, the service account specified at `serviceAccount.name` is used for the Deployment. | string | `""` |

## Configuration and Installation Details

### Configuring Chart PostgreSQL

With the Pact Broker Helm Chart, it bundles together the Pact Broker and a Bitnami PostgreSQL database - this can be enabled by switching `postgresql.enabled` to true (it is `true` by default). If switched on, the Helm Chart, on deployment, will automatically deploy a PostgreSQL instance and configure it with the credentials you specify. There are multiple ways of doing this that will be detailed below.

#### Automatic Database Credential Creation
This is the easiest of the configuration options. Here, the credentials for both the Admin and Database user will be automatically generated and put into a Kubernetes secret. This then will be automatically used by the Pact Broker. For this, ensure the following happens:
  - Keep `postgresql.auth.existingSecret` & `postgresql.auth.password` empty.

#### Specifying Password for PostgreSQL to Use
Here, you can specify the password that you want PostgreSQL to use for it's Database User (The user that the Pact Broker will use to connect to the database). For this, ensure the following happens:
  - Keep the `postgresql.auth.existingSecret` empty.
  - Set the `postgresql.auth.password` to the value that you want the User password to be.
  > **_NOTE:_** Be careful and mindful that the value you provide here is done in a secure way.

#### Specifying Existing Secret for PostgreSQL to Use
Here, you can specify an existing Kubernetes secret that you have created that contains the Password that you want PostgreSQL to use. The secret has to be in the same namespace as where you are deploying the Helm Chart. For this, ensure the following happens:
  - Create the Kubernetes secret with the Password inside.
  - Set `postgresql.auth.existingSecret` to the name of the Secret
  - PostgreSQL by default will look for the relevant Password keys that are set by default here `postgresql.auth.secretKeys`. So make sure that the Keys in the Secret match the default `secretKeys` values. More information [here](https://artifacthub.io/packages/helm/bitnami/postgresql)
  - For example, if you want PostgreSQL to use an existing Secret called `my-user-secret` that has the User password that you want to use inside it. Make sure that you create a Key inside that secret called `user-password` (this key can be found here `postgresql.auth.secretKeys.userPasswordKey`). i.e. `user-password=Password123`.

### Configuring External Database
If you want to use an external database with your Pact Broker, switch the `externalDatabase.enabled` flag to true and the `postgresql.enabled` to false.

The configuring of the `externalDatabase.config.host`, `externalDatabase.config.port`, `externalDatabase.config.adapter` and `externalDatabase.config.databaseName` should be pretty straight forward. The credential configuration however has two methods of configuration.

#### Specify Credentials via Values
Configure the Pact Broker by using the username credential that you configure via the `externalDatabase.config.auth.username` value and the password via the `externalDatabase.config.auth.password` value.
  > **_NOTE:_** Be careful and mindful that the values you provide here is done in a secure way.

#### Specify Credentials via Secret
Configure the Pact Broker to use an existing Secret to retrieve the user password as a means to connect to the database. Ensure that the Kubernetes Secret has the password in the `user-password` field and ensure that you have set `externalDatabase.config.auth.existingSecret` value to the name of the secret. To configure the username, you can use the `username` value.

### Database Clean Task
Pact Broker [automatic data cleanup](https://docs.pact.io/pact_broker/docker_images/pactfoundation#automatic-data-clean-up) can be enabled by setting the property `broker.config.databaseClean.enabled` to `true`.

By default and for simple installations, one could rely on the built-in integrated mode of the cleanup (the property `broker.config.databaseClean.mode` having the value `embedded`).

For a more advanced setup e.g. in highly available installations with more than one replica, one should rely on the [external source pattern](https://docs.pact.io/pact_broker/docker_images/pactfoundation#running-the-clean-task-from-an-external-source) of running the clean task. That can be achieved by setting the property `broker.config.databaseClean.mode` to external, which would result in having a `CronJob` performing the cleanup task instead of the main application Pods.
