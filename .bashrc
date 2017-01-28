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

### weather: pass your city or zip code, and it returns the weather!
### USAGE - weather cleveland
###         OR
###         weather 44106
### WARNING - city and zip code args may yield inaccurate/different results.
weather() { curl wttr.in/"$1"; }

### myip: prints out your IP address. Handy to check if your VPN is on!
alias myip="curl icanhazip.com"

### plz: re-run the last command as root.
alias plz="fc -l -1 | cut -d' ' -f2- | xargs sudo"

### ls but better: add some color to your life.
alias ls="ls --color=auto"

### a more verbose, colorful ls: see almost everything!
alias lsm="ls -lAhG --color=auto"

### up: cd .. when you're too lazy to use the spacebar
alias up="cd .."

### cls: a better clear with listed directories.
### DEPENDENCY - lsm (see above)
alias cls="clear;lsm"

### update: update all of your packages!
alias update="sudo pacman -Syyu"

### incognito: no saving your command history!
incognito() {
  case $1 in
    start)
    set +o history;;
    stop)
    set -o history;;
    *)
    echo -e "USAGE:
    incognito start - disable command history.
    incognito stop - enable command history."};;
  esac
}

### gpom: simplistic git push origin master alias.
alias gpom="git push origin master"

### restart: a quick refresh for your shell instance.
alias restart="source ~/.bashrc"

### write download <website url> to download any and every item linked from that page, including all sub-webpages and directories.
### ex:download http://www.iarcs.org.in/inoi/online-study-material/
alias download="wget --random-wait -r -p --no-parent -e robots=off -U mozilla"

### start a servre in the current directory for quick file sharing across a network
### also display the ip address of the server
### to access the server on another pc, go to ip:port (generally 8000)
ifconfig | grep inet\ addr && python3 -m http.server
