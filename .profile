# ~/.profile for login shells

# to execute in bash even if .bash_profile is present, add
# [[ -f ~/.profile ]] && . ~/.profile
# to the .bash_profile

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

#    eval $(gnome-keyring-daemon --start)
#    export SSH_AUTH_SOCK
#fi


# Added by Toolbox App
export PATH="$PATH:/home/jojodicus/.local/share/JetBrains/Toolbox/scripts"

