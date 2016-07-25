# ~/.bashrc
# Noobie: What is .bashrc?
# It's the bash file that is loaded each time a bash terminal is loaded.

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# Colors! Generated by bashrcgenerator.com
export PS1="\[\033[38;5;141m\]\h\[$(tput sgr0)\]\[\033[38;5;118m\]@\u\[$(tput sgr0)\]\[\033[38;5;172m\][\w]\[$(tput sgr0)\]\[\033[38;5;118m\]\\$\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"

# Terminal fix on ssh-server
# alias ssh="TERM=linux ssh"

# Alias
alias private="ecryptfs-mount-private"
alias uprivate="ecryptfs-umount-private"

# Add python 3.4 to path permanently
PATH=$PATH:/usr/bin/python3
export PATH

