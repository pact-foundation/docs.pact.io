# Diátaxis Review — docs-pact-io-diataxis-refactor

**Scope:** `/Users/matthew.fellows/development/public/docs-pact-io-diataxis-refactor/website/docs/`
**Date:** 2026-03-20
**Reviewer:** Claude Sonnet 4.6

---

## Executive Summary

This is a Diátaxis refactor branch of the Pact documentation site. Compared to a typical legacy codebase, it shows significant intentional improvement: the top-level navigation has been explicitly reorganised around the four quadrants, with dedicated `concepts.md`, `tutorials.md`, and the existing `consumer/` and `provider/` sections positioned as how-to content. The structural intent is clear and largely correct. However, several important documents still contain type-mixing anti-patterns, and two of the four quadrants remain underdeveloped or mislocated within the overall structure.

---

## 1. What Adheres Well

### The top-level navigation model (`getting_started.md`, `concepts.md`, `tutorials.md`)

The landing page (`getting_started.md`) is the strongest structural win. Its "Where would you like to go?" table maps cleanly onto the four Diátaxis types:

| User intent | Destination |
|---|---|
| Follow a tutorial | Tutorials |
| Understand how Pact works | Concepts |
| Solve a specific problem | How-to Guides |
| Look up API/spec details | Pact Docs |

This is correct Diátaxis navigation architecture. The reader is routed to the right quadrant from the first page they land on.

`concepts.md` correctly acts as a signpost page for Explanation content. It labels itself clearly as "the why and how behind Pact" and routes users to conceptual sub-pages. The framing — "If you're new to contract testing or want to deepen your understanding" — is the right register for Explanation.

`tutorials.md` is a well-structured Tutorial hub. It names concrete outcomes ("5-minute quick start", "Introduction to Pact — 13 steps", "Async messages") and links to the workshop steps. The framing ("hands-on tutorials to learn Pact by doing") is correct. The "After the tutorials" section correctly guides users onward to How-to and Reference material — this cross-linking pattern is exactly what Diátaxis recommends.

### University workshop steps (`university/introduction/`, `university/message-pact-async/`)

These are genuine Tutorials in execution. They are sequential, step-based, learning-by-doing exercises. Each step (`01_Step1.md` through `13_Step13.md`) follows the learner-led progression that defines a tutorial. The scaffolding files (`00_1_Intro.md`, `00_3_LearningObjectives.md`, etc.) support the tutorial's promise of a guided learning journey.

### Reference material (`pact_broker/configuration/settings.md`, `pact_broker/api/webhooks.md`)

`pact_broker/configuration/settings.md` is correctly structured as Reference. It is auto-generated, structured by the product's own parameter names, and contains no procedural steps. Each entry lists environment variable name, YAML key, default, and allowed values — consistent patterns across all items. This is textbook Reference.

`pact_broker/api/webhooks.md` follows the same pattern — paths, allowed methods, request/response schemas — with no instructions or opinions embedded. Correct placement.

`pact_broker/advanced_topics/consumer_version_selectors.md` is a strong Reference document. It defines each selector property neutrally, lists them consistently, and provides code examples structured by language. The inline comments explaining _why_ not to use `latest: true` drift briefly toward opinion, but this is minor. The overall structure is correct for a document that users will consult during work, not read through.

`implementation_guides/overview.md` correctly functions as a Reference index — tables of languages, CLI tools, Docker images, and Homebrew packages, structured by the product's own taxonomy.

### How-to guides (`consumer.md`, `provider/how_to_fix_failing_verification_tests.md`)

`consumer.md` (Writing Consumer Tests) is close to a correct How-to. It is organised around practitioner rules ("Use Pact for isolated unit tests", "Avoid using Pact for tests that involve the UI", "Ensure all calls to the Provider go through tested classes"). The Best Practice Guide section with good/bad code examples is well-suited to a How-to audience.

`provider/how_to_fix_failing_verification_tests.md` is a correctly scoped How-to: a specific problem ("my pact verification tests are failing"), with concrete steps, per-language. It is numbered, goal-directed, and assumes the user knows they have a problem to solve.

---

## 2. What Needs Improvement

### `5-minute-getting-started-guide.md` — Tutorial with anti-patterns

**Classification:** Intended as Tutorial; partially functioning as one.

**Issues:**
- Lines 40–53: Instead of guiding the learner through actions, the guide pauses to explain _scope_ — "Ideally, the Pact tests should be 'unit tests' for your client class… Remember that pact is for testing the contract used for communication." This is Explanation embedded in a Tutorial. A Tutorial learner does not need to understand _why_ scope matters during their first steps; they need to be told what to do next.
- Lines 237–242: The aside about 404/400/500 status codes ("you would rinse and repeat") breaks the tutorial's linear journey with open-ended suggestions. Tutorials should not offer choices or branches — they lead.
- The title says "5 minutes" but the guide includes significant conceptual passages and requires environment setup, forking, and cloning. The learning contract with the reader is broken.

**Suggestion:** Split this into two documents. Retain a true 5-minute tutorial that guides the learner through exactly one consumer-provider test end-to-end with no explanatory digressions. Move the explanatory content about test scope and status codes to the relevant Concepts or How-to pages (some of this already exists in `consumer.md`).

---

### `getting_started/how_pact_works.md` — Explanation with embedded How-to

**Classification:** Primarily Explanation; contains how-to instructions.

**Issues:**
- Lines 105–193 ("How to write message pact tests?") embed a full walkthrough of Ports and Adapters architecture, code samples, and procedural steps for consumer and provider sides. This is How-to material. Its presence in what should be a conceptual overview document breaks the Explanation quadrant.
- The title "How Pact works" signals Explanation; the final third of the document delivers instruction.

**Suggestion:** Extract lines 105–193 ("How to write message pact tests?") into a dedicated How-to guide under `consumer/` or `provider/` — something like "How to test async message integrations." Retain the conceptual description of Message Pact (what it is, why it abstracts protocols) in `how_pact_works.md`.

---

### `getting_started/conceptual_overview.md` — Explanation with procedural leakage

**Classification:** Primarily Explanation; anti-patterns present.

**Issues:**
- Line 44: "I'll discuss later how we use branches and environments to help answer the question: can I deploy?" — first-person narrative is appropriate for Explanation, but the phrase "I'll discuss later" suggests a tutorial's sequential structure rather than a stable conceptual reference. Explanation does not have a "later."
- The document mixes the right conceptual content (domain model tables, how branches and versions relate) with forward references that make it feel like a chapter in a guide rather than a standalone explanation.
- There are no explicit heading anchors or a clear scope boundary. The page stops abruptly at "pacticipant."

**Suggestion:** Make this document self-contained and explicitly scoped. Add a brief intro paragraph naming what the page explains and its boundaries. Remove the "I'll discuss later" forward references. Replace them with links to the relevant how-to or reference documents.

---

### `pact_nirvana.md` / `pact_nirvana/step_*.md` — How-to mixed with Tutorial framing

**Classification:** Mixed — part CI/CD How-to, part Tutorial walkthrough.

**Issues:**
- The intro (`pact_nirvana.md`) is framed as a how-to guide: "a technical guide for developers and testers who want to use Pact to implement consumer driven contract testing as part of your ongoing CI/CD workflow." This is correct how-to positioning.
- However, the step files (`step_1.md` through `step_7.md`) are sequential and prescriptive, resembling a Tutorial. `step_1.md` reads: "Before you read this document, you should have read..." — this prerequisite structure belongs to Tutorial, not How-to.
- The "steps" metaphor and the linear Bronze→Silver→Gold→Platinum progression blur the line between "stages of a guide" and "tutorial steps."
- `step_1.md` contains almost no actionable content — it is a list of prerequisites and links, not a guide step.

**Suggestion:** Clarify the document type explicitly. If this is a How-to, reorganise around tasks the reader needs to accomplish ("How to set up Pact Broker integration in CI", "How to configure can-i-deploy"). If it is a Tutorial, rewrite it with first-person plural framing ("Let's configure...") and ensure it reaches a satisfying conclusion. A hybrid is difficult to maintain and confuses both types of users.

---

### `getting_started/matching.md` — Reference with embedded Best Practice

**Classification:** Mixed — partly Reference, partly How-to opinion.

**Issues:**
- Lines 183–199 ("Best practice — Request matching / Response matching / Random data") embed opinionated guidance ("You generally want to use exact matching... You want to be _as loose as possible_...") into what is otherwise a factual description of matching features.
- The first ~180 lines correctly describe matcher syntax and behaviour (Reference). The last section adds opinion and judgement — which is How-to territory.

**Suggestion:** Move the "Best practice" section to `consumer.md` or a dedicated how-to page on choosing matchers. Leave `matching.md` as a neutral description of the matching features available.

---

### `pact_broker/can_i_deploy.md` — How-to with Explanation embedded

**Classification:** Primarily How-to; good but contains conceptual explanation that interrupts the task.

**Issues:**
- Lines 7–13: The explanation of what the Matrix is ("When a pact is published, the version of the consumer that generated the pact is recorded...") is Explanation. A user consulting can-i-deploy to accomplish a deployment task does not need this background explained inline. It belongs in the Pact Broker Overview (`pact_broker/overview.md`), which already covers the Matrix concept.
- The document improves significantly once it starts with concrete commands. The Summary at line 93 is exactly right for a How-to — it restates the two commands the user needs.

**Suggestion:** Replace the explanatory opening paragraph with a one-sentence statement of the problem ("Before deploying, you need to confirm the version you're deploying is compatible with what's already in the environment") and a link to the Matrix concept in the overview. The bulk of the document is solid.

---

### `recipes/kafka.md` — How-to without How-to structure

**Classification:** Intended as How-to (recipe); reads as an informal tutorial walkthrough.

**Issues:**
- The document uses first-person narrative ("We'll start with...", "Lets take a look at..."), which is tutorial voice, not how-to voice.
- It walks through code chronologically ("Next we define...", "Moving on...") in a way that teaches the pattern rather than efficiently directing someone to accomplish a task.
- There is no clear problem statement ("You need to test a Kafka consumer using Pact — here's how") or assumed competence level.
- Code blocks are not preceded by explanatory headings that tell the reader what they're about to do.

**Suggestion:** Restructure as a How-to guide: state the goal upfront, use imperative headings ("Configure your consumer test", "Write the provider verification"), and remove the narrative walkalong voice. The technical content is good; the framing needs to shift from "let me show you" to "here is how to do it."

---

### `consumer.md` — Structural boundary issue: Best Practice Guide section

**Classification:** Mostly How-to; Best Practice Guide section is appropriate but very long.

**Issues:**
- The "Best Practice Guide" section (lines 110–640) is a comprehensive, well-organised set of rules. However, its depth and structure (numbered sections with subsections, rule boxes, code examples) makes it feel like a standalone reference document rather than integrated how-to guidance.
- It would benefit from being its own page (e.g., `consumer/best_practices.md`) with a clear link from `consumer.md`, reducing the length of the main how-to page.

**Suggestion:** Extract the Best Practice Guide into its own document. This would make `consumer.md` a proper compact how-to, and the Best Practice Guide page would be findable on its own as a reference or how-to companion.

---

## 3. Significant Gaps

### Gap 1: No standalone Explanation for core Pact concepts

The `concepts.md` page correctly positions itself as an Explanation hub, and `how_pact_works.md` and `conceptual_overview.md` are attempts at Explanation. However, there is no dedicated Explanation page that addresses the fundamental question a newcomer has: **"Why does contract testing exist, and why is Pact's consumer-driven approach the right design?"**

`getting_started/what_is_pact_good_for.md` is a good start — it explains trade-offs and design reasoning. But the questions of _why consumer-driven contracts rather than schema testing_, _why the pact file is generated rather than hand-written_, and _how this fits into a microservices testing strategy_ are scattered across FAQs, the landing page, and blog links. These are precisely the "distance from the work" topics that Explanation is for — the user is not trying to do anything; they are trying to understand.

**User need left unmet:** A developer new to contract testing who has finished the tutorial and wants to understand why Pact works the way it does cannot find a single, coherent page that explains the design philosophy, trade-offs, and mental model. They leave without the conceptual foundation needed to make good decisions when Pact behaves unexpectedly.

**Suggestion:** Create `concepts/why-pact.md` or `concepts/design-philosophy.md` that brings together the rationale for consumer-driven contracts, the difference from schema testing, the philosophy of test independence, and why the broker model exists. This page should be read away from the computer, not during work.

---

### Gap 2: No Reference index for the Pact file format / specification

The `getting_started/specification.md` links to the external GitHub specification repository. There is no on-site Reference documentation describing the structure of a pact file — what fields it contains, what the schema is, what each field means, and how different specification versions differ.

**User need left unmet:** A developer who is debugging a pact file, writing a custom publisher, or building tooling around the pact format has no on-site reference to consult. They must go to GitHub and read raw specification files.

**Suggestion:** Create a Reference page `reference/pact-file-format.md` that describes the JSON structure of a pact file — top-level fields, interaction structure, matching rules, and metadata — across specification versions.

---

### Gap 3: Shallow provider how-to coverage compared to consumer

The `consumer.md` page is extensive (640+ lines with best practices). The `provider.md` equivalent is much thinner. The provider how-to section contains:
- `provider/recommended_configuration.md`
- `provider/handling_auth.md`
- `provider/how_to_fix_failing_verification_tests.md`
- `provider/using_provider_states_effectively.md`

There is no equivalent of the consumer Best Practice Guide for providers. There is no "how to write good provider tests" with the depth and structure that `consumer.md` provides for consumers.

**User need left unmet:** A provider team picking up Pact for the first time has deep consumer guidance available but must figure out provider verification best practices by reading implementation-guide documentation for their specific language, rather than finding general principled guidance.

**Suggestion:** Create a `provider/best_practices.md` that mirrors the structure of the consumer best practice guide — covering test isolation, stubbing dependencies, provider state design, and verification scope.

---

### Gap 4: Plugin documentation has no Explanation-level page

The `plugins/` section contains `directory.md` (a reference list) and `quick_start.md`, plus the `create-a-plugin` workshop tutorial. There is no page that explains the conceptual model of the plugin system: what plugins are, how they integrate with the FFI layer, when you would build one versus using an existing one, and what the protocol boundaries are.

The design documents under `implementation_guides/pact_plugins/docs/` (content-matcher-design, plugin-driver-design) are Explanation content buried in the implementation guides section, inaccessible to users who approach from the top-level plugins menu.

**User need left unmet:** A developer evaluating whether to build a Pact plugin cannot find a conceptual overview in the user-facing plugins section. They either do the tutorial (too much) or read implementation design docs written for contributors (too much the other way).

**Suggestion:** Create `plugins/concepts.md` that explains the plugin model at a conceptual level — suitable for someone evaluating whether plugins address their use case, before they commit to a tutorial.

---

## After the Report

The most impactful next step would be addressing Gap 1 — the missing Explanation page for Pact's design philosophy. This single gap affects every new user who completes a tutorial and then struggles to understand why Pact behaves the way it does. I can draft `concepts/why-pact.md` if that would be useful.

Alternatively, if the priority is fixing existing content rather than creating new pages, the highest-impact improvements would be:
1. Extracting the Message Pact how-to walkthrough out of `getting_started/how_pact_works.md` (it contaminates what should be a clean Explanation page)
2. Splitting the `5-minute-getting-started-guide.md` to remove the Explanation digressions
3. Giving the `pact_nirvana/` section a clear type declaration and restructuring accordingly

Which of these would you like to tackle first?
