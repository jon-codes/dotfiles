# ~/.bashrc: executed by bash for non-login shells.
# ==============================================================================

# shellcheck shell=bash

# short-circuit if non-interactive shell
case "$-" in *i*) ;; *) return;; esac

# ignore errors when attempting to set unsupported options
safe_shopt() {
    shopt -s "$1" 2>/dev/null || true
}

# general options
# ------------------------------------------------------------------------------

safe_shopt autocd               # directories as commands are executed as if arguments to `cd`
safe_shopt cdable_vars          # `cd` can use variable values as the directory argument
safe_shopt cdspell              # correct small errors in `cd` directory components
safe_shopt dirspell             # correct small errors in directory completion
safe_shopt interactive_comments # allow `#` comments in the interactive shell
safe_shopt checkwinsize         # update the window size after each command

# history
# ------------------------------------------------------------------------------

HISTSIZE=100000                  # set a large session history size
HISTFILESIZE=$HISTSIZE           # set a large history file size
HISTCONTROL=ignoreboth:erasedups # ignoreboth: don't add commands starting with whitespace or sequential duplicates to history
                                 # erasedups:   erase non-sequential duplicates from history

safe_shopt histappend # append to the history file, rather than overwriting it
safe_shopt cmdhist    # save multi-line commands as a single history entry

# prompt
# ------------------------------------------------------------------------------

set_prompt() {
    local color_prompt

    # set a fancy prompt (non-color, unless we know we "want" color)
    case "$TERM" in xterm-color|*-256color) color_prompt='yes';; esac

    if command -v tput &>/dev/null && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt='yes'
    else
        color_prompt=
    fi

    if [ "$color_prompt" = 'yes' ]; then
        local bold; bold=$(tput bold)
        local red; red=$(tput setaf 1)
        # local green; green=$(tput setaf 2)
        # local yellow; yellow=$(tput setaf 3)
        local blue; blue=$(tput setaf 4)
        # local magenta; magenta=$(tput setaf 5)
        local gray; gray=$(tput setaf 8)
        local reset; reset=$(tput sgr0)

        local exit_prompt="\[$gray\]\$(code=\${?##0};echo \${code:+\"[\[$red\]\$code\[$gray\]] \"})\[$reset\]"
        PS1="\[$gray\]\t\[$reset\] \[$bold$blue\]\w\[$reset\] $exit_prompt\$ "
    else
        local exit_prompt="\$(code=\${?##0};echo \${code:+\"[\$code] \"})"
        PS1="\t \w $exit_prompt\$ "
    fi

    PROMPT_DIRTRIM=2 # trim the directory component to 2 elements

    # if this is an xterm set the title to user@host:dir
    case "$TERM" in xterm*|rxvt*) PS1="\[\e]0;\u@\h: \w\a\]$PS1";; esac
}

set_prompt

# aliases
# ------------------------------------------------------------------------------

if [ -f ~/.bash_aliases ]; then . ~/.bash_aliases; fi

# completions
# ------------------------------------------------------------------------------

# enable programmable completion features
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -r /usr/local/etc/profile.d/bash_completion.sh ]; then
        . /usr/local/etc/profile.d/bash_completion.sh
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi
