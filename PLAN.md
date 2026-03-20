# Diataxis Refactor Plan — docs.pact.io

## Status: In Progress
Last updated: 2026-03-20

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

---

## 2. Key constraints

- **DO NOT modify** anything under `website/docs/implementation_guides/` (Pact Docs)
- **DO NOT modify** anything under `website/docs/pact_broker/` (Pact Broker Docs)
- **DO NOT modify** anything under `website/blog/` (Blog)
- **Add redirects** in `netlify.toml` for any URL changes

---

## 3. Implementation plan

### Phase 1–13: Navigation and structural restructure ✅ COMPLETE
All phases completed 2026-03-19. Summary:
- Added Concepts sidebar (extracted from Getting Started)
- Added Tutorials sidebar (replacing University nav item)
- Renamed Guides → How-to Guides in nav + footer
- Slimmed Getting Started; added Diataxis signposting table to landing page
- Added `/university` → `/tutorials` redirect in netlify.toml
- Fixed pre-existing broken Step file references in tutorials sidebar
- `further_reading` moved to Resources sidebar
- `concepts.md` and `tutorials.md` landing pages created

---

### Phase 14: Diataxis review + content gaps ✅ COMPLETE (2026-03-20)

Full Diataxis review conducted. Four content gaps identified and filled:

- [x] **Gap 1** — `getting_started/why-pact.md` created: design philosophy explanation (consumer-driven contracts, generated pact files, broker model, trade-offs)
- [x] **Gap 2** — `getting_started/pact-file-format.md` created: Reference page for pact JSON schema across spec versions V1–V4
- [x] **Gap 3** — `provider/best_practices.md` created: provider how-to guide mirroring consumer.md depth
- [x] **Gap 4** — `plugins/concepts.md` created: Explanation of the plugin model and system actors
- [x] `concepts.md` updated with new entries for why-pact and pact-file-format
- [x] All four pages wired into `sidebars.json`

---

### Phase 15: Structural fixes to existing content ✅ COMPLETE (2026-03-20)

Eight type-mixing and framing issues fixed:

- [x] **Fix 1** — `getting_started/how_pact_works.md`: extracted Message Pact how-to walkthrough → `consumer/how_to_test_async_messages.md`
- [x] **Fix 2** — `5-minute-getting-started-guide.md`: removed embedded Explanation digressions (consumer scope, provider scope, status code advice)
- [x] **Fix 3** — `pact_nirvana.md` + `step_1.md`: declared as how-to guide; removed tutorial prerequisite voice
- [x] **Fix 4** — `getting_started/matching.md`: moved Best practice section to `consumer.md`; added "avoid random data" guidance
- [x] **Fix 5** — `pact_broker/can_i_deploy.md`: replaced Matrix explanation with 2-sentence problem statement + link
- [x] **Fix 6** — `recipes/kafka.md`: full rewrite with imperative headings and goal-first framing
- [x] **Fix 7** — `consumer.md`: extracted 530-line Best Practice Guide → `consumer/best_practices.md`
- [x] **Fix 8** — `getting_started/conceptual_overview.md`: added scoped intro; replaced "I'll discuss later" with direct link

---

### Phase 16: Tone and style consistency pass ✅ COMPLETE (2026-03-20)

Rewrite in-scope pages for consistent tone and style:
- Second-person voice throughout ("you", not "we" or "I")
- Imperative framing in How-to pages
- Neutral descriptive framing in Reference/Explanation pages
- Remove hedging language ("you might want to", "it can be tempting to")
- Remove filler openers ("Remember that...", "As you would hopefully have read")
- Remove first-person author voice ("I'll discuss", "Let's walk through")
- Consistent heading capitalisation (sentence case)

Scope excludes `implementation_guides/`, `pact_broker/`, `blog/`, and pages written fresh in phases 14–15 (already consistent).

#### Getting Started section
- [x] **T1** — `getting_started.md` (landing page)
- [x] **T2** — `getting_started/what_is_pact_good_for.md`
- [x] **T3** — `getting_started/how_pact_works.md`
- [x] **T4** — `getting_started/terminology.md` (already clean)
- [x] **T5** — `getting_started/testing-scope.md`
- [x] **T6** — `getting_started/verifying_pacts.md`
- [x] **T7** — `getting_started/provider_states.md`
- [x] **T8** — `getting_started/sharing_pacts.md`
- [x] **T9** — `getting_started/comparisons.md` (already clean)

#### FAQ
- [x] **T10** — `faq.md` + `faq/convinceme.md`

#### Consumer how-to
- [x] **T11** — `consumer.md` + `consumer/contract_tests_not_functional_tests.md` + `consumer/using_pact_to_support_ui_testing.md` + `consumer/recommended_configuration.md`

#### Provider how-to
- [x] **T12** — `provider.md` + `provider/using_provider_states_effectively.md` + `provider/handling_auth.md` + `provider/recommended_configuration.md` + `provider/how_to_fix_failing_verification_tests.md`

#### CI/CD Guide
- [x] **T13** — `pact_nirvana/step_2.md` through `step_7.md`

#### Recipes
- [x] **T14** — `recipes.md` + `recipes/optional.md` + `recipes/graphql.md` + `recipes/apigateway.md` + `recipes/awssignedrequests.md` + `recipes/lambdaasync.md` + `recipes/lambdahttp.md` + `recipes/cypress.md` + `recipes/munit.md`

#### Plugins
- [x] **T15** — `plugins/quick_start.md` + `plugins/directory.md`

---

### Phase 17: Housekeeping ✅ COMPLETE (2026-03-20)

- [x] Commit `DIATAXIS_REVIEW.md` (committed 2026-03-20)
- [x] Final build verification — 2 pre-existing broken links remain in `implementation_guides/` (out of scope); 3 links fixed in concepts.md and step_1.md
- [x] Review for any remaining orphaned pages — none found
- [ ] PR / merge to master

---

## Progress log

- [x] **2026-03-19**: Worktree created, PLAN.md written
- [x] **2026-03-19**: Phases 2–13 — navigation restructure complete
- [x] **2026-03-20**: Sidebar step ID regression fixed (`01_Step1` → `Step1`); site confirmed running
- [x] **2026-03-20**: Phase 14 — four content gaps filled (4 new pages)
- [x] **2026-03-20**: Phase 15 — eight structural fixes applied
- [x] **2026-03-20**: Phase 16 — tone and style pass complete (T1–T15, 30+ files)
- [x] **2026-03-20**: Phase 17 — housekeeping complete; 3 broken links fixed; PR pending
