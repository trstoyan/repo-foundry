# Docs Governance Profile

Use this profile when a project needs clear documentation authority and drift
control.

## Source-Of-Truth Model

Recommended document responsibilities:

- `README.md`: project identity, quick start, and navigation.
- `AGENTS.md`: agent operating contract and validation expectations.
- `DEVELOPMENT.md`: contributor workflow and local commands.
- `SYSTEM_STATUS.md`: current implemented system truth.
- `CHANGELOG.md`: chronological change history.
- `docs/architecture/`: design contracts and durable architecture notes.
- `docs/decisions/`: accepted decisions and tradeoffs.
- `docs/runbooks/`: repeatable operational procedures.

## Drift Rules

A change is incomplete when:

- code and current-status docs disagree;
- validation commands in docs do not match reality;
- changelog/history describes current truth instead of past changes;
- architecture docs claim capabilities that are not implemented;
- operational runbooks reference retired targets without marking them retired.

## Adoption Steps

1. Add the source-of-truth files that match the project.
2. Update `AGENTS.md` with the document authority model.
3. Add a documentation consistency check to `scripts/validate.sh`.
4. Treat drift fixes as part of the same slice as behavior changes.

