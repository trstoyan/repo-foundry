# Idea To Plan Workflow

This guide explains how Repo Foundry helps a user move from an idea to an
agent-operable plan.

The goal is not to make an AI agent start coding immediately. The goal is to
give agents enough structure to expand the idea safely, expose unknowns, and
create small implementation slices that can be validated.

## 1. Start With An Idea Brief

Use:

```text
templates/base/docs/planning/idea-brief.md
```

The idea brief keeps the first conversation grounded:

- what problem is being solved;
- who the users are;
- what outcome matters;
- what is intentionally not included yet;
- what constraints exist;
- what unknowns must be answered;
- what the first safe step might be.

Good prompt:

```text
Read docs/planning/idea-brief.md and help me clarify the problem, audience,
non-goals, unknowns, and first safe step. Do not propose implementation yet.
```

## 2. Turn The Idea Into A Plan

Use:

```text
templates/base/docs/planning/project-plan.md
```

The plan should define:

- vision;
- users;
- core workflows;
- system shape;
- source-of-truth documents;
- milestones;
- risks;
- validation strategy.

Good prompt:

```text
Turn the idea brief into a project plan. Keep it implementation-neutral. Identify
open questions, risks, milestones, and validation strategy.
```

## 3. Classify Risk Early

Use:

```text
templates/base/docs/planning/risk-profile.md
```

Risk classification decides which governance profiles apply.

Examples:

- A personal static site may need only the base template.
- A SaaS app with login and user data likely needs docs governance and evidence
  review.
- A production automation system may need high-risk runtime controls.
- Parallel AI-agent work may need multi-agent worktree ownership.

Good prompt:

```text
Review the project plan and fill out the risk profile. Recommend which Repo
Foundry profiles apply and explain why.
```

## 4. Create The First Slices

Use:

```text
templates/base/docs/planning/slice-template.md
```

A slice is the smallest useful unit of implementation. It should have:

- one objective;
- allowed paths;
- non-goals;
- acceptance criteria;
- validation commands;
- risk level;
- required evidence;
- handoff details if multiple agents are involved.

Good prompt:

```text
From this project plan, propose the first three implementation slices. Each
slice must be small, testable, and include non-goals, acceptance criteria, and
validation.
```

## 5. Give Agents A Compact Context File

Use:

```text
templates/base/docs/planning/agent-context.md
```

This file gives future agents the short version:

- what the project is;
- what matters now;
- which plan and slice are active;
- what rules apply;
- what prompts are safe for planning.

Good prompt:

```text
Update docs/planning/agent-context.md so a new stateless agent can understand
the project, current priority, active slice, blockers, and planning rules.
```

## 6. Only Then Start Implementation

Implementation should start only after:

- the idea brief is clear enough;
- the project plan has a first milestone;
- the risk profile is reviewed;
- at least one slice is accepted;
- validation expectations are named;
- applicable profiles are selected.

Good prompt:

```text
Implement only the accepted slice. Stay within allowed paths. Run the listed
validation commands. Report changed files, checks, skipped checks, and remaining
risks.
```

## Anti-Patterns

Avoid:

- asking an agent to build the whole idea from a paragraph;
- starting code before non-goals exist;
- letting the builder define its own success after implementation;
- using broad tasks such as "make this production ready";
- adding high-risk features without risk classification;
- running parallel agents without branch or worktree ownership.

## Result

After this workflow, the project has:

- a clear idea brief;
- a project plan;
- a risk profile;
- first implementation slices;
- compact agent context;
- validation expectations;
- selected governance profiles.

That is the point where AI agents can work with much more confidence.

