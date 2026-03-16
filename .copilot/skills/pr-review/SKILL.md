---
name: pr-review
description: Use this skill when reviewing pull requests or branches, diffing against develop, or running /review to check code quality.
---
# Pull Request or Branch Review

## Purpose
For branch development, it's necessary to know that develop is the main branch used for development, and master is the main branch used for production.

## Guidelines
1. When reviewing a branch code using /review locally, ensure that we are using the diff from the current branch to develop.
2. All code written and all code review should adhere to the human readable code skill guidelines.

## Review Checklist
Before finalizing code, check:
- [ ] Does the code follow the project's human readable code skill guidelines?
- [ ] Did we compare from the current branch to develop?
- [ ] Does the diff between current branch and develop have good code quality and code readability?
