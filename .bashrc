#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ -f ~/.welcome_screen ]] && . ~/.welcome_screen

# yes, this should technically be in .bash_aliases
alias ls='ls --color=auto'
alias ll='ls -lav --ignore=..'   # show long listing of all except ".."
alias l='ls -lav --ignore=.?*'   # show long listing but no hidden dotfiles except "."

[[ -z "$FUNCNEST" ]] && export FUNCNEST=100          # limits recursive functions, see 'man bash'

## Use the up and down arrow keys for finding a command in history
## (you can write some initial letters of the command first).
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

[[ -f ~/.bash_aliases ]] && . ~/.bash_aliases

PS1='\[\e[0m\][\[\e[0;96m\]\w\[\e[0m\]] \[\e[0m\]<\[\e[0;91m\]$(git branch 2>/dev/null | grep '"'"'^*'"'"' | colrm 1 2)\[\e[0m\]> \[\e[0;93m\]* \[\e[0m\]'

# vi mode
PS0="\e[2 q"
set -o vi

# fuck
eval $(thefuck --alias)
[ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib/python3.10/site-packages/nvidia/cuda_runtime/lib/
