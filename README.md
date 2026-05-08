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

## What Belongs Here

- Project-start templates that can be reused for new repositories.
- AI-agent collaboration rules that are useful across many projects.
- Discovery notes from repository tours.
- Decision records explaining why a convention exists.
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
│   ├── repo-tour-plan.md
│   ├── decisions/
│   └── discovery/
├── scripts/
│   └── validate.sh
└── templates/
    └── base/
```

## How We Will Use It

1. Tour an existing project.
2. Write down concrete lessons in `docs/discovery/`.
3. Discuss which lessons are universal, optional, or project-specific.
4. Promote durable lessons into `templates/base/` or future template profiles.
5. Add validation when a rule is important enough to enforce.

The starting tour method is in `docs/repo-tour-plan.md`.

## Support

If Repo Foundry helps you build better projects, you can support the work on
[Buy Me a Coffee](https://buymeacoffee.com/trstoyan).

## License

MIT License. See `LICENSE`.
