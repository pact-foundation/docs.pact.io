---
title: Telemetry
---

The Pact team strive to develop great open source tools for the community. We rely on the community's input to help us iterate on and improve Pact. Telemetry is additional information that helps us to better understand the community's needs, diagnose issues, and prioritise feature work.

The Pact client libraries (e.g. Pact JS, Pact JVM) collect telemetry, such as generic usage metrics and system and environment information. For details of the types of telemetry collected, see [Types of information collected](#types-of-information-collected).

We do not collect personal information, such as usernames or email addresses. It also does not extract sensitive project-level information.

When using Pact you can control whether telemetry is enabled, and the setting can be changed at any point in time. If telemetry remains enabled, telemetry data is sent in the background without requiring any additional customer interaction.

This data is collected via [Google Analytics (GA)](https://developers.google.com/analytics/devguides/collection/protocol/v1/devguide) and is accessible by Pact OSS maintainers.

## Opt Out

### Disabling telemetry for a session

To disable telemetry for your current session, you must set the environment variable `PACT_DO_NOT_TRACK` to `true`. You must repeat the command for each new terminal or session.

In macOS and Linux operating systems, you can disable telemetry for a single session as follows:

```bash
export PACT_DO_NOT_TRACK=true
```

On Windows (PowerShell):

```powershell
$env:PACT_DO_NOT_TRACK = 'true'
```

Maven pom.xml>surefire :
```xml
<property>
    <name>pact_do_not_track</name>
    <value>true</value>
</property>
```

### Disabling telemetry for your profile in all sessions

To disable telemetry permanenently (for all future sessions), you need to add a new item to your list of permanent environment variables.

In macOS and Linux operating systems, you can add it to your terminal profile as follows:

```bash
echo "export PACT_DO_NOT_TRACK=true" >> ~/.profile
source ~/.profile
```

On Windows:

```sh
setx PACT_DO_NOT_TRACK "true"
refresh env
```

## Types of Information Collected

The information collected is a combination of data about the the environment and event occurring and parameters required by GA.

| Data                        | Description                                                                                             |
| :-------------------------- | :------------------------------------------------------------------------------------------------------ |
| Version of API              | Version of the GA API used to collect telemetry                                                         |
| Hash of hostname            | MD5 digest hash of the hostname. Used to anonymously detect repeat usage                                |
| Human readable library name | Human readable string to indicate which library generated the event e.g 'Pact JS'                       |
| Library name                | The name of the library as it appears in github e.g 'pact-js'                                           |
| Library version             | The semantic version of the Library that generated the event e.g v1.2.3                                 |
| AIP                         | Anonymised IP address of the computer                                                                   |
| Data Source                 | Environment where the code generating the event ran, e.g 'cli', 'client' or 'broker'                    |
| OS and Arch                 | The OS and Arch of the machine that generated the event e.g 'linux-x86_64'                              |
| Plugin name                 | Where the event is generated from a plugin, the name of that plugin                                     |
| Plugin version              | Where the event is generated from a plugin, the version of that plugin                                  |
| Pact verification mode      | The language or test framework running the pact test that generated the event e.g 'Ruby', 'JUnit'       |
| Platform version            | The version related to the above test framework or language                                             |
| Event                       | Human readable string to indicate which event occurred e.g 'Pacts verified'                             |
| Category                    | Used to determine if the test running was a provider test of consumer test                              |
| Action                      | Used to indicate an action that occurred in the code when the event was generated.                      |
| Value                       | Numerical value that can be used to track any number related to the event, e.g number of pacts verified |

## Further Questions?

For more information or help with Telemetry check out ['Where to go for help'](https://docs.pact.io/help/)
