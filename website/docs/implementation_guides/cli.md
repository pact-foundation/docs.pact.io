---
title: Pact command line tools
sidebar_label: Overview
---

There are Pact implementations written in more than 10 languages (see the sidebar of this page for a full list).

Pact contract tests on the consumer side, and verification on the provider side, are usually written in the same language as the code they are testing, using one of Pact's native language DSL's.

Under the hood, these languages leverage the Pact Mock Server (Consumer side) & Pact Verifier (Provider Side) capabilties via the Pact FFI Interface. These capabilities are also exposed in a CLI form.

This document covers all available Pact tools and the multiple ways to install them on your system.

## 🛠️ Available Tools

### **[pact](/implementation_guides/cli/pact-cli)** - All-in-one CLI

- Combines all Pact tools in a single binary
- Extensible architecture with plugin system
- Mock/Stub Server, Provider Verifier, Broker Client & Plugin CLI
- Built-in extension management

### **[pact-mock-server](/implementation_guides/cli/pact-mock-server)** - Consumer testing

- HTTP mock server built with Rust
- Real-time request validation
- Support for Pact V2, V3, V4 specifications
- Plugin support for custom protocols
- provides a web api and command line interface to run pact mock servers.

### **[pact-verifier](/implementation_guides/cli/pact-verifier)** - Provider verification

- Verify providers against consumer contracts
- HTTP, Async/Sync Message & Pact Plugin support.
- Verify from files, URLs, or Pact Broker
- Flexible interaction filtering
- Support for all Pact specifications

### **[pact-stub-server](/implementation_guides/cli/pact-stub-server)** - Integration testing

- Designed to support prototyping of mobile applications
- Generate responses from Pact files
- Load multiple Pact files simultaneously from file, url or broker
- Watch mode, to reload files from disk

### **[pact-broker-client](/implementation_guides/cli/pact-broker-cli)** - Pact Broker interactions

- Publish pacts to broker
- Check deployment safety (`can-i-deploy`)
- Record deployment events
- Manage pacticipant versions, branches and tags

### **[pact-plugin](/implementation_guides/cli/pact-plugin)** - Protocol extensions

- Install and manage Pact plugins
- Support for gRPC, Avro, Csv & custom protocols

### **[pact-legacy](https://github.com/pact-foundation/pact-standalone)** - Ruby-based tools

- Legacy compatibility tools
- Ruby-based implementation
- Original Pact-Ruby core with Pact V2 specification support. Superceded by Pact-Rust core.

## 🚀 Installation Methods

### **Scripts** (Cross-Platform - Linux/MacOS/Windows ARM64/AMD64)

#### *nix Users (including WSL/msys2/mingw)

**Unified CLI**

```bash
curl -fsSL https://raw.githubusercontent.com/pact-foundation/pact-cli/main/install.sh | sh
```

**Pact Broker Client**

```bash
curl -fsSL https://raw.githubusercontent.com/pact-foundation/pact-broker-cli/main/install.sh | sh
```

**Pact Legacy**

```bash
curl -fsSL https://raw.githubusercontent.com/pact-foundation/pact-standalone/master/install.sh | sh
```

#### PowerShell (Windows)

**Unified CLI**

```powershell
iwr -useb https://raw.githubusercontent.com/pact-foundation/pact-cli/main/install.ps1 | iex
```

**Pact Broker Client**

```powershell
iwr -useb https://raw.githubusercontent.com/pact-foundation/pact-broker-cli/main/install.ps1 | iex
```

### **Cargo** (Any Rust-supported target)

**Unified CLI**

```sh
cargo install pact
```

**Pact Verifier**

```sh
cargo install pact_verifier_cli
```

**Pact Mock Server**

```sh
cargo install pact_mock_server_cli
```

**Pact Stub Server**

```sh
cargo install pact-stub-server
```

**Pact Broker Client**

```sh
cargo install pact-broker-cli
```

**Pact Plugin**

```sh
cargo install pact-plugin-cli
```

### **Homebrew** (MacOS/Linux ARM64/AMD64)

```bash
brew tap pact-foundation/tap
```

**Unified CLI**

```bash
brew install pact-foundation/tap/pact
```

**Pact Mock Server**

```bash
brew install pact-foundation/tap/pact-mock-server
```

**Pact Verifier**

```bash
brew install pact-foundation/tap/pact-verifier
```

**Pact Stub Server**

```bash
brew install pact-foundation/tap/pact-stub-server
```

**Pact Plugin**

```bash
brew install pact-foundation/tap/pact-plugin
```

**Pact Broker Client**

```bash
brew install pact-foundation/tap/pact-broker-client
```

**Pact Legacy**

```bash
brew install pact-foundation/tap/pact-legacy
```

### **Scoop** (Windows ARM64/AMD64)

```powershell
# Unified CLI
scoop bucket add pact https://github.com/pact-foundation/scoop
scoop install pact

# Individual tools
scoop install pact-mock-server
scoop install pact-stub-server
scoop install pact-verifier
scoop install pact-plugin
scoop install pact-broker-client
scoop install pact-legacy
```

#### GitHub Actions Example

```yml
- name: Install Pact via Scoop
  if: runner.os == 'Windows'
  shell: powershell
  run: |
    scoop bucket add pact https://github.com/pact-foundation/scoop
    scoop install pact
    scoop search pact
    pact --help
```

### **Chocolatey** (Windows ARM64/AMD64)

- Grab the required package from <https://github.com/pact-foundation/choco/releases>

**Unified CLI**

Download the required package

```powershell
curl https://github.com/pact-foundation/choco/releases/download/choco/pact.0.9.1.nupkg -OutFile pact.nupkg
```

Install the Unified CLI

```powershell
choco install -y pact --source .
```

Windows on ARM - requires ForceARM64 parameter

```powershell
choco install -y pact --params "'/ForceARM64:true'"  --source .
```

**Pact Broker Client**

```powershell
curl https://github.com/pact-foundation/choco/releases/download/choco/pact-broker-client.0.5.0.nupkg -OutFile pact-broker-client.nupkg
choco install -y pact-broker-client --source .
```

**Pact Mock Server**

```powershell
curl https://github.com/pact-foundation/choco/releases/download/choco/pact-mock-server.2.1.0.nupkg -OutFile pact-mock-server.nupkg
choco install -y pact-mock-server --source .
```

**Pact Verifier**

```powershell
curl https://github.com/pact-foundation/choco/releases/download/choco/pact-verifier.1.3.0.nupkg -OutFile pact-verifier.nupkg
choco install -y pact-verifier --source .
```

**Pact Plugin**

```powershell
curl https://github.com/pact-foundation/choco/releases/download/choco/pact-plugin.0.2.0.nupkg -OutFile pact-plugin.nupkg
choco install -y pact-plugin --source .
```

**Pact Stub Server**

```powershell
curl https://github.com/pact-foundation/choco/releases/download/choco/pact-stub-server.0.7.0.nupkg -OutFile pact-stub-server.nupkg
choco install -y pact-stub-server --source .
```

**Pact Legacy**

```powershell
curl https://github.com/pact-foundation/choco/releases/download/choco/pact-legacy.2.5.6.nupkg -OutFile pact-legacy.nupkg
choco install -y pact-legacy --source .
```

#### Chocolatey GitHub Actions Example

```yml
- name: Install Pact via Chocolatey
  if: runner.os == 'Windows'
  shell: powershell
  run: |
    curl https://github.com/pact-foundation/choco/releases/download/choco/pact.0.9.1.nupkg -OutFile pact.nupkg
    if ("${{ runner.arch }}" -eq "ARM64") {
      choco install -y pact --source . --params "'/ForceARM64:true'"
    } else {
      choco install -y pact --source .
    }
    pact --help
```

### **GitHub Actions**

Direct action installation available:

**Unified CLI**

```yml
- uses: pact-foundation/pact-cli@main
- name: Show help
  run: |
    pact --help
    pact broker --help
```

**Pact Broker Client**

```yml
- uses: pact-foundation/pact-broker-cli@main
- name: Show help
  run: pact-broker-cli --help
```

### **Docker** (ARM64/AMD64)

Available on [DockerHub](https://hub.docker.com/u/pactfoundation) & [GitHub Container Registry](https://github.com/orgs/pact-foundation/packages)

```bash
# Unified CLI
docker run --rm -it pactfoundation/pact:latest
docker run --rm -it ghcr.io/pact-foundation/pact:latest

# Individual tools
docker run --rm -it pactfoundation/pact-broker-cli:latest
docker run --rm -it pactfoundation/pact-mock-server:latest
docker run --rm -it pactfoundation/pact-stub-server:latest
docker run --rm -it pactfoundation/pact-verifier:latest
docker run --rm -it ghcr.io/pact-foundation/pact-broker-cli:latest
docker run --rm -it ghcr.io/pact-foundation/pact-mock-server:latest
docker run --rm -it ghcr.io/pact-foundation/pact-stub-server:latest
docker run --rm -it ghcr.io/pact-foundation/pact-verifier:latest
```

## 🏗️ Platform Support

| Platform | x86_64 | ARM64 | Notes |
|----------|--------|-------|-------|
| **Linux** | ✅ | ✅ | All installation methods |
| **macOS** | ✅ | ✅ | All installation methods |
| **Windows** | ✅ | ✅ | Some methods require ARM64 flags |
| **Docker** | ✅ | ✅ | Multi-architecture images |

## 🚦 Quick Start Guide

### 1. Choose Your Installation Method

- **Cross-platform**: Use installation scripts
- **Rust developers**: Use Cargo
- **macOS/Linux**: Use Homebrew
- **Windows**: Use Scoop or Chocolatey
- **CI/CD**: Use GitHub Actions or Docker
- **Containers**: Use Docker images

### 2. Start with the Unified CLI (Recommended)

```bash
# Install unified CLI (method varies by platform)
pact --help

# List available extensions
pact extension list

# Install available extensions
pact extension install pactflow-ai
pact extension install pact-legacy

# Run pactflow-ai
pact pactflow-ai

# Run a legacy tool
pact pact-broker-legacy
```

### 3. Basic Usage Examples

Start Master Mock server for consumer testing

```bash
pact mock start --port 1234
```

Create a mock server

```bash
pact mock create --file examples/foo-bar.json --port 1234
```

Verify a provider

```bash
pact verifier --hostname localhost --port 4567 --file ./examples/fail.json --state-change-url http://localhost:4567/provider-state
```

Start a pact broker with docker

```bash
pact broker docker start
```

Publish some pacts

```bash
pact broker publish ./pacts --auto-detect-version-properties --broker-base-url http://localhost:9292
```

Check deployment safety for a provider

```bash
pact broker can-i-deploy --pacticipant "Example API" --version 4fdf20082263d4c5038355a3b734be1c0054d1e1 --to test --broker-base-url http://localhost:9292
```

Check deployment safety for a consumer

```bash
pact broker can-i-deploy --pacticipant "Example App" --version 5556b8149bf8bac76bc30f50a8a2dd4c22c85f30 --to test --broker-base-url http://localhost:9292
```

Same command as above, with the legacy tooling

```bash
pact extensions install pact-legacy
pact pact-broker-legacy can-i-deploy --pacticipant "Example App" --version 5556b8149bf8bac76bc30f50a8a2dd4c22c85f30 --to test --broker-base-url http://localhost:9292
```

## 📚 Documentation & Resources

- **[Pact Documentation](https://docs.pact.io)** - Comprehensive guides
- **[Getting Started](https://docs.pact.io/getting_started/)** - New to Pact?
- **[Implementation Guides](https://docs.pact.io/implementation_guides/)** - Language-specific
- **[Pact Broker](https://docs.pact.io/pact_broker/)** - Contract repository
- **[Plugins](https://docs.pact.io/plugins/)** - Protocol extensions

## 🤝 Community & Support

- **GitHub Issues**: Report issues in respective tool repositories
- **Slack**: [Join the Pact community](https://slack.pact.io/)
- **Stack Overflow**: Tag questions with `pact`
- **Documentation**: Comprehensive guides at [docs.pact.io](https://docs.pact.io)

## 🎯 Which Tool Should I Use?

### For New Projects

→ **Unified CLI (`pact`)** - Single binary with all tools and extensions

### For Existing Workflows

→ **Individual tools** - Drop-in replacements for existing Ruby tools

#### Migrations

The following examples show the migration path from the legacy pact-ruby tooling to the new Rust based which supports all the latest Pact features.

- Mock Server
  - Legacy (Ruby) - See [Example](https://github.com/pact-foundation/pact-cli/blob/main/examples/mock_example-ruby.sh)
  - New (Rust) - See [Example](https://github.com/pact-foundation/pact-cli/blob/main/examples/mock_example-rust.sh)
- Verifier
  - Legacy (Ruby) - See [Example](https://github.com/pact-foundation/pact-cli/blob/main/examples/verifier_example-ruby.sh)
  - New (Rust) - See [Example](https://github.com/pact-foundation/pact-cli/blob/main/examples/verifier_example-rust.sh)
- Stub
  - Legacy (Ruby) - See [Example](https://github.com/pact-foundation/pact-cli/blob/main/examples/stub_example-ruby.sh)
  - New (Rust) - See [Example](https://github.com/pact-foundation/pact-cli/blob/main/examples/stub_example-rust.sh)

### For CI/CD Pipelines

→ **Docker images** or **GitHub Actions** - Consistent, reproducible environments

### For Development

→ **Package managers** (Homebrew, Scoop, Chocolatey) - Easy installation and updates

---

**Ready to get started?** Choose your preferred installation method above and dive into contract testing with Pact! 🚀
