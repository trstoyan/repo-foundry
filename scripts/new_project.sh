#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'USAGE'
Usage:
  scripts/new_project.sh <target-directory> <project-name>

Creates a new project from templates/base.

Example:
  scripts/new_project.sh /tmp/my-new-project "My New Project"
USAGE
}

if [[ "${1:-}" == "-h" || "${1:-}" == "--help" ]]; then
  usage
  exit 0
fi

if [[ $# -ne 2 ]]; then
  usage >&2
  exit 2
fi

target_dir=$1
project_name=$2

if [[ -z "$project_name" || "$project_name" == *$'\n'* ]]; then
  echo "Project name must be non-empty and must not contain newlines." >&2
  exit 2
fi

repo_root=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
template_dir="${repo_root}/templates/base"

if [[ ! -d "$template_dir" ]]; then
  echo "Template directory not found: $template_dir" >&2
  exit 1
fi

if [[ -e "$target_dir" ]]; then
  if [[ ! -d "$target_dir" ]]; then
    echo "Target exists and is not a directory: $target_dir" >&2
    exit 1
  fi

  if find "$target_dir" -mindepth 1 -maxdepth 1 | read -r _; then
    echo "Target directory must be empty: $target_dir" >&2
    exit 1
  fi
else
  mkdir -p "$target_dir"
fi

cp -R "${template_dir}/." "$target_dir/"

if [[ -f "${target_dir}/README.md" ]]; then
  escaped_project_name=${project_name//\\/\\\\}
  escaped_project_name=${escaped_project_name//&/\\&}
  escaped_project_name=${escaped_project_name//|/\\|}
  sed -i "s|# <Project Name>|# ${escaped_project_name}|" "${target_dir}/README.md"
fi

chmod +x "${target_dir}/scripts/validate.sh"

cat <<EOF
Created project:
  ${target_dir}

Next steps:
  cd "${target_dir}"
  ./scripts/validate.sh
  edit docs/planning/idea-brief.md

First AI prompt:
  I am using Repo Foundry. Read AGENTS.md and docs/planning/idea-brief.md.
  Help me clarify this idea into a project plan. Do not implement anything yet.
EOF
