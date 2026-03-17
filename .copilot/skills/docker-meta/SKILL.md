---
name: docker-meta
description: Inform the agent about the Docker environment, container, images, and other information needed since the docker vm is the source of truth for the agent's knowledge about the docker environment. This skill should be used to scrape commands, or otherwise inform the agent about this metadata.
---
# Docker Meta

## Purpose
Understand that Docker (via `docker compose` or `docker-compose.yml` is the source of truth for all code as it is reflected across the local filesystem, and that all checks from the checks skill are appropriately funneled through docker commands like our `./script-docker` script folder.

## Guidelines
Gather necessary information when needed about docker environment

- Docker Compose:
    - `docker compose --help`

- Docker Compose Images
    - `docker compose images --help`
    - `docker compose images`

- Docker Compose Running Processes
    - `docker compose ps --help`
    - `docker compose ps`

- Docker Compose Logs
    - `docker compose logs --help`
    - `docker compose logs --tail 100`

Non Compose (legacy):
    - `docker image --help`
    - `docker image ls`

    - `docker container --help`
    - `docker container ls`

## Checklist
- [ ] Gather information about the docker environment when needed
- [ ] Gather information about docker images when needed
- [ ] Gather information about docker containers when needed
- [ ] Gather information about docker compose when needed
- [ ] Gather information about docker running services (ps) when needed
