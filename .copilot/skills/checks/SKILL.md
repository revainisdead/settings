---
name: checks
description: Linting, test runners, migration checks, ruffs linting and formatting, and possibly playwright checks, anything needed to ensure tests / ci tests are passing.
---
# Checks

## Purpose
Never run these commands locally, always use docker, everything that runs should basically run on the docker container or environment that is built

## Guidelines
1. Refer to all of these commands and run help to understand what they can do.
    - `./script-docker/check --help`
    - `./script-docker/test --help`
    - `docker compose exec web ruff check {changed_files}`
    - `docker compose exec web ruff format {changed_files}`
    - `./script-docker/migrate --help`
    - `./script-docker/console --help`

2. When all code is written and complete, during review, run some checks including linting, ruff, and testing.
    - `./script-docker/check --help`

3. NOTE: Never let ruff format or fix the whole project, always take use the pr review or develop branch skill to only check files that have been changed in the branch.

## Checklist
- [ ] Have local linting checks run and pass?
- [ ] Have local ruff checks run and pass?
    - a. the linter (check part 1)
    - b. and the apply fixes (format part 2)
- [ ] Have local tests run and pass?
