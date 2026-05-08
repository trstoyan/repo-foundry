# Project Agent Guidelines

This file is the canonical instruction file for agents working in this project.
Update it when project workflows, validation commands, or safety rules change.

## Project Scope

Describe what this project owns, what it does not own, and which directories are
important.

## Source Of Truth

- `README.md`: project identity, quick start, and navigation.
- `AGENTS.md`: agent operating contract.
- `docs/planning/`: idea brief, project plan, risk profile, slices, and agent
  context.
- `docs/decisions/`: durable decisions and tradeoffs.
- `docs/runbooks/`: repeatable operational procedures.
- `scripts/validate.sh`: stable local validation entrypoint.

If code, docs, and validation commands disagree, treat that as drift and fix it
before reporting completion.

## Planning Gate

Do not start implementation from a raw idea or broad request.

Before non-trivial implementation, identify or create:

- an idea brief or project plan;
- a risk profile;
- an accepted slice with objective, scope, non-goals, acceptance criteria, and
  validation;
- agent context for future handoff.

If these do not exist, treat the task as planning work first.

## Working Rules

- Preserve unrelated user changes.
- Keep edits scoped to the requested task.
- Do not commit secrets, tokens, database dumps, or generated private data.
- Prefer existing project patterns over new abstractions.
- Update documentation when behavior, setup, or operations change.
- Treat builder summaries as context, not proof.

## Validation

Run the relevant checks from the project root before reporting completion.

```sh
./scripts/validate.sh
```

If a check cannot be run, report why and describe the residual risk.

Validation evidence should include:

- commands run;
- pass/fail results;
- skipped checks and reasons;
- remaining risks.

## Reporting

When finished, summarize:

- changed files;
- validation commands and results;
- docs updated or intentionally unchanged;
- remaining risks or follow-up work.
