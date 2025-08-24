# Sample .bashrc for SUSE Linux
# Copyright (c) SUSE Software Solutions Germany GmbH

# There are 3 different types of shells in bash: the login shell, normal shell
# and interactive shell. Login shells read ~/.profile and interactive shells
# read ~/.bashrc; in our setup, /etc/profile sources ~/.bashrc - thus all
# settings made here will also take effect in a login shell.
#
# NOTE: It is recommended to make language settings in ~/.profile rather than
# here, since multilingual X sessions would not work properly if LANG is over-
# ridden in every subshell.

test -s ~/.alias && . ~/.alias || true
# --- Bash Config Equivalent of Your Zsh Config ---

# Prompt (with colors)
# In bash, you use \e[...m instead of $fg[...] etc.
PS1="\[\e[1;31m\][\[\e[1;36m\]\w\[\e[1;31m\]]\[\e[0m\] > "

# History
HISTSIZE=500000
HISTFILESIZE=500000
HISTFILE=~/.cache/bash/history
shopt -s histappend          # append to history, don’t overwrite
PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# Disable ctrl-s freeze
stty stop undef

# Source aliases and shortcuts if they exist
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/shortcutrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/shortcutrc"
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc"

# Auto-cd equivalent
shopt -s autocd

# Completion (bash built-in)
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# Vi mode
set -o vi
bind -m vi-insert '"\C-r": reverse-search-history'
bind -m vi-insert '"\C-o": "lfcd\n"'
bind '"\C-f": "ffc\n"'
bind -m vi-insert '"\C-e": "\C-x\C-e"'
bind '"\e[3~": delete-char'   # Delete key fix (like bindkey '^[[P')

# Use lf to switch directories (ctrl-o)
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp" >/dev/null
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}

# Save path on cd
cd() {
    builtin cd "$@" || return
    pwd > ~/.cache/last_dir
}

# Make Ctrl+L clear the screen
bind '"\C-l": clear-screen'

