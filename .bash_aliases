###############################################################################
#
# 88                       88  88  88  88
# 88                       ""  88  88  ""                             ,d
# 88                           88  88                                 88
# 88,dPPYba,   8b,dPPYba,  88  88  88  88  ,adPPYYba,  8b,dPPYba,   MM88MMM
# 88P'    "8a  88P'   "Y8  88  88  88  88  ""     `Y8  88P'   `"8a    88
# 88       d8  88          88  88  88  88  ,adPPPPP88  88       88    88
# 88b,   ,a8"  88          88  88  88  88  88,    ,88  88       88    88,
# 8Y"Ybbd8"'   88          88  88  88  88  `"8bbdP"Y8  88       88    "Y888
#
# A handful of bash aliases to strengthen the bond between you and your machine.
#
# All you can eat. Take whatever you want/need.
#
# Categorized by operating system.
#
# Made by: Ben Roytenberg (roytenberg@users.noreply.github.com)
###############################################################################

###############################################################################
#
# 88        88               88               
# 88        88               ""               
# 88        88                                
# 88        88  8b,dPPYba,   88  8b,     ,d8  
# 88        88  88P'   `"8a  88   `Y8, ,8P'   
# 88        88  88       88  88     )888(     
# Y8a.    .a8P  88       88  88   ,d8" "8b,   
#  `"Y8888Y"'   88       88  88  8P'     `Y8
#
# Usable by basically all Unix-like machines out of the box.
###############################################################################

### sudo hack: so you can use custom aliases as sudo
###
### NOTE - bash will normally stop recognizing aliases after it sees
### the space after the command sudo, but if it sees an alias that
### ends in a space, it will attempt to detect another alias after.
alias sudo="sudo "

### sets the option to 'autocd' into a directory.
### Instead of `XXXX is a directory`, bash will cd into it.
if [ "$(uname -s)" != "Darwin" ]; then # macOS doesn't have shopt...
  shopt -s autocd
fi

### ls but better: add some color to your life.
if [ "$(uname -s)" == "Darwin" ]; then # OS X sucks.
  alias ls="ls -G"
else
  alias ls="ls --color=auto"
fi

### a more verbose, colorful ls: see almost everything!
###
### DEPENDENCY - ls but better (see above)
alias lsm="ls -hlAFG"

### up: cd .. when you're too lazy to use the spacebar
alias up="cd .."

### cls: a better clear with listed directories.
###
### DEPENDENCY - lsm (see above)
alias cls="clear;lsm"

### update: update all of your packages!
if [ ! -z "$(which brew)" ]; then
  alias update="brew update && brew upgrade"
elif [ ! -z "$(which pacman)" ]; then
  alias update="sudo pacman -Syyu"
elif [ ! -z "$(which apt)" ]; then
  alias update="sudo apt update && sudo apt upgrade && sudo apt full-upgrade"
elif [ ! -z "$(which apt-get)" ]; then
  alias update ="sudo apt-get update && sudo apt-get upgrade && sudo apt-get dist-upgrade"
elif [ ! -z "$(which dnf)" ]; then
  alias update="sudo dnf upgrade"
elif [ ! -z "$(which yum)" ]; then
  alias update="su -c 'yum update'"
elif [ ! -z "$(which zypper)" ]; then
  alias update="sudo zypper update"
fi

### weather: pass your city or zip code, and it returns the weather!
###
### USAGE - weather cleveland
###         OR
###         weather 44106
###
### WARNING - city and zip code args may yield inaccurate/different results.
weather() { curl wttr.in/"$1"; }

### myip: prints out your IP address. Handy to check if your VPN is on!
alias myip="curl icanhazip.com"

### plz: re-run the last command as root.
alias plz="fc -l -1 | cut -d' ' -f2- | xargs sudo"

### ports: lists all ports open and which programs are using them
alias ports="netstat -tulpn"

### space: gets space left on disk
alias space="df -h"

### used: recursively gets how much space is used in the current (or given) directory
alias used="du -ch -d 1"

### incognito: no saving your command history!
incognito() {
  case $1 in
    start)
    set +o history;;
    stop)
    set -o history;;
    *)
    echo -e "USAGE: incognito start - disable command history.
       incognito stop  - enable command history.";;
  esac
}

### download: download any and every item linked from that page.
###
### USAGE - download https://data.gov
alias download="wget --random-wait -r -p --no-parent -e robots=off -U mozilla"

###############################################################################
#                                                                        
#                                               ,ad8888ba,     ad88888ba   
#                                              d8"'    `"8b   d8"     "8b  
#                                             d8'        `8b  Y8,          
# 88,dPYba,,adPYba,   ,adPPYYba,   ,adPPYba,  88          88  `Y8aaaaa,    
# 88P'   "88"    "8a  ""     `Y8  a8"     ""  88          88    `"""""8b,  
# 88      88      88  ,adPPPPP88  8b          Y8,        ,8P          `8b  
# 88      88      88  88,    ,88  "8a,   ,aa   Y8a.    .a8P   Y8a     a8P  
# 88      88      88  `"8bbdP"Y8   `"Ybbd8"'    `"Y8888Y"'     "Y88888P"   
#
# Usable only by macOS out of the box.
###############################################################################

### pman: render the given manpage in Preview.app
if [ "$(uname -s)" == "Darwin" ]; then
  pman() { ps=`mktemp -t manpageXXXX`.ps ; man -t $@ > "$ps" ; open "$ps" ; }
fi

## reveal: lost in the terminal? Just reveal your current folder programmaticaly.
if [ "$(uname -s)" == "Darwin" ]; then
  alias reveal="open ."
fi

###############################################################################
#                         
#              88           
#              ""    ,d     
#                    88     
#  ,adPPYb,d8  88  MM88MMM  
# a8"    `Y88  88    88     
# 8b       88  88    88     
# "8a,   ,d88  88    88,    
#  `"YbbdP"Y8  88    "Y888  
# aa,    ,88               
#  "Y8bbdP"     
#
# A suite of git commands.
###############################################################################

### gpom: simplistic git push origin master alias.
alias gpom="git push origin master"

### restart: a quick refresh for your shell instance.
alias restart="source ~/.bashrc"

### git commands: handful of git commands to make life easier.
alias add="git add"
alias commit="git commit"
alias push="git push"
alias status="git status"
alias stash="git stash"

### push-please: force-pushing, but more polite!
alias push-please="git push --force-with-lease"
