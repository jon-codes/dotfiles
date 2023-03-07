# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash, if ~/.bash_profile or ~/.bash_login exists.
# ==============================================================================

# shellcheck shell=sh

# default programs
# ------------------------------------------------------------------------------
export EDITOR='vi -e'
export VISUAL='vim'
export PAGER='less'
export BROWSER='firefox'

# xdg home dirs
# ------------------------------------------------------------------------------
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"

# include private bin dirs in path
# ------------------------------------------------------------------------------
[ -d "$HOME/bin" ] && PATH="$HOME/bin:$PATH"
[ -d "$HOME/.local/bin" ] && PATH="$HOME/.local/bin:$PATH"

# macos specific setup
# ------------------------------------------------------------------------------
case "$(uname -s)" in
    Darwin*)
        # setup homebrew
        if [ -d "/opt/homebrew" ]; then 
            export HOMEBREW_PREFIX="/opt/homebrew"
            export HOMEBREW_CELLAR="$HOMEBREW_PREFIX/Cellar"
            export HOMEBREW_REPOSITORY="$HOMEBREW_PREFIX"
            export PATH="$HOMEBREW_PREFIX/bin:$HOMEBREW_PREFIX/sbin${PATH+:$PATH}";
            export MANPATH="$HOMEBREW_PREFIX/share/man${MANPATH+:$MANPATH}:";
            export INFOPATH="$HOMEBREW_PREFIX/share/info:${INFOPATH:-}";
        fi

        # setup gpg
        GPG_TTY="$(tty)"
        export GPG_TTY
    ;;
esac
