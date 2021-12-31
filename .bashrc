### My .bashrc ###

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Includes
source /home/christian/bin/settings/utils.sh

#PS1='[\u@\h \W]\$ '

#export PS1="\[\033[1;30m\][\u@\h \[\033[1;33m\]\$(parse_git_branch) \[\033[1;30m\]\[\033[0;32m\]\w\[\033[1;30m\]]\[\033[1;30m\]$\[\033[00m\] "

# Show git branch in terminal
parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# Add command completion for git aliases (defined in .gitconfig)
_git_upush() {
    _git_branch
}
_git_newpush() {
    _git_branch
}
_git_fpush() {
    _git_branch
}
_git_mpush() {
    _git_branch
}

create_PS1() {
    # Add documentation to ps1 terminal line, ie:
    #    [christian@system76-pc (master) ~/bin/summit-knowledge-integration]$
    MAKE_BOLD_YELLOW="\[\033[1;33m\]"
    MAKE_BOLD_BLACK="\[\033[1;30m\]"
    MAKE_REG_GREEN="\[\033[0;32m\]"
    MAKE_RGB1="\[\033[38;5;246m\]"
    MAKE_RGB2="\[\033[38;5;246m\]"
    MAKE_NORMAL="\[\033[00m\]"
    LITERAL_DOLLAR="$"
    user="\u"           # see `man bash` -> PROMPTING
    hostname="\h"       # see `man bash` -> PROMPTING
    working_dir="\w"    # see `man bash` -> PROMPTING
    branch=$(parse_git_branch)

    echo "$MAKE_RGB1[$user@$hostname $MAKE_BOLD_YELLOW$branch $MAKE_BOLD_BLACK$MAKE_REG_GREEN$working_dir$MAKE_RGB2]$MAKE_RGB2$LITERAL_DOLLAR$MAKE_NORMAL "
}
#export PS1=$(create_PS1)

export PS1="\[\033[38;5;246m\][\u@\h \[\033[1;33m\]\$(parse_git_branch) \[\033[1;30m\]\[\033[0;32m\]\w\[\033[38;5;246m\]]\[\033[38;5;246m\]$\[\033[00m\] "

# Disable Ctrl-s (pause terminal): Inadvertently enable search with Ctrl-s (Ctrl-r: reverse search)
stty -ixon

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Aliases
alias ..="cd ../../"
alias ...="cd ../../../"
alias ....="cd ../../../../"
alias .....="cd ../../../../../"

# Warning: no longer able to pass arguments to cd using this method
#alias cd=pushd > /dev/null # overwrite cd to use pushd instead, so that I can go back multiple directories
#alias bb="popd && popd"
#alias bbb="popd && popd && popd"
#alias bbbb="popd && popd && popd && popd"

# Screenshots
alias flame="flameshot gui"
alias shots="kazam --area"

# Tools
alias ls="ls --color=auto --group-directories-first"
alias lsswp="ls .*.swp"
alias unzipper="tar -zxf"
alias installed="sudo apt list --installed"
alias installed_files="dpkg -L" # <package_name>
alias search="sudo apt-cache search"
alias local-pkg-install="sudo dpkg -i" # <package_name>
alias aliasgit="git config --get-regexp alias"
alias aliasbash="alias"

alias dp="docker ps"
alias dc="docker container ls"
alias di="docker images"
alias dv="docker volume ls"
alias dl="docker-compose logs -f --tail 20"

dockerIdFromName() {
    # Parse `docker images` output for id of image with name "summit-knowledge-integration_static_build"
    #SEARCH_TERM="summit-knowledge-integration_static_build"
    SEARCH_TERM=$1

    # Split line up into multiple lines using awk, delimeter being 3 spaces, print fourth line, finally remove all whitespace
    IMAGE_ID=$(docker images | grep $SEARCH_TERM | awk -F "\ \ \ " '{print $4}' | sed 's/^[[:space:]]*//g')

    # Run command on docker image (would need to update image from running container for this to work on current code)
    #docker run -i $IMAGE_ID lerna run test --stream

    echo Retrieved $IMAGE_ID \(using $SEARCH_TERM\)
}

# Git
alias gs="git status"
alias gd="git diff"
alias gdc="git diff --cached"
alias gl="git log"
alias gb="git branch"

# Diagnostics
alias ubuntu="lsb_release -a"

# Moving
alias down="cd ~/Downloads"

alias bin="cd /home/christian/bin"
alias notes="cd /home/christian/bin/notes"
alias settings="cd /home/christian/bin/settings"
alias cl="cd /home/christian/bin/captains_log"
alias crh="cd /home/christian/bin/christian-revain-hall"

alias ski="cd /home/christian/bin/summit-knowledge-integration"
alias erp="cd /home/christian/bin/erp-service"
alias log="cd /home/christian/bin/login-service"

alias ski2="cd /home/christian/bin/sk2/summit-knowledge-integration2"
alias erp2="cd /home/christian/bin/sk2/erp-service2"
alias log2="cd /home/christian/bin/sk2/login-service2"

alias cdf="cd /home/christian/bin/cable_dev_files"

alias spec="cd /home/christian/bin/summit-knowledge-integration/client/spec/cable-ticket"
alias specmod="cd /home/christian/bin/summit-knowledge-integration/client/spec/core/models"
alias specm="cd /home/christian/bin/summit-knowledge-integration/client/spec/core/models"
alias stash="cd /home/christian/bin/stash"

alias snips="cd /home/christian/Pictures/snippets"
alias cab="cd /home/christian/bin/summit-knowledge-integration/client/src/cable-ticket"
alias mod="cd /home/christian/bin/summit-knowledge-integration/client/src/core/models"
alias core="cd /home/christian/bin/summit-knowledge-integration/client/src/core"
alias tick="cd /home/christian/bin/summit-knowledge-integration/server/tickets"
alias sk="cd /home/christian/bin/summit-knowledge-integration/server/sk"
#/home/christian/bin/summit-knowledge-integration/server/sk/tasks
#/home/christian/bin/summit-knowledge-integration/client/src/core/save-button

alias gtp="cd /home/christian/bin/gtpaper-venv/gtpaper"
alias gtpact="source /home/christian/bin/gtpaper-venv/bin/activate"

alias opg="cd /home/christian/bin/opg-venv/one-percent-growth"
alias opgact="source /home/christian/bin/opg-venv/bin/activate"
alias opgs="cd /home/christian/bin/opg-venv/one-percent-growth/server"
alias opgc="cd /home/christian/bin/opg-venv/one-percent-growth/client"


# Notable files
f_array=()
f_array+=("/home/christian/bin/summit-knowledge-integration/server/tickets/views.py")
f_array+=("/home/christian/bin/summit-knowledge-integration/server/tickets/serializers.py")
f_array+=("/home/christian/bin/summit-knowledge-integration/server/tickets/models/cable.py") # CableTicket, CableSegment
f_array+=("/home/christian/bin/summit-knowledge-integration/server/tickets/models/abstract.py") # CableSegmentAbstractModel
f_array+=("/home/christian/bin/summit-knowledge-integration/server/templates/index_sk.html")
f_array+=("/home/christian/bin/summit-knowledge-integration/server/sk/api_v3_urls.py")
f_array+=("/home/christian/bin/summit-knowledge-integration/server/sk/views.py") # ERPServiceProxyViewSet
f_array+=("/home/christian/bin/summit-knowledge-integration/server/utils/rest_serializers.py") # NestedListSerializer
f_array+=("/home/christian/bin/summit-knowledge-integration/server/utils/erp.py") # ERPClient
f_array+=("/home/christian/bin/summit-knowledge-integration/client/grunt-config-new.json")
f_array+=("/home/christian/bin/summit-knowledge-integration/client/src/job/cable-ocm/cableModalService.service.coffee")
f_array+=("/home/christian/bin/summit-knowledge-integration/client/src/core/search-dialog/cableMaterialSearchDialog.directive.coffee")
f_array+=("/home/christian/bin/summit-knowledge-integration/client/src/vendor/cancelableResource.factory.coffee")
f_array+=("/home/christian/bin/summit-knowledge-integration/client/js/app-chaplin/routes.js")
f_array+=("/home/christian/bin/summit-knowledge-integration/client/src/core/uiselect.directive.coffee")
f_array+=("/home/christian/bin/summit-knowledge-integration/client/src/core/uiselectSearches.service.coffee")
f_array+=("/home/christian/bin/summit-knowledge-integration/client/src/core/filters/findChoice.filter.coffee")
f_array+=("/home/christian/bin/summit-knowledge-integration/client/src/core/models/ERPEquipment.factory.coffee") # MLE
f_array+=("/home/christian/bin/erp-service/inventory/filters.py")
f_array+=("/home/christian/bin/erp-service/inventory/views.py")
f_array+=("/home/christian/bin/summit-knowledge-integration/server/inventory/views.py")
f_array+=("/home/christian/bin/summit-knowledge-integration/client/src/core/Store.factory.coffee")
f_array+=("/home/christian/bin/summit-knowledge-integration/client/src/core/StorageEngine.factory.coffee")
f_array+=("/home/christian/bin/summit-knowledge-integration/client/_SpecRunner.html") # Changing file names, go here too.
f_array+=("/home/christian/bin/summit-knowledge-integration/client/js/vendor/jasmine-2.3.4/jasmine.js")
#f_array_end

alias gar="cd /home/christian/bin/garden-venv/garden/"
alias gar-act="source ../bin/activate"

# Alias functions
quotesgrep() {
    echo Checking for $1 wrapped in single quotes . . .
    grep -r --exclude-dir={node_modules,react-with-addons} "\'$1\'" .
    echo Checking for $1 wrapped in double quotes . . .
    grep -r --exclude-dir={node_modules,react-with-addons} "\"$1\"" .
}

exgrep() {
    echo Checking for $1 excluding node_modules and react-with-addons . . .
    # Needed to quote the argument $1 below or the escaped values would not work
    grep -r --exclude="tags" --exclude-dir={node_modules,react-with-addons,site-packages,notes,vendor,app-chaplin,.grunt,app-components,.git,static,media} "$1" .
}

findname() {
    #echo Searching for file name containg $1 . . .

    # Grep preferrable to -name because it prints matches in color
    # To exlude folders from find use:
    # `find . -type d \( -path ./.git -o -path ./node_modules -o \) -prune - false -o -name '*.txt'`

    # Add quote at beginning and end of each line to be able to expand and send to rm command
    # s/^/'/ Replace beginning of line with a tick
    # s/$/'/ Replace end of line with a tick
    #find . -type f -print | grep "$1" | sed "s/^/'/;s/$/'/"
    # Summary: turns out not needed, can use `rm $(findname .test1)` without quoting output and it works.

    # Use sed to exclude directories from output
    find . -type f -print | grep "$1" | sed "/node_modules/d" # Delete entire line containing string
}

finddir() {
    echo Searching for folder name container $1 . . .
    find . -type d -name $1
}

getpath() {
    # Or could use . for directory, equivalent
    find "$PWD" -name $1
}
getpathrc() {
    echo Printing the absolute path for \"$1\"... \(and adding to .bashrc\)
    # overwrite: >
    # append: >>
    # stderr: &>
    # stderr append: &>>
    # stderr overwrite w/ terminal putput: 2>&1 | tee

    find "$PWD" -name $1
    find "$PWD" -name $1 >> ~/.bashrc

}

printNotable() {
    # Now defined above
    #declare -a arr=($f1, $f2, $f3)

    for item in "${f_array[@]}"
    do
        echo "$item"
    done
}

# Cleanup
removeVimUndo() {
    # Use sed to remove lines containing 'node_modules'
    files=$(find . -type f -print | grep ".un~" | sed "/node_modules/d")
    rm $files
}

#alias db="cd /mnt/dev/opt/cyberfire && auto -u postgres psql cyberfire"
#alias db2="psql -U postgres"

# Django
#alias run="sudo python3 manage.py runserver --nothreading 0.0.0.0:8080"
#alias mm="python3 manage.py makemigrations"
#alias m="python3 manage.py migrate"
#alias link="sudo python manage.py collectstatic --link"

#alias private="ecryptfs-mount-private"
#alias uprivate="ecryptfs-umount-private"
#alias sd="uprivate && sudo telinit 0"

#alias neo="cd ~/bin/matrix && python matrix.py"

# slap dap -LDAP- lap
#alias ldapcdconf="cd /etc/openldap"
#alias ldapconf="sudo vim /etc/openldap/slapd.conf"
#alias ldapcddb="cd /var/lib/openldap/openldap-data"
#alias ldapconftest="sudo slaptest -f /etc/openldap/slapd.conf -F /etc/openldap/slapd.d/"

# Add python 3.4 to path permanently (old computer)
#alias py2="export PATH=/home/christian/.gem/ruby/2.3.0/bin:/home/christian/.gem/ruby/2.3.0/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/usr/bin/python2"
#alias py3="export PATH=/home/christian/.gem/ruby/2.3.0/bin:/home/christian/.gem/ruby/2.3.0/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/usr/bin/python3"



### Ubuntu Defaults ###

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

#if [ -n "$force_color_prompt" ]; then
#    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
#	# We have color support; assume it's compliant with Ecma-48
#	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
#	# a case would tend to support setf rather than setaf.)
#	color_prompt=yes
#    else
#	color_prompt=
#    fi
#fi

#if [ "$color_prompt" = yes ]; then
#    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
#else
#    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
#fi
#unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
