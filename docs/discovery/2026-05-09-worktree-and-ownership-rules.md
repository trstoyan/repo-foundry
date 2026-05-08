# Discovery Note: source workspace / worktree and ownership rules

Date: 2026-05-09
Project Archetype: multi-component workspace
Status: candidate

## Context

We inspected governance docs from a multi-component workspace because they
capture a direct lesson from multi-agent development: mutation becomes risky
when ownership is unclear.

## Observation

The source process states the learned lesson plainly: autonomous multi-agent
development fails when multiple agents mutate the same checkout without
explicit ownership.

Its proposed ownership record includes:

- repository;
- slice;
- agent or operator;
- base revision;
- branch;
- worktree;
- touched files;
- validation;
- blockers;
- next owner.

It allows read-only exploration in main checkouts, but requires dedicated
branches and worktrees for mutating parallel work.

## Why It Matters

Repo Foundry should support both solo and multi-agent work. A base project does
not need heavy worktree governance, but a serious multi-agent workflow needs a
clear mutation boundary before work starts.

This reduces:

- branch conflicts;
- accidental cleanup of another agent's work;
- silent mutation in shared checkouts;
- incomplete handoffs;
- unclear validation ownership.

## Candidate Pattern

Repo Foundry should define an optional "multi-agent worktree profile" with:

- one slice per branch by default;
- one mutating owner per worktree;
- branch pattern guidance;
- worktree path guidance;
- a handoff record template;
- validation evidence before integration;
- a rule that read-only exploration can use shared checkouts, but mutating
  parallel work needs explicit ownership.

The base template should mention ownership only lightly; the full worktree
policy belongs in an optional profile.

## Evidence

- File types inspected:
  - workspace-level agent guidelines;
  - engineering rules;
  - multi-component development process docs;
  - governance profile docs;
  - AI-agent context docs.
- Commands run:
  - search for worktree, branch, slice, handoff, ownership, and mutating
    language.

## Decision

Keep as candidate. Do not add this to the base template as a hard requirement
yet. Design it as a profile after we collect one or two more multi-repo
examples.
