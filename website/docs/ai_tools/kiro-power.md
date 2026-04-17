---
title: "Kiro Power: Swagger Contract Testing"
sidebar_label: Kiro Power
custom_edit_url: https://github.com/pactflow/pact-agent-skills/edit/main/docs/ai-tools/kiro-power.md
---
<!-- This file has been synced from the pactflow/pact-agent-skills repository. Please do not edit it directly. The URL of the source file can be found in the custom_edit_url value above -->

## What is a Kiro Power?

A **Kiro Power** is a Kiro-native agent bundle that goes beyond a passive skill. Where a skill provides reference material that the AI draws on when you ask a question, a Power is an active agent: it detects when contract testing work is happening and activates automatically, runs a structured onboarding sequence the first time it fires, routes your task to the right specialised context, and connects directly to your PactFlow workspace via the SmartBear MCP server — all without any manual configuration in the conversation.

The `swagger-contract-testing` Power covers the full contract testing lifecycle: writing and reviewing Pact consumer tests, provider verification, can-i-deploy, BDCT, and full workspace management.

---

## Installing the Power

Open the **Agent Steering & Skills** panel in Kiro, click **+**, choose **Import a Power**, select **GitHub**, and paste:

```
https://github.com/pactflow/pactflow-agent-skills/tree/main/powers/swagger-contract-testing
```

No cloning required. Kiro fetches the Power files directly.

:::note Kiro version
Powers require Kiro with agent steering support. If the Import a Power option is not visible, update Kiro to the latest version.
:::

---

## Configuring credentials

The Power connects to your PactFlow workspace via two environment variables. Set these in your shell profile or Kiro's environment configuration:

```bash
# PactFlow Cloud
export PACT_BROKER_BASE_URL="https://yourorg.pactflow.io"
export PACT_BROKER_TOKEN="your-api-token"
```

Get your API token from `https://yourorg.pactflow.io/settings/api-tokens`.

For an open-source Pact Broker, use username and password instead:

```bash
export PACT_BROKER_BASE_URL="https://your-self-hosted-broker.example.com"
export PACT_BROKER_USERNAME="admin"
export PACT_BROKER_PASSWORD="your-password"
```

:::note
AI test generation, AI test review, and team metrics require PactFlow Cloud. These tools are not available when connected to an open-source Pact Broker.
:::

---

## Onboarding flow

When the Power first activates, it runs three checks automatically:

1. **Node.js 20+** — runs `node --version`. If missing or below v20, the Power will direct you to install it before continuing.

2. **Credentials** — verifies that `PACT_BROKER_BASE_URL` and either `PACT_BROKER_TOKEN` or `PACT_BROKER_USERNAME`/`PACT_BROKER_PASSWORD` are set.

3. **Live connection** — calls `contract-testing_list_environments` to confirm the connection is working:
   - Returns results → setup is complete
   - Returns `401` → token is wrong or missing
   - Returns `404` → base URL is wrong or has a trailing slash

The Power will not attempt broker operations until all three checks pass.

---

## Steering map

Once activated, the Power detects the type of work you are doing and loads the appropriate steering context automatically. You do not need to specify which mode to use.

| Task                                                                                                                              | Steering loaded     |
| --------------------------------------------------------------------------------------------------------------------------------- | ------------------- |
| Writing or generating Pact consumer tests; parsing OpenAPI schemas; scaffolding Drift test cases                                  | `write-tests`       |
| Provider verification config; running can-i-deploy; diagnosing can-i-deploy failures; recording deployments; workspace onboarding | `verify-and-deploy` |
| Bi-Directional Contract Testing end-to-end (Drift self-verification + publish + cross-contract + can-i-deploy)                    | `bdct`              |

---

## Companion skills

Install these Kiro skills alongside the Power for deeper reference material. The Power handles live broker operations and routing; these skills add detailed language-specific examples, CLI references, and schema documentation that the Power draws on when generating or explaining code.

| Skill              | What it adds                                                                                                          | Install from GitHub                                                                                                  |
| ------------------ | --------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------- |
| **pactflow**       | Full Pact/PactFlow reference — consumer test patterns, provider verification, CI/CD, BDCT, DSL guides for 8 languages | `https://github.com/pactflow/pactflow-agent-skills/tree/main/plugins/swagger-contract-testing/skills/pactflow`       |
| **drift-testing**  | Full Drift CLI reference — test case YAML schema, Lua API, authentication, mock server, CI/CD publishing              | `https://github.com/pactflow/pactflow-agent-skills/tree/main/plugins/swagger-contract-testing/skills/drift-testing`  |
| **openapi-parser** | Complex OpenAPI schema patterns (anyOf/oneOf/allOf/discriminator/$ref) and Drift YAML mapping                         | `https://github.com/pactflow/pactflow-agent-skills/tree/main/plugins/swagger-contract-testing/skills/openapi-parser` |

To install each skill: open **Agent Steering & Skills** → **+** → **Import a skill** → **GitHub** → paste the URL.

---

## Available tools

The Power exposes `contract-testing_*` tools that connect directly to your workspace:

- **AI test generation** — generate complete Pact consumer tests from request/response pairs, existing client code, or an OpenAPI spec
- **AI test review** — audit existing tests for best-practice violations and false positives
- **Publishing** — publish consumer pacts and provider contracts (OpenAPI + self-verification results)
- **Deployment safety** — run can-i-deploy against live broker data before deploying
- **Recording** — record deployments and releases to keep workspace state accurate
- **Workspace management** — manage pacticipants, environments, webhooks, secrets, labels, and metrics
- **BDCT verification** — inspect cross-contract verification results for Bi-Directional Contract Testing

For the full tool catalog, see [SmartBear MCP](/ai_tools/smartbear-mcp).

If an AI tool (`generate_pact_tests`, `review_pact_tests`) returns a `401`, the Power will call `contract-testing_check_pactflow_ai_entitlements` to diagnose credit or permission issues automatically.
