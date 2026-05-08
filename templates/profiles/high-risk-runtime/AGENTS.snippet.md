## High-Risk Runtime Rules

Treat changes as high risk when they can affect live execution, production
data, security boundaries, infrastructure, tenants, credentials, or irreversible
state.

For high-risk changes:

- identify affected runtime surfaces before editing;
- document non-goals and rollback or recovery notes;
- add or update tests for safety behavior;
- run required smoke checks where practical;
- require explicit human approval before deployment or promotion;
- fail closed when runtime truth cannot be proven.

