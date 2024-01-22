#!/bin/bash

# Move all relevant dot files from this folder to home ~/
include=".bashrc .gitconfig .vimrc"

set -e
pushd $(dirname $0) > /dev/null
SCRIPT_PATH=$(pwd -P)
popd > /dev/null
# cd $SCRIPT_PATH/..

source $SCRIPT_PATH/utils.sh

# Point of this script is to move hidden files from this repo to the
# home directory, so must be able to move dot files with mv/cp command
# (disabled by default), use this command as a fix, for just this script
shopt -s dotglob

for path in $SCRIPT_PATH/*
do
    name=`basename $path`
    newName=$name
    destination=~/      # with trailing slash

    # Special case for moving ssh_config to a different target name: config
    if [ $name == "ssh_config" ]; then
        destination=~/.ssh/     # with trailing slash
        newName="config"

        # Enable interpretation of backslash escapes using `echo -e`
        cecho "\tConverting ssh_config to ${newName} in ${destination}" yellow
    fi

    finalpath="${destination}${newName}"

    # Include does contain name
    if [[ $config_files =~ $name ]]; then
        # Only copy over if file does not already exist
        if [ ! -f $finalpath ]; then
            cecho "Copying file ${name} to ${finalpath}" green
            cp -r $name "$finalpath"
        else
            cecho "File already exists $finalpath" red
        fi
    fi
done

# Set up pre-commit in project's .git/hooks directory
# Leverage install-hooks.sh to accomplish that

# step 1: move install-hooks.sh into .git/hooks
# cp $SCRIPT_PATH/git-hooks/install-hooks.sh $PROJECT_DIR/.git/hooks
# step 2: run install-hooks.sh
