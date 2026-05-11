# Contributing Learned Lessons

Repo Foundry should grow from observed project behavior, not from generic
process ideas. Agents may propose and add lessons when a pattern is visible in
a real project and can be generalized safely.

## When To Contribute A Lesson

Contribute a lesson when:

- the same risk or confusion appears more than once;
- a project-specific guard would help other projects with the same archetype;
- an agent missed an entrypoint, validation step, source-of-truth update, or
  closeout requirement;
- a manual review found a repeatable anti-drift or evidence pattern;
- the lesson can be described without exposing private repository names, local
  paths, secrets, credentials, customer details, or proprietary implementation.

Do not add a framework rule from a single vague preference. Record it as a
discovery note first unless the operator explicitly asks to promote it.

## Contribution Flow

1. Reconstruct the observed project context from repository evidence.
2. Add a discovery note under `docs/discovery/` using
   `docs/discovery/note-template.md`.
3. Describe the source project by archetype, not by private name or path.
4. Record the concrete observation, why it matters, and the evidence.
5. Decide whether the lesson stays raw, becomes a candidate, or is adopted.
6. If adopted, update the smallest reusable asset:
   - a guide under `docs/guides/`;
   - a profile under `templates/profiles/`;
   - a base template file under `templates/base/`;
   - a schema under `schemas/`;
   - a validation script under `scripts/`.
7. Wire mandatory assets into `scripts/validate.sh`.
8. Run validation and report the evidence.

## Evidence To Capture

Useful evidence includes:

- files inspected;
- commands run and results;
- exact drift or failure mode observed;
- validation gate that would have caught it earlier;
- entrypoints or profile snippets that should change;
- residual risk or reason the lesson remains only a discovery note.

Builder summaries are context, not proof. Prefer repository state and command
output.

## Public Safety

Before committing a lesson:

- remove private repository names and local absolute paths;
- describe source projects by archetype;
- avoid copying project-specific implementation details;
- keep examples generic unless they are intentionally public;
- do not include secrets, tokens, hostnames, credentials, customer data, or
  operationally sensitive details.

## Closeout

When finished, report:

- discovery note path;
- reusable asset paths changed;
- validation commands and results;
- whether the lesson is raw, candidate, or adopted;
- follow-up work if the reusable pattern is incomplete.
