---
name: git-tool
description: Git is a version control system that allows developers to manage and track changes in their codebase. It provides features such as branching, merging, and collaboration, making it easier for teams to work together on projects. Git helps maintain a history of changes, facilitates code reviews, and enables efficient collaboration among developers.

We use git to manage our codebase, track changes, and collaborate with other developers. It allows us to create branches for different features or bug fixes, merge changes back into the main codebase, and maintain a history of all changes made to the project. Git also helps us resolve conflicts when multiple developers are working on the same code, ensuring a smooth development process.

Branch development is a software development strategy that involves creating separate branches in a version control system for different features, bug fixes, or experiments. This allows developers to work on multiple tasks simultaneously without interfering with each other's work. Branches can be merged back into the main codebase once the work is complete and tested, ensuring a more organized and efficient development process.

This skill seems necessary because when using git sometimes I have changes that are stashed, staged, commited, or unstaged, or uncommited, the agent should be able to understand that it needs to check these locations for possible other code that is currently changed or nearby for context or usage.
---
# Git Tool

## Purpose
Develop is the main branch for developing new code, master is the production branch. Git has many locations where it can have current code including staged, stashed, or commited code.

## Guidelines
1. Understand that changes can exist in git in various locations using `git` command line tool:
    - Staged and Unstaged: `git status`
    - Unstaged changes: `git diff`
    - Staged changes: `git diff --cached`
    - Branch commits: `git log HEAD..develop`
    - Branch entire diff: `git diff HEAD..develop`
    - Show commits: `git show {commit_hash}`
    - Show last stashed: `git show -p`
2. Only check last stashed if necessary.

## Checklist
- [ ] Check for unstaged changes using as defined in guidelines.
- [ ] Check for staged changes using as defined in guidelines.
- [ ] Check for commits in the current branch using `git log HEAD..develop`
- [ ] Check for entire diff between branches using 
