# Decision 0003: Add Idea-To-Plan Workflow

Date: 2026-05-09
Status: accepted

## Context

Repo Foundry should help before code exists. A user often starts with an idea,
not a repository, a backlog, or a validation suite.

If AI agents begin implementation from a broad idea, they can expand scope too
quickly, skip non-goals, invent success criteria, or create unsafe architecture
before the operator has made the important choices visible.

## Decision

Add a base planning workflow:

- idea brief;
- project plan;
- risk profile;
- slice template;
- agent context;
- public guide for moving from idea to agent-operable plan.

Planning assets live under `templates/base/docs/planning/`. The public guide
lives under `docs/guides/idea-to-plan.md`.

## Consequences

- New projects can use Repo Foundry before implementation starts.
- Agents get structured prompts and planning files instead of broad coding
  requests.
- Risk and profile selection happen early.
- Implementation starts from accepted slices, not vague ideas.

