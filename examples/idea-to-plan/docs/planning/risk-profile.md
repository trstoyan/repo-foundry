# Risk Profile

Status: draft
Last updated: 2026-05-09

## Risk Level

Overall risk: low

## Risk Surfaces

- [x] User data
- [ ] Authentication or authorization
- [ ] Payments, money, credits, or quota
- [ ] External APIs
- [ ] Production infrastructure
- [ ] Background jobs or schedulers
- [ ] Database migrations
- [ ] Secrets or credentials
- [ ] Generated content shown to users
- [ ] Physical-world operations
- [ ] Legal, compliance, or privacy obligations

## Required Profiles

- [x] docs governance
- [ ] evidence review
- [ ] high-risk runtime
- [ ] multi-agent worktree ownership

## Required Human Approvals

- Deployment: not applicable for first version.
- Data deletion: required before adding destructive delete commands.
- Billing or payment changes: not applicable.
- Credential changes: not applicable.
- Production migration: not applicable.

## Validation Expectations

- Required automated checks: local unit tests and `./scripts/validate.sh`.
- Required smoke checks: create/list a sample habit once CLI exists.
- Required manual review: confirm first version stays local-first.
- Evidence records: final response must list commands and results.

## Fail-Closed Rules

If local data cannot be read safely, do not overwrite it. Report the error and
require explicit recovery or migration work.

