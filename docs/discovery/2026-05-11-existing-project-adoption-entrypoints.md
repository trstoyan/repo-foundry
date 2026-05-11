# Discovery Note: Existing project / Repo Foundry adoption entrypoints

Date: 2026-05-11
Project Archetype: existing monorepo adopting Repo Foundry governance
Status: adopted into the framework

## Context

An existing project adopted Repo Foundry-style governance after it already had
its own backend, frontend, documentation hierarchy, runtime rules, and agent
entrypoint. The adoption added useful profile behavior, but the process showed
that entrypoints can be missed when an agent focuses only on new governance
documents.

## Observation

Existing-project adoption needs a distinct checklist. Adding planning docs or
profiles is not enough. The active agent entrypoint and human entrypoints must
also be adapted so future agents know the new read order, selected profiles,
source-of-truth contracts, validation gates, and runtime boundaries.

## Why It Matters

Repo Foundry depends on stateless agents reading the repository, not inheriting
conversation context. If `AGENTS.md`, `README.md`, contributor docs, or
validation scripts are not updated during adoption, the framework exists on
paper but is not operational.

## Candidate Pattern

Add a guide for adopting Repo Foundry into existing projects. The guide should
require an entrypoint pass covering agent instructions, human onboarding,
source-of-truth docs, validation scripts, CI, and closeout evidence.

## Evidence

- File types inspected: agent instructions, governance docs, profile snippets,
  validation scripts, planning docs.
- Commands run: repository validation, diff hygiene check.
- Related behavior: after a downstream adoption, missing or partial entrypoint
  updates had to be corrected so the selected governance profile became visible
  to future agents.

## Decision

Adopt the pattern into Repo Foundry as an existing-project adoption guide, and
link it from the main guide index and startup path.
