# Multi-Agent Worktree Profile

Use this profile when multiple agents or operators may work on the same project
in parallel.

## Core Rule

Read-only exploration may happen in a shared checkout. Mutating parallel work
requires explicit ownership.

## Ownership Record

Every non-trivial mutating slice should declare:

```yaml
repo: <repository-name-or-local-role>
slice: <slice-id-or-task-id>
owner: <agent-or-operator-id>
base_revision: <commit-or-branch>
branch: work/<slice>/<owner>
worktree: .worktrees/<slice>/<owner>
touched_files:
  - <path>
validation:
  - <command>
blockers: []
next_owner: <agent-or-operator-id>
```

## Handoff Rules

- One mutating owner per worktree.
- One logical slice per branch by default.
- Cross-repository slices need one ownership record per repository.
- Do not rebase, clean, delete, or overwrite another owner's worktree.
- Integration requires validation evidence and an explicit handoff or closure
  record.

