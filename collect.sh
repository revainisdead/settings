#!/bin/bash


createDirIfDoesNotExist() {
    if [ ! -d "$1" ]; then
        mkdir -p "$1"
    fi
}

updateSettings() {
    cp ~/.bashrc ~/bin/settings/
    cp ~/.vimrc ~/bin/settings/
    cp ~/.gitconfig ~/bin/settings/
    cp ~/.ssh/config ~/bin/settings/ssh_config

    # Other files included by default in .coplilot, just grab agents
    createDirIfDoesNotExist ~/bin/settings/.copilot/agents
    cp -r ~/.copilot/agents/* ~/bin/settings/.copilot/agents

    # Other files included by default in .coplilot, just grab skills
    createDirIfDoesNotExist ~/bin/settings/.copilot/skills
    cp -r ~/.copilot/skills/* ~/bin/settings/.copilot/skills
}

# settings_list="~/.bashrc ~/.vimrc ~/.gitconfig ~/.ssh/config"
# DEST=~/bin/settings
#
# for file in $settings_list
#     # check for existence of DEST
#     # if it does not exist, git clone "git@github-revainisdead:revainisdead/settings.git"
#     cp file $DEST

echo Copying config files from home directory to settings repository: $(pwd)
updateSettings
