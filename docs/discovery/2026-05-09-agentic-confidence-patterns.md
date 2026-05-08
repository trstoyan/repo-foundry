# Discovery Note: source workspace / agentic confidence patterns

Date: 2026-05-09
Project Archetype: source workspace survey
Status: candidate

## Context

We started the first Repo Foundry tour by inspecting active projects that carry
agent guidance, governance documents, validation scripts, or legacy
provider-specific guidance.

The goal was to identify reusable patterns that make development more
confident for a human-plus-AI workflow.

## Observation

The mature projects do not rely on one instruction file alone. They combine:

- a canonical `AGENTS.md`;
- project-local source-of-truth documents;
- explicit validation commands;
- documented safety boundaries;
- a completion/reporting contract;
- scripts that convert important rules into checks.

The strongest archetypes observed were:

- a safety-sensitive operator console with an agent operating contract,
  deterministic module-slice planning, visible checklist requirements, safety
  boundaries, documentation updates, and release-quality checks;
- a runtime-heavy service that splits documentation responsibility across
  project identity, contributor workflow, current system truth, and change
  history;
- a multi-component CLI/web/helper/docs workspace that turns multi-agent work
  into declared ownership over repository, slice, branch, worktree, validation,
  handoff, and next owner;
- lightweight CLI and web projects that show the minimal version: clear project
  shape, concrete commands, secrets rules, and scoped edits.

## Why It Matters

Agentic confidence comes from reducing ambiguity before mutation starts.

Across the surveyed projects, the repeated confidence builders are:

- project boundaries are explicit;
- canonical instructions are discoverable;
- local commands are listed, not guessed;
- secrets and local data are called out;
- safety-sensitive actions fail closed;
- documentation is updated with behavior;
- completion requires validation evidence;
- source repos are treated as read-only unless the task owns them.

These patterns make it easier for an agent to move quickly without silently
changing the wrong thing, testing the wrong target, or treating stale docs as
truth.

## Candidate Pattern

Repo Foundry should define an "agent-operable project" baseline:

- `AGENTS.md` as the canonical agent entrypoint;
- a documented project boundary;
- a working-state inspection step;
- explicit validation commands;
- secret/local-data rules;
- a required final report shape;
- source-of-truth documents with non-overlapping responsibilities;
- optional governance profiles for projects that need slice planning, safety
  gates, deployment guardrails, or multi-agent worktree isolation.

## Evidence

- File types inspected:
  - project-level and nested `AGENTS.md` files;
  - deterministic module/slice planning docs;
  - coverage and release-quality contracts;
  - contributor workflow docs;
  - multi-component engineering rules;
  - worktree ownership process docs.
- Commands run:
  - discover `AGENTS.md` files;
  - inspect selected project git status;
  - inventory project scripts;
  - search for validation, drift, source-of-truth, worktree, safety, and
    reporting language.

## Decision

Keep as candidate. The next step is to promote the common baseline into
`templates/base/AGENTS.md`, then keep stronger governance patterns as optional
profiles rather than making every new project heavy by default.
