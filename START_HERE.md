# Start Here

Repo Foundry helps you turn an idea into an agent-ready project without letting
AI agents jump straight into messy implementation.

## If You Are Just Looking

Read these in order:

1. `docs/foundry-process.md`
2. `docs/guides/idea-to-plan.md`
3. `docs/guides/adopting-existing-project.md` if you are applying Repo Foundry
   to a repository that already exists.
4. `docs/guides/contributing-lessons.md` if you are feeding lessons back into
   Repo Foundry.
5. `docs/guides/prompts.md`
6. `examples/idea-to-plan/README.md`

The main idea:

```text
No implementation from raw idea.
Implementation starts from an accepted slice.
```

## If You Want To Try It

Create a new project from the base template:

```sh
./scripts/new_project.sh /tmp/my-foundry-project "My Foundry Project"
cd /tmp/my-foundry-project
./scripts/validate.sh
```

Then open:

```text
docs/planning/idea-brief.md
```

## First Prompt To Use With An AI Agent

```text
I am using Repo Foundry. Read AGENTS.md and docs/planning/idea-brief.md.
Help me clarify this idea into a project plan. Do not implement anything yet.
```

More prompts are in `docs/guides/prompts.md`.

## If You Are Adopting An Existing Project

Do an entrypoint pass before implementation. Update the project's `AGENTS.md`
or equivalent agent contract, human onboarding docs, validation scripts, and
selected profile references together.

Use:

```text
docs/guides/adopting-existing-project.md
```

## When Planning Is Ready

Use this prompt:

```text
Implement only the accepted slice <SLICE_ID>. Stay within allowed paths.
Run the listed validation. Report changed files, command results, skipped
checks, remaining risks, and follow-up slices.
```

## Guided Commands

Show the guided path:

```sh
./scripts/next_steps.sh
```

Create a starter project:

```sh
./scripts/new_project.sh <target-directory> "<Project Name>"
```
