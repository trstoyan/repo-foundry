# Adopting Repo Foundry In An Existing Project

Existing projects already have agent entrypoints, validation commands, docs,
runtime assumptions, and local conventions. Do not only copy Repo Foundry
planning files into the repository. Adapt the project entrypoints so future
agents actually follow the selected framework.

## Goal

Bring an existing project under Repo Foundry governance without breaking its
current source of truth.

The adoption work is successful when:

- the project has an explicit agent entrypoint;
- selected profiles are reflected in that entrypoint;
- validation commands are discoverable and runnable;
- source-of-truth docs are named and non-overlapping;
- slices, evidence, and closeout rules are visible to future agents.

## Adoption Pass

1. Read the existing project entrypoints:
   - `AGENTS.md` or equivalent agent instruction file;
   - `README.md`;
   - contributor docs such as `DEVELOPMENT.md`;
   - status or architecture docs;
   - validation scripts;
   - CI configuration.
2. Reconstruct current project truth before changing templates.
3. Choose Repo Foundry profiles that match the project risk and collaboration
   model.
4. Create or adapt planning files only where they fit the existing doc layout.
5. Update `AGENTS.md` with:
   - required read order;
   - selected profile rules;
   - source-of-truth document contracts;
   - validation and closeout requirements;
   - push, deploy, or runtime mutation boundaries.
6. Update human entrypoints such as `README.md`, `START_HERE.md`, or
   `DEVELOPMENT.md` so they point to the same workflow.
7. Update validation scripts to check the adopted governance files.
8. Add an accepted slice for the adoption work or record why the adoption is
   documentation-only.
9. Run validation and document skipped checks or residual risk.

## Entry Point Checklist

For every adopted profile, check whether these files need updates:

- `AGENTS.md`: agent operating contract and selected profile rules.
- `README.md`: project identity and navigation to governance docs.
- `DEVELOPMENT.md`: contributor commands and validation gates.
- `SYSTEM_STATUS.md` or equivalent: current implementation truth.
- `CHANGELOG.md` or release notes: historical record only.
- `docs/architecture/`: durable contracts introduced by the profile.
- `docs/planning/` or project-specific plan directory: accepted slices and
  agent context.
- `scripts/validate.sh` or equivalent: runnable governance checks.
- CI workflows: validation entrypoints that must run outside local development.

If the project uses different filenames, document the mapping in `AGENTS.md`.

## Common Failure Mode

The most common adoption error is adding governance docs while leaving the
agent entrypoint unchanged. Future agents then read the old instructions and
miss the new workflow.

Treat that as incomplete adoption. A profile is active only when the project
entrypoints and validation path make it visible.

## Closeout Evidence

Report:

- selected profiles and why they apply;
- entrypoints updated;
- validation commands run;
- docs intentionally left unchanged and why;
- known gaps for a follow-up slice.
