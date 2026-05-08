#!/usr/bin/env bash
set -euo pipefail

cat <<'EOF'
Repo Foundry guided path
========================

1. Read the process:
   docs/foundry-process.md

2. Read the idea-to-plan guide:
   docs/guides/idea-to-plan.md

3. Inspect the filled example:
   examples/idea-to-plan/README.md

4. Copy a useful prompt:
   docs/guides/prompts.md

5. Create a new project:
   ./scripts/new_project.sh /tmp/my-foundry-project "My Foundry Project"

6. Move into the project and validate:
   cd /tmp/my-foundry-project
   ./scripts/validate.sh

7. Start with the idea brief:
   docs/planning/idea-brief.md

First AI prompt:
  I am using Repo Foundry. Read AGENTS.md and docs/planning/idea-brief.md.
  Help me clarify this idea into a project plan. Do not implement anything yet.

Core rule:
  No implementation from raw idea.
  Implementation starts from an accepted slice.
EOF
