# Diataxis Refactor Plan — docs.pact.io

## Status: In Progress
Last updated: 2026-03-19

---

## 1. Audit Summary

### Current navigation structure

| Nav Item | Sidebar key | Description |
|---|---|---|
| Getting Started | `getting-started` | Landing, How Pact Works, 5-min guide, Pact Concepts, Workshops, FAQ |
| Guides | `guides` | Consumer best practices, Provider best practices, Pact Nirvana (CI/CD), Recipes |
| Pact Docs | `docs` | Implementation guides per language, CLI tools, Plugins, Feature support |
| Pact Broker Docs | `pact_broker` | Broker admin, webhooks, can-i-deploy, etc. |
| Resources | `resources` | History, blogs, books, events, case studies |
| Contributing | `contributing` | Code, CI, docs, contributors |
| Blog | (separate) | |
| Help | `help` | How to ask for help, debug logging, SmartBear resources |
| University | `university` | Intro to Pact (13 steps), Async messages (4 steps), Plugins workshop |

### Diataxis content audit

#### TUTORIALS (learning-oriented, hands-on "learning by doing")
| Current location | Content | Action |
|---|---|---|
| `/5-minute-getting-started-guide` | 5-minute guide (consumer + provider example, JS) | Move to Tutorials |
| `/university/introduction/*` | 13-step Intro to Pact workshop | Keep in Tutorials (already good) |
| `/university/message-pact-async/*` | Async message pact workshop | Keep in Tutorials |
| `/plugins/workshops/create-a-plugin/*` | Create a plugin workshop | Keep in Tutorials |
| `/implementation_guides/workshops` | External workshop links | Keep in Tutorials |

**GAP**: No language-agnostic "write your first consumer test" tutorial. The 5-minute guide is JS-only and slightly dated.

#### HOW-TO GUIDES (problem-oriented, "how do I accomplish X?")
| Current location | Content | Action |
|---|---|---|
| `/consumer` | Writing consumer tests (best practices) | Keep in How-to Guides |
| `/consumer/contract_tests_not_functional_tests` | Contract vs functional tests | Keep in How-to Guides |
| `/consumer/using_pact_to_support_ui_testing` | UI testing with Pact | Keep in How-to Guides |
| `/consumer/recommended_configuration` | Consumer recommended config | Keep in How-to Guides |
| `/provider` | Verifying pacts (best practices) | Keep in How-to Guides |
| `/provider/using_provider_states_effectively` | Provider states guide | Keep in How-to Guides |
| `/provider/handling_auth` | Handling auth in provider tests | Keep in How-to Guides |
| `/provider/recommended_configuration` | Provider recommended config | Keep in How-to Guides |
| `/provider/how_to_fix_failing_verification_tests` | Fix failing verification | Keep in How-to Guides |
| `/pact_nirvana` + steps | CI/CD setup (7 steps to Pact Nirvana) | Keep in How-to Guides (it's a multi-step how-to) |
| `/recipes/*` | Optional fields, Kafka, GraphQL, AWS, Lambda, Cypress, MUnit | Keep in How-to Guides |
| `/implementation_guides/feature_toggles` | Feature toggles | Keep in How-to Guides (recipes) |
| `/getting_started/stubs` | Using stub servers | Move to How-to Guides |

**GAP**: No how-to guide for "migrate from v3 to v4 Pact specification". Migration docs scattered in language-specific guides.

#### EXPLANATIONS (understanding-oriented, "why does this work this way?")
| Current location | Content | Action |
|---|---|---|
| `/` (getting_started.md) | What is contract testing, when to use it | Stays as intro but restructure to be clearly explanation |
| `/getting_started/how_pact_works` | How Pact works (with diagrams) | Move to Concepts/Explanations |
| `/getting_started/conceptual_overview` | Conceptual overview | Move to Concepts/Explanations |
| `/getting_started/terminology` | Pact terminology | Move to Concepts/Explanations |
| `/getting_started/testing-scope` | Testing scope | Move to Concepts/Explanations |
| `/getting_started/matching` | Matching (conceptual) | Move to Concepts/Explanations |
| `/getting_started/verifying_pacts` | Provider verification concepts | Move to Concepts/Explanations |
| `/getting_started/provider_states` | Provider states (conceptual) | Move to Concepts/Explanations |
| `/getting_started/sharing_pacts` | Sharing pacts (conceptual) | Move to Concepts/Explanations |
| `/getting_started/specification` | Pact specification overview | Move to Reference |
| `/getting_started/further_reading` | Further reading | Move to Resources |
| `/getting_started/what_is_pact_good_for` | When to use Pact | Move to Concepts |
| `/getting_started/comparisons` | Pact vs other tools | Move to Concepts |
| `/faq/convinceme` | Convince me to use Pact | Move to Concepts |
| `/faq` | General FAQ | Move to Concepts (or Reference) |
| `/history` | Pact history | Keep in Resources |

**GAP**: No clear explanation of "Consumer-Driven Contract testing philosophy". Currently scattered across multiple pages.

#### REFERENCE (information-oriented, technical specs)
| Current location | Content | Action |
|---|---|---|
| `/roadmap/feature_support` | Feature support matrix | Move to Reference |
| `/roadmap/roadmap` | Roadmap | Move to Reference |
| `/wrapper_implementations` | Wrapper implementations | Move to Reference |
| `/telemetry` | Telemetry reference | Move to Reference |
| `/implementation_guides/ssl` | SSL configuration | Move to Reference |
| `/getting_started/specification` | Pact specification | Move to Reference |
| `pact_broker/*` | **DO NOT TOUCH** | Leave intact |
| `implementation_guides/*` | **DO NOT TOUCH** | Leave intact |

---

### Issues identified

1. **Duplicate files**: `consumer.md` and `consumer.mdx` both exist with identical content. The `.mdx` file appears to be the newer version with MDX tab components but the `.md` is what's in sidebars. **Resolve**: Remove `consumer.md`, use `consumer.mdx`, update sidebars.

2. **"Getting Started" does too much**: It's simultaneously an introduction, a tutorial (5-min guide), an explanation (Pact concepts), and even some reference (terminology). New users can't tell where to start.

3. **University is disconnected**: Excellent tutorial content exists in University but it's buried in the nav. First-time users hitting "Getting Started" don't naturally flow to University.

4. **Pact Nirvana positioning**: The CI/CD setup guide is gold-standard how-to content but buried under a generic "Guides" label. It should be prominently featured.

5. **Thin provider guide**: `provider.md` is only ~40 lines compared to `consumer.md` which is 640+ lines with a comprehensive best practices guide.

6. **"Guides" label is unclear**: Users don't know if "Guides" means tutorials, best practices, or reference docs.

7. **Stubs section misplaced**: In `docs` sidebar under "Stubs" but it's really a how-to topic.

8. **Feature support / roadmap**: In `docs` sidebar but really belongs in Reference.

9. **Resources section is well-organised** but `further_reading` from Getting Started should be here.

---

## 2. Proposed New Structure

### Navigation bar (updated labels)

| Old label | New label | Route | Notes |
|---|---|---|---|
| Getting Started | Getting Started | `/` | Shorter; intro + pointers to all 4 quadrants |
| *(new)* | Concepts | `/concepts` | Moved from Getting Started |
| *(renamed)* | Tutorials | `/tutorials` | University renamed/promoted |
| Guides | How-to Guides | `/consumer` | Rename label, same route |
| Pact Docs | Pact Docs | `/implementation_guides/overview` | **DO NOT TOUCH** |
| Pact Broker Docs | Pact Broker Docs | `/pact_broker` | **DO NOT TOUCH** |
| *(new)* | Reference | `/reference` | Spec, feature support, matching rules |
| Resources | Resources | `/history` | Add further_reading here |
| Contributing | Contributing | `/contributing` | Unchanged |
| Blog | Blog | `/blog` | **DO NOT TOUCH** |
| Help | Help | `/help` | Unchanged |
| University | *(merged into Tutorials)* | - | University nav item removed |

### New sidebar: `getting-started` (slimmer)

The landing page stays at `/`. This sidebar becomes the entry point that signposts users to the right quadrant.

```
Getting Started
  ├── Introduction (what is Pact, when to use it) [/]
  ├── How Pact works [/getting_started/how_pact_works]
  ├── Quick start (5-minute guide) → Tutorial [/tutorials/5-minute]
  ├── Should I use Pact?
  │   ├── What is Pact good for [/getting_started/what_is_pact_good_for]
  │   ├── Comparing Pact to other tools [/getting_started/comparisons]
  │   └── Convince me [/faq/convinceme]
  └── FAQ [/faq]
```

### New sidebar: `concepts` (extracted from getting-started)

```
Concepts (Explanations)
  ├── Conceptual overview [/getting_started/conceptual_overview]
  ├── Terminology [/getting_started/terminology]
  ├── Testing scope [/getting_started/testing-scope]
  ├── Matching [/getting_started/matching]
  │   └── Gotchas [/getting_started/matching/gotchas]
  ├── Provider states [/getting_started/provider_states]
  ├── Verifying pacts [/getting_started/verifying_pacts]
  ├── Sharing pacts [/getting_started/sharing_pacts]
  └── Pact Specification [/getting_started/specification]
```

### Renamed sidebar: `university` → `tutorials`

```
Tutorials
  ├── Overview [/tutorials]
  ├── 5-minute quick start [/5-minute-getting-started-guide]
  ├── Introduction to Pact (JS workshop, 13 steps)
  │   └── ... [university/introduction/*]
  ├── Async Message Pact (4 steps)
  │   └── ... [university/message-pact-async/*]
  ├── Create a Pact Plugin (7 steps)
  │   └── ... [plugins/workshops/create-a-plugin/*]
  └── External Workshops [/implementation_guides/workshops]
```

### Updated sidebar: `guides` (renamed label only, same key)

```
How-to Guides
  Consumer
    ├── Writing consumer tests [/consumer]
    ├── Contract tests vs functional tests [/consumer/contract_tests_not_functional_tests]
    ├── Using Pact for UI testing [/consumer/using_pact_to_support_ui_testing]
    └── Recommended configuration [/consumer/recommended_configuration]
  Provider
    ├── Verifying pacts [/provider]
    ├── Using provider states effectively [/provider/using_provider_states_effectively]
    ├── Handling authentication [/provider/handling_auth]
    ├── Recommended configuration [/provider/recommended_configuration]
    └── Fixing failing verification tests [/provider/how_to_fix_failing_verification_tests]
  CI/CD Integration
    ├── Introduction [/pact_nirvana]
    └── Steps 1–7 + Notes [/pact_nirvana/step_*]
  Recipes
    ├── Overview [/recipes]
    ├── Optional fields [/recipes/optional]
    ├── Kafka / async [/recipes/kafka]
    ├── GraphQL [/recipes/graphql]
    ├── API Gateway [/recipes/apigateway]
    ├── AWS Signed Requests [/recipes/awssignedrequests]
    ├── Lambda (async) [/recipes/lambdaasync]
    ├── Lambda (HTTP) [/recipes/lambdahttp]
    ├── Cypress [/recipes/cypress]
    ├── MUnit [/recipes/munit]
    ├── Feature toggles [/implementation_guides/feature_toggles]
    └── Stubs [/getting_started/stubs]
```

### New sidebar: `reference`

```
Reference
  ├── Pact Specification [/getting_started/specification]
  ├── Feature Support Matrix [/roadmap/feature_support]
  ├── Roadmap [/roadmap/roadmap]
  ├── Wrapper Implementations [/wrapper_implementations]
  ├── Telemetry [/telemetry]
  └── SSL Configuration [/implementation_guides/ssl]
```

### Updated sidebar: `resources`

```
Resources
  ├── History [/history]
  ├── Further Reading [/getting_started/further_reading]
  ├── Blogs, Videos & Articles [/blogs_videos_and_articles]
  ├── Books [/books]
  ├── Community Repos [/community_repos]
  ├── Events [/events]
  │   └── Webinars and Workshops [...]
  └── Case Studies & Users
      ├── Testimonials [/users/testimonials]
      ├── Trusted by [/users/trustedby]
      ├── Case Studies [...]
      └── Community Corner [...]
```

---

## 3. Key constraints

- **DO NOT modify** anything under `website/docs/implementation_guides/` (Pact Docs)
- **DO NOT modify** anything under `website/docs/pact_broker/` (Pact Broker Docs)
- **DO NOT modify** anything under `website/blog/` (Blog)
- **Add redirects** in `netlify.toml` for any URL changes
- **No content rewriting** - restructure navigation and pointers only (minor additions to index/landing pages are OK)

---

## 4. Implementation plan

### Phase 1: PLAN.md and setup
- [x] Create PLAN.md in worktree root
- [x] Commit

### Phase 2: Resolve consumer.md / consumer.mdx duplication
- [ ] Compare consumer.md vs consumer.mdx
- [ ] consumer.mdx is the newer version (has MDX tabs at bottom)
- [ ] Remove consumer.md from filesystem
- [ ] Update sidebars.json to reference `consumer` (Docusaurus resolves .mdx)
- [ ] Test that sidebar still resolves
- [ ] Commit

### Phase 3: Add Concepts sidebar
- [ ] Create `website/docs/concepts.md` as a landing/index page for the Concepts section
- [ ] Update `sidebars.json`:
  - Add new `"concepts"` sidebar with content moved from `getting-started`
  - Remove Pact Concepts category from `getting-started` sidebar
  - Keep How Pact Works in Getting Started (it bridges intro → concepts)
- [ ] Update `docusaurus.config.js` navbar to add Concepts link
- [ ] No file moves - just sidebar membership changes
- [ ] Commit

### Phase 4: Create Tutorials sidebar (rename/repurpose University)
- [ ] Create `website/docs/tutorials.md` as landing page for Tutorials
- [ ] Move `5-minute-getting-started-guide` into Tutorials sidebar
- [ ] Rename `university` sidebar to `tutorials` in sidebars.json
- [ ] Update navbar: replace "University" with "Tutorials", same destination
- [ ] Add Getting Started pointer to Tutorials
- [ ] Add redirects: `/university` → `/tutorials`
- [ ] Commit

### Phase 5: Rename Guides → How-to Guides
- [ ] Update navbar label from "Guides" to "How-to Guides"
- [ ] Update sidebar category labels within `guides` sidebar
- [ ] Move Stubs from `docs` sidebar to Recipes section of `guides` sidebar
- [ ] Add `feature_toggles` to Recipes if not already there (already is)
- [ ] Commit

### Phase 6: Create Reference sidebar
- [ ] Create `website/docs/reference.md` as landing page
- [ ] Add `"reference"` sidebar in sidebars.json with: specification, feature_support, roadmap, wrapper_implementations, telemetry, ssl
- [ ] Remove these pages from their current sidebars (docs, getting-started)
- [ ] Update navbar to add Reference link
- [ ] Add redirects if any URLs change (they shouldn't - same paths)
- [ ] Commit

### Phase 7: Slim down Getting Started
- [ ] Update `getting_started.md` to be a clear entry-point page that signposts all 4 Diataxis quadrants
- [ ] Update Getting Started sidebar to be concise: intro, how pact works, should I use Pact, FAQ
- [ ] Move `further_reading` to Resources sidebar
- [ ] Commit

### Phase 8: Update Resources sidebar
- [ ] Add `further_reading` to Resources
- [ ] Ensure all existing resources links still work
- [ ] Commit

### Phase 9: Update landing page (getting_started.md)
- [ ] Add clear "where to go next" navigation section pointing to all 4 Diataxis quadrants
- [ ] Keep existing content intact
- [ ] Commit

### Phase 10: Create tutorial landing page
- [ ] Write `website/docs/tutorials.md` with overview of available tutorials and when to use each
- [ ] Commit

### Phase 11: Create concepts landing page
- [ ] Write `website/docs/concepts.md` with overview of key Pact concepts
- [ ] Commit

### Phase 12: Create reference landing page
- [ ] Write `website/docs/reference.md`
- [ ] Commit

### Phase 13: Final audit & redirects
- [ ] Review all nav changes for broken links
- [ ] Ensure all moved/restructured pages have redirects in netlify.toml
- [ ] Review Algolia search indexing implications
- [ ] Commit

---

## 5. Files to create (new)

| File | Purpose |
|---|---|
| `website/docs/concepts.md` | Landing page for Concepts section |
| `website/docs/tutorials.md` | Landing page for Tutorials section (replaces university.md nav) |
| `website/docs/reference.md` | Landing page for Reference section |

## 6. Files to modify

| File | Changes |
|---|---|
| `website/sidebars.json` | Major restructure (see phases above) |
| `website/docusaurus.config.js` | Navbar label changes, new nav items |
| `website/docs/getting_started.md` | Add signposting section |
| `netlify.toml` | Add redirects for any changed URLs |

## 7. Files to remove

| File | Reason |
|---|---|
| `website/docs/consumer.md` | Duplicate of consumer.mdx |

## 8. Redirects to add (netlify.toml)

| From | To | Reason |
|---|---|---|
| `/university` | `/tutorials` | University nav item replaced |
| `/university/*` | Preserve existing routes | University pages keep their URLs |

Note: Most "moves" in this plan are sidebar-only - the actual file paths don't change, so no redirects are needed for most changes. The Docusaurus sidebar just controls which sidebar a page appears in, not the URL.

---

## Progress log

- [x] **2026-03-19**: Worktree created, PLAN.md written
- [x] **2026-03-19**: Phase 2 — skipped (consumer.mdx is untracked in master, not in worktree; pre-existing issue)
- [x] **2026-03-19**: Phase 3 — Concepts sidebar added (extracted from getting-started)
- [x] **2026-03-19**: Phase 4 — Tutorials sidebar created (replacing university key); university.md kept in tutorials sidebar for /university URL context; netlify redirect /university -> /tutorials added
- [x] **2026-03-19**: Phase 5 — Guides renamed to How-to Guides in navbar and footer
- [x] **2026-03-19**: Phase 6 — Reference category added within concepts sidebar (specification, further_reading); skipped separate Reference nav item (too thin; docs sidebar untouched per constraints)
- [x] **2026-03-19**: Phase 7 — Getting Started slimmed: removed Pact Concepts section, 5-min guide, workshops
- [x] **2026-03-19**: Phase 8 — further_reading remains in Concepts/Reference category (logical home)
- [x] **2026-03-19**: Phase 9 — Landing page updated with Diataxis signposting table
- [x] **2026-03-19**: Phase 10 — tutorials.md landing page created
- [x] **2026-03-19**: Phase 11 — concepts.md landing page created
- [x] **2026-03-19**: Phase 12 — Reference in concepts sidebar (skipped standalone reference.md; Reference items are a sub-category of Concepts)
- [x] **2026-03-19**: Phase 13 — Final audit complete:
  - Confirmed: no previously-sidebared pages orphaned by my changes
  - Fixed: pre-existing bug where university sidebar referenced non-existent Step1..Step13 files; corrected to 01_Step1..13_Step13 (and async 01_Step1..04_Step4)
  - Guides sidebar converted from shorthand object to explicit array format (same Docusaurus behaviour)
  - further_reading moved from Concepts/Reference to Resources sidebar (better semantic fit)
  - All 306 sidebar doc references validated as resolving to real files
  - JSON and config syntax validated

## Final state

All phases complete. The refactor is ready for review and PR.

### Summary of changes
| Change | Files affected |
|---|---|
| New Concepts sidebar (Pact terminology, matching, provider states, etc.) | `sidebars.json`, `docs/concepts.md` (new) |
| New Tutorials sidebar (5-min guide + University workshops promoted) | `sidebars.json`, `docs/tutorials.md` (new) |
| Renamed Guides → How-to Guides in nav + footer | `docusaurus.config.js` |
| Slimmed Getting Started (removed Pact Concepts, 5-min, workshops) | `sidebars.json`, `docs/getting_started.md` |
| Signposting table on landing page | `docs/getting_started.md` |
| Redirect /university → /tutorials | `netlify.toml` |
| Fixed pre-existing broken Step file references in tutorials sidebar | `sidebars.json` |
| further_reading moved to Resources | `sidebars.json`, `docs/concepts.md` |
| **Untouched** implementation_guides, pact_broker, blog | — |
