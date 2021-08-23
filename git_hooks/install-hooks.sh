#!/bin/bash

GIT_DIR=$(git rev-parse --git-dir)

echo "Installing hooks . . ."
ln -s /home/christian/bin/settings/git_hooks/pre-commit $GIT_DIR/hooks/pre-commit

echo "Done."
