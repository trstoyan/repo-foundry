# Repository Tour Plan

This plan guides how we inspect existing projects and turn lessons into this
framework.

## Tour Goals

- Understand which project practices made work easier.
- Find repeated sources of confusion or breakage.
- Identify validation commands that caught real problems.
- Capture agent-collaboration rules that should be reused.
- Separate universal lessons from stack-specific project needs.

## Tour Method

For each project:

1. Read the nearest `AGENTS.md`, or legacy guideline files if the project has no
   canonical file yet.
2. Inspect `README.md`, package metadata, scripts, CI, and docs.
3. Check how local setup, validation, deployment, and secrets are handled.
4. Write discovery notes in `docs/discovery/`.
5. Decide whether each lesson is raw, candidate, adopted, or rejected.

## Initial Tour Candidates

Start with projects that already have canonical agent guidelines:

- `bounty-hunter-os`
- `caseflow`
- `crypto-trading-system`
- `obsidian-vault-agent/docs`
- `spatio-temporal-computational-neurodynamics`

Then inspect projects with legacy guideline files that should eventually be
consolidated:

- `artist-management-system`
- `civo-manifests-for-backup-devmod-baremetal`
- `pebble-workout-companion`

## Signals To Capture

- Clear setup instructions.
- Missing or fragile validation.
- Useful smoke tests.
- Secrets handling.
- Deployment and recovery knowledge.
- Documentation drift.
- Agent instructions that prevented mistakes.
- Places where legacy provider-specific files caused duplication.

## Promotion Rules

- One observation creates a raw note.
- Repeated observations create a candidate pattern.
- Candidate patterns become template files only when they are practical and
  broadly reusable.
- Mandatory rules must eventually gain validation.

