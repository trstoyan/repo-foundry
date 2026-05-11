## API Contract Governance Rules

Use these rules when backend/API producers and frontend, SDK, CLI, worker, or
integration consumers can change independently.

Before changing API behavior:

- identify the canonical contract source for the producer;
- identify all consumer layers that depend on the contract;
- keep producer and consumer changes in the same accepted slice unless an
  explicit compatibility plan exists.

For contract changes:

- update the producer contract source before production consumers depend on it;
- update generated clients, shared types, request helpers, or adapters before
  screens and workflows use the changed shape;
- do not introduce raw undocumented production API references in consumer code;
- keep test mocks aligned with the production contract.

Before closeout:

- run the project-local API contract drift guard;
- include the command result in validation evidence;
- document skipped contract checks and the remaining risk;
- treat contract drift as incomplete work, not as a follow-up cleanup.
