# Decision 0002: Promote Governance Assets

Date: 2026-05-09
Status: accepted

## Context

The first anonymized discovery pass found repeated patterns around explicit
agent entrypoints, executable validation, source-of-truth drift control,
evidence-based closeout, high-risk runtime gates, and multi-agent worktree
ownership.

The stateless governance agents RFC also introduced a concrete trust model:
neutral evidence, deterministic gates, stateless review, release decisions, and
closure records.

## Decision

Promote the first set of reusable governance assets:

- JSON schemas for evidence packets, review results, release decisions, and
  closure records;
- optional template profiles for documentation governance, evidence review,
  high-risk runtime controls, and multi-agent worktree ownership;
- stronger base template language for source-of-truth roles, validation
  evidence, and residual-risk reporting.

Keep these as reusable assets and optional overlays, not mandatory base
complexity.

## Consequences

- New projects can start small with the base template.
- Higher-risk projects can opt into stronger governance without forking the
  entire framework.
- Future validation tools can target stable schema names instead of prose-only
  guidance.
- The public reference remains anonymized and archetype-based.

