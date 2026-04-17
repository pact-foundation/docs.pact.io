---
title: SmartBear MCP Server
sidebar_label: SmartBear MCP
custom_edit_url: https://github.com/pactflow/pact-agent-skills/edit/main/docs/ai-tools/smartbear-mcp.md
---
<!-- This file has been synced from the pactflow/pact-agent-skills repository. Please do not edit it directly. The URL of the source file can be found in the custom_edit_url value above -->

The `@smartbear/mcp` package is a [Model Context Protocol](https://modelcontextprotocol.io) server that exposes your PactFlow or Pact Broker workspace as a set of `contract-testing_*` tools. When configured alongside the [PactFlow skill](/ai_tools/pactflow-skill), your AI assistant gains structured, programmatic access to your workspace — direct matrix queries and full management of every broker resource. On PactFlow Cloud ☁, it also unlocks AI-assisted test generation and review using your live provider states, BDCT cross-contract verification results, and team metrics.

For the official SmartBear documentation on the MCP server, see the [SmartBear MCP contract testing docs](https://developer.smartbear.com/smartbear-mcp/docs/contract-testing-with-pactflow).

Without the MCP server, the skill can still interact with your broker via the `pact-broker` CLI if it is installed and credentials are set in the environment. The CLI covers the core operations — publishing pacts, can-i-deploy, recording deployments, managing environments and webhooks — but does not expose the contract matrix, AI generation tools, or BDCT results. See the [comparison table](/ai_tools/pactflow-skill#skill-vs-pact-cli-vs-full-plugin) for the full breakdown.

:::tip Open-source Pact Broker and PactFlow Cloud
The skill and MCP server work with both the open-source Pact Broker and PactFlow Cloud. Features marked ☁ require a PactFlow Cloud account. All other capabilities work with Pact and any Pact Broker. PactFlow-specific capabilities include: Drift testing, AI test generation and review, bi-directional contract testing, team metrics, the audit log, and all administration tools.
:::

## Installation and configuration

If the PactFlow skill is already active, you can ask it to install and configure the MCP server for you:

```
Set up the SmartBear MCP server
```

For manual setup, see the [PactFlow Skill](/ai_tools/pactflow-skill#adding-a-live-broker-connection) page for full instructions per tool (Claude Code, Claude Desktop, VS Code, Cursor). The short version:

```bash
# Claude Code — plugin install handles this automatically
/plugin install swagger-contract-testing@pactflow-agent-skills

# All other tools — run the MCP server via npx
npx @smartbear/mcp@latest
```

**Required environment variables:**

| Variable               | Required for       | Description                                                 |
| ---------------------- | ------------------ | ----------------------------------------------------------- |
| `PACT_BROKER_BASE_URL` | All                | Full URL to your broker, e.g. `https://yourorg.pactflow.io` |
| `PACT_BROKER_TOKEN`    | PactFlow Cloud     | API token from `Settings → API Tokens`                      |
| `PACT_BROKER_USERNAME` | Open-source broker | HTTP Basic Auth username                                    |
| `PACT_BROKER_PASSWORD` | Open-source broker | HTTP Basic Auth password                                    |

Use a token **or** username/password — not both.

---

## AI tools ☁ Cloud only

### `contract-testing_generate_pact_tests`

Generates a complete, runnable Pact test using PactFlow AI. Accepts any combination of inputs and returns idiomatic test code in the target language with correct matching rules applied.

**Inputs:**

| Parameter                   | Description                                                                                                                                                        |
| --------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `language`                  | Target language (`javascript`, `typescript`, `java`, `kotlin`, `go`, `dotnet`, `ruby`, `python`, `php`, `swift`). Inferred if omitted and code files are provided. |
| `request_response.request`  | Raw HTTP request string or description                                                                                                                             |
| `request_response.response` | Raw HTTP response string or description                                                                                                                            |
| `code`                      | Array of code files (API client, models, utilities) to generate from                                                                                               |
| `openapi.document`          | OpenAPI spec content (inline)                                                                                                                                      |
| `openapi.matcher`           | Filter to a specific endpoint, method, or status code within a spec (e.g. `GET /orders 200`)                                                                       |
| `openapi.remoteDocument`    | URL to a remote OpenAPI spec, with optional `auth` credentials                                                                                                     |
| `additional_instructions`   | Extra constraints — framework version, test runner, naming conventions                                                                                             |
| `test_template`             | An existing test file to use as a structural template, so output matches your team's conventions                                                                   |

The [pact-generator subagent](/ai_tools/pactflow-skill#pact-generator) always calls `contract-testing_get_provider_states` before invoking this tool, ensuring generated tests reuse existing provider state names from your workspace rather than creating duplicates.

**Example:**

```
Generate a consumer test for the POST /orders endpoint.
Use TypeScript with pact-js v13 and Vitest.
Check what provider states already exist for OrderService first.
```

---

### `contract-testing_review_pact_tests`

Reviews existing Pact tests against best practices and returns a prioritised list of findings.

**Inputs:**

| Parameter                                           | Description                                                                                                |
| --------------------------------------------------- | ---------------------------------------------------------------------------------------------------------- |
| `pact_tests`                                        | Test files to review — required                                                                            |
| `code`                                              | Supporting files for context (API client, models)                                                          |
| `openapi.document` / `.matcher` / `.remoteDocument` | API spec for additional context                                                                            |
| `user_instructions`                                 | Areas to focus on, e.g. "check matching rules" or "focus on provider state naming"                         |
| `error_messages`                                    | Output from a failing test run or broken provider verification — the review will target the actual failure |

The [pact-reviewer subagent](/ai_tools/pactflow-skill#pact-reviewer) uses this tool as the core of its review process, passing your files and any error output directly to it.

**Example:**

```
Review the Pact tests in src/__tests__/consumer.test.ts.
My provider verification is failing with this error:
[paste error output]
```

---

### `contract-testing_check_pactflow_ai_entitlements`

Diagnoses 401 errors or missing-credit issues when the AI generation or review tools fail. Takes no parameters. Returns a plain-language explanation of your account's current AI entitlement state — whether you have credits remaining, whether the feature is enabled on your plan, and what to do if it isn't.

Both pact-generator and pact-reviewer call this automatically when they receive a 401, before falling back to non-AI generation.

---

## Deployment safety

### `contract-testing_can_i_deploy`

The deployment safety gate. Checks the contract matrix to determine whether a specific version of a service is safe to deploy to a given environment. Run this in CI **before** deploying.

**Parameters:** `pacticipant` (required), `version` (required), `environment` (required — use the environment name, e.g. `production`)

Returns a success or failure result with a human-readable explanation. When it fails, use `contract-testing_matrix` to diagnose the root cause.

**Example:**

```
Is FrontendApp version abc123 safe to deploy to production?
```

---

### `contract-testing_matrix`

Queries the contract verification matrix — the source of truth for what has and hasn't been verified. Use this to diagnose can-i-deploy failures, investigate a specific consumer-provider pair, or get an overview of verification state.

**Key parameters:**

| Parameter  | Description                                                                                                                                                             |
| ---------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `q`        | Array of 1–2 pacticipant selectors. Each selector has `pacticipant` and one of: `version`, `branch`, `environment`, `latest`, `tag`, `mainBranch`, `deployedOrReleased` |
| `latestby` | `cvp` — latest result per consumer version + provider; `cvpv` — latest per consumer version + provider version                                                          |
| `limit`    | Max rows to return (1–1000, default 100)                                                                                                                                |

**Reading the results:**

| Matrix row state             | Meaning                                                  |
| ---------------------------- | -------------------------------------------------------- |
| No row exists                | Provider has never verified this consumer version        |
| Row exists, `success: null`  | Verification is in progress or results weren't published |
| Row exists, `success: false` | Provider verified and it failed — genuine contract break |
| Row exists, `success: true`  | Verified and passing                                     |

**Diagnosing a can-i-deploy failure:**

```
# Step 1: check what's actually deployed in production
contract-testing_get_currently_deployed_versions  →  environmentId: <prod-uuid>

# Step 2: query the matrix for this consumer version vs what's in production
contract-testing_matrix
  q: [
    { pacticipant: "FrontendApp", version: "abc123" },
    { pacticipant: "OrderService", deployed: true, environment: "production" }
  ]
  latestby: "cvp"
```

| Root cause                     | Fix                                                                                 |
| ------------------------------ | ----------------------------------------------------------------------------------- |
| No matrix row (never verified) | Provider is missing `{ deployedOrReleased: true }` in `consumerVersionSelectors`    |
| `success: false`               | Genuine contract break — fix the failing interaction                                |
| Results not published          | Provider CI missing `publishVerificationResults: true` and `providerVersion` config |
| No webhook firing              | Create a webhook for `contract_requiring_verification_published`                    |

---

## Contracts

### `contract-testing_publish_consumer_contracts`

Publishes consumer pact files to the broker. Run in consumer CI after tests pass.

**Key parameters:**

| Parameter                  | Description                                                                                                                                    |
| -------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------- |
| `pacticipantName`          | Consumer name as registered in the broker                                                                                                      |
| `pacticipantVersionNumber` | Version number — use the git SHA                                                                                                               |
| `branch`                   | Consumer branch name — use `$GIT_BRANCH`                                                                                                       |
| `contracts`                | Array of pact objects: `{ consumerName, providerName, content (base64-encoded JSON), contentType: "application/json", specification: "pact" }` |
| `buildUrl`                 | CI build URL for traceability                                                                                                                  |

:::tip Always publish with branch
Publishing without `branch` means the broker can't use `{ mainBranch: true }` or `{ matchingBranch: true }` selectors for this version.
:::

---

### `contract-testing_get_pacts_for_verification`

Fetches the pacts a provider should verify in its current CI run. Called by the provider pipeline, not manually.

**Key parameters:**

| Parameter                  | Description                                                                           |
| -------------------------- | ------------------------------------------------------------------------------------- |
| `providerName`             | Provider name                                                                         |
| `providerVersionBranch`    | Current provider branch — used to resolve `matchingBranch` selectors                  |
| `consumerVersionSelectors` | Array of selectors controlling which consumer versions are verified                   |
| `includePendingStatus`     | `true` — new consumer interactions won't fail the provider build until first verified |
| `includeWipPactsSince`     | ISO 8601 date — include new consumer pacts automatically for early feedback           |

**Recommended selectors:**

```json
[
  { "mainBranch": true },
  { "matchingBranch": true },
  { "deployedOrReleased": true }
]
```

Missing `{ "deployedOrReleased": true }` is the single most common cause of can-i-deploy failures — without it the provider never verifies the version currently in production.

---

### `contract-testing_get_provider_states`

Lists all provider states defined for a provider across all published pacts. **Always call this before generating new consumer tests** — it lets you reuse existing state names and avoid duplication.

**Parameter:** `provider` (required)

---

### `contract-testing_publish_provider_contract` ☁ Cloud only (BDCT)

Publishes a provider OpenAPI spec and self-verification results to PactFlow. Used in the [BDCT flow](#bi-directional-contract-testing-cloud-only) instead of running consumer pact tests on the provider.

**Key parameters:**

| Parameter                                   | Description                                                                       |
| ------------------------------------------- | --------------------------------------------------------------------------------- |
| `providerName`                              | Provider name                                                                     |
| `pacticipantVersionNumber`                  | Version number — use git SHA                                                      |
| `branch`                                    | Provider branch                                                                   |
| `contract.content`                          | Base64-encoded OpenAPI spec (YAML or JSON)                                        |
| `contract.contentType`                      | `application/yaml` or `application/json`                                          |
| `contract.specification`                    | Must be `oas`                                                                     |
| `contract.selfVerificationResults.success`  | `true` or `false` — whether the provider's own verification tool passed           |
| `contract.selfVerificationResults.verifier` | Tool used for self-verification: `dredd`, `schemathesis`, `postman`, `curl`, etc. |

The `selfVerificationResults.success` boolean is critical. PactFlow will not mark the provider as verified unless this is `true`.

---

## Pacticipants

Pacticipants are the services registered in your workspace. Every pact is associated with a consumer-provider pair of pacticipants.

| Tool                                  | What it does                                                                                              |
| ------------------------------------- | --------------------------------------------------------------------------------------------------------- |
| `contract-testing_list_pacticipants`  | List all registered services. Optional: `pageNumber`, `pageSize`                                          |
| `contract-testing_get_pacticipant`    | Get metadata for a service                                                                                |
| `contract-testing_create_pacticipant` | Register a new service. Set `mainBranch` on creation so `{ mainBranch: true }` selectors work immediately |
| `contract-testing_patch_pacticipant`  | Partially update a service (only provided fields change). Preferred for targeted changes                  |
| `contract-testing_update_pacticipant` | Fully replace a service's metadata — clears fields not provided                                           |
| `contract-testing_delete_pacticipant` | Delete a service and all its data. Irreversible. Check for active deployments first                       |

**Registering a new service:**

```
contract-testing_create_pacticipant
  name: "PaymentService"
  displayName: "Payment Service"
  mainBranch: "main"
  repositoryUrl: "https://github.com/example/payment-service"
```

**Setting the main branch on an existing service:**

```
contract-testing_patch_pacticipant
  pacticipantName: "PaymentService"
  mainBranch: "main"
```

---

## Branches and versions

Branches are a first-class concept in the Pact Broker (from v2.82.0). They supersede tags for tracking which pacts belong to which development line.

| Tool                                                 | What it does                                                           |
| ---------------------------------------------------- | ---------------------------------------------------------------------- |
| `contract-testing_list_branches`                     | List branches for a service. Optional: `q` (name filter)               |
| `contract-testing_get_branch`                        | Get branch metadata                                                    |
| `contract-testing_get_branch_versions`               | List versions published from a branch                                  |
| `contract-testing_delete_branch`                     | Delete a branch and its version associations. Clean up after PRs merge |
| `contract-testing_list_pacticipant_versions`         | List all versions for a service                                        |
| `contract-testing_get_pacticipant_version`           | Get metadata for a specific version                                    |
| `contract-testing_get_latest_pacticipant_version`    | Get the most recent version, optionally filtered by tag                |
| `contract-testing_get_deployed_versions_for_version` | Check deployment records for a version in a specific environment       |
| `contract-testing_get_released_versions_for_version` | Check release records for a version (mobile/library workflows)         |

:::tip Branch cleanup
Delete merged feature branches with `contract-testing_delete_branch` to keep the workspace clean. The associated versions are cleaned up automatically. Never delete a branch that has deployed versions without checking first.
:::

---

## Environments and deployments

Environments are named deployment targets (e.g. `staging`, `production`). The broker needs to know what is deployed where in order for can-i-deploy to work correctly.

### Managing environments

| Tool                                  | What it does                                                              |
| ------------------------------------- | ------------------------------------------------------------------------- |
| `contract-testing_list_environments`  | List all environments and their UUIDs                                     |
| `contract-testing_get_environment`    | Get details for a specific environment                                    |
| `contract-testing_create_environment` | Create an environment. Set `production: true` for production environments |
| `contract-testing_update_environment` | Replace environment config                                                |
| `contract-testing_delete_environment` | Delete an environment and all its deployment/release records              |

**Creating environments:**

```
contract-testing_create_environment  name: "staging"     production: false
contract-testing_create_environment  name: "production"  production: true
```

Environment UUIDs are needed for recording deployments. Retrieve them with `contract-testing_list_environments`.

### Recording deployments

Use `contract-testing_record_deployment` for traditional services where one version is active per environment at a time. Recording a new deployment automatically marks the previous version as undeployed.

```
contract-testing_record_deployment
  pacticipantName: "FrontendApp"
  versionNumber: "abc1234"
  environmentId: "<uuid-of-production>"
  applicationInstance: "blue"   # optional — for blue/green deployments
```

### Recording releases

Use `contract-testing_record_release` for mobile apps and shared libraries where multiple versions coexist simultaneously. Unlike `record_deployment`, this does not mark previous versions as inactive — all released versions remain "supported".

```
contract-testing_record_release
  pacticipantName: "MobileApp"
  versionNumber: "3.2.1"
  environmentId: "<uuid-of-production>"
```

### Checking what is deployed

```
# What is currently deployed in production?
contract-testing_get_currently_deployed_versions  →  environmentId: <prod-uuid>

# What versions are currently supported (mobile/library)?
contract-testing_get_currently_supported_versions  →  environmentId: <prod-uuid>
```

---

## Bi-Directional Contract Testing ☁ Cloud only

BDCT removes the need for the provider to run consumer Pact tests. Instead, the provider publishes its OpenAPI spec and the results of a self-verification tool (Dredd, Schemathesis, Postman). PactFlow performs the cross-contract comparison automatically.

See [BDCT vs Standard Pact](#bdct-vs-standard-pact) for a comparison of the two approaches.

### Investigating a BDCT failure

Work from broad to specific:

**1. Overall cross-contract result for a provider version**

```
contract-testing_get_bdct_cross_contract_verification_results
  providerName: "OrderService"
  providerVersionNumber: "def5678"
```

Shows the overall pass/fail and which consumer pact interactions failed the spec comparison.

**2. Provider self-verification results**

```
contract-testing_get_bdct_provider_contract_verification_results
  providerName: "OrderService"
  providerVersionNumber: "def5678"
```

The output of the provider's own spec-verification tool. If `success: false`, the provider's implementation doesn't match its own spec — fix the implementation or the spec before BDCT can pass.

**3. Consumer contracts used in the comparison**

```
contract-testing_get_bdct_consumer_contracts
  providerName: "OrderService"
  providerVersionNumber: "def5678"
```

Lists all consumer pact files PactFlow used in the cross-contract verification.

**4. Pinpoint a specific consumer-provider version pair**

When you know which consumer version is failing:

```
contract-testing_get_bdct_cross_contract_verification_results_by_consumer_version
  providerName: "OrderService"
  providerVersionNumber: "def5678"
  consumerName: "CheckoutApp"
  consumerVersionNumber: "abc1234"
```

Additional by-consumer-version tools available for: `get_bdct_consumer_contract_by_consumer_version`, `get_bdct_provider_contract_by_consumer_version`, `get_bdct_provider_contract_verification_results_by_consumer_version`, `get_bdct_consumer_contract_verification_results_by_consumer_version`.

### Common BDCT failure patterns

| Failure message                                 | Root cause                                            | Fix                                                                                         |
| ----------------------------------------------- | ----------------------------------------------------- | ------------------------------------------------------------------------------------------- |
| `$.body.X is not defined in the spec`           | Provider returns field X but spec doesn't document it | Update the spec to document it                                                              |
| `$.body.X type mismatch`                        | Spec type doesn't match implementation                | Fix the spec to match what the provider actually returns                                    |
| `Path /foo not found in spec`                   | Provider implements the path but spec is missing it   | Add the path to the spec                                                                    |
| `Self-verification failed`                      | Provider's implementation doesn't match its own spec  | Fix the implementation or the spec                                                          |
| BDCT fails even though self-verification passed | Spec is too strict for what the consumer expects      | Check for `additionalProperties: false`, missing response headers, or overly strict schemas |

### BDCT vs Standard Pact

|                              | Standard Pact                               | BDCT                                               |
| ---------------------------- | ------------------------------------------- | -------------------------------------------------- |
| Provider runs consumer tests | Yes                                         | No                                                 |
| Provider publishes           | Verification results                        | OpenAPI spec + self-verification results           |
| Cross-contract verification  | Done by provider test suite                 | Done by PactFlow automatically                     |
| Consumer side                | Same                                        | Same                                               |
| Availability                 | Cloud, On-Prem, Open Source                 | PactFlow Cloud only                                |
| Best for                     | Tight teams with shared test infrastructure | Loosely coupled teams; existing spec-based testing |

---

## Integrations and network

| Tool                                          | What it does                                                                                                   |
| --------------------------------------------- | -------------------------------------------------------------------------------------------------------------- |
| `contract-testing_list_integrations`          | List all consumer-provider pairings in the workspace                                                           |
| `contract-testing_get_pacticipant_network`    | Get the full integration graph for a service — all consumers that depend on it and all providers it depends on |
| `contract-testing_get_integrations_by_team` ☁ | List integrations owned by a specific team                                                                     |
| `contract-testing_delete_integration`         | Delete a specific consumer-provider pairing and all associated data                                            |
| `contract-testing_delete_all_integrations`    | Delete every integration in the workspace. Irreversible — use only when decommissioning an entire workspace    |

`contract-testing_get_pacticipant_network` is the tool to reach for before making a breaking API change — it shows the blast radius across your entire ecosystem.

```
Which services depend on UserService?
```

---

## Labels

Labels are free-form tags you can apply to pacticipants for grouping and filtering.

| Tool                                             | What it does                                  |
| ------------------------------------------------ | --------------------------------------------- |
| `contract-testing_list_labels`                   | List all labels used in the workspace         |
| `contract-testing_get_pacticipant_label`         | Check whether a label is applied to a service |
| `contract-testing_list_pacticipants_by_label`    | List all services with a given label          |
| `contract-testing_add_label_to_pacticipant`      | Apply a label                                 |
| `contract-testing_remove_label_from_pacticipant` | Remove a label                                |

---

## Metrics

| Tool                                  | What it does                                                               |
| ------------------------------------- | -------------------------------------------------------------------------- |
| `contract-testing_get_metrics`        | Workspace-wide usage statistics — total pacticipants, pacts, verifications |
| `contract-testing_get_team_metrics` ☁ | Per-team breakdown of the same metrics                                     |

---

## Webhooks

Webhooks trigger actions (typically CI builds) when events occur in the broker. The most important use case is triggering provider verification immediately when a consumer publishes a changed pact, rather than waiting for the next scheduled provider CI run.

### Webhook events

| Event                                       | When triggered                                            | Typical use                                                          |
| ------------------------------------------- | --------------------------------------------------------- | -------------------------------------------------------------------- |
| `contract_published`                        | A pact is published for the first time or content changes | Trigger provider verification                                        |
| `contract_requiring_verification_published` | A pact is published and needs verification                | **Recommended** — passes the pact URL directly to the provider build |
| `verification_published`                    | A provider publishes a verification result                | Trigger consumer build to check can-i-deploy                         |
| `provider_verification_succeeded`           | After a successful verification                           | Notify consumer team                                                 |
| `provider_verification_failed`              | After a failed verification                               | Alert provider team                                                  |

### Dynamic variables

These can be used in webhook request bodies and URLs:

```
${pactbroker.consumerName}
${pactbroker.providerName}
${pactbroker.pactUrl}
${pactbroker.verificationResultUrl}
${pactbroker.consumerVersionNumber}
${pactbroker.providerVersionNumber}
${pactbroker.consumerVersionBranch}
${pactbroker.providerVersionBranch}
${pactbroker.githubVerificationStatus}
```

### Managing webhooks

| Tool                                     | What it does                                                                        |
| ---------------------------------------- | ----------------------------------------------------------------------------------- |
| `contract-testing_list_webhooks`         | List all webhook configurations                                                     |
| `contract-testing_get_webhook`           | Get details for a specific webhook                                                  |
| `contract-testing_create_webhook`        | Create a webhook                                                                    |
| `contract-testing_update_webhook`        | Update a webhook                                                                    |
| `contract-testing_delete_webhook`        | Delete a webhook                                                                    |
| `contract-testing_execute_webhook`       | Trigger a webhook manually using the last matching pact event as the test payload   |
| `contract-testing_test_execute_webhooks` | Trigger a webhook with a specific consumer-provider pair as the payload for testing |

**Example — trigger provider CI via GitHub Actions:**

```
contract-testing_create_webhook
  description: "Trigger OrderService verification on pact change"
  events: ["contract_requiring_verification_published"]
  consumer: "FrontendApp"
  provider: "OrderService"
  request:
    method: POST
    url: "https://api.github.com/repos/example/order-service/actions/workflows/pact.yml/dispatches"
    headers:
      Authorization: "Bearer ${user.bearerToken}"
      Content-Type: "application/json"
    body:
      ref: "main"
      inputs:
        pact_url: "${pactbroker.pactUrl}"
```

See the [webhook template library](https://github.com/pactflow/pact-agent-skills/blob/main/pact_broker/webhooks/template_library) for ready-made templates for GitHub Actions, CircleCI, GitLab CI, Jenkins, and Azure DevOps.

---

## Secrets

Secrets store sensitive values (API keys, tokens) for use in webhook configurations. Storing them as secrets means the values aren't exposed in webhook config or logs.

| Tool                             | What it does                                   |
| -------------------------------- | ---------------------------------------------- |
| `contract-testing_list_secrets`  | List all secrets (names and UUIDs, not values) |
| `contract-testing_get_secret`    | Get secret metadata                            |
| `contract-testing_create_secret` | Create a secret. `name` and `value` required   |
| `contract-testing_update_secret` | Update a secret's value                        |
| `contract-testing_delete_secret` | Delete a secret                                |

Reference secrets in webhook headers using `${user.<secret-name>}`.

---

## Audit log ☁ Cloud only

`contract-testing_get_audit_log` returns an audit trail of actions performed in the workspace — who did what and when. Useful for compliance and debugging unexpected state changes.

---

## Account and authentication

| Tool                                      | What it does                                                              |
| ----------------------------------------- | ------------------------------------------------------------------------- |
| `contract-testing_get_current_user`       | Get the identity of the currently authenticated user — name, email, roles |
| `contract-testing_get_system_preferences` | Read system-level preferences for the workspace                           |
| `contract-testing_get_user_preferences`   | Read preferences for the current user                                     |
| `contract-testing_list_api_tokens`        | List API tokens for the current user                                      |
| `contract-testing_regenerate_api_token`   | Regenerate an API token by UUID. The old token is immediately invalidated |

---

## Administration ☁ Cloud only

Administration tools manage users, teams, roles, and system accounts in PactFlow Cloud. These are typically used by workspace administrators during onboarding or access control changes.

### Users

| Tool                                  | What it does                                |
| ------------------------------------- | ------------------------------------------- |
| `contract-testing_admin_list_users`   | List all users in the workspace             |
| `contract-testing_admin_get_user`     | Get details for a specific user             |
| `contract-testing_admin_create_user`  | Create a new user                           |
| `contract-testing_admin_update_user`  | Update a user's details                     |
| `contract-testing_admin_delete_user`  | Remove a user from the workspace            |
| `contract-testing_admin_invite_users` | Send invitation emails to one or more users |

### Teams

| Tool                                           | What it does                               |
| ---------------------------------------------- | ------------------------------------------ |
| `contract-testing_admin_list_teams`            | List all teams                             |
| `contract-testing_admin_get_team`              | Get details for a specific team            |
| `contract-testing_admin_create_team`           | Create a team                              |
| `contract-testing_admin_update_team`           | Update a team's name or settings           |
| `contract-testing_admin_delete_team`           | Delete a team                              |
| `contract-testing_admin_list_team_users`       | List users in a team                       |
| `contract-testing_admin_get_team_user`         | Check whether a specific user is in a team |
| `contract-testing_admin_set_team_users`        | Replace the full user list for a team      |
| `contract-testing_admin_patch_team_users`      | Add or remove specific users from a team   |
| `contract-testing_admin_remove_user_from_team` | Remove a single user from a team           |

### Roles and permissions

| Tool                                           | What it does                            |
| ---------------------------------------------- | --------------------------------------- |
| `contract-testing_admin_list_roles`            | List all roles defined in the workspace |
| `contract-testing_admin_get_role`              | Get details for a specific role         |
| `contract-testing_admin_create_role`           | Create a custom role                    |
| `contract-testing_admin_update_role`           | Update a role's permissions             |
| `contract-testing_admin_delete_role`           | Delete a custom role                    |
| `contract-testing_admin_reset_roles`           | Reset all roles to the system defaults  |
| `contract-testing_admin_list_permissions`      | List all available permissions          |
| `contract-testing_admin_add_role_to_user`      | Assign a role to a user                 |
| `contract-testing_admin_remove_role_from_user` | Remove a role from a user               |
| `contract-testing_admin_set_user_roles`        | Replace a user's full role assignment   |

### System accounts

| Tool                                               | What it does                                              |
| -------------------------------------------------- | --------------------------------------------------------- |
| `contract-testing_admin_create_system_account`     | Create a system account (non-human user for CI pipelines) |
| `contract-testing_admin_get_system_account_tokens` | Get the API tokens for a system account                   |

---

## Troubleshooting

| Symptom                            | Likely cause                                      | Fix                                                                            |
| ---------------------------------- | ------------------------------------------------- | ------------------------------------------------------------------------------ |
| `401 Unauthorized`                 | Wrong or missing token                            | Check `PACT_BROKER_TOKEN` matches the value from the API tokens page           |
| `404 Not Found`                    | Wrong broker URL                                  | Verify `PACT_BROKER_BASE_URL` — no trailing slash, correct subdomain           |
| Tools not appearing                | MCP server not starting                           | Run `npx @smartbear/mcp@latest` in a terminal to see startup errors            |
| AI tools return `401`              | Missing PactFlow AI entitlement                   | Call `contract-testing_check_pactflow_ai_entitlements` to diagnose             |
| can-i-deploy fails unexpectedly    | Provider never verified deployed consumer version | Add `{ deployedOrReleased: true }` to provider's `consumerVersionSelectors`    |
| Verification results not appearing | Results published outside CI                      | `publishVerificationResults` should be `true` only when `CI=true`              |
| Webhook not firing                 | Event type mismatch                               | Use `contract_requiring_verification_published` for triggering provider builds |
