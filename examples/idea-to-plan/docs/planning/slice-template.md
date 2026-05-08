# Slice: HABITS.MODEL.1

Status: draft
Owner: unassigned
Last updated: 2026-05-09

## Objective

Create the minimal local habit model and tests for creating and listing habits.

## Context

This is the smallest useful foundation for the tracker. It avoids UI and daily
entry complexity until the local data model is proven.

## Scope

Allowed paths:

- `src/**`
- `tests/**`
- `README.md`
- `scripts/validate.sh`

Expected changes:

- Add habit record structure.
- Add local storage read/write helper.
- Add create habit behavior.
- Add list habits behavior.
- Add focused tests.

## Non-Goals

- No daily progress entries.
- No editing or deleting habits.
- No cloud sync.
- No UI beyond what is needed for tests or a minimal command.

## Acceptance Criteria

- A habit can be created with a name.
- Created habits persist locally.
- Habits can be listed.
- Invalid empty names are rejected.
- Tests cover create/list behavior.

## Validation

Required commands:

```sh
./scripts/validate.sh
```

Additional checks:

- Unit tests for create/list habits.

## Risk

Risk level: low

High-risk surfaces touched:

- Local user data file.

## Evidence Required

- git status;
- changed files;
- commands run and results;
- skipped checks and reasons;
- remaining risks.

## Handoff

- Branch:
- Worktree:
- Next owner:
- Blockers:

