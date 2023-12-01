function fman
    set -l selection "$(man -k . \
        | fzf --preview "echo {} | sed 's/\([a-zA-Z0-9_\.-]*\) (\([a-z0-9]*\)).*/man -P cat \2 \1/' | sh" \
        | sed 's/\([a-zA-Z0-9_\.-]*\) (\([a-z0-9]*\)).*/man \2 \1/')"
    if test -n "$selection"
        echo "$selection" | sh
        fman
    end
end
