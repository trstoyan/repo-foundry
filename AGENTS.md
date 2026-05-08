# Repo Foundry Agent Guidelines

Repo Foundry turns lessons from real projects into agent-ready repository
templates, operating rules, scripts, and runbooks.

## Purpose

- Capture lessons from active repositories as evidence, not folklore.
- Promote repeated lessons into reusable template assets.
- Keep universal project rules separate from stack-specific profiles.
- Make new projects easier for humans and AI agents to understand, validate,
  debug, operate, and maintain.

## Working Rules

- Keep this repository documentation-first until a pattern has been observed in
  real projects.
- Do not copy entire files from other projects unless the source project is
  named and the content is intentionally generalized.
- Record lessons in `docs/discovery/` before turning them into template rules.
- Put reusable starter assets under `templates/`.
- Put Repo Foundry maintenance scripts under `scripts/`.
- Do not add provider-specific agent files such as `CLAUDE.md`, `GEMINI.md`,
  `.cursorrules`, or similar files.
- Preserve unrelated user changes.

## Validation

Run from this repository root:

```sh
./scripts/validate.sh
```

This currently checks the expected starter structure and blocks
provider-specific guideline files.

## Documentation Flow

1. Add raw observations with `docs/discovery/note-template.md`.
2. Promote repeated observations into `docs/main-ideas.md` or a decision record.
3. Convert stable patterns into files under `templates/base/` or a future
   stack-specific profile.
4. Update validation when a convention becomes mandatory.
