# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# Show git branch in terminal
parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# Branch name terminal
export PS1="\[\033[1;30m\][\u@\h \[\033[1;33m\]\$(parse_git_branch) \[\033[1;30m\]\[\033[0;32m\]\w\[\033[1;30m\]]\[\033[1;30m\]$\[\033[00m\] "

# Alias
# =====
# SSHFS
alias sshdev="sudo sshfs -o allow_other root@10.10.243.116:/ /mnt/dev"

# Git
alias gs="git status"
alias gd="git diff"
alias gl="git log"
alias gb="git branch"

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
# =====

export PYTHONPATH=/mnt/dev/opt/cfcore
export MYPYPATH=/mnt/dev/opt/cfcore:/mnt/dev/opt/cfcore/stubs:/mnt/dev/opt/cyberfire:/mnt/dev/opt/cyberfire/stubs
export PATH=$PATH:/usr/bin/python3

PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"