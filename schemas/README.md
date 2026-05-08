# Governance Schemas

These schemas define the first machine-readable governance records for Repo
Foundry.

- `evidence-packet.schema.json`: neutral evidence collected from repository
  state, command output, diffs, and artifacts.
- `review-result.schema.json`: structured findings from a stateless reviewer.
- `release-decision.schema.json`: accept, block, or defer decision for a slice.
- `closure-record.schema.json`: final auditable record for the slice outcome.

Builder summaries may appear in an evidence packet, but they must be marked as
untrusted. Acceptance should depend on neutral evidence, deterministic gates,
independent review, and an auditable release decision.

