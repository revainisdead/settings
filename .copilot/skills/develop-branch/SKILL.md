---
name: develop-branch
description: Use develop branch as the main branch for development and compare the feature branch against develop to assess the full code from a branch.
---
# Develop Branch

## Purpose
Describe that develop is the main branch for development, and that master is the main branch for production.

## Guidelines
- Use the git tool skill to gather the full code from a branch ie. `git diff HEAD..develop` or the reverse if needed `git diff develop..HEAD`

## Checklist
- [ ] Use develop branch for development
- [ ] Use master branch for production
- [ ] Use git diff to compare feature branch against develop to assess the full code from a branch
