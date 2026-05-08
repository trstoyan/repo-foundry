# Repository Tour Plan

This plan guides how we inspect existing projects and turn lessons into this
framework without making the public reference depend on any one source project.

## Tour Goals

- Understand which project practices made work easier.
- Find repeated sources of confusion or breakage.
- Identify validation commands that caught real problems.
- Capture agent-collaboration rules that should be reused.
- Separate universal lessons from stack-specific project needs.

## Privacy Rule

Repo Foundry discovery notes should describe reusable patterns, not concrete
source repositories.

- Do not name private or source-workspace repositories in public notes.
- Use project archetypes such as "runtime-heavy service", "CLI workspace",
  "Django web app", "research kernel", or "documentation workspace".
- Record exact source paths only in private working notes outside this repo, if
  needed for local follow-up.
- Keep public evidence focused on file types, command shapes, and observed
  workflows.

## Tour Method

For each source project:

1. Read the nearest `AGENTS.md`, or legacy guideline files if the project has no
   canonical file yet.
2. Inspect `README.md`, package metadata, scripts, CI, and docs.
3. Check how local setup, validation, deployment, and secrets are handled.
4. Write anonymized discovery notes in `docs/discovery/`.
5. Decide whether each lesson is raw, candidate, adopted, or rejected.

## Initial Archetypes

Start with projects that already have canonical agent guidelines, grouped by
archetype rather than by repository name:

- safety-sensitive operator console;
- runtime-heavy service with deployment truth;
- multi-component CLI/web/helper/docs workspace;
- lightweight CLI or API project;
- Django/server-rendered web application;
- research or simulation project;
- documentation-heavy project.

Then inspect projects with legacy provider-specific guideline files that should
eventually be consolidated into `AGENTS.md`.

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

