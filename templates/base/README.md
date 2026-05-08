# <Project Name>

Short description of what this project does and who it serves.

## Quick Start

```sh
./scripts/validate.sh
```

## Project Structure

```text
.
├── AGENTS.md
├── README.md
├── docs/
│   ├── decisions/
│   ├── planning/
│   └── runbooks/
└── scripts/
    └── validate.sh
```

## Planning

Start with `docs/planning/idea-brief.md`, then create a project plan, risk
profile, first slices, and agent context before implementation begins.

## Development

Document setup, common commands, and local environment requirements here.

## Validation

Document tests, linters, builds, smoke checks, and any external dependencies
needed to run them.

The stable local validation entrypoint is:

```sh
./scripts/validate.sh
```

When validation cannot run, record the reason and the remaining risk.

## Source Of Truth

- `README.md`: project identity, quick start, and navigation.
- `AGENTS.md`: agent operating contract.
- `docs/decisions/`: durable decisions and tradeoffs.
- `docs/planning/`: idea brief, project plan, risk profile, slices, and agent
  context.
- `docs/runbooks/`: operational procedures.
- `scripts/validate.sh`: stable validation entrypoint.

## Operations

Link deployment, debugging, recovery, and maintenance runbooks here.

## Agent Profiles

If this project needs stronger governance, consider adding a Repo Foundry
profile:

- docs governance;
- evidence review;
- high-risk runtime;
- multi-agent worktree ownership.
