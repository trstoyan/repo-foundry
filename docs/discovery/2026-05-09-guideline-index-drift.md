# Discovery Note: source workspace / guideline index drift

Date: 2026-05-09
Project Archetype: multi-project workspace
Status: raw

## Context

The source workspace root has an `AGENTS.md` file that lists canonical project
guideline files. During the first Repo Foundry survey, we searched for all
`AGENTS.md` files in the workspace.

## Observation

The workspace contains more project-level `AGENTS.md` files than the root
canonical index currently names.

Observed guideline categories include:

- root workspace guidelines;
- project-level guidelines;
- nested component guidelines;
- documentation workspace guidelines;
- template example guidelines.

The root index currently names only a subset.

## Why It Matters

The root workspace instructions act as a router. If the router index drifts,
future agents may miss project-local instructions even though those
instructions exist.

This is especially important in a multi-project workspace where applying one
project's rules to another is explicitly forbidden.

## Candidate Pattern

Repo Foundry should include a workspace-level index check for multi-project
workspaces:

- discover `AGENTS.md` files;
- compare them to the root canonical index;
- report missing entries;
- optionally distinguish project-level files from nested template examples.

This does not need to be part of every single-project template, but it belongs
in a multi-project workspace profile.

## Evidence

- File types inspected:
  - root workspace `AGENTS.md`;
  - project and nested component `AGENTS.md` files.
- Commands run:
  - discover `AGENTS.md` files;
  - count selected guideline files.

## Decision

Keep as raw. The immediate Repo Foundry lesson is clear, but workspace index
maintenance should remain separate from framework work unless explicitly
requested.
