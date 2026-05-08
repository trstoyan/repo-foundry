# Project Agent Guidelines

This file is the canonical instruction file for agents working in this project.
Update it when project workflows, validation commands, or safety rules change.

## Project Scope

Describe what this project owns, what it does not own, and which directories are
important.

## Working Rules

- Preserve unrelated user changes.
- Keep edits scoped to the requested task.
- Do not commit secrets, tokens, database dumps, or generated private data.
- Prefer existing project patterns over new abstractions.
- Update documentation when behavior, setup, or operations change.

## Validation

Run the relevant checks from the project root before reporting completion.

```sh
./scripts/validate.sh
```

If a check cannot be run, report why and describe the residual risk.

## Reporting

When finished, summarize:

- changed files;
- validation commands and results;
- remaining risks or follow-up work.

