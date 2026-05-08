# Discovery Note: source workspace / source-of-truth and drift control

Date: 2026-05-09
Project Archetype: source workspace survey
Status: candidate

## Context

We inspected projects with heavier documentation systems to understand how they
avoid stale docs, contradictory instructions, and unclear current state.

## Observation

The most mature projects assign distinct jobs to distinct documents.

One runtime-heavy service defines four root documentation contracts:

- `README.md` is project identity and entry point.
- `DEVELOPMENT.md` is contributor workflow.
- `SYSTEM_STATUS.md` is current platform truth.
- `CHANGELOG.md` is chronological history.

It treats ambiguity between those documents as documentation drift that must be
resolved.

One safety-sensitive operator console uses a different but related model:

- README module maturity is current capability truth.
- module docs define review state and ownership boundaries.
- slice docs define concrete implementation units.
- a slice-order document defines execution readiness.
- a review tracker records review and approval progress.
- documentation integrity checks verify that slice references and readiness
  states stay coherent.

One multi-component workspace extends this into governance profiles and
component ownership: a CLI owns execution truth, a web surface owns projections,
a helper owns bounded diagnostics, and docs own governance and architecture.

## Why It Matters

Agents need to know which document wins when files disagree. Without that,
documentation becomes a source of false confidence.

The strongest pattern is not "write more docs"; it is "give each document one
job, then block closeout when those jobs contradict each other."

## Candidate Pattern

Repo Foundry should add a reusable source-of-truth model:

- base projects should define at least:
  - `README.md`: project identity and quick start;
  - `AGENTS.md`: agent operating contract;
  - `docs/decisions/`: durable decisions;
  - `docs/runbooks/`: operational procedures.
- larger projects can opt into:
  - `DEVELOPMENT.md`: contributor workflow;
  - `SYSTEM_STATUS.md`: current platform truth;
  - `CHANGELOG.md`: chronological history;
  - `docs/slices/` or equivalent for planned implementation units;
  - drift checks that fail when current truth, history, and workflow docs
    contradict each other.

## Evidence

- File types inspected:
  - agent operating contracts;
  - contributor workflow docs;
  - current-status docs;
  - changelogs;
  - deterministic module/slice planning docs;
  - review trackers;
  - governance profile docs.
- Commands run:
  - inventory documentation files;
  - search for source-of-truth, current-state, drift, slice, and readiness
    language.

## Decision

Keep as candidate. Add a lightweight source-of-truth section to the base
template, then design heavier documentation profiles for projects that need
runtime truth, maturity tracking, or slice governance.
