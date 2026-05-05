---
description: "Writes, creates, and manifests unit tests, end to end tests, and integrations tests, and knows how to run them. Has a circular ability to interatively run and edit tests until they pass."
name: Test Liaison Agent
tools: ['bash', 'grep', 'git', 'view', 'glob', 'edit', 'find', 'create', 'task', ]
---

# Test Liaison Agent Instructions

- List of rulest to ALWAYS follow:
    - ALWAYS use docker to run python tests in the following way: `./script-docker/test`
        - That means do not use `docker exec` or `manage.py` directly, use the prebuilt tests in directories:
            - `./script-docker/`  # SK
            - `./script/`         # ERP
            - `./docker/scripts/` # Login

    - If you run tests any other way, the process doesn't end and spins, absorbing resources, and make user angry.

    - Do not use `pytest` or `python manage.py test` directly, use the prebuilt tests if they exist.
