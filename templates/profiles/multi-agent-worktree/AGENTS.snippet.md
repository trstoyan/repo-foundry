## Multi-Agent Ownership

Read-only exploration may use the main checkout. Mutating parallel work must
use an owned branch and worktree.

Before mutating non-trivial work, record:

- slice or task ID;
- owner;
- base revision;
- branch;
- worktree;
- intended write set;
- validation commands;
- handoff path.

Do not overwrite, rebase, clean, or delete another owner's worktree without
explicit approval.

