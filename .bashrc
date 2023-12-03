#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ -f ~/.welcome_screen ]] && . ~/.welcome_screen

[[ -f ~/.bash_aliases ]] && . ~/.bash_aliases

PS1='\[\e[0;93m\]\A \[\e[0m\]- \[\e[0;94m\]\u\[\e[0m\]@\[\e[0;38;5;202m\]\h \[\e[0m\][\[\e[0;92m\]\w\[\e[0m\]]\n\[\e[0m\]> \[\e[0m\]'
