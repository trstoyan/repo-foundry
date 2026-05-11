# API Contract Governance Profile

Use this profile when a project has independently edited API producers and
consumers, such as a backend service plus a frontend app, SDK, CLI, automation
client, or integration worker.

This profile complements `docs-governance`: documentation can define the source
of truth, but interface drift also needs an executable check.

## Contract Model

Each project should name its canonical contract source. Examples include:

- backend route registry;
- OpenAPI document;
- GraphQL schema;
- protobuf or AsyncAPI schema;
- generated SDK manifest;
- hand-maintained endpoint manifest for small systems.

Consumer code should depend on the contract through a stable layer, such as:

- generated types or clients;
- shared request helpers;
- adapters that normalize payloads before UI or workflow code consumes them;
- contract tests that exercise producer and consumer assumptions together.

## Propagation Rule

When an API changes, apply changes in this order:

1. Update the producer contract source.
2. Update generated or shared types if the project has them.
3. Update consumer adapters and request helpers.
4. Update consumer screens, workflows, or clients.
5. Run the contract drift guard and include the result in closeout evidence.

Do not let production consumer code reference new API paths, operations, or
payload fields before the canonical contract source records them.

## Validation Expectations

Add a project-local validation command that fails when consumer references drift
from the producer contract. The command can be implemented with any stack-native
tool, but it should be deterministic and runnable from the repository root.

Typical checks:

- consumer API paths exist in the canonical route or schema source;
- removed producer operations are not still referenced by production consumers;
- request and response types are regenerated or explicitly updated;
- test-only mocks do not mask production contract drift;
- documented validation commands include the contract guard.

## Adoption Steps

1. Identify producer and consumer directories.
2. Choose the canonical contract source.
3. Add a drift guard script or schema validation command.
4. Wire the guard into the main validation entrypoint.
5. Add the agent rules from `AGENTS.snippet.md`.
6. Record closeout evidence whenever the contract changes.

## Closeout Evidence

When a slice changes API behavior, report:

- contract source files changed;
- generated or shared consumer contract files changed;
- consumer adapters or callers changed;
- drift guard command and result;
- skipped checks and residual risk.
