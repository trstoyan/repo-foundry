# Discovery Note: API-backed frontend / contract drift governance

Date: 2026-05-11
Project Archetype: API-backed frontend with separate backend route ownership
Status: adopted into the framework

## Context

A high-risk, agent-operated web platform had backend routes and frontend API
callers evolve in separate slices. Documentation governance was already useful,
but it did not fully prevent frontend code from referencing API paths that were
not backed by the backend route registry.

## Observation

The project needed an explicit contract propagation rule:

- producer-side API routes must be recorded in a canonical contract source;
- consumer-side frontend paths must flow through shared API clients, typed
  contracts, or adapters;
- validation must fail when production frontend API references drift from the
  backend contract source.

## Why It Matters

Documentation authority alone catches stale truth, but API consumers can still
drift when backend and frontend work are split across agents or slices. A small
contract guard turns a runtime integration risk into a deterministic validation
failure before closeout.

## Candidate Pattern

Add an optional API contract governance profile for projects with independent
API producers and consumers. The profile should define:

- canonical contract source ownership;
- producer-to-consumer propagation order;
- generated or shared type expectations where available;
- a validation hook that blocks undocumented production API references;
- closeout evidence requirements.

## Evidence

- File types inspected: backend route registry, frontend TypeScript API callers,
  governance docs, workflow checklist, validation scripts.
- Commands run: route-contract lint, profile validation hook, documentation
  governance lint, whitespace diff check.
- Related behavior: a project-local guard matched production frontend API paths
  against a backend route registry and reported all production API references as
  backed by registered backend routes.

## Decision

Adopt the pattern into Repo Foundry as an optional
`api-contract-governance` profile. Keep the profile generic: source projects are
described by archetype, and projects must adapt the placeholder validation hook
to their own API framework, contract manifest, or schema generation path.
