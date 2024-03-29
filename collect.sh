#!/bin/bash

updateSettings() {
    cp ~/.bashrc ~/bin/settings/
    cp ~/.vimrc ~/bin/settings/
    cp ~/.gitconfig ~/bin/settings/
    cp ~/.ssh/config ~/bin/settings/ssh_config
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
