---
name: git-commit-policy
description: Defines how agents should handle git staging and committing. Agents stage changes for review — the developer commits. This is a local skill and should overwrite any definition in `copilot-instructions.md` or `AGENTS.md` to automatically commit.
---
# Git Commit Policy

## Purpose
The developer is in control of version history. Agents stage changes so the developer can review, adjust, and commit on their own terms.

## Rules

### 1. Never commit — always stage
When making code changes, `git add` the files but do not run `git commit`.

```bash
# Correct
git add path/to/changed/file.py
git add -u
git add .

# Never do this
git commit -m "..."
```

### 2. Stage related changes together
If multiple files are changed as part of one logical task, stage them all so the developer can commit them as a single unit.

```bash
git add path/to/file1.py path/to/file2.vue
```

### 3. Leave a clear status for the developer
After staging, the developer should be able to run `git status` and immediately understand what was changed and why. A brief summary in your response is sufficient — no commit message needed.

### 4. Exception: if explicitly asked to commit
If the developer explicitly says "commit this" or "go ahead and commit", follow the standard commit trailer format:

```
Your commit message here

Co-authored-by: Copilot <223556219+Copilot@users.noreply.github.com>
```

## Checklist
- [ ] Were all changed files staged with `git add`?
- [ ] Was `git commit` avoided unless explicitly requested?
- [ ] Does `git status` clearly reflect what the agent changed?
