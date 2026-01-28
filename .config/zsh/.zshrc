# Source global shell alias
[ -f "$XDG_CONFIG_HOME/shell/aliasrc" ] && source "$XDG_CONFIG_HOME/shell/aliasrc"

PLUGINS_DIR="$XDG_DATA_HOME/zsh/plugins"

# Load modules
autoload -U compinit && compinit
autoload -U colors && colors

PS1="%F{2}%B[%n@%m%b %1~]%f$ "

# History options
HISTFILE="$XDG_STATE_HOME/zsh/history"
HISTSIZE=1000
SAVEHIST=1000
HISTCONTROL=ignoreboth

# vi mode
bindkey -v
export KEYTIMEOUT=1

lfcd() {
    tmp="$(mktemp -uq)"
    trap 'rm -f $tmp >/dev/null 2>&1 && trap - HUP INT QUIT TERM PWR EXIT' HUP INT QUIT TERM PWR EXIT
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}

# Binds
bindkey '^L' clear-screen
bindkey '^A' beginning-of-line

bindkey -s '^o' '^Ulfcd\n'

autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Completion dump
compinit -d "$XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION"

zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/zcompcache"

source "$PLUGINS_DIR/zsh-syntax/highlighting/zsh-syntax-highlighting.zsh"
