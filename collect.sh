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
#     # if it does not exist, git clone https://github.com/revainisdead/settings.git
#     cp file $DEST

WORKING_DIR=$(pwd)
echo Copying config files from home directory to settings repository: $WORKING_DIR

updateSettings()
