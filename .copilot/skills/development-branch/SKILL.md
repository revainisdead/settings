---
name: development-branch
description: Use development branch as the main branch for development and compare the feature branch against development to assess the full code from a branch.
---
# Development Branch

## Purpose
Describe that development is the main branch for development, and that master is the main branch for production.

## Guidelines
- Use the git tool skill to gather the full code from a branch ie. `git diff HEAD..development` or the reverse if needed `git diff development..HEAD`

## Checklist
- [ ] Use development branch for development
- [ ] Use master branch for production
- [ ] Use git diff to compare feature branch against development to assess the full code from a branch
