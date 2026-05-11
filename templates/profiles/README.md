# Template Profiles

Profiles are optional overlays for projects that need more structure than the
base template.

Use profiles by copying their files into a new project and adapting the
placeholders. Do not apply every profile by default. Start with `templates/base`
and add only the controls that match the project's risk and collaboration
model.

## Available Profiles

- `docs-governance`: source-of-truth documents, drift rules, and documentation
  authority.
- `api-contract-governance`: producer/consumer API contract ownership,
  propagation rules, and executable drift checks.
- `evidence-review`: evidence packets, deterministic gates, stateless reviews,
  release decisions, and closure records.
- `high-risk-runtime`: extra controls for systems where changes can affect
  money, infrastructure, production data, security boundaries, or physical
  operations.
- `multi-agent-worktree`: branch/worktree ownership and handoff records for
  parallel mutating agent work.

## Selection Guide

Use `docs-governance` when:

- current state, history, workflow, and architecture need separate authorities;
- documentation drift has caused incorrect work;
- the project has long-running plans or frequent behavior changes.

Use `api-contract-governance` when:

- backend/API producers and frontend, SDK, CLI, worker, or integration
  consumers can change independently;
- route, schema, or payload drift has caused integration risk;
- validation should fail when production consumer references are not backed by
  the producer contract source.

Use `evidence-review` when:

- builder claims are not enough to accept work;
- releases need auditable proof;
- independent review should consume neutral evidence.

Use `high-risk-runtime` when:

- changes can affect live execution, user data, money, permissions, tenants,
  infrastructure, or production configuration.

Use `multi-agent-worktree` when:

- more than one agent or operator may mutate the project in parallel;
- long-running slices need handoff and ownership records.
