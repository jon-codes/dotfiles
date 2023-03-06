# ~/.bash_profile: executed by bash for login shells
# ==============================================================================

# shellcheck shell=bash

# load shell-agnostic profile
# ------------------------------------------------------------------------------
if [ -r ~/.profile ]; then . ~/.profile; fi

# if interactive, load .bashrc if it exists
# ------------------------------------------------------------------------------
case "$-" in *i*) if [ -r ~/.bashrc ]; then . ~/.bashrc; fi;; esac
