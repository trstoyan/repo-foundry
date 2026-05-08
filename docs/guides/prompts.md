# Guided Prompts

Use these prompts with an AI agent while working in a Repo Foundry project.

## First Planning Prompt

```text
I am using Repo Foundry. Read AGENTS.md and docs/planning/idea-brief.md.
Help me clarify this idea into a project plan. Do not implement anything yet.
```

## Idea Brief Review

```text
Review docs/planning/idea-brief.md. Identify vague parts, missing non-goals,
risks, assumptions, and the smallest safe next step. Do not propose code yet.
```

## Project Plan Draft

```text
Turn docs/planning/idea-brief.md into docs/planning/project-plan.md.
Keep it implementation-neutral. Include users, workflows, milestones, source of
truth, risks, validation strategy, and open questions.
```

## Risk Profile

```text
Review docs/planning/project-plan.md and fill out docs/planning/risk-profile.md.
Recommend which Repo Foundry profiles apply and explain why. Do not implement.
```

## Slice Drafting

```text
From docs/planning/project-plan.md and docs/planning/risk-profile.md, propose
the first three implementation slices. Each slice must include objective, scope,
non-goals, acceptance criteria, validation, risk, and evidence required.
```

## Agent Context

```text
Update docs/planning/agent-context.md so a new stateless agent can understand
the project, current priority, active slice, blockers, and planning rules.
```

## Implementation

```text
Implement only the accepted slice <SLICE_ID>. Stay within allowed paths.
Run the listed validation. Report changed files, command results, skipped
checks, remaining risks, and follow-up slices.
```

## Review

```text
Review the completed slice using the acceptance criteria and validation
evidence. Treat builder summaries as context, not proof. Report blocker, major,
minor, and note findings.
```

