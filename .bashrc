### My .bashrc ###

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

# Show git branch in terminal
parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
# Branch name terminal
export PS1="\[\033[1;30m\][\u@\h \[\033[1;33m\]\$(parse_git_branch) \[\033[1;30m\]\[\033[0;32m\]\w\[\033[1;30m\]]\[\033[1;30m\]$\[\033[00m\] "

# Aliases
alias ls='ls --color=auto'

# SSHFS
alias sshdev="sudo sshfs -o allow_other root@10.10.243.116:/ /mnt/dev"

# Git
alias gs="git status"
alias gd="git diff"
alias gl="git log"
alias gb="git branch"

# Directories
alias bin="cd /home/christian/bin"

alias db="cd /mnt/dev/opt/cyberfire && auto -u postgres psql cyberfire"
alias db2="psql -U postgres"

# Django
alias run="sudo python3 manage.py runserver --nothreading 0.0.0.0:8080"
alias mm="python3 manage.py makemigrations"
alias m="python3 manage.py migrate"
alias link="sudo python manage.py collectstatic --link"

alias private="ecryptfs-mount-private"
alias uprivate="ecryptfs-umount-private"
alias sd="uprivate && sudo telinit 0"
alias notes="cd ~/notes/dev"

# For fun
alias neo="cd ~/bin/matrix && python matrix.py"

# slap dap -LDAP- lap
alias ldapcdconf="cd /etc/openldap"
alias ldapconf="sudo vim /etc/openldap/slapd.conf"
alias ldapcddb="cd /var/lib/openldap/openldap-data"
alias ldapconftest="sudo slaptest -f /etc/openldap/slapd.conf -F /etc/openldap/slapd.d/"

# Add python 3.4 to path permanently
alias py2="export PATH=/home/christian/.gem/ruby/2.3.0/bin:/home/christian/.gem/ruby/2.3.0/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/usr/bin/python2"
alias py3="export PATH=/home/christian/.gem/ruby/2.3.0/bin:/home/christian/.gem/ruby/2.3.0/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/usr/bin/python3"

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
    find . -type f -print | grep "$1"
}

export PYTHONPATH=/mnt/dev/opt/cfcore
export MYPYPATH=/mnt/dev/opt/cfcore:/mnt/dev/opt/cfcore/stubs:/mnt/dev/opt/cyberfire:/mnt/dev/opt/cyberfire/stubs
export PATH=$PATH:/usr/bin/python3

PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"


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

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

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
