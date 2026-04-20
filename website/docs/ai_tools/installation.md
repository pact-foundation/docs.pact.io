---
title: PactFlow Agent Skills
sidebar_label: Installation
custom_edit_url: https://github.com/pactflow/pact-agent-skills/edit/main/README.md
slug: installation
description: Installation guide for PactFlow AI coding assistant skills across Claude Code, GitHub Copilot, Cursor, Windsurf, Codex, Kiro, and more.
---
<!-- This file has been synced from the pactflow/pact-agent-skills repository. Please do not edit it directly. The URL of the source file can be found in the custom_edit_url value above -->

Agent skills teach your AI coding assistant — Claude Code, GitHub Copilot, Cursor, Windsurf, and others — how to work with Pact, PactFlow, and Drift. Instead of explaining contract testing concepts every time you start a conversation, the skills give your AI persistent, deep knowledge of consumer test patterns, provider verification, can-i-deploy diagnostics, Drift test authoring, and workspace management.

The plugin goes further: it bundles the [SmartBear MCP server](/ai_tools/smartbear-mcp) alongside the skills, so your assistant can connect directly to your PactFlow workspace or Pact Broker. It can fetch live provider states before generating tests, query the contract matrix to diagnose a failing can-i-deploy, publish pacts and provider contracts, record deployments, and manage environments — all without leaving your editor.

There are two types of components in this repo. **Skills** are context files that activate when the task matches — the assistant reads them and applies the knowledge. **Agents** are autonomous sub-tasks the PactFlow skill delegates to: generating tests, reviewing them for best-practice violations, running a full BDCT flow end-to-end, or auditing workspace health.

| Plugin name                | Skills / Agents        | What it does                                                                                                                                                                                                                                                                                                                                   |
| -------------------------- | ---------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `swagger-contract-testing` | **Drift**              | Expert assistant for Drift — PactFlow's OpenAPI contract testing CLI. Helps write test cases, configure lifecycle hooks, debug failures, and publish results to PactFlow.                                                                                                                                                                      |
|                            | **OpenAPI Parser**     | Parses complex OpenAPI specs (anyOf/oneOf/allOf, discriminators, polymorphism, $ref chains, enums, regex) and generates Drift test cases covering every viable schema combination.                                                                                                                                                             |
|                            | **PactFlow**           | Expert assistant for PactFlow and Pact contract testing. Uses the SmartBear MCP `contract-testing_*` tools to generate and review Pact tests with AI, publish contracts, verify providers, run can-i-deploy checks, record deployments, and manage the full PactFlow workspace (environments, pacticipants, BDCT, webhooks, secrets, metrics). |
|                            | **pact-generator**     | Agent: generates new Pact consumer tests and provider state handlers from existing code, OpenAPI specs, or example request/response pairs.                                                                                                                                                                                                     |
|                            | **pact-reviewer**      | Agent: reviews Pact consumer tests and provider verification code for best-practice violations, false positives, and provider state naming issues.                                                                                                                                                                                             |
|                            | **pact-implementor**   | Agent: builds a new Pact client library from scratch in any language by wrapping the Pact FFI.                                                                                                                                                                                                                                                 |
|                            | **pact-maintainer**    | Agent: audits PactFlow workspace health, fixes failing verifications, and cleans up stale pacticipants, branches, and environments.                                                                                                                                                                                                            |
|                            | **bdct-tester**        | Agent: drives a full Bi-Directional Contract Testing flow end-to-end — consumer tests, provider contract verification, publishing, and can-i-deploy.                                                                                                                                                                                          |

The three skills work together: **OpenAPI Parser** analyses a spec and generates Drift test scaffolding; **Drift** runs, iterates, and publishes those tests; **PactFlow** manages the full contract testing lifecycle — from generating Pact tests with AI to safely deploying services. The agents handle specialised sub-tasks autonomously within the PactFlow skill.

**Further reading:** [PactFlow Skill](/ai_tools/pactflow-skill) · [SmartBear MCP](/ai_tools/smartbear-mcp) · [Kiro Power](/ai_tools/kiro-power)

---

## Installation guide for Agentic IDEs/Coding agents

- [Quick install with `npx skills`](#quick-install-with-npx-skills)
- [Claude Code](#installing-in-claude-code)
- [OpenCode](#installing-in-opencode)
- [GitHub Copilot (VS Code)](#installing-in-github-copilot-vs-code)
- [GitHub Copilot CLI](#installing-in-github-copilot-cli)
- [Cursor](#installing-in-cursor)
- [Windsurf](#installing-in-windsurf)
- [Codex](#installing-in-codex)
- [Kiro](#installing-in-kiro)
- [Antigravity](#installing-in-antigravity)

## Quick install with `npx skills`

The [`skills` CLI](https://skills.sh) installs agent skills from GitHub directly into your project. It auto-detects which agentic coding tools you use and places the skill files in the correct location for each one.

```bash
npx skills add pactflow/pactflow-agent-skills
```

This installs the `swagger-contract-testing` skills for all detected agents in your project (Claude Code, Copilot, Cursor, Windsurf, Kiro, Codex, OpenCode, Antigravity, and more).

---

### Windows users

The install commands throughout this guide use Unix shell syntax. In PowerShell, replace:

| Unix                                                                  | PowerShell                                                                           |
| --------------------------------------------------------------------- | ------------------------------------------------------------------------------------ |
| `mkdir -p path/to/dir`                                                | `New-Item -ItemType Directory -Force -Path path\to\dir`                              |
| `cp -r plugins/swagger-contract-testing/skills/drift-testing path/to/dir` | `Copy-Item -Recurse plugins\swagger-contract-testing\skills\drift-testing path\to\dir` |

`~` (home directory) works in PowerShell 3+. In older environments use `$HOME` instead.

---

## Installing in Claude Code

Claude Code supports [Skills](https://code.claude.com/docs/en/skills) via a plugin marketplace system. Requires Claude Code v1.0.33+.

### From Anthropic's community marketplace (recommended)

The plugin is listed in Anthropic's official community plugins marketplace. Add the marketplace and install in two commands:

**1. Add the Anthropic community marketplace:**

```bash
claude plugin marketplace add anthropics/claude-plugins-community
```

**2. Install the plugin:**

```bash
claude plugin install swagger-contract-testing@claude-community
```

Alternatively, open the **`/plugin`** panel in Claude Code, navigate to **Discover**, search for `swagger-contract-testing`, and click **Install**.

**3. Configure your PactFlow credentials:**

Add a `pluginConfigs` block to `~/.claude/settings.json` with your PactFlow base URL and API token:

```json
{
  "pluginConfigs": {
    "swagger-contract-testing@claude-community": {
      "options": {
        "pact_broker_base_url": "https://yourorg.pactflow.io",
        "pact_broker_token": "your-api-token"
      }
    }
  }
}
```

Get your API token from `https://yourorg.pactflow.io/settings/api-tokens`. For an open-source Pact Broker, use `pact_broker_username` and `pact_broker_password` instead of `pact_broker_token`.

Then reload the plugin to start the MCP server:

```claude
/reload-plugins
```

### From the PactFlow repo (for teams who want to pin a version)

**1. Add the marketplace** inside a Claude Code session:

```claude
/plugin marketplace add pactflow/pactflow-agent-skills
```

Or add it to `.claude/settings.json` so teammates are prompted to install it automatically when they open the project:

```json
{
  "extraKnownMarketplaces": {
    "pactflow-agent-skills": {
      "source": {
        "source": "github",
        "repo": "pactflow/pactflow-agent-skills"
      }
    }
  }
}
```

**2. Install the plugin:**

```claude
/plugin install swagger-contract-testing@pactflow-agent-skills
```

**Scope options:**

| Scope            | Stored in                     | Who it applies to                       |
| ---------------- | ----------------------------- | --------------------------------------- |
| `user` (default) | `~/.claude/settings.json`     | You, across all projects                |
| `project`        | `.claude/settings.json`       | Everyone on the team (commit this file) |
| `local`          | `.claude/settings.local.json` | You, in this project only (gitignored)  |

**3. Configure your PactFlow credentials:**

Add a `pluginConfigs` block to `~/.claude/settings.json` with your PactFlow base URL and API token:

```json
{
  "pluginConfigs": {
    "swagger-contract-testing@pactflow-agent-skills": {
      "options": {
        "pact_broker_base_url": "https://yourorg.pactflow.io",
        "pact_broker_token": "your-api-token"
      }
    }
  }
}
```

Get your API token from `https://yourorg.pactflow.io/settings/api-tokens`. For an open-source Pact Broker, use `pact_broker_username` and `pact_broker_password` instead of `pact_broker_token`.

Then reload the plugin to start the MCP server:

```claude
/reload-plugins
```

### From a local clone

```claude
/plugin marketplace add ./path/to/pactflow-agent-skills/.claude-plugin/marketplace.json
/plugin install swagger-contract-testing@pactflow-agent-skills
```

### For local development (no marketplace needed)

```bash
claude --plugin-dir ./plugins/swagger-contract-testing
```

### Managing plugins

```claude
/plugin                          # open plugin manager (Discover / Installed / Marketplaces / Errors)
/reload-plugins                  # reload without restarting
/plugin disable swagger-contract-testing@pactflow-agent-skills
/plugin uninstall swagger-contract-testing@pactflow-agent-skills
```

---

## Installing in OpenCode

OpenCode supports [Agent Skills](https://opencode.ai/docs/skills) loaded from `SKILL.md` files in named subdirectories. The agent
automatically selects relevant skills based on task context.

### Global install (available in all projects)

```bash
cp -r plugins/swagger-contract-testing/skills/drift-testing ~/.config/opencode/skills/drift-testing
cp -r plugins/swagger-contract-testing/skills/openapi-parser ~/.config/opencode/skills/openapi-parser
cp -r plugins/swagger-contract-testing/skills/pactflow ~/.config/opencode/skills/pactflow
```

### Project-level install (this project only)

```bash
mkdir -p .opencode/skills
cp -r plugins/swagger-contract-testing/skills/drift-testing .opencode/skills/drift-testing
cp -r plugins/swagger-contract-testing/skills/openapi-parser .opencode/skills/openapi-parser
cp -r plugins/swagger-contract-testing/skills/pactflow .opencode/skills/pactflow
```

OpenCode will pick up the skills automatically — no restart required.

---

## Installing in GitHub Copilot (VS Code)

VS Code Copilot supports [Agent Skills](https://code.visualstudio.com/docs/copilot/customization/agent-skills)
natively. Skills are loaded from `SKILL.md` files in named subdirectories and invoked as slash commands
in Copilot Chat (`/drift-testing`, `/openapi-parser`). Copilot also auto-loads relevant skills based on context.

### Project-level install (recommended for teams)

Copy the skill folders into any of the standard discovery locations — Copilot checks all of them:

```bash
# .github/skills  (most common for GitHub projects)
mkdir -p .github/skills
cp -r plugins/swagger-contract-testing/skills/drift-testing .github/skills/drift-testing
cp -r plugins/swagger-contract-testing/skills/openapi-parser .github/skills/openapi-parser
cp -r plugins/swagger-contract-testing/skills/pactflow .github/skills/pactflow

# or .agents/skills
mkdir -p .agents/skills
cp -r plugins/swagger-contract-testing/skills/drift-testing .agents/skills/drift-testing
cp -r plugins/swagger-contract-testing/skills/openapi-parser .agents/skills/openapi-parser
cp -r plugins/swagger-contract-testing/skills/pactflow .agents/skills/pactflow

# or .claude/skills (already used by Claude Code)
mkdir -p .claude/skills
cp -r plugins/swagger-contract-testing/skills/drift-testing .claude/skills/drift-testing
cp -r plugins/swagger-contract-testing/skills/openapi-parser .claude/skills/openapi-parser
cp -r plugins/swagger-contract-testing/skills/pactflow .claude/skills/pactflow
```

Commit the chosen directory to share the skills with your team. No VS Code configuration required.

### Personal install (all your projects)

Copy to a personal skills directory so the skills are available in every repo you open:

```bash
mkdir -p ~/.copilot/skills
cp -r plugins/swagger-contract-testing/skills/drift-testing ~/.copilot/skills/drift-testing
cp -r plugins/swagger-contract-testing/skills/openapi-parser ~/.copilot/skills/openapi-parser
cp -r plugins/swagger-contract-testing/skills/pactflow ~/.copilot/skills/pactflow
```

### Custom location

Point Copilot at any directory via VS Code settings:

```json
{
  "chat.agentSkillsLocations": ["/path/to/your/skills"]
}
```

### Using the skills in Copilot Chat

Once installed, open Copilot Chat and invoke a skill by name:

```claude
/drift-testing write a test case for POST /orders returning 201
/openapi-parser generate Drift tests for the payments spec
```

You can also type `/skills` in chat to browse and configure installed skills. Copilot will
auto-load a skill when it detects a relevant task even without an explicit slash command.

---

### Fallback: custom instructions (older Copilot versions)

If your version of Copilot doesn't support Agent Skills yet, use custom instructions instead.

**Repo-wide** — applies to every conversation in the repository:

```bash
cat plugins/swagger-contract-testing/skills/drift-testing/SKILL.md plugins/swagger-contract-testing/skills/drift-testing/references/*.md >> .github/copilot-instructions.md
cat plugins/swagger-contract-testing/skills/openapi-parser/SKILL.md plugins/swagger-contract-testing/skills/openapi-parser/references/*.md >> .github/copilot-instructions.md
cat plugins/swagger-contract-testing/skills/pactflow/SKILL.md plugins/swagger-contract-testing/skills/pactflow/references/*.md >> .github/copilot-instructions.md
```

**Path-scoped** — loads only when relevant files are open:

```bash
# Drift — scoped to Drift config files
echo '---\napplyTo: "**/drift.yaml,**/*.tests.yaml,**/*.dataset.yaml"\n---\n' > .github/instructions/drift.instructions.md
cat plugins/swagger-contract-testing/skills/drift-testing/SKILL.md plugins/swagger-contract-testing/skills/drift-testing/references/*.md >> .github/instructions/drift.instructions.md

# OpenAPI Parser — scoped to OpenAPI spec files
echo '---\napplyTo: "**/openapi.yaml,**/openapi.json,**/*.oas.yaml"\n---\n' > .github/instructions/openapi-parser.instructions.md
cat plugins/swagger-contract-testing/skills/openapi-parser/SKILL.md plugins/swagger-contract-testing/skills/openapi-parser/references/*.md >> .github/instructions/openapi-parser.instructions.md

# PactFlow — scoped to Pact test files and pact config
echo '---\napplyTo: "**/*.pact.test.*,**/pacts/**,**/.pactrc*"\n---\n' > .github/instructions/pactflow.instructions.md
cat plugins/swagger-contract-testing/skills/pactflow/SKILL.md plugins/swagger-contract-testing/skills/pactflow/references/*.md >> .github/instructions/pactflow.instructions.md
```

**Reusable prompts** — attach on demand in chat:

1. Enable prompt files in VS Code settings: `{ "chat.promptFiles": true }`
2. Create prompt files:
   ```bash
   cat plugins/swagger-contract-testing/skills/drift-testing/SKILL.md plugins/swagger-contract-testing/skills/drift-testing/references/*.md > .github/prompts/drift.prompt.md
   cat plugins/swagger-contract-testing/skills/openapi-parser/SKILL.md plugins/swagger-contract-testing/skills/openapi-parser/references/*.md > .github/prompts/openapi-parser.prompt.md
   cat plugins/swagger-contract-testing/skills/pactflow/SKILL.md plugins/swagger-contract-testing/skills/pactflow/references/*.md > .github/prompts/pactflow.prompt.md
   ```
3. In Copilot Chat, click **Attach context → Prompt...** and select the skill.

---

## Installing in GitHub Copilot CLI

GitHub Copilot CLI supports plugins via the `/plugin` command (requires `gh copilot` v1+).

**1. Add the marketplace:**

```shell
copilot plugin marketplace add pactflow/pactflow-agent-skills
```

**2. Install the plugin:**

```shell
copilot plugin install swagger-contract-testing@pactflow-agent-skills
```

Or install directly from the repo without adding a marketplace first:

```shell
copilot plugin install pactflow/pactflow-agent-skills
```

**3. Configure your PactFlow credentials** in `~/.copilot/settings.json` (or the equivalent config file for your environment):

```json
{
  "pluginConfigs": {
    "swagger-contract-testing@pactflow-agent-skills": {
      "options": {
        "pact_broker_base_url": "https://yourorg.pactflow.io",
        "pact_broker_token": "your-api-token"
      }
    }
  }
}
```

---

## Installing in Cursor

Cursor supports [Agent Skills](https://cursor.com/docs/skills) loaded from `SKILL.md` files in named subdirectories. Skills can be project-scoped or global.

### Remote install from GitHub

1. Open **Cursor Settings → Rules**
2. Click **Add Rule** in Project Rules
3. Select **Remote Rule (GitHub)**
4. Enter the URL to each skill folder:
   - `https://github.com/pactflow/pactflow-agent-skills/tree/main/plugins/swagger-contract-testing/skills/drift-testing`
   - `https://github.com/pactflow/pactflow-agent-skills/tree/main/plugins/swagger-contract-testing/skills/openapi-parser`

### Project-level install (manual)

```bash
mkdir -p .cursor/skills
cp -r plugins/swagger-contract-testing/skills/drift-testing .cursor/skills/drift-testing
cp -r plugins/swagger-contract-testing/skills/openapi-parser .cursor/skills/openapi-parser
cp -r plugins/swagger-contract-testing/skills/pactflow .cursor/skills/pactflow
```

Commit `.cursor/skills/` to share the skills with your team. Cursor also discovers skills from `.agents/skills/`.

### Global install (all your projects)

```bash
mkdir -p ~/.cursor/skills
cp -r plugins/swagger-contract-testing/skills/drift-testing ~/.cursor/skills/drift-testing
cp -r plugins/swagger-contract-testing/skills/openapi-parser ~/.cursor/skills/openapi-parser
cp -r plugins/swagger-contract-testing/skills/pactflow ~/.cursor/skills/pactflow
```

---

## Installing in Windsurf

Windsurf supports [Skills](https://docs.windsurf.com/windsurf/cascade/skills) loaded from `SKILL.md` files in named subdirectories. Skills can be workspace-scoped or global.

### From the UI

1. Open the **Cascade** panel
2. Click the **⋯** menu → **Skills**
3. Choose **+ Workspace** (project) or **+ Global**
4. Copy the contents of each `SKILL.md` into the new skill

### Project-level install (manual)

```bash
mkdir -p .windsurf/skills
cp -r plugins/swagger-contract-testing/skills/drift-testing .windsurf/skills/drift-testing
cp -r plugins/swagger-contract-testing/skills/openapi-parser .windsurf/skills/openapi-parser
cp -r plugins/swagger-contract-testing/skills/pactflow .windsurf/skills/pactflow
```

Commit `.windsurf/skills/` to share the skills with your team.

### Global install (all your projects)

```bash
mkdir -p ~/.codeium/windsurf/skills
cp -r plugins/swagger-contract-testing/skills/drift-testing ~/.codeium/windsurf/skills/drift-testing
cp -r plugins/swagger-contract-testing/skills/openapi-parser ~/.codeium/windsurf/skills/openapi-parser
cp -r plugins/swagger-contract-testing/skills/pactflow ~/.codeium/windsurf/skills/pactflow
```

---

## Installing in Codex

Codex supports [Skills](https://developers.openai.com/codex/skills/) loaded from `SKILL.md` files in named subdirectories, and a [Plugin system](https://developers.openai.com/codex/plugins/build) with a `.codex-plugin/plugin.json` manifest for bundled installs.

### Plugin install (recommended)

The plugin manifest bundles all three skills together and wires up the SmartBear MCP server automatically.

**1. Add the marketplace** (repo-scoped, shared with your team):

The repo already ships a marketplace file at `.agents/plugins/marketplace.json`. Codex discovers it automatically when you open the project — no extra configuration needed.

**2. Install the plugin** using the built-in `$plugin-creator` skill or manually via the Codex plugin manager:

```codex
$plugin install swagger-contract-testing@pactflow-agent-skills
```

Or install directly from the repo:

```codex
$plugin install pactflow/pactflow-agent-skills
```

**3. Configure your PactFlow credentials** in `~/.codex/settings.json`:

```json
{
  "pluginConfigs": {
    "swagger-contract-testing@pactflow-agent-skills": {
      "options": {
        "pact_broker_base_url": "https://yourorg.pactflow.io",
        "pact_broker_token": "your-api-token"
      }
    }
  }
}
```

Get your API token from `https://yourorg.pactflow.io/settings/api-tokens`. For an open-source Pact Broker, use `pact_broker_username` and `pact_broker_password` instead of `pact_broker_token`.

### Using the skill installer

```bash
$skill-installer pactflow/pactflow-agent-skills/plugins/swagger-contract-testing/skills/drift-testing
$skill-installer pactflow/pactflow-agent-skills/plugins/swagger-contract-testing/skills/openapi-parser
$skill-installer pactflow/pactflow-agent-skills/plugins/swagger-contract-testing/skills/pactflow
```

### Project-level install (manual)

```bash
mkdir -p .agents/skills
cp -r plugins/swagger-contract-testing/skills/drift-testing .agents/skills/drift-testing
cp -r plugins/swagger-contract-testing/skills/openapi-parser .agents/skills/openapi-parser
cp -r plugins/swagger-contract-testing/skills/pactflow .agents/skills/pactflow
```

Commit `.agents/skills/` to share the skills with your team.

### Global install (all your projects)

```bash
mkdir -p ~/.agents/skills
cp -r plugins/swagger-contract-testing/skills/drift-testing ~/.agents/skills/drift-testing
cp -r plugins/swagger-contract-testing/skills/openapi-parser ~/.agents/skills/openapi-parser
cp -r plugins/swagger-contract-testing/skills/pactflow ~/.agents/skills/pactflow
```

---

## Installing in Kiro

### Kiro Power (recommended)

The `swagger-contract-testing` Power bundles the skills and SmartBear MCP server into a single install with automatic onboarding, credential validation, and smart task routing. See the [Kiro Power](/ai_tools/kiro-power) page for full details.

Open the **Agent Steering & Skills** panel in Kiro, click **+**, choose **Import a Power**, select **GitHub**, and paste:

```
https://github.com/pactflow/pactflow-agent-skills/tree/main/powers/swagger-contract-testing
```

Set `PACT_BROKER_BASE_URL` and `PACT_BROKER_TOKEN` in your shell profile or Kiro's environment configuration before activating.

### Import skills from GitHub

1. Open the **Agent Steering & Skills** panel in Kiro
2. Click **+** → **Import a skill**
3. Select **GitHub** and paste the URL to each skill folder:
   - `https://github.com/pactflow/pactflow-agent-skills/tree/main/plugins/swagger-contract-testing/skills/drift-testing`
   - `https://github.com/pactflow/pactflow-agent-skills/tree/main/plugins/swagger-contract-testing/skills/openapi-parser`
   - `https://github.com/pactflow/pactflow-agent-skills/tree/main/plugins/swagger-contract-testing/skills/pactflow`

Imported skills are copied to your skills directory and work immediately.

### Project-level install (manual)

```bash
mkdir -p .kiro/skills
cp -r plugins/swagger-contract-testing/skills/drift-testing .kiro/skills/drift-testing
cp -r plugins/swagger-contract-testing/skills/openapi-parser .kiro/skills/openapi-parser
cp -r plugins/swagger-contract-testing/skills/pactflow .kiro/skills/pactflow
```

Commit `.kiro/skills/` to share the skills with your team.

### Global install (all your projects)

```bash
mkdir -p ~/.kiro/skills
cp -r plugins/swagger-contract-testing/skills/drift-testing ~/.kiro/skills/drift-testing
cp -r plugins/swagger-contract-testing/skills/openapi-parser ~/.kiro/skills/openapi-parser
cp -r plugins/swagger-contract-testing/skills/pactflow ~/.kiro/skills/pactflow
```

> When both locations contain a skill with the same name, the workspace skill takes priority.

---

## Installing in Antigravity

Antigravity supports [Agent Skills](https://antigravity.google/docs/skills) loaded from `SKILL.md` files in named subdirectories. Skills can be workspace-scoped or global.

### Project-level install (recommended for teams)

```bash
mkdir -p .agents/skills
cp -r plugins/swagger-contract-testing/skills/drift-testing .agents/skills/drift-testing
cp -r plugins/swagger-contract-testing/skills/openapi-parser .agents/skills/openapi-parser
cp -r plugins/swagger-contract-testing/skills/pactflow .agents/skills/pactflow
```

Commit `.agents/skills/` to share the skills with your team.

### Global install (all your projects)

```bash
mkdir -p ~/.gemini/antigravity/skills
cp -r plugins/swagger-contract-testing/skills/drift-testing ~/.gemini/antigravity/skills/drift-testing
cp -r plugins/swagger-contract-testing/skills/openapi-parser ~/.gemini/antigravity/skills/openapi-parser
cp -r plugins/swagger-contract-testing/skills/pactflow ~/.gemini/antigravity/skills/pactflow
```

> Antigravity also supports `.agent/skills/` (singular) for backward compatibility.
