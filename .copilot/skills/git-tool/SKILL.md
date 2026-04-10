---
name: git-tool
description: Git is used as the version control system and branch development is used for pull request workflow. This skill is for understanding the various locations where code can exist in git and how to check for them.
---
# Git Tool

## Purpose
Git has many locations where it can have current code including staged, stashed, or commited code. This skill seems necessary because when using git sometimes I have changes that are stashed, staged, commited, or unstaged, or uncommited, the agent should be able to understand that it needs to check these locations for possible other code that is currently changed or nearby for context or usage.

## Guidelines
1. Understand that changes can exist in git in various locations using `git` command line tool:
    - Staged and Unstaged: `git status`
    - Unstaged changes: `git diff`
    - Staged changes: `git diff --cached`
    - Branch commits: `git log HEAD..develop`
    - Branch entire diff: `git diff HEAD..develop`
    - Show commits: `git show {commit_hash}`
2. Uses the develop-branch skill.

## Checklist
- [ ] Check for unstaged changes using as defined in guidelines.
- [ ] Check for staged changes using as defined in guidelines.
- [ ] Check for commits in the current branch using `git log HEAD..develop`
- [ ] Check for entire diff between branches using 
