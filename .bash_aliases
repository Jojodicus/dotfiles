#######################
# Jojodicus - .bashrc #
#######################

# pasted from public config files

# update system
# debian
#alias update="sudo apt update -y && sudo apt upgrade -y && sudo apt autoremove -y && sudo apt dist-upgrade -y"
# arch
alias update="yay"
#alias update="sudo pacman -Syu"

# yep windows user
alias cls="clear"

alias py="python3.10"

#uwu
alias sbb='sudo "$BASH" -c "$(history -p !!)"'

# go up a variable number of directories
function cu {
    local count=$1
    if [ -z "${count}" ]; then
        count=1
    fi
    local path=""
    for i in $(seq 1 ${count}); do
        path="${path}../"
    done
    cd $path
}

# make a directory and cd into it
mkcd() {
  mkdir -p "$1" && cd "$1"
}

# nicer man pages
fman () {
    selection="$(man -k . \
        | fzf --preview "echo {} | sed 's/\([a-zA-Z0-9_\.-]*\) (\([a-z0-9]*\)).*/man -P cat \2 \1/' | sh" \
        | sed 's/\([a-zA-Z0-9_\.-]*\) (\([a-z0-9]*\)).*/man \2 \1/')"
    if [ -n "$selection" ]; then
        echo "$selection" | sh
        fman
    fi
}

# Colours have names too. Stolen from Arch wiki
txtblk='\[\e[0;30m\]' # Black - Regular
txtred='\[\e[0;31m\]' # Red
txtgrn='\[\e[0;32m\]' # Green
txtylw='\[\e[0;33m\]' # Yellow
txtblu='\[\e[0;34m\]' # Blue
txtpur='\[\e[0;35m\]' # Purple
txtcyn='\[\e[0;36m\]' # Cyan
txtwht='\[\e[0;37m\]' # White
bldblk='\[\e[1;30m\]' # Black - Bold
bldred='\[\e[1;31m\]' # Red
bldgrn='\[\e[1;32m\]' # Green
bldylw='\[\e[1;33m\]' # Yellow
bldblu='\[\e[1;34m\]' # Blue
bldpur='\[\e[1;35m\]' # Purple
bldcyn='\[\e[1;36m\]' # Cyan
bldwht='\[\e[1;37m\]' # White
unkblk='\[\e[4;30m\]' # Black - Underline
undred='\[\e[4;31m\]' # Red
undgrn='\[\e[4;32m\]' # Green
undylw='\[\e[4;33m\]' # Yellow
undblu='\[\e[4;34m\]' # Blue
undpur='\[\e[4;35m\]' # Purple
undcyn='\[\e[4;36m\]' # Cyan
undwht='\[\e[4;37m\]' # White
bakblk='\[\e[40m\]'   # Black - Background
bakred='\[\e[41m\]'   # Red
badgrn='\[\e[42m\]'   # Green
bakylw='\[\e[43m\]'   # Yellow
bakblu='\[\e[44m\]'   # Blue
bakpur='\[\e[45m\]'   # Purple
bakcyn='\[\e[46m\]'   # Cyan
bakwht='\[\e[47m\]'   # White
txtrst='\[\e[0m\]'    # Text Reset
