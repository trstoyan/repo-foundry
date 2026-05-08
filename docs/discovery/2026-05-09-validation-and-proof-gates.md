# Discovery Note: source workspace / validation and proof gates

Date: 2026-05-09
Project Archetype: source workspace survey
Status: candidate

## Context

We sampled project instructions, scripts, and development docs to understand
how the active source projects prove that a change is complete.

## Observation

Validation maturity appears in layers:

- simple projects list direct test/build commands;
- more mature projects provide wrapper scripts for repeatable local checks;
- safety-sensitive projects add read-only contract checks, smoke tests, and
  deployment verification gates.

Examples by archetype:

- Go-based projects expose commands such as `go test ./...`, targeted package
  tests, and build/run commands.
- Django projects list linting, migration dry-runs, framework checks, and test
  commands.
- safety-sensitive operator consoles use backend tests, coverage, authenticated
  API smoke tests, database-backed smoke tests, and read-only
  documentation/contract checks.
- runtime-heavy services use startup linting, governance linting, compose smoke
  checks, API route ownership linting, permission matrix linting, and
  deployment/infra verification helpers.
- deployment-heavy projects define a canonical local workflow: start the
  expected topology first, run smoke validation, then run backend/frontend
  checks.

## Why It Matters

The strongest projects avoid relying on agent memory. They encode verification
as commands that can be repeated by humans, agents, CI, or future automation.

The most reusable lesson is that validation should not be one undifferentiated
test command. It should identify the type of confidence being produced:

- code correctness;
- formatting/linting;
- schema or migration safety;
- documentation consistency;
- security or permission boundaries;
- startup health;
- deployed smoke proof;
- rollback or recovery readiness.

## Candidate Pattern

Repo Foundry should provide a validation contract in the base template:

- `scripts/validate.sh` as the stable local entrypoint;
- room for targeted scripts under `scripts/check-*`, `scripts/test-*`, and
  `scripts/smoke-*`;
- documentation that names which checks are required for which change types;
- a final report requirement that lists commands, results, skipped checks, and
  residual risk.

More mature profiles should add:

- read-only docs integrity checks;
- source-of-truth drift checks;
- smoke tests for critical user workflows;
- deployment target verification before diagnostics;
- safety contract checks that fail closed.

## Evidence

- File types inspected:
  - project `AGENTS.md` files;
  - contributor workflow docs;
  - test coverage contracts;
  - script directories;
  - package metadata and build files.
- Commands run:
  - inventory project scripts;
  - search for validation, test, smoke, lint, check, and coverage language.

## Decision

Keep as candidate. Promote the stable `scripts/validate.sh` entrypoint and
final validation report into the base template. Keep contract checks and smoke
proof as optional profiles for projects that justify the extra structure.
