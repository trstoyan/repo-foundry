# Project Plan

Status: draft
Last updated: 2026-05-09

## Vision

Make daily habit tracking feel like a small local project artifact, not a
hosted product.

## Users

- Primary user: solo builder tracking three to seven daily habits.
- Secondary users: local-first tool users who prefer plain files.
- Operators or maintainers: the project owner.

## Core Workflows

1. Create a habit:
   - Trigger: user decides to track a habit.
   - Steps: enter habit name, optional description, and active status.
   - Expected result: habit is stored locally and appears in the list.

2. Mark today's progress:
   - Trigger: user completes or skips a habit for today.
   - Steps: select habit and mark done or not done.
   - Expected result: today's entry is stored locally.

3. View recent history:
   - Trigger: user wants to see momentum.
   - Steps: open recent summary.
   - Expected result: last seven days are visible.

## System Shape

First version can be a CLI or minimal local web app backed by a plain local data
file. No server, account, or external API is required.

## Source Of Truth

- Product intent: `docs/planning/idea-brief.md`
- Current implementation truth: source code and tests after implementation
- Operational truth: `README.md` and `scripts/validate.sh`
- Change history: future `CHANGELOG.md` if the project grows

## Milestones

| Milestone | Outcome | Validation |
| --- | --- | --- |
| M0 | Planning accepted | Idea brief, risk profile, and first slice reviewed |
| M1 | Habit model exists | Unit tests for create/list habits pass |
| M2 | Daily entries exist | Unit tests for marking today pass |
| M3 | Recent summary exists | Smoke check shows last seven days |

## Open Questions

- Question: CLI or web first?
  - Why it matters: it decides tooling and validation.
  - How to answer: choose the smallest implementation surface.

- Question: JSON file or SQLite?
  - Why it matters: it affects migration and validation.
  - How to answer: use JSON until query needs become real.

## Risks

- Risk: scope expands into a full productivity suite.
  - Impact: first version stalls.
  - Mitigation: keep non-goals visible and implement one slice at a time.

- Risk: local data format changes without migration.
  - Impact: user records break.
  - Mitigation: version the data file once persistence exists.

## Validation Strategy

- Unit tests: habit creation, listing, daily entry recording.
- Integration tests: local data file read/write.
- Smoke checks: run a local command that creates a sample habit and lists it.
- Manual review: verify UX remains simple.
- Evidence records: changed files, commands run, skipped checks, remaining risk.

