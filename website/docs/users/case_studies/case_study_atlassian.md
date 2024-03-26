---
title: Case Study - Atlassian
---

## Atlassian: Jira

<img src="/img/logos/brand/atlassian.svg" alt="Atlassian Logo" width="500" />

### Overview

Atlassian is an enterprise software company that develops products for software development, project management, and content management. It is best known for its issue tracking application, Jira, and its team collaboration and wiki product, Confluence.

One of the reasons Jira is so successful is its deep integration with other tools - and to achieve this, the Jira team builds integrations - "A lot of integrations". In a recent change, they've re-architected parts of their platform to move aware from pulling in data from external vendors to having external vendors push data to them, resulting in an increase in the number of APIs they were required to design and build. Their first objective was to implement their new feature flag integration in Jira.

The project had a tight deadline (8 weeks), external customers, and a lot of "unknown unknowns":

> These constraints led us to one overarching driver: we needed to move quickly, and iterate on our API fast as we received feedback from our external customers.

James Navin, Principal Developer

### Challenges

The current approach to designing, building and releasing APIs had two big drawbacks:

- **Slow feedback loops** - Time from “start design” to “get feedback” was measured in days or weeks.
- **Breaking API changes** - It was too easy to introduce unintentional breaking changes to APIs during maintenance, unless there was a strict discipline in place to detect it.

### Outcomes

The team moved to a specification-first approach, meaning APIs were documented, codified in tests and shared with all parties. To achieve this, they used a number of tools including Swagger / OpenAPI (OAS) specification and Pact.

The benefits:

- **Iterative API design** - Feedback on the API design was fast and meaningful.
- **Parallel development** - Integration teams could begin implementation on their side without needing to wait for the API implementation to complete.
- **Shorter feedback loops** - Teams were able to get internal or external feedback within hours, not days.
- **Automated mocks** - Teams could build mocks from the Swagger and Pact definitions without fear that it would fail when it came time to test the real implementation.
- **Contract testing for safety** - They received immediate feedback in their tests when a breaking change was about to be made to the API implementation by validating against our API spec.

### Further material

- https://www.youtube.com/watch?v=-6x6XBDf9sQ
- https://www.atlassian.com/blog/technology/spec-first-api-development

___
