---
title: Best Practise
---

For a video of this best practise guide, please see [YouTube](https://www.youtube.com/watch?v=LyVSmRtwFkc) for Reducing the cost of testing in application modernization: a banking case study by [Sngular](https://www.sngular.com/)

## 3 key steps to ensure and scale enterprise wide adoption

- Stakeholder buy-in:
  - Using Pact requires collaboration and commitment from each consumer and provider team. Getting buy-in from key stakeholders and aligning on clear goals, objectives and how we will measure success.
- Run a PoC:
  - In our experience, it’s best to start small with an initial MVP and a reduced working group on which to establish the appropriate working context, validate concepts and hypotheses. With these learnings it will be easier to scale and expand across the organisation.
- GoP:
  - Once a PoC has demonstrated value in moving forward, the challenge becomes scaling contract testing throughout the organisation. There is value in creating an internal group of practise to accelerate adoption, training, eduction and scaling.

## Group of Practise (GoP)

- Metrics: Establish metrics and KPI’s to track the speed of adoption across the organisation
- Processes: Develop a standard methodology for team adoption with step-by-step instructions including
  - Workflow of all contract testing related tasks within every sprint
  - Recommended development model that follows the release cycle using a branching model
  - Adaptation of the SDLC to include contract testing
  - Definition of the onboarding and monitoring processes for all relevant teams.
- Communication: Facilitate real-time collaboration by enabling the rapid collection of data and ideas
  - Organise regular “open sessions” to address/resolve any questions or issues
  - Regular meetings to track progress with stakeholders (including Dev, QA, SRE, PO)
  - Create an open commenting/annotation system to loop in others and improve coverage
- Tracking: Reporting of KPI progress to all key stakeholders
  - Support and follow up for all teams
  - Feedback to revise and refine all processes and practise

## How to onboard teams?

- Buy in: Establish the current problems and how the new model will help solve those challenges
- Training: Step by step training and workshop, based on company domain
- Alignment: Define the main objects and agree on metrics to measure adoption
- Commitment: Reserve time to commit to adoption of new practise
- Adoption: Set a group of Contract testing champions to help build spikes
  - Champions pair programming
  - Continuous support via champions and GoP
- Progress tracking: Follow up and KPI’s monitoring
- Refinement: Open talks and retros with teams to gather feedback

## Quantitative metrics

- Engagement
  - No of pipelines with can-i-deploy tool enabled
  - No of teams/projects with contracts in Pactflow
  - No of endpoints covered by contracts (contract testing coverage)

- Impact
  - Time spent on manual testing (we want to see a reduction)
  - Deployment frequency - how often do you release?
  - Lead time for change - how long does it take to get a release from commit to production
  - Change failure rates - how frequently does a change result in a failure as a percentage
  - Mean time to recovery (MTTR) - how long does it take to recover from a failure

## Qualitative Metrics

- How is the team feeling with the new tools?
- What are the plans and gains?
- How active is the tool?
- How active and supportive is the community?

## Example results from a customer after 7 sprints

- Governance
  - 2 teams training in CT techniques, 4 CT champions
  - 8 KPI’s defined
  - GoP setup to engage teams and continue CT using Pact gaining adoption
  - Implementation of RBAC in Pactflow
- Technical Aspects
  - 6 endpoints covered with CT
  - 2 Jenkins pipelines integrated with Pactflow
  - 2 bugs detected which were present in production environments
- Times
  - 8 hours to develop first CT test
  - 3 weeks to integrate first pipeline
  - 4 weeks from the project start date to discover first bug

## Learnings: Contract testing champions as a key role

> Main role to accelerate the process

- Evangelises the rest of the teams
- Supports the practise also over the organisation
- Ownership of the practise
- Autonomy and trust of the organisation to make decisions

## Learnings: A Group of Practise is a must to expand adoption

  >Group of Practise should always be established to guide, support & continuously track the degree of adoption of the new practise within an organisation.
  
Key responsibilities include:

- Evangelise about the use and benefits of contract testing
- Train teams in the technique
- Establish metrics for monitoring and checking the degree of success
- Collect feedback from the teams
- Resolve dependencies and impediments
- Provider teams with adequate resources to implement contract testing - efficiently
- Prepare status reports
- Organise meetings, seminars, workshops, lectures on contract testing within the organisation

## Learnings: Monitoring metrics are key to track success

>For any process of implementation of new practises in an organisation, it is important to establish monitoring metrics that allow us to know the degree of evolution of the same.

This data will give us information on:

- Degree of implementation in teams
- Effectiveness of contract testing within the organisation
- Alignment with business objectives
- Fulfilment of expectations
- Detection of deviations or inefficiencies
