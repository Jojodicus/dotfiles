if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_prompt -d "Write out the prompt"
    echo -n (set_color normal)'['(set_color blue)(prompt_pwd)(set_color normal)'] <'(set_color red)
    echo -n (fish_git_prompt | awk '{$1=$1};1')
    echo -n (set_color normal)'> '(set_color yellow)'*'(set_color normal)' '
end

set -gx LANG "en_US.UTF-8"
set -gx LC_CTYPE "en_US.UTF-8"
set -gx LC_NUMERIC "de_DE.UTF-8"
set -gx LC_TIME "de_DE.UTF-8"
set -gx LC_COLLATE C
set -gx LC_MONETARY "de_DE.UTF-8"
set -gx LC_MESSAGES "en_US.UTF-8"
set -gx LC_PAPER "de_DE.UTF-8"
set -gx LC_NAME "de_DE.UTF-8"
set -gx LC_ADDRESS "de_DE.UTF-8"
set -gx LC_TELEPHONE "de_DE.UTF-8"
set -gx LC_MEASUREMENT "de_DE.UTF-8"
set -gx LC_IDENTIFICATION "de_DE.UTF-8"

set -gx _JAVA_AWT_WM_NONREPARENTING 1

if test "$TERM" = "xterm-kitty"
    alias ssh="kitty +kitten ssh"
end

alias py="python"

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ]
    set PATH "$HOME/bin:$PATH"
end

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ]
    set PATH "$HOME/.local/bin:$PATH"
end

# gnome keyring daemon
if [ -n "$DESKTOP_SESSION" ];then
    eval $(gnome-keyring-daemon --start)
    export SSH_AUTH_SOCK
end

