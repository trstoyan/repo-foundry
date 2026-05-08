# RFC 0001: Stateless Governance Agents

Status: draft
Date: 2026-05-09

## Abstract

Long-running agentic development workflows introduce a trust problem: the same
context that produced an implementation often becomes responsible for judging
whether that implementation is correct. This creates risk of
self-confirmation, context contamination, biased evidence selection, and shallow
validation.

This RFC proposes a governance architecture based on stateless ephemeral review
agents, neutral evidence collection, and deterministic anti-gaming gates. The
goal is to make agentic execution auditable, reviewable, and safer without
trusting the implementing agent's own narrative of success.

## Problem Statement

Agentic software development is moving from short isolated tasks into
long-running execution plans. A plan may contain many implementation slices.
Each slice may be assigned, implemented, tested, documented, reviewed, and
released.

The problem is not only execution. The problem is trusting execution.

A common failure pattern appears when the same agentic context that implemented
a change also explains why the change is correct. Over time, this context can
become biased by its own assumptions, previous decisions, partial memories, or
desire to complete the plan.

Unsafe pattern:

```text
Builder Agent
  -> Builder-prepared summary
  -> Reviewer approves summary
  -> Release accepts slice
```

That is self-validation through a proxy, not independent review.

## Core Thesis

A stateless reviewer is not enough.

The system needs three properties:

```text
1. Stateless review
   The reviewing agent has no inherited memory or contaminated context.

2. Neutral evidence
   The review packet is generated mechanically from repository state, command
   output, logs, and runtime artifacts, not from the builder's summary.

3. Deterministic anti-gaming gates
   The system checks for patterns that can make weak or manipulated
   implementations appear correct.
```

Trust formula:

```text
Trust = Evidence + Isolation + Deterministic Gates + Independent Review + Auditable Release Decision
```

## Definitions

### Slice

A slice is an atomic unit of planned work. It has bounded scope, acceptance
criteria, allowed paths, expected tests, and closure requirements.

```yaml
slice_id: GOV.EPHEMERAL_AGENTS.1
objective: Introduce the ephemeral agent job contract and review record model.
scope:
  allowed_paths:
    - internal/governance/**
    - docs/governance/**
    - tests/governance/**
acceptance_criteria:
  - Ephemeral job schema exists.
  - Review result schema exists.
  - Slice lifecycle supports review states.
  - Closure record is machine-readable.
```

### Builder Agent

The builder agent implements the slice. It may modify code, tests,
documentation, migrations, or configuration.

Builder notes may be useful, but they are not evidence.

### Neutral Evidence Collector

The neutral evidence collector is a deterministic system component that captures
objective artifacts from the repository and execution environment.

It collects:

```text
- git status
- git diff
- changed files
- commit hashes
- test commands
- raw test output
- lint/typecheck results
- coverage changes
- migration diffs
- runtime logs
- screenshots or traces for UI changes
```

### Ephemeral Governance Agent

An ephemeral governance agent is a stateless reviewer invoked for one job only.

It receives a bounded evidence packet and returns a structured review result.
It does not inherit previous chat history, builder memory, release manager
assumptions, unrelated roadmap context, or narrative pressure.

### Release Manager Agent

The release manager agent coordinates execution, but does not trust claims
directly. It decides whether a slice can advance based on evidence,
deterministic guard results, independent reviews, and any required human
approval.

## Failure Modes

### Context Self-Confirmation

The implementing agent may remember why a change was made and then judge the
result through that same reasoning. This can lead to approval without objective
verification.

### Biased Evidence Packaging

Even if the reviewer is stateless, the review can still be biased if the input
packet was prepared by the builder.

Examples:

```text
- only favorable logs are included
- failing commands are omitted
- raw output is replaced with a summary
- unrelated files are hidden
- skipped tests are not mentioned
- the prompt frames the implementation as complete
```

### Test Gaming

Tests can pass while proving little.

Examples:

```text
- assertions are weakened
- tests are skipped
- xfail markers are added
- snapshots are blindly updated
- mocks are tested instead of behavior
- only narrow test commands are run
- CI checks are disabled
- coverage decreases unnoticed
```

### Scope Expansion

A slice may make unrelated changes that appear useful but introduce
architectural drift.

### Release Narrative Bias

The release manager may accept the builder's explanation instead of requiring
machine-readable evidence.

## Proposed Architecture

The safe architecture separates execution, evidence, review, and decision.

```text
Human Operator
  -> Release Manager Agent
  -> Builder Agent
  -> Repository State
  -> Neutral Evidence Collector
  -> Deterministic Anti-Gaming Gates
  -> Ephemeral Governance Agents
  -> Release Decision
  -> Closure Record
```

The builder changes the repository. The evidence collector observes the
repository. The reviewer judges the evidence. The release manager decides based
on artifacts, not claims.

## Evidence Packet

The evidence packet is the central object in the trust model. It should be
generated by the system, not by the builder.

```yaml
evidence_packet:
  slice_id: RUNTIME.SCOPE.ALIGNMENT.1
  base_ref: origin/main
  head_ref: HEAD

  contract:
    objective: Align runtime selection with the accepted source of truth.
    acceptance_criteria:
      - Runtime uses the canonical selector for the current cycle.
      - Deprecated selectors cannot independently choose runtime scope.
      - Missing score mismatch cannot reappear.

  git:
    status: clean
    commits:
      - abc123
    changed_files:
      - runtime/selection.py
      - tests/runtime/test_scope_selection.py

  commands:
    - command: pytest tests/runtime/test_scope_selection.py
      exit_code: 0
      raw_output_ref: artifacts/tests/scope_selection.out

  diffs:
    full_diff_ref: artifacts/diffs/full.diff
    stat_ref: artifacts/diffs/stat.txt

  builder_note:
    trust_level: untrusted
    content: "Implemented runtime scope alignment."
```

## Deterministic Anti-Gaming Gates

Before AI review, the system should run mechanical checks.

Recommended gates:

```text
1. Forbidden path changes
2. Deleted test detection
3. Added skip/xfail detection
4. Assertion weakening detection
5. Snapshot update detection
6. Coverage decrease detection
7. CI workflow weakening detection
8. Lint/typecheck disabling detection
9. Dependency change detection
10. Migration safety detection
11. Runtime configuration risk detection
12. Generated file size anomaly detection
```

Example gate result:

```yaml
guard_results:
  forbidden_paths:
    status: pass

  skipped_tests_added:
    status: fail
    findings:
      - file: tests/runtime/test_scope_selection.py
        evidence: "Added skip marker to an existing regression test."

  coverage_delta:
    status: warning
    evidence: "Coverage decreased from 84.2% to 82.9%."
```

## Ephemeral Review Agents

Different reviewers should inspect different dimensions:

- scope auditor: checks whether implementation stayed inside the slice boundary;
- test auditor: checks whether tests prove the acceptance criteria;
- architecture auditor: checks whether the change preserves intended design;
- security auditor: checks authentication, authorization, secrets,
  permissions, and exposed surfaces;
- risk auditor: checks whether high-risk runtime behavior can be affected.

High-risk runtime systems may require special review for:

- execution engines;
- external API connectors;
- balance or state reconciliation;
- capital or resource allocation;
- persisted runtime state;
- tenant or user isolation;
- strategy or policy activation;
- production configuration;
- database migrations.

## Review Output Schema

Each ephemeral reviewer should return a structured result.

```yaml
review_result:
  reviewer: ephemeral_test_auditor
  status: pass | fail | conditional

  findings:
    - severity: blocker | major | minor | note
      category: test_coverage
      file: tests/runtime/test_scope_selection.py
      evidence: "The test covers deprecated selector exclusion but not missing score behavior."
      recommendation: "Add a regression test for missing-score mismatch."

  required_followups:
    - slice_id: RUNTIME.TEST.MISSING_SCORE.1
      reason: "Acceptance criterion is not fully proven."

  final_recommendation: conditional
```

The reviewer should produce findings that can be audited later, not only a
binary approval.

## Release Decision

The release decision is separate from the review.

A slice is accepted only when:

```text
1. The implementation is committed.
2. The working tree is clean.
3. Required tests pass.
4. Deterministic gates pass.
5. Required ephemeral reviews pass.
6. No blocker findings remain.
7. High-risk changes receive manual approval.
8. A closure record is stored.
```

Example:

```yaml
release_decision:
  slice_id: GOV.EPHEMERAL_AGENTS.1
  decision: accepted
  decided_by: release_manager
  commit: abc123
  evidence_hash: sha256:...
  guard_status: pass
  required_reviews:
    scope_auditor: pass
    test_auditor: pass
    architecture_auditor: pass
  blockers: 0
  working_tree: clean
```

If blocked:

```yaml
release_decision:
  slice_id: RUNTIME.SCOPE.ALIGNMENT.1
  decision: blocked
  reason: "Test auditor found missing regression coverage."
  required_action:
    - "Add integration test for missing-score mismatch."
```

## Application To Agentic Development Platforms

An agentic development platform can implement this as a first-class governance
layer.

Suggested object model:

```text
Plan
  -> Release
     -> Slice
        -> Contract
        -> Implementation Run
        -> Evidence Packet
        -> Deterministic Guard Results
        -> Ephemeral Reviews
        -> Release Decision
        -> Closure Record
```

Suggested filesystem layout:

```text
.governance/
  releases/
    2026-05-ga/
      slices/
        GOV.EPHEMERAL_AGENTS.1/
          contract.yaml
          evidence.json
          guards.json
          reviews/
            scope-audit.yaml
            test-audit.yaml
            architecture-audit.yaml
          decision.yaml
          closure.yaml
```

The platform then becomes more than a planner. It becomes a governed execution
system.

## Application To High-Risk Runtime Systems

High-risk runtime systems require stricter governance because implementation
mistakes can affect money, production infrastructure, user data, security
boundaries, or physical-world operations.

Any slice touching these areas should require mandatory risk review:

```text
- execution engine
- external API connector
- reconciliation logic
- capital or resource allocation
- persisted runtime state
- tenant or user boundary
- policy or strategy activation
- live runtime flag
- database migration
```

Recommended policy:

```yaml
risk_policy:
  manual_approval_required_when:
    paths:
      - runtime/execution/**
      - runtime/strategies/**
      - runtime/capital/**
      - runtime/state/**
      - backend/api/runtime/**
      - migrations/**

  required_reviews:
    - scope_auditor
    - test_auditor
    - architecture_auditor
    - runtime_risk_auditor
```

A high-risk slice should never be accepted only because tests pass. It must also
prove that it does not create unsafe runtime behavior.

## Design Principles

1. Claims are not evidence.
2. Evidence must be neutral.
3. Reviewers must be stateless.
4. Deterministic gates run before AI review.
5. High-risk changes require human approval.
6. Every decision must be auditable.

## Initial Implementation Roadmap

### GOV.EVIDENCE.1

Introduce the evidence packet schema.

### GOV.GUARDS.1

Add deterministic anti-gaming checks.

### GOV.EPHEMERAL_REVIEW.1

Add review result schema and attach reviews to slices.

### GOV.RELEASE_GATE.1

Block slice acceptance unless required evidence, guards, and reviews pass.

### GOV.RISK_POLICY.1

Add risk-aware governance for high-impact systems.

## Conclusion

Stateless agents are useful, but they do not automatically create trustworthy
review. A stateless reviewer can still be misled if the input is biased,
filtered, or prepared by the same agent that implemented the work.

A safer model requires a complete governance pipeline:

```text
Builder Agent
  -> Repository State
  -> Neutral Evidence Collector
  -> Deterministic Anti-Gaming Gates
  -> Ephemeral Governance Review
  -> Release Manager Decision
  -> Auditable Closure Record
```

This architecture prevents the same context from judging itself. It also makes
long-running agentic development more reliable, especially in systems where
correctness, runtime safety, and release discipline matter.

