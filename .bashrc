### My .bashrc ###

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#PS1='[\u@\h \W]\$ '

# Show git branch in terminal
parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
# Branch name terminal
#export PS1="\[\033[1;30m\][\u@\h \[\033[1;33m\]\$(parse_git_branch) \[\033[1;30m\]\[\033[0;32m\]\w\[\033[1;30m\]]\[\033[1;30m\]$\[\033[00m\] "
export PS1="\[\033[38;5;246m\][\u@\h \[\033[1;33m\]\$(parse_git_branch) \[\033[1;30m\]\[\033[0;32m\]\w\[\033[38;5;246m\]]\[\033[38;5;246m\]$\[\033[00m\] "

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
alias ls="ls --color=auto --group-directories-first"
alias flame="flameshot gui"

# Git
alias gs="git status"
alias gd="git diff"
alias gl="git log"
alias gb="git branch"

# Directories
alias bin="cd /home/christian/bin"
alias notes="cd /home/christian/bin/notes"
alias ski="cd /home/christian/bin/summit-knowledge-integration"
alias erp="cd /home/christian/bin/erp-service"
alias log="cd /home/christian/bin/login-service"
alias tests="cd /home/christian/bin/summit-knowledge-integration/client/spec"
alias stash="cd /home/christian/bin/stash"

alias snips="cd /home/christian/Pictures/snippets"
alias cab="cd /home/christian/bin/summit-knowledge-integration/client/src/cable-ticket"
alias mod="cd /home/christian/bin/summit-knowledge-integration/client/src/core/models"
alias tick="cd /home/christian/bin/summit-knowledge-integration/server/tickets"
#alias erp_t="cd /home/christian/bin/summit-knowledge-integration/server/sk/tasks"

# Notable files
f_array=()
f_array+=("/home/christian/bin/summit-knowledge-integration/client/src/core/models/CableTicket.factory.coffee")
f_array+=("/home/christian/bin/summit-knowledge-integration/server/tickets/views.py")
f_array+=("/home/christian/bin/summit-knowledge-integration/server/tickets/serializers.py")
f_array+=("/home/christian/bin/summit-knowledge-integration/server/tickets/models/cable.py")
f_array+=("/home/christian/bin/summit-knowledge-integration/client/grunt-config-new.json")
f_array+=("/home/christian/bin/summit-knowledge-integration/client/src/job/cable-ocm/cableModalService.service.coffee")
f_array+=("/home/christian/bin/summit-knowledge-integration/client/src/core/search-dialog/cableMaterialSearchDialog.directive.coffee")
f_array+=("/home/christian/bin/summit-knowledge-integration/client/src/vendor/cancelableResource.factory.coffee")
f_array+=("/home/christian/bin/summit-knowledge-integration/client/js/app-chaplin/routes.js")
f_array+=("/home/christian/bin/summit-knowledge-integration/server/templates/index_sk.html")

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
    grep -r --exclude-dir={node_modules,react-with-addons} $1 .
}

findname() {
    echo Searching for file name containg $1 . . .
    # Grep preferrable to -name because it prints matches in color
    # To exlude folders from find use `find . -type d \( -path ./.git -o -path ./node_modules -o \) -prune - false -o -name '*.txt'`
    find . -type f -print | grep "$1"
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

alias dp="docker ps"
alias di="docker images"

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
#/home/christian/bin/summit-knowledge-integration/client/src/cable-ticket/actions-section.html
#/home/christian/bin/summit-knowledge-integration/client/src/core/save-button
