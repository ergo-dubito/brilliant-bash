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
###############################################################################

### sets the option to 'autocd' into a directory.
### Instead of `XXXX is a directory`, bash will cd into it.
shopt -s autocd

### sudo hack: so you can use custom aliases as sudo
###
### NOTE - bash will normally stop recognizing aliases after it sees
### the space after the command sudo, but if it sees an alias that
### ends in a space, it will attempt to detect another alias after.
alias sudo="sudo "

### weather: pass your city or zip code, and it returns the weather!
###
### USAGE - weather cleveland
###         OR
###         weather 44106
###
### WARNING - city and zip code args may yield inaccurate/different results.
weather() { curl wttr.in/"$1"; }

### nh - run a task in the background with nohup - handy when a program needs
### environment variables from the shell
nh() { nohup $1 >/dev/null 2>/dev/null & }

### myip: prints out your IP address. Handy to check if your VPN is on!
alias myip="curl icanhazip.com"

### plz: re-run the last command as root.
alias plz="fc -l -1 | cut -d' ' -f2- | xargs sudo"

### ls but better: add some color to your life.
if [ "$(uname -s)" == "Darwin" ]; then # OS X sucks.
  alias ls="ls -G"
else
  alias ls="ls --color=auto"
fi

### a more verbose, colorful ls: see almost everything!
###
### DEPENDENCY - ls colorization (see above)
alias lsm="ls -hlAFG"

### render the given manpage in Preview.app
if [ "$(uname -s)" == "Darwin" ]; then
  pman() { ps=`mktemp -t manpageXXXX`.ps ; man -t $@ > "$ps" ; open "$ps" ; }
fi

### up: cd .. when you're too lazy to use the spacebar
alias up="cd .."

### cls: a better clear with listed directories.
###
### DEPENDENCY - lsm (see above)
alias cls="clear;lsm"

### update: update all of your packages!
if [ ! -z "$(which pacman)" ]; then
  alias update="sudo pacman -Syyu"
elif [ ! -z "$(which apt)" ]; then
  alias update="sudo apt update && sudo apt upgrade && sudo apt full-upgrade"
elif [ ! -z "$(which apt-get)" ]; then
  alias update ="sudo apt-get update && sudo apt-get upgrade && sudo apt-get dist-upgrade"
elif [ ! -z "$(which dnf)" ]; then
  alias update="sudo dnf upgrade"
elif [ ! -z "$(which yum)" ]; then
  alias update="su -c 'yum update'"
elif [ ! -z "$(which brew)" ]; then
  alias update="brew update && brew upgrade"
elif [ ! -z "$(which zypper)" ]; then
  alias update="sudo zypper update"
fi

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

### python/pip: it's 2017. Let's act like we live in it.
# alias python="python3"
#if [ ! -z "$(which virtualenv)" ]; then
#  alias pyenv="virtualenv -p python3 env"
#	 alias pyact="source ./env/bin/activate"
#fi

### write download <website url> to download any and every item linked from that page, including all sub-webpages and directories.
### ex:download http://www.iarcs.org.in/inoi/online-study-material/
alias download="wget --random-wait -r -p --no-parent -e robots=off -U mozilla"

### start a servre in the current directory for quick file sharing across a network
### also display the ip address of the server
### to access the server on another pc, go to ip:port (generally 8000)
alias server="ifconfig | grep inet\ addr && python3 -m http.server"
