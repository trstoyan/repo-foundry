# Repo Foundry

[![Support the Project](https://img.shields.io/badge/Support-Buy%20Me%20A%20Coffee-yellow.svg)](https://buymeacoffee.com/trstoyan)

Agent-ready repository templates and operational playbooks.

This repository is the starting point for a reusable project template and a
living engineering playbook built from lessons learned across active projects.

The goal is not to create a static boilerplate. The goal is to build a system
that helps future projects start with clear operating rules, useful validation,
decision records, runbooks, and human-plus-AI collaboration practices that have
already survived real work.

## Current Status

Foundation created. The repo is ready to collect discoveries, discuss them, and
promote the stable ones into template assets.

## Start In 10 Minutes

Create a new project from the base template:

```sh
./scripts/new_project.sh /tmp/my-new-project "My New Project"
cd /tmp/my-new-project
./scripts/validate.sh
```

Then start planning:

```text
docs/planning/idea-brief.md
docs/planning/project-plan.md
docs/planning/risk-profile.md
docs/planning/slice-template.md
docs/planning/agent-context.md
```

See `examples/idea-to-plan/` for a filled planning example.

## What Belongs Here

- Project-start templates that can be reused for new repositories.
- AI-agent collaboration rules that are useful across many projects.
- Anonymized discovery notes from repository tours.
- Decision records explaining why a convention exists.
- RFCs for larger governance and architecture proposals.
- Governance schemas for evidence, review, release, and closure records.
- Validation scripts that enforce the conventions we trust.
- Runbook and documentation patterns that reduce repeated confusion.

## What Does Not Belong Here

- Secrets, tokens, private dumps, or machine-specific state.
- Unreviewed copies of entire project files.
- Stack-specific rules presented as universal rules.
- Provider-specific agent instruction files.

## Repository Shape

```text
.
├── AGENTS.md
├── README.md
├── docs/
│   ├── main-ideas.md
│   ├── foundry-process.md
│   ├── repo-tour-plan.md
│   ├── decisions/
│   ├── discovery/
│   ├── guides/
│   └── rfcs/
├── schemas/
├── examples/
├── scripts/
│   ├── new_project.sh
│   └── validate.sh
└── templates/
    ├── base/
    └── profiles/
```

## How We Will Use It

For new projects, follow the Foundry Process:

1. Capture the idea.
2. Create a plan.
3. Classify risk.
4. Select profiles.
5. Define accepted slices.
6. Give agents compact context.
7. Implement only accepted slices.
8. Collect evidence, review, and close out.

The process is defined in `docs/foundry-process.md`.

The starting tour method is in `docs/repo-tour-plan.md`.

To start a new project from an idea, use the workflow in
`docs/guides/idea-to-plan.md`.

For improving Repo Foundry itself:

1. Tour an existing project.
2. Write down anonymized lessons in `docs/discovery/`.
3. Discuss which lessons are universal, optional, or project-specific.
4. Promote durable lessons into `templates/base/` or future template profiles.
5. Add schemas or validation when a rule is important enough to enforce.

## Support

If Repo Foundry helps you build better projects, you can support the work on
[Buy Me a Coffee](https://buymeacoffee.com/trstoyan).

## License

MIT License. See `LICENSE`.
