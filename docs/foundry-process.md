# Foundry Process

The Foundry Process is the default lifecycle for turning an idea into an
agent-operable project.

It exists to prevent the common failure mode where an AI agent starts
implementation from a vague idea, expands scope silently, and then judges its
own work by narrative instead of evidence.

## Lifecycle

```text
Idea
  -> Brief
  -> Plan
  -> Risk Profile
  -> Profile Selection
  -> Slices
  -> Agent Context
  -> Implementation
  -> Evidence
  -> Review
  -> Closure
```

## Phase 1: Idea

Start with the raw idea and clarify the problem, audience, desired outcome,
constraints, non-goals, and unknowns.

Template:

```text
templates/base/docs/planning/idea-brief.md
```

Rule:

```text
No implementation from raw idea.
```

## Phase 2: Plan

Turn the idea into a project plan with users, workflows, milestones, source of
truth, risks, and validation strategy.

Template:

```text
templates/base/docs/planning/project-plan.md
```

Rule:

```text
Agents may expand the plan, but they must keep open questions and non-goals
visible.
```

## Phase 3: Risk Profile

Classify project risk before choosing implementation strategy.

Template:

```text
templates/base/docs/planning/risk-profile.md
```

Rule:

```text
High-risk surfaces require stronger governance before implementation.
```

## Phase 4: Profile Selection

Choose optional profiles only when the project needs them.

Available profiles:

- docs governance;
- evidence review;
- high-risk runtime;
- multi-agent worktree ownership.

Rule:

```text
Use profiles as overlays, not as default complexity.
```

For existing projects, profile selection must include an entrypoint pass. Update
the active agent instructions, human onboarding docs, validation scripts, and
source-of-truth mapping so the selected profiles are visible to future agents.
Use `docs/guides/adopting-existing-project.md`.

## Phase 5: Slices

Convert the plan into small, testable implementation slices.

Template:

```text
templates/base/docs/planning/slice-template.md
```

Rule:

```text
Implementation starts from an accepted slice, not from a broad plan.
```

## Phase 6: Agent Context

Create a compact context file so a new stateless agent can understand the
current project state without inheriting a long conversation.

Template:

```text
templates/base/docs/planning/agent-context.md
```

Rule:

```text
Agent context summarizes the plan; it does not replace source-of-truth docs.
```

## Phase 7: Implementation

Agents implement only the accepted slice, stay inside allowed scope, and update
docs when behavior or operations change.

Rule:

```text
Keep implementation bounded and validation-ready.
```

## Phase 8: Evidence

Collect evidence from repository state and command output.

Schema:

```text
schemas/evidence-packet.schema.json
```

Rule:

```text
Builder summaries are context, not proof.
```

## Phase 9: Review

Use deterministic checks and, when needed, independent review records.

Schema:

```text
schemas/review-result.schema.json
```

Rule:

```text
Review should inspect evidence and acceptance criteria, not trust the builder's
success narrative.
```

## Phase 10: Closure

Record the release decision and closure state.

Schemas:

```text
schemas/release-decision.schema.json
schemas/closure-record.schema.json
```

Rule:

```text
A slice is not complete until validation results, skipped checks, remaining
risks, and follow-ups are visible.
```

## Minimum Ready-To-Code Gate

Before implementation begins, the project should have:

- idea brief;
- project plan;
- risk profile;
- selected profiles or explicit decision to use only base;
- at least one accepted slice;
- validation expectations;
- agent context.

For existing projects, the gate also includes updated project entrypoints for
the selected profiles.

## Minimum Closeout Gate

Before a slice is accepted, the project should have:

- changed files list;
- validation commands and results;
- skipped checks with reasons;
- documentation updates or explanation;
- remaining risks;
- follow-up slices or explicit no-follow-up note.

