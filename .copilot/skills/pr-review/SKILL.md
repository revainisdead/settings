---
name: pr-review
description: Use this skill when reviewing pull requests or branches, uses the develop-branch skill, or running /review to check code quality.
---
# Pull Request or Branch Review

## Purpose
Different skills are used in a project for linting, checks, testing, end to end, playwright, etc, and a pull request or branch review skill combines all of that and the human readable code skill to assess the current code written (in staged because of git-commit-policy, and changes any new code or suggest improvements and generally does a local code review.

## Guidelines
1. When reviewing a branch code using /review locally, ensure that we are using the develop-branch skill.
2. All code written and all code review should adhere to the human readable code skill guidelines.

## Review Checklist
Before finalizing code, check:
- [ ] Does the code follow the project's human readable code skill guidelines?
- [ ] Is the code memorable and easy to understand?
- [ ] Does the entire branch's code look high quality, readable, and maintainable?
- [ ] Is there any research that can be done to suggest more code improvements?
