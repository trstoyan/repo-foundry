#!/usr/bin/env bash
set -euo pipefail

required_files=(
  "AGENTS.md"
  ".github/FUNDING.yml"
  "README.md"
  "START_HERE.md"
  "docs/main-ideas.md"
  "docs/foundry-process.md"
  "docs/roadmap.md"
  "docs/repo-tour-plan.md"
  "docs/rfcs/README.md"
  "docs/rfcs/0001-stateless-governance-agents.md"
  "docs/guides/README.md"
  "docs/guides/idea-to-plan.md"
  "docs/guides/prompts.md"
  "schemas/README.md"
  "schemas/evidence-packet.schema.json"
  "schemas/review-result.schema.json"
  "schemas/release-decision.schema.json"
  "schemas/closure-record.schema.json"
  "examples/idea-to-plan/README.md"
  "examples/idea-to-plan/docs/planning/idea-brief.md"
  "examples/idea-to-plan/docs/planning/project-plan.md"
  "examples/idea-to-plan/docs/planning/risk-profile.md"
  "examples/idea-to-plan/docs/planning/slice-template.md"
  "examples/idea-to-plan/docs/planning/agent-context.md"
  "docs/discovery/README.md"
  "docs/discovery/note-template.md"
  "docs/discovery/2026-05-11-api-contract-governance.md"
  "docs/decisions/0001-start-as-repo-foundry.md"
  "docs/decisions/0002-promote-governance-assets.md"
  "docs/decisions/0003-add-idea-to-plan-workflow.md"
  "templates/base/AGENTS.md"
  "templates/base/README.md"
  "templates/base/docs/decisions/README.md"
  "templates/base/docs/planning/README.md"
  "templates/base/docs/planning/idea-brief.md"
  "templates/base/docs/planning/project-plan.md"
  "templates/base/docs/planning/risk-profile.md"
  "templates/base/docs/planning/slice-template.md"
  "templates/base/docs/planning/agent-context.md"
  "templates/base/docs/runbooks/README.md"
  "scripts/next_steps.sh"
  "scripts/new_project.sh"
  "templates/base/scripts/validate.sh"
  "templates/profiles/README.md"
  "templates/profiles/docs-governance/README.md"
  "templates/profiles/docs-governance/AGENTS.snippet.md"
  "templates/profiles/api-contract-governance/README.md"
  "templates/profiles/api-contract-governance/AGENTS.snippet.md"
  "templates/profiles/evidence-review/README.md"
  "templates/profiles/evidence-review/AGENTS.snippet.md"
  "templates/profiles/high-risk-runtime/README.md"
  "templates/profiles/high-risk-runtime/AGENTS.snippet.md"
  "templates/profiles/multi-agent-worktree/README.md"
  "templates/profiles/multi-agent-worktree/AGENTS.snippet.md"
)

for path in "${required_files[@]}"; do
  if [[ ! -f "$path" ]]; then
    echo "Missing required file: $path" >&2
    exit 1
  fi
done

legacy_files=$(find . -path ./.git -prune -o \( -name CLAUDE.md -o -name GEMINI.md -o -name .cursorrules \) -print)
if [[ -n "$legacy_files" ]]; then
  echo "Provider-specific guideline files are not allowed:" >&2
  echo "$legacy_files" >&2
  exit 1
fi

if command -v python3 >/dev/null 2>&1; then
  for schema in schemas/*.schema.json; do
    python3 -m json.tool "$schema" >/dev/null
  done
else
  echo "Warning: python3 not found; skipping JSON syntax validation." >&2
fi

if [[ ! -x "scripts/new_project.sh" ]]; then
  echo "Expected executable script: scripts/new_project.sh" >&2
  exit 1
fi

if [[ ! -x "scripts/next_steps.sh" ]]; then
  echo "Expected executable script: scripts/next_steps.sh" >&2
  exit 1
fi

if [[ ! -x "templates/base/scripts/validate.sh" ]]; then
  echo "Expected executable script: templates/base/scripts/validate.sh" >&2
  exit 1
fi

echo "Validation passed."
