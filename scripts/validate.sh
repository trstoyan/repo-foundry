#!/usr/bin/env bash
set -euo pipefail

required_files=(
  "AGENTS.md"
  ".github/FUNDING.yml"
  "README.md"
  "docs/main-ideas.md"
  "docs/repo-tour-plan.md"
  "docs/discovery/README.md"
  "docs/discovery/note-template.md"
  "docs/decisions/0001-start-as-repo-foundry.md"
  "templates/base/AGENTS.md"
  "templates/base/README.md"
  "templates/base/docs/decisions/README.md"
  "templates/base/docs/runbooks/README.md"
  "templates/base/scripts/validate.sh"
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

echo "Validation passed."
