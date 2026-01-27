# Source global shell alias
[ -f "$XDG_CONFIG_HOME/shell/aliasrc" ] && source "$XDG_CONFIG_HOME/shell/aliasrc"

# Load modules
autoload -U compinit && compinit

# History options
HISTFILE="$XDG_STATE_HOME/zsh/history"
HISTSIZE=1000
SAVEHIST=1000
HISTCONTROL=ignoreboth

# Binds
bindkey -v

# Completion dump
compinit -d "$XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION"

zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/zcompcache"
