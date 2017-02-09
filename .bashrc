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
# Add this line to your .bashrc, to avoid any breaking aliases or functions.
###############################################################################

### Don't enable any fancy or potentially breaking features
### if the shell session is non-interactive
if [[ $- != *i* ]] ; then
        return
fi

if [ -f ~/.bash_aliases ]; then
. ~/.bash_aliases
fi