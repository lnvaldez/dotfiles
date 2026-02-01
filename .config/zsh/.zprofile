# Default programs
export EDITOR="vim"
export TERM="st"
export TERMINAL="st"

# XDG base directory specification
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

export XINITRC="$XDG_CONFIG_HOME/x11/xinitrc"

if [[ -z $DISPLAY && $(tty) == /dev/tty1 ]]; then
	exec startx "$XINITRC"
fi
