# Repo Foundry Roadmap

This is the lightweight backlog for rough points we want to tackle later.
Items here are not promises of scope or schedule. They are reminders to convert
repeated lessons into clearer tools, docs, examples, and validation.

## Current Direction

Repo Foundry is usable as a documentation-first starter and planning discipline.
The next stage is to make the workflow easier to follow, harder to skip by
accident, and more verifiable with small tools.

## Near-Term Backlog

### CI Validation

Add a GitHub Actions workflow that runs the repository validator on every pull
request and push.

Expected result:

- `./scripts/validate.sh` runs in CI.
- JSON schema syntax is checked in CI.
- The repo rejects provider-specific guideline files automatically.

### Profile Apply Script

Add a script that applies selected profiles to a generated project.

Expected result:

- A user can start with `templates/base`.
- A user can opt into profiles such as evidence review, documentation
  governance, high-risk runtime, or multi-agent worktree rules.
- The script reports what changed and what still requires manual review.

### Schema Validation Examples

Add example evidence, review, release decision, and closure records, then
validate them against the schemas.

Expected result:

- `examples/governance/` contains minimal valid records.
- Validation catches malformed records.
- The governance RFC is connected to runnable examples.

### Guided Setup Wizard

Build a guided command that walks a new user from raw idea to project scaffold.

Expected result:

- The wizard asks for project name, project type, risk level, and desired
  profiles.
- It creates a project from the base template.
- It points the user to the first planning files to complete.

### Planning Quality Checks

Add checks that help agents detect when implementation is starting too early.

Expected result:

- Generated projects can report missing idea brief, project plan, risk profile,
  accepted slice, or agent context.
- The checks stay advisory at first and become stricter only after the pattern
  is stable.

### Documentation Site

Publish the core guide as a simple static documentation site.

Expected result:

- New users can browse the Foundry Process, guided onboarding, templates,
  profiles, schemas, and examples without reading the repository tree manually.
- The site is generated from the same markdown files used in the repo.

### Versioned Releases

Start tagging stable template versions once the base workflow and profile
application flow are less experimental.

Expected result:

- Users can pin a known Repo Foundry version.
- Release notes explain template, schema, and process changes.
- Breaking changes are explicit.

## Recently Addressed

- Base project scaffold with canonical `AGENTS.md`.
- New project creation script.
- Guided next-step script.
- Idea-to-plan guide.
- Filled planning example.
- Governance schemas for evidence, review, release decision, and closure.
- Sanitized discovery notes and decision records.

## Working Principle

Keep improvements small and evidence-led. A rule should become validation only
after it has proved useful as documentation and repeated practice.
