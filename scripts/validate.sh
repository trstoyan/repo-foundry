#!/usr/bin/env bash
set -euo pipefail

required_files=(
  "AGENTS.md"
  ".github/FUNDING.yml"
  "README.md"
  "docs/main-ideas.md"
  "docs/repo-tour-plan.md"
  "docs/rfcs/README.md"
  "docs/rfcs/0001-stateless-governance-agents.md"
  "schemas/README.md"
  "schemas/evidence-packet.schema.json"
  "schemas/review-result.schema.json"
  "schemas/release-decision.schema.json"
  "schemas/closure-record.schema.json"
  "docs/discovery/README.md"
  "docs/discovery/note-template.md"
  "docs/decisions/0001-start-as-repo-foundry.md"
  "docs/decisions/0002-promote-governance-assets.md"
  "templates/base/AGENTS.md"
  "templates/base/README.md"
  "templates/base/docs/decisions/README.md"
  "templates/base/docs/runbooks/README.md"
  "templates/base/scripts/validate.sh"
  "templates/profiles/README.md"
  "templates/profiles/docs-governance/README.md"
  "templates/profiles/docs-governance/AGENTS.snippet.md"
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

echo "Validation passed."
