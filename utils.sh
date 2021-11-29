#!/bin/bash

# Color reset
Normal='\033[0m'

# Regular Colors
Black='\033[0;30m'        # Black
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
White='\033[0;37m'        # White

# Bold
BBlack='\033[1;30m'       # Black
BRed='\033[1;31m'         # Red
BGreen='\033[1;32m'       # Green
BYellow='\033[1;33m'      # Yellow
BBlue='\033[1;34m'        # Blue
BPurple='\033[1;35m'      # Purple
BCyan='\033[1;36m'        # Cyan
BWhite='\033[1;37m'       # White

# Underline
UBlack='\033[4;30m'       # Black
URed='\033[4;31m'         # Red
UGreen='\033[4;32m'       # Green
UYellow='\033[4;33m'      # Yellow
UBlue='\033[4;34m'        # Blue
UPurple='\033[4;35m'      # Purple
UCyan='\033[4;36m'        # Cyan
UWhite='\033[4;37m'       # White

# Background
On_Black='\033[40m'       # Black
On_Red='\033[41m'         # Red
On_Green='\033[42m'       # Green
On_Yellow='\033[43m'      # Yellow
On_Blue='\033[44m'        # Blue
On_Purple='\033[45m'      # Purple
On_Cyan='\033[46m'        # Cyan
On_White='\033[47m'       # White

# High Intensity
IBlack='\033[0;90m'       # Black
IRed='\033[0;91m'         # Red
IGreen='\033[0;92m'       # Green
IYellow='\033[0;93m'      # Yellow
IBlue='\033[0;94m'        # Blue
IPurple='\033[0;95m'      # Purple
ICyan='\033[0;96m'        # Cyan
IWhite='\033[0;97m'       # White

# Bold High Intensity
BIBlack='\033[1;90m'      # Black
BIRed='\033[1;91m'        # Red
BIGreen='\033[1;92m'      # Green
BIYellow='\033[1;93m'     # Yellow
BIBlue='\033[1;94m'       # Blue
BIPurple='\033[1;95m'     # Purple
BICyan='\033[1;96m'       # Cyan
BIWhite='\033[1;97m'      # White

# High Intensity backgrounds
On_IBlack='\033[0;100m'   # Black
On_IRed='\033[0;101m'     # Red
On_IGreen='\033[0;102m'   # Green
On_IYellow='\033[0;103m'  # Yellow
On_IBlue='\033[0;104m'    # Blue
On_IPurple='\033[0;105m'  # Purple
On_ICyan='\033[0;106m'    # Cyan
On_IWhite='\033[0;107m'   # White


# Test creating object mapping
declare -A colors

# The key is the value passed to cecho after msg
# ex. `cecho "This is a sentence" green`
# The value is the color value from above globals
colors=(
    ["normal"]=$Normal
    ["black"]=$Black
    ["red"]=$Red
    ["green"]=$Green
    ["yellow"]=$Yellow
    ["blue"]=$Blue
    ["purple"]=$Purple
    ["cyan"]=$Cyan
    ["white"]=$White

    ["bblack"]=$BBlack
    ["bred"]=$BRed
    ["bgreen"]=$BGreen
    ["byellow"]=$BYellow
    ["bblue"]=$BBlue
    ["bpurple"]=$BPurple
    ["bcyan"]=$BCyan
    ["bwhite"]=$BWhite

    ["ublack"]=$UBlack
    ["ured"]=$URed
    ["ugreen"]=$UGreen
    ["uyellow"]=$UYellow
    ["ublue"]=$UBlue
    ["upurple"]=$UPurple
    ["ucyan"]=$UCyan
    ["uwhite"]=$UWhite

    ["onblack"]=$OnBlack
    ["onred"]=$OnRed
    ["ongreen"]=$OnGreen
    ["onyellow"]=$OnYellow
    ["onblue"]=$OnBlue
    ["onpurple"]=$OnPurple
    ["oncyan"]=$OnCyan
    ["onwhite"]=$OnWhite

    ["iblack"]=$IBlack
    ["ired"]=$IRed
    ["igreen"]=$IGreen
    ["iyellow"]=$IYellow
    ["iblue"]=$IBlue
    ["ipurple"]=$IPurple
    ["icyan"]=$ICyan
    ["iwhite"]=$IWhite

    ["biblack"]=$BIBlack
    ["bired"]=$BIRed
    ["bigreen"]=$BIGreen
    ["biyellow"]=$BIYellow
    ["biblue"]=$BIBlue
    ["bipurple"]=$BIPurple
    ["bicyan"]=$BICyan
    ["biwhite"]=$BIWhite

    ["oniblack"]=$OnIBlack
    ["onired"]=$OnIRed
    ["onigreen"]=$OnIGreen
    ["oniyellow"]=$OnIYellow
    ["oniblue"]=$OnIBlue
    ["onipurple"]=$OnIPurple
    ["onicyan"]=$OnICyan
    ["oniwhite"]=$OnIWhite
)

# set: animals['key']='value'
# get:
# expand: "${animals[@]}"
#echo $colors["black"]   # wrong
#echo ${colors["black"]} # right

cecho() {
    text=$1
    colorArg=$2

    if [[ -z ${colorArg} ]]; then
        colorArg="normal"
    fi

    # Retrieve from associative array
    colorFromMapping="${colors[$colorArg]}"
    echo -e "${colorFromMapping}${text}"
}
