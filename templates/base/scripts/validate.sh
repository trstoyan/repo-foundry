#!/usr/bin/env bash
set -euo pipefail

echo "No project-specific validation has been configured yet."
echo "Replace this placeholder with tests, linters, build checks, or smoke checks."

required_files=(
  "AGENTS.md"
  "README.md"
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

echo "Base structural validation passed."
