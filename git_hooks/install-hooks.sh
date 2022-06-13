#!/bin/bash

# Instructions how to use
#   1) cd into a to a git repository
#       ex: `cd ~/summit-knowledge-integration`
#   2) run this script
#       ex: `/home/christian/bin/settings/git_hooks/install-hooks.sh`


GIT_DIR=$(git rev-parse --git-dir)

echo "Installing hooks . . ."
ln -s /home/christian/bin/settings/git_hooks/pre-commit $GIT_DIR/hooks/pre-commit

echo "Done."
