# ~/.bash_aliases

alias ls='ls --color=auto'
alias ll='ls -lhv'
alias la='ls -lahv'

alias py='python3'

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

alias ml='module load'
alias ma='module avail'
