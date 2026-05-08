# Main Ideas

These are the first principles for the framework. They should change as we
learn from the active projects.

## 1. Every Project Should Be Agent-Operable

A new project should explain how an agent can safely work in it:

- where to read instructions;
- how to inspect state before editing;
- which commands validate changes;
- which files must never contain secrets;
- how to report what changed and what remains risky.

The canonical file for that contract is `AGENTS.md`.

## 2. Templates Should Be Evidence-Based

Rules become universal only after they prove useful across real projects. A
single project can inspire a pattern, but repeated evidence should decide
whether it belongs in the base template.

## 3. Validation Beats Memory

Important conventions should eventually become checks, scripts, or CI jobs.
Documentation explains why a rule exists; validation helps make sure it keeps
working.

## 4. Use Profiles, Not One Giant Template

The base template should stay small. Stack-specific needs should become
profiles, such as:

- web application;
- CLI tool;
- Python service;
- Node application;
- mobile app;
- Kubernetes or deployment-heavy service;
- research or notebook-heavy project.

## 5. Decisions Should Leave a Trail

When a convention becomes important, it should have a short decision record:

- what problem it solves;
- what we chose;
- what alternatives we rejected;
- when it should be revisited.

## 6. Local Setup Must Be Boring

Every project should make local development predictable:

- required tools are listed;
- setup commands are repeatable;
- environment variables are documented without exposing secrets;
- tests and smoke checks are easy to run.

## 7. Operational Knowledge Belongs in Runbooks

Debugging, deployment, recovery, data migration, and recurring maintenance
steps should be written as runbooks, not rediscovered during incidents.

## 8. The Framework Should Stay Live

This repository should evolve through small, traceable updates. New lessons
start as discovery notes, then graduate into decisions, templates, scripts, or
runbooks only when they are useful enough.

## 9. Claims Are Not Evidence

Agentic workflows should separate implementation from verification. Builder
summaries are useful context, but acceptance should depend on neutral evidence,
deterministic checks, independent review, and auditable closure records.
