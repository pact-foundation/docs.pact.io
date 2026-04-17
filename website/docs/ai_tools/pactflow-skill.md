---
title: PactFlow AI Assistant Skill
sidebar_label: PactFlow Skill
custom_edit_url: https://github.com/pactflow/pact-agent-skills/edit/main/docs/ai-tools/pactflow-skill.md
---
<!-- This file has been synced from the pactflow/pact-agent-skills repository. Please do not edit it directly. The URL of the source file can be found in the custom_edit_url value above -->

The **PactFlow skill** turns your AI coding assistant into a Pact and PactFlow contract testing expert. It provides deep knowledge of consumer test patterns, provider verification configuration, can-i-deploy diagnostics, and full workspace management — surfaced directly in your editor without leaving your flow.

It ships as part of the [`swagger-contract-testing`](https://github.com/pactflow/pactflow-agent-skills) plugin alongside two companion skills:

- **Drift** ☁ (Spec-based API conformance testing tool, PactFlow Cloud only — [docs](https://pactflow.github.io/drift-docs/))
- **OpenAPI Parser** (spec analysis).

:::tip Works with open-source Pact Broker and PactFlow Cloud
The skill and MCP server work with both the open-source Pact Broker and PactFlow Cloud. Features marked ☁ require a PactFlow Cloud account. All other capabilities work with Pact and any Pact Broker.
PactFlow-specific capabilities include: Drift testing, AI test generation and review, bi-directional contract testing, team metrics, the audit log, and all administration tools.
:::

---

## Skill vs Pact CLI vs Full Plugin

There are three levels of capability depending on what is installed alongside the skill.

|                                                     | Skill only | Skill + Pact CLI | Full plugin (skill + MCP server) |
| --------------------------------------------------- | ---------- | ---------------- | -------------------------------- |
| Pact/PactFlow domain knowledge                      | Yes        | Yes              | Yes                              |
| Writes consumer tests and verification config       | Yes        | Yes              | Yes                              |
| Debugs can-i-deploy failures conceptually           | Yes        | Yes              | Yes                              |
| Connects to your actual broker                      | No         | Yes              | Yes                              |
| Publishes pacts and records deployments             | No         | Yes              | Yes                              |
| Runs can-i-deploy against live data                 | No         | Yes              | Yes                              |
| Lists pacticipants, environments, branches          | No         | Yes              | Yes                              |
| Manages webhooks and environments                   | No         | Yes              | Yes                              |
| Queries the contract matrix directly                | No         | No               | Yes                              |
| Generates tests using your existing provider states | No         | No               | Yes                              |
| AI-assisted test generation ☁                       | No         | No               | Yes                              |
| AI-assisted test review ☁                           | No         | No               | Yes                              |
| BDCT cross-contract verification results ☁          | No         | No               | Yes                              |

**Skill only** — the assistant has expert knowledge but cannot reach your broker. Useful for writing tests from scratch or working through problems offline.

**Skill + Pact CLI** — with the `pact-broker` CLI installed and broker credentials set in the environment, the skill can run shell commands via the Bash tool to publish pacts, run can-i-deploy, record deployments, manage environments and webhooks, and more. This works with both PactFlow Cloud and open-source Pact Broker, and requires no MCP configuration.

**Full plugin (skill + MCP server)** — the [SmartBear MCP server](/ai_tools/smartbear-mcp) exposes `contract-testing_*` tools that go beyond what the CLI supports: direct matrix queries and structured access to every broker resource. On PactFlow Cloud ☁, it also enables AI-assisted test generation and review using your live provider states, BDCT cross-contract verification results, and team metrics. This is the recommended setup for the richest experience.

:::note Pact Plugin Framework
The word "plugin" in this context refers to an AI coding assistant plugin — a bundle of skills and agents for your IDE. It is unrelated to the [Pact Plugin Framework](https://github.com/pactflow/pact-agent-skills/blob/main/plugins/quick_start), which extends Pact with new transports and protocols (gRPC, Protobuf, etc.).
:::

---

## PactFlow Cloud features ☁

The following capabilities require a [PactFlow Cloud](https://pactflow.io) account. They are not available with an open-source Pact Broker.

| Feature                                                                                        | Description                                                                                                                                                                      |
| ---------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [AI-assisted test generation](#writing-consumer-tests)                                         | Generate complete, runnable Pact tests from request/response pairs, API client code, or an OpenAPI spec                                                                          |
| [AI-assisted test review](#ai-assisted-test-review-pactflow-cloud-only)                        | Automated best-practice audit of your existing Pact tests with ranked findings                                                                                                   |
| [Bi-Directional Contract Testing (BDCT)](#bi-directional-contract-testing-pactflow-cloud-only) | Cross-contract verification without the provider running consumer Pact tests — see also the [MCP tool reference](/ai_tools/smartbear-mcp#bi-directional-contract-testing--cloud-only) |
| [Drift](https://pactflow.github.io/drift-docs/)                                                | Detect API drift between your OpenAPI spec and live implementation                                                                                                               |
| [Team metrics](#metrics-and-observability)                                                     | Per-team breakdown of contract testing usage                                                                                                                                     |
| [Workspace administration](/ai_tools/smartbear-mcp#administration--cloud-only)                      | User, team, role, and system account management                                                                                                                                  |
| [Audit log](/ai_tools/smartbear-mcp#audit-log--cloud-only)                                          | Full audit trail of workspace actions                                                                                                                                            |

---

## Installation

For full installation instructions covering Claude Code, GitHub Copilot, Cursor, Windsurf, Kiro, Codex, OpenCode, Antigravity, and more, see the [README installation guide](https://github.com/pactflow/pactflow-agent-skills#installation-guide-for-agentic-idescoding-agents).

---

## Using the Pact CLI (no MCP required)

If you have the `pact-broker` CLI installed and broker credentials set in your environment, the skill can interact with your broker directly via the Bash tool — no MCP server needed. This works with both PactFlow Cloud and open-source Pact Broker.

### Install the CLI

See the [Pact CLI installation guide](https://github.com/pactflow/pact-agent-skills/blob/main/implementation_guides/cli/pact-broker-cli) for install options, or ask the skill to install it for you:

```
Install the pact-broker CLI
```

### Set credentials

```bash
# PactFlow Cloud
export PACT_BROKER_BASE_URL="https://yourorg.pactflow.io"
export PACT_BROKER_TOKEN="your-api-token"

# Open-source Pact Broker
export PACT_BROKER_BASE_URL="https://your-broker.example.com"
export PACT_BROKER_USERNAME="admin"
export PACT_BROKER_PASSWORD="password"
```

With these set, the skill can run commands like:

```bash
pact-broker can-i-deploy --pacticipant FrontendApp --version abc123 --to-environment production
pact-broker record-deployment --pacticipant FrontendApp --version abc123 --environment production
pact-broker publish ./pacts --consumer-app-version $GIT_COMMIT --branch $GIT_BRANCH
pact-broker list-environments
pact-broker create-or-update-pacticipant --name PaymentService --main-branch main
```

For BDCT (PactFlow Cloud only), the `pactflow` CLI extension handles provider contract publishing:

```bash
pactflow publish-provider-contract openapi.yaml \
  --provider MyProvider \
  --provider-app-version $GIT_COMMIT \
  --branch $GIT_BRANCH \
  --specification oas \
  --verification-success
```

### What the CLI cannot do

The CLI does not expose the contract matrix, AI generation and review tools, BDCT cross-contract verification results, or label management. For those capabilities, configure the [SmartBear MCP server](#adding-a-live-broker-connection).

---

## Adding a live broker connection

For any tool other than Claude Code (which handles this automatically via the plugin), configure the SmartBear MCP server to connect the skill to your actual broker.

You can ask the skill to walk you through the setup or configure it for you:

```
Set up the SmartBear MCP server for Claude Desktop
```

### Prerequisites

- Node.js 20+
- A PactFlow account or self-hosted Pact Broker

### Claude Desktop

Edit `~/Library/Application Support/Claude/claude_desktop_config.json` (macOS) or `%APPDATA%\Claude\claude_desktop_config.json` (Windows):

```json
{
  "mcpServers": {
    "smartbear": {
      "command": "npx",
      "args": ["-y", "@smartbear/mcp@latest"],
      "env": {
        "PACT_BROKER_BASE_URL": "https://yourorg.pactflow.io",
        "PACT_BROKER_TOKEN": "your-api-token"
      }
    }
  }
}
```

### VS Code

Create or edit `.vscode/mcp.json` in your project root:

```json
{
  "servers": {
    "smartbear": {
      "type": "stdio",
      "command": "npx",
      "args": ["-y", "@smartbear/mcp@latest"],
      "env": {
        "PACT_BROKER_BASE_URL": "https://yourorg.pactflow.io",
        "PACT_BROKER_TOKEN": "your-api-token"
      }
    }
  }
}
```

### Cursor

Edit `~/.cursor/mcp.json` (global) or `.cursor/mcp.json` (project):

```json
{
  "mcpServers": {
    "smartbear": {
      "command": "npx",
      "args": ["-y", "@smartbear/mcp@latest"],
      "env": {
        "PACT_BROKER_BASE_URL": "https://yourorg.pactflow.io",
        "PACT_BROKER_TOKEN": "your-api-token"
      }
    }
  }
}
```

### Open-source Pact Broker

Replace `PACT_BROKER_TOKEN` with `PACT_BROKER_USERNAME` and `PACT_BROKER_PASSWORD` in any of the configs above:

```json
{
  "env": {
    "PACT_BROKER_BASE_URL": "https://your-self-hosted-broker.example.com",
    "PACT_BROKER_USERNAME": "admin",
    "PACT_BROKER_PASSWORD": "your-password"
  }
}
```

:::note
AI test generation, AI test review, and team metrics require PactFlow Cloud. These tools are not available when connected to an open-source Pact Broker.
:::

### Verify the connection

Once configured, ask your assistant:

```
List the environments in my PactFlow workspace
```

If the connection is working, it will call `contract-testing_list_environments` and return results from your workspace.

---

## What you can do

### Writing consumer tests

The skill knows the Pact DSL for every supported language and can generate a complete, runnable consumer test from a description of the interaction. Supported languages: JavaScript, TypeScript, Java, Kotlin, Go, .NET (C#), Ruby, PHP, Swift.

It applies matching rules correctly by default — `like()` for type matching, `eachLike()` for arrays, `term()` for regex — and knows when exact value matching is appropriate. It will also flag common mistakes like over-specifying response bodies or using exact matching for timestamps and IDs.

**With a live broker connection (OSS + Cloud):** the assistant calls `contract-testing_get_provider_states` to fetch the provider states already defined in your workspace, so new interactions reuse state names the provider already knows how to set up.

**With PactFlow Cloud ☁:** the `contract-testing_generate_pact_tests` tool also generates tests directly from request/response pairs, existing client code, or an OpenAPI spec using AI.

```
Generate a consumer test for GET /orders/{id} returning a 200 with order details.
Check what provider states already exist for OrderService first.
```

```
Generate a Pact test in Go from this OpenAPI spec, only for the POST /payments endpoint.
```

### Message pacts (Kafka, SQS, SNS)

The skill understands the hexagonal architecture pattern for message contract testing: the Pact test calls your domain function (the port) directly, bypassing the Kafka/SQS adapter entirely. It will help you split the code into the right layers before writing tests, so you don't end up testing infrastructure.

It covers both async (fire-and-forget) and sync (request/reply streaming) message patterns, with examples in JavaScript and Java.

```
Help me write a Pact message test for the OrderCreated event consumed from Kafka in Java.
```

### Provider verification

The skill knows the exact `consumerVersionSelectors` configuration needed to avoid the most common can-i-deploy failure — a provider that never verifies the version currently deployed in production:

```javascript
consumerVersionSelectors: [
  { mainBranch: true },
  { matchingBranch: true },
  { deployedOrReleased: true },  // the one most teams are missing
],
enablePending: true,
publishVerificationResults: process.env.CI === "true",
providerVersion: process.env.GIT_COMMIT,
providerVersionBranch: process.env.GIT_BRANCH,
```

It can write provider state handlers, explain how to handle authentication in verification (basic auth, bearer tokens, JWKS), and walk through fixing specific verification failures.

```
Set up provider verification in my Spring Boot app. We use OAuth2 with a test identity provider.
```

```
My provider verification is failing with 'unexpected body'. Walk me through fixing it.
```

### CI/CD pipeline setup

The skill covers the full [Pact Nirvana](https://github.com/pactflow/pact-agent-skills/blob/main/pact_nirvana) journey — Bronze through Diamond — and can scaffold the exact CI steps for your platform (GitHub Actions, GitLab CI, CircleCI, Jenkins).

It will configure:

- Consumer CI: run tests → publish pact → can-i-deploy gate → deploy → record deployment
- Provider CI: fetch pacts → verify → publish results → can-i-deploy gate → deploy → record deployment
- Webhooks to trigger provider verification immediately when a pact changes

```
Write GitHub Actions workflows for both consumer and provider CI pipelines.
```

### can-i-deploy diagnostics

**Skill only:** the assistant walks through the most common root causes systematically — missing `deployedOrReleased` selector, verification results not published, no webhook firing on pact changes — and explains which CI config to fix.

**With a live broker connection:** the assistant inspects your actual workspace. It calls `contract-testing_can_i_deploy` to get the result, then uses `contract-testing_matrix` to identify exactly which consumer-provider version pair is unverified or failing, and `contract-testing_get_currently_deployed_versions` to confirm what is actually in production. It traces the failure to a specific root cause rather than guessing.

```
Why is can-i-deploy failing for FrontendApp version abc123 in production?
```

### Publishing contracts and verification results

**With a live broker connection:** the assistant can call `contract-testing_publish_consumer_contracts` to upload pact files directly, or `contract-testing_get_pacts_for_verification` to fetch the pacts a provider should verify in its current CI run.

```
Publish this pact file for FrontendApp version abc123 on the main branch.
```

### Deployment and release tracking

**With a live broker connection:** after a successful deploy, the assistant calls `contract-testing_record_deployment` to update the contract matrix. For mobile apps and shared libraries where multiple versions coexist, it uses `contract-testing_record_release` instead — which keeps all released versions marked as supported simultaneously.

It can also tell you what is currently deployed in any environment:

```
What version of PaymentService is deployed in staging right now?
```

```
Record the deployment of OrderService version abc123 to production.
```

### Workspace management

**With a live broker connection:** the assistant can manage the full lifecycle of services in your workspace.

**Pacticipants** — register new services, set main branches so branch-based can-i-deploy works correctly, update repository URLs, apply and remove labels:

```
Register a new service called NotificationService with main branch 'main'.
```

**Environments** — list environments and their UUIDs, create new ones, mark them as production:

```
Create a staging environment and a production environment.
```

**Webhooks** — create webhooks to trigger provider CI when a pact changes, test them manually, manage secrets used in webhook authentication:

```
Create a webhook to trigger the UserService verification pipeline when a new pact is published.
```

**Cleanup** — remove stale feature branches, delete decommissioned services:

```
Delete the feature/old-checkout branch for FrontendApp.
```

### Network and blast radius analysis

**With a live broker connection:** `contract-testing_get_pacticipant_network` returns the full integration graph for a service — all consumers that depend on it, and all providers it depends on. Use this before making breaking changes to understand the blast radius.

```
Which services depend on UserService?
```

### Metrics and observability

**With a live broker connection:** `contract-testing_get_metrics` returns workspace-wide usage statistics. On PactFlow Cloud ☁, `contract-testing_get_team_metrics` breaks this down per team.

### AI-assisted test review ☁ (PactFlow Cloud only)

The `contract-testing_review_pact_tests` tool reads your existing test files and returns a ranked list of best-practice violations and improvement recommendations. You can also pass in error output from a failing test run to get targeted diagnosis.

```
Review my existing Pact tests in ./src/__tests__/consumer.test.ts for best-practice violations.
```

```
My provider verification is failing with this error output. What's wrong?
[paste error]
```

### Bi-Directional Contract Testing ☁ (PactFlow Cloud only)

For BDCT workflows, the skill can help you publish a provider contract (OpenAPI spec + self-verification results from Dredd, Schemathesis, or similar), then use the BDCT tools to inspect cross-contract verification results and diagnose compatibility failures — without the provider needing to run the consumer pact suite directly.

```
Publish our OpenAPI spec as a provider contract for UserService version abc123.
The Dredd self-verification passed.
```

```
Show the cross-contract verification results for UserService version abc123.
```

### Example prompts

```
Help me write a consumer test for the GET /orders endpoint in TypeScript using pact-js v13
```

```
Why is can-i-deploy failing for OrderService in production?
```

```
Generate a Pact test for PaymentService — fetch the existing provider states first
```

```
Review my Pact tests in src/__tests__/ for best-practice violations
```

```
Set up provider verification in Spring Boot with OAuth2 auth and the right consumer version selectors
```

```
Write GitHub Actions CI workflows for both consumer and provider pipelines
```

```
Which services depend on UserService? I'm making a breaking change.
```

```
Record the deployment of FrontendApp version abc123 to production
```

---

## Subagents

The plugin ships with three specialist subagents that the PactFlow skill can delegate to automatically. Each runs as an independent agent with its own set of tools, so it can read your codebase, write files, and call MCP tools without interrupting the main conversation.

You don't invoke them by name — the skill detects when a task is better handled by a subagent and dispatches it. You can also trigger them explicitly with a natural language prompt.

### pact-generator

**Purpose:** generates complete, runnable Pact consumer tests and matching provider state handlers.

When asked to write tests, the pact-generator agent follows a specific sequence before writing a single line of code:

1. Reads any OpenAPI specs, existing API client code, or test files you point it to
2. Calls `contract-testing_get_provider_states` to fetch existing provider state names from your broker — new interactions reuse these rather than inventing duplicates
3. Calls `contract-testing_list_pacticipants` to confirm the exact consumer and provider names as registered in your workspace
4. Uses `contract-testing_generate_pact_tests` (PactFlow Cloud) to generate the test with AI, or falls back to generating it directly if that tool is unavailable

The output is always a complete, runnable file — not a snippet. It includes:

- The full consumer test with imports, mock setup, interaction definitions, and assertions
- Matching provider state handler code for every state referenced in the test
- A short note explaining which states were reused from the broker vs newly created, and the matching strategy applied

It applies matching rules correctly by default: `like()` for type matching, `eachLike()` for arrays, `term()` for regex patterns. It will not generate tests that over-specify response bodies or use exact matchers where type matchers are appropriate.

**Triggers:**

```
Write a Pact test for the GET /orders/{id} endpoint in TypeScript
Generate contract tests for the PaymentService integration
Convert this API client code into a Pact test
Create provider state handlers for the existing pacts
```

### pact-reviewer

**Purpose:** audits existing Pact tests and provider verification code for best-practice violations and returns a ranked list of findings.

The pact-reviewer agent reads your test files, checks them against the broker state, and produces a structured review:

1. Reads test files using Glob/Grep to locate all relevant files
2. Calls `contract-testing_get_provider_states` to check for duplicated or mismatched state names between your tests and the broker
3. Uses `contract-testing_review_pact_tests` (PactFlow Cloud) for AI-powered analysis, passing in your files and any error output
4. Applies a standard set of best-practice rules (see below) on top of the AI output

Findings are returned in severity order: **Critical → High → Medium → Low**, each with a file path, line number, explanation of the problem, and what to do instead.

**Consumer test red flags it looks for:**

- Exact matchers where type matchers would suffice
- Testing provider business logic rather than the consumer's API client
- Missing provider states for data-dependent interactions
- Random or dynamic data in pact definitions (breaks content hashing and reproducibility)
- State names that nearly duplicate existing ones in the broker

**Provider verification red flags:**

- `publishVerificationResults: true` outside of CI (pollutes the matrix)
- Missing `providerVersion` or `providerVersionBranch` (results don't associate correctly)
- `consumerVersionSelectors` missing `{ deployedOrReleased: true }` (the most common regression risk)
- No `enablePending: true` (breaks the provider build when a new consumer interaction is added)
- State handlers that set up more data than needed, or are missing teardown

**Triggers:**

```
Review my Pact tests in src/__tests__/ for best-practice violations
Audit the provider verification config in our Spring Boot app
My provider verification is failing — review the test files and this error output: [paste output]
```

### pact-implementor

**Purpose:** builds a new Pact client library from scratch for a language that doesn't have one yet.

This agent runs on Opus and is designed for the substantial task of wrapping the Pact FFI or implementing the Pact specification in a new language. It knows the full internal architecture of Pact libraries — consumer side, provider side, matching rules, Integration JSON, and the FFI surface — and recommends the correct approach:

1. **Wrap the Rust FFI** (strongly recommended) — the `pact_ffi` crate exposes the entire Pact Rust core as a C ABI-compatible shared library. This is how Go, .NET, PHP, C++, and Python V3 are built. It gives you immediate V1–V4 spec support with no additional work.
2. **Use the mock server HTTP API** — simpler, no FFI required, suitable for languages with no C interop.
3. **Implement from the spec** — only for languages that genuinely cannot use FFI or HTTP (e.g. embedded systems).

It scaffolds the correct FFI binding pattern for the target language, generates the full mock server lifecycle code, and explains Integration JSON (the inline matcher format used for V3+ matching rules). It also knows which reference implementations to study for guidance (Go, .NET, PHP).

**Triggers:**

```
I want to build a Pact library for Zig
Help me wrap the Pact FFI in Elixir
Build a Pact client library for Lua using LuaJIT FFI
Port the Pact mock server to a new runtime
```

### pact-maintainer

**Purpose:** audits workspace health, diagnoses can-i-deploy failures, cleans up stale state, and handles ongoing maintenance tasks across the full PactFlow workspace.

This is the broadest of the subagents — it has access to almost every `contract-testing_*` tool and handles the operational side of a contract testing ecosystem: keeping the broker clean, verifications green, and environments accurate. It can be pointed at one specific problem or asked for a full workspace audit.

**Task 1 — Health audit**

When asked to audit the workspace, it works through a structured checklist:

1. Lists all pacticipants and integrations to map the full consumer-provider graph
2. Queries the matrix for each integration to find failing or unknown verifications
3. Lists branches per pacticipant and flags any not updated in over 30 days
4. Checks every environment for services with no recorded deployments
5. Lists webhooks and flags any that are disabled or have no recent executions
6. Pulls workspace metrics for headline numbers

The output is a structured health report: summary counts, a list of failing/unknown verifications, stale branches, and a ranked recommendations list.

**Task 2 — can-i-deploy diagnosis and fix**

Runs `contract-testing_can_i_deploy`, then drills into the matrix to identify the exact failing row, classifies the root cause (never verified, verification failed, no results published, pending pact), reads the relevant test files, applies a fix using AI review if needed, and reports the specific cause and action taken.

**Task 3 — Update pacts after an API change**

Given a breaking or additive API change, it fetches all consumer pacts currently being verified, reads the affected test files, classifies each change as additive (no action needed) or breaking (consumer tests must be updated), applies the updates, republishes, and checks the matrix to confirm the fix.

**Task 4 — Stale state cleanup**

Deletes merged feature branches, removes decommissioned services (after checking for active deployments and network dependents), and cleans up orphaned integrations. It will never delete a pacticipant with currently deployed versions without explicit confirmation.

**Task 5 — Environment and webhook setup**

Creates environments with the correct `production` flag, configures standard webhooks to trigger provider CI on pact changes (using PactFlow's template variables like `${pactbroker.pactUrl}`), and tests webhooks by executing them manually.

**Task 6 — Deployment recording**

Records deployments and releases after CI steps using the correct tool for the workflow: `record_deployment` for traditional services (one version active per environment), `record_release` for mobile apps and libraries (multiple versions simultaneously supported).

**Triggers:**

```
Give me a health report for our PactFlow workspace
Why is can-i-deploy failing for CheckoutService?
Clean up stale branches across all our services
Update our pacts — we renamed the /users endpoint to /accounts
Set up environments and a webhook to trigger provider verification
```

### bdct-tester

**Purpose:** drives a full Bi-Directional Contract Testing flow end-to-end — consumer tests, provider OpenAPI contract, publication, cross-contract verification — and loops until BDCT passes or a maximum of 5 iterations is reached.

This agent handles everything from generating consumer tests to publishing both sides of the contract and diagnosing failures from PactFlow's cross-contract verification results. It is designed to take you from zero to a green BDCT result in a single invocation.

**Phase 1 — Discovery**

Locates the provider and consumer codebases (asking the user for paths if needed), finds the provider's existing OpenAPI spec, reads the consumer's API client code to understand which endpoints and fields it uses, and resolves the pacticipant names from existing Pact config or by asking.

It will stop immediately if no OpenAPI spec exists on the provider side — BDCT requires one, and it will not create it on behalf of the provider team.

**Phase 2 — Consumer test generation**

Generates Pact V4 consumer tests with high coverage targets:

- Every endpoint the consumer calls (happy path)
- Every distinct response shape (e.g. empty array vs populated array)
- Common error cases the consumer handles (404, 400, 401, 422)
- Each optional field as both present and absent (separate interactions with different provider states)

It then runs the tests to generate the pact file, fixing any failures before moving on.

**Phase 3 — Publication**

Publishes both contracts to PactFlow:

- Consumer pact via `contract-testing_publish_consumer_contracts`
- Provider OpenAPI spec + self-verification results via `contract-testing_publish_provider_contract`

**Phase 4 — Verify and loop**

Polls the contract matrix until results arrive, then checks `contract-testing_get_bdct_cross_contract_verification_results` for detailed failure reasons.

When BDCT fails, it classifies the failure and applies the correct fix — for example, if the spec is missing a field the provider actually returns, it updates the spec to document it; if the consumer is using a field the provider never returns, it removes that field from the consumer test. It then bumps the version and republishes.

This loop runs up to 5 times. If BDCT still fails after 5 iterations, it stops and reports the remaining failures with a diagnosis.

**Output**

At the end it reports the final status, the consumer and provider contract versions and publication URLs, the cross-contract verification result, and any remaining failures.

**Triggers:**

```
Set up bi-directional contract testing for the OrderService integration
Make BDCT pass for FrontendApp and ProductsService
Publish and verify contracts for our checkout flow
```

---

## SmartBear MCP tools

The full `contract-testing_*` tool catalog — AI generation, can-i-deploy, the contract matrix, BDCT, environments, webhooks, secrets, and more — is documented on the [SmartBear MCP](/ai_tools/smartbear-mcp) page.

---

## Troubleshooting

| Symptom                             | Likely cause                    | Fix                                                                   |
| ----------------------------------- | ------------------------------- | --------------------------------------------------------------------- |
| `401 Unauthorized` from MCP tools   | Wrong or missing token          | Check `PACT_BROKER_TOKEN` matches the value from your API tokens page |
| `404 Not Found` from MCP tools      | Wrong broker URL                | Verify `PACT_BROKER_BASE_URL` — no trailing slash, correct subdomain  |
| MCP tools not appearing             | MCP server not starting         | Run `npx @smartbear/mcp@latest` in a terminal to see startup errors   |
| AI generation/review returns `401`  | Missing PactFlow AI entitlement | Ask the assistant to check your entitlements                          |
| Skill not activating in Claude Code | Plugin not reloaded             | Run `/reload-plugins` inside a Claude Code session                    |
