# Evidence Review Profile

Use this profile when a project needs proof-based acceptance rather than
builder-written success narratives.

## Trust Model

Builder notes are useful context, but they are not proof.

Slice acceptance should depend on:

- neutral evidence collected from repository state and command output;
- deterministic anti-gaming gates;
- independent stateless review;
- a release decision;
- an auditable closure record.

## Required Records

Store records under a project-local governance directory such as:

```text
.governance/
  slices/
    <slice-id>/
      evidence.json
      guards.json
      reviews/
      decision.json
      closure.json
```

Use Repo Foundry schemas as the starting point:

- `schemas/evidence-packet.schema.json`
- `schemas/review-result.schema.json`
- `schemas/release-decision.schema.json`
- `schemas/closure-record.schema.json`

## Minimum Deterministic Gates

- forbidden path changes;
- deleted tests;
- added test skip or xfail markers;
- assertion weakening;
- CI or validation weakening;
- dependency changes;
- migration presence;
- generated file size anomalies.

