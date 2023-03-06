# ~/.bash_aliases: shell aliases sourced by `~/.bashrc`
# ==============================================================================

# shellcheck shell=bash

if [[ "$OSTYPE" == 'linux-gnu' ]]; then
    alias ls='ls -av --color=auto --group-directories-first'
else
    alias ls='ls -av --color=auto'
fi

alias diff='diff --color=auto'
alias grep='grep --color=auto'

if command -v 'nvim' &> /dev/null; then
    alias vim='nvim'
fi
