---
title: Telemetry
---

The Pact team strive to develop great open source tools for the community. We rely on the community's input to help us iterate on and improve Pact. Telemetry is additional information that helps us to better understand the community's needs, diagnose issues, and prioritise feature work.

Pact's distribution channels — Docker images on Docker Hub, CLI binaries on GitHub Releases, and similar — are routed through [Scarf](https://scarf.sh/), which collects anonymized usage analytics about how Pact tools are downloaded. README impressions on github.com and Docker Hub are also tracked via 1x1 pixel images served from `static.scarf.sh`.

We do not collect personal information, such as usernames or email addresses. Pact tools do not extract sensitive project-level information at runtime.

When consuming Pact tools you can control whether telemetry is enabled, and the setting can be changed at any point in time. If telemetry remains enabled, telemetry data is sent in the background without requiring any additional interaction.

This data is collected via [Scarf](https://scarf.sh/) and is accessible by Pact OSS maintainers.

## Opt Out

Scarf collects analytics at the moment you pull / download a Pact distribution. The primary opt-out is **to use the canonical (Docker Hub / GitHub Releases / etc.) URLs directly instead of the Pact Foundation's Scarf gateway URLs documented in each project's README.**

### Docker images

To opt out of pull-event analytics for the Pact Broker (and any other Pact Docker image), pull from Docker Hub directly:

```bash
docker pull pactfoundation/pact-broker
```

Avoid the `docker.pactflow.io/pactfoundation/...` gateway URLs shown in each project's README install / examples blocks.

### CLI binaries

To opt out of download-event analytics for Pact CLI binaries (e.g. `pact-broker-cli`, `pact-cli`), download from the canonical [GitHub Releases](https://github.com/pact-foundation/pact-broker-cli/releases) page directly. Avoid the Scarf gateway URLs documented in each tool's README (e.g. `curl <gateway>/...installer.sh | sh`).

### README impression pixel

A 1x1 image served from `static.scarf.sh` records README impressions on github.com and Docker Hub. To opt out:

- Disable image loading in your browser when viewing the README; or
- Block `static.scarf.sh` at the network level (firewall, DNS sinkhole, browser content-blocker).

### `PACT_DO_NOT_TRACK` for install scripts

Some Pact install scripts (e.g. the `pact-cli` installer) respect the `PACT_DO_NOT_TRACK` environment variable as a fail-fast opt-out for install-time analytics events. Where this is supported, setting `PACT_DO_NOT_TRACK=true` prevents the script from emitting any telemetry.

In macOS and Linux operating systems:

```bash
export PACT_DO_NOT_TRACK=true
```

On Windows (PowerShell):

```powershell
$env:PACT_DO_NOT_TRACK = 'true'
```

Maven `pom.xml` > `surefire`:

```xml
<property>
    <name>pact_do_not_track</name>
    <value>true</value>
</property>
```

### Disabling telemetry for your profile in all sessions

To disable install-time analytics permanently for every future session, add `PACT_DO_NOT_TRACK=true` to your permanent environment variables.

In macOS and Linux operating systems, add it to your shell profile:

```bash
echo "export PACT_DO_NOT_TRACK=true" >> ~/.profile
source ~/.profile
```

On Windows:

```sh
setx PACT_DO_NOT_TRACK "true"
refresh env
```

This affects install-time scripts that honor `PACT_DO_NOT_TRACK`. Scarf gateway analytics for pulls and downloads are opted out **by URL** (see above sections), not by environment variable, and the README impression pixel is opted out via image / network blocking.

## Types of Information Collected

Telemetry collected through [Scarf](https://scarf.sh/) falls into three categories, per [Scarf's Docker / File Packages documentation](https://docs.scarf.sh/packages/):

| Category | Description |
| :-- | :-- |
| System and OS statistics | Parsed from the client `User-Agent` header: Docker client version, language runtime, kernel version, OS (`linux` / `darwin` / `windows`), architecture (`amd64` / `arm64` / `arm`). |
| Company information | Organisation / company name derived from the source IP via an ASN lookup at request time. Attributes usage at company level, not user level. |
| Downloads by versions / tags | The tag in a Docker pull, or the version in a release download. Tells maintainers which versions are in active use. |

Additional metadata per Scarf's [privacy policy](https://about.scarf.sh/privacy-policy):

| Category | Description |
| :-- | :-- |
| Coarse-grained location | Country, derived from the source IP at request time. |
| Referring URL | For README pixel impressions, the page that referred the request, when present. |
| Page parameter | For README pixel impressions, the page name passed in the pixel URL (always `README.md` for Pact's pixels). |
| Pixel ID | The `x-pxid` query parameter identifying which pixel fired the event. |

### What is NOT collected

Per Scarf's documentation:

- **IP addresses are not stored.** They are used at request time for the geo / organisation lookup and then discarded.
- **No cookies are set.**
- **No persistent identifiers are used.** Users are not tracked across sessions or across sites.
- **No personally identifiable information is retained.**

## Further Questions?

For more information or help with Telemetry check out ['Where to go for help'](https://docs.pact.io/help/)
