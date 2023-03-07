# ~/.bash_aliases: shell aliases sourced by `~/.bashrc`
# ==============================================================================

# shellcheck shell=bash

# use gnu coreutils for macos
# ------------------------------------------------------------------------------

case "$OSTYPE" in
    darwin*)
        if command -v gls &>/dev/null; then
            alias ls='gls'
        fi
    ;;
esac

# common aliases
# ------------------------------------------------------------------------------

alias ls='ls --color=auto'
alias la='ls -aF'
alias ll='la -l'

alias diff='diff --color=auto'
alias grep='grep --color=auto'

# use nvim if available
if command -v 'nvim' &> /dev/null; then
    alias vim='nvim'
fi
