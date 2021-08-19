#drwxrwxr-x  3 christian christian  4096 Aug 19 08:54 .
#drwxr-xr-x 20 christian christian  4096 Aug 19 08:20 ..
#-rw-rw-r--  1 christian christian  1026 Aug 16 10:51 alias.cmd
#-rw-rw-r--  1 christian christian    97 Aug 16 10:51 .asoundrc
#-rw-rw-r--  1 christian christian 11529 Aug 18 11:58 .bashrc
#drwxrwxr-x  8 christian christian  4096 Aug 19 08:49 .git
#-rw-rw-r--  1 christian christian  8501 Aug 18 11:58 .gitconfig
#-rw-rw-r--  1 christian christian    19 Aug 16 10:51 .gitignore
#-rwxrwxr-x  1 christian christian   179 Aug 19 08:49 init.sh
#-rw-r--r--  1 christian christian  4096 Aug 19 08:54 .init.sh.swp
#-rw-rw-r--  1 christian christian    10 Aug 16 10:51 README.md
#-rw-rw-r--  1 christian christian   343 Aug 18 11:58 ssh_config
#-rw-rw-r--  1 christian christian  6618 Aug 18 11:58 .vimrc
#-rw-rw-r--  1 christian christian  1093 Aug 16 10:51 .Xdefaults

# Move all relevant dot files from this folder to home ~/
exclude_always=".git .gitignore init.sh alias.cmd README.md" # alias.cmd is for Windows
exclude_for_now=".asoundrc .Xdefaults"

exclude="${exclude_always} ${exclude_for_now}"

set -e
pushd $(dirname $0) > /dev/null
SCRIPT_PATH=$(pwd -P)
popd > /dev/null

# Point of this script is to move hidden files from this repo to the
# home directory, so must be able to move dot files with mv command
# (disabled by default), use this command as a fix, for just this script
shopt -s dotglob

for path in $SCRIPT_PATH/*
do
    name=`basename $path`
    newName=`$name`

    # Special case for moving ssh_config to a different target name: config
    if [ $path = "ssh_config" ]; then
        newName="config"
    fi

    # Exclude does not contain name
    if [[ ! $exclude =~ $name ]]; then
        echo $pathbase

        # Only copy over if file does not already exist
        if [ ! -f ~/"$name" ]; then
            sudo cp -r $pathbase ~/"$newName"
        fi
    fi
done
