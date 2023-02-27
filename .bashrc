# If not running interactively, don't do anything
[[ $- != *i* ]] && return

function addToPATH {
  case ":$PATH:" in
    *":$1:"*) :;; # already there
    *) PATH="$1:$PATH";; # or PATH="$PATH:$1"
  esac
}

MYBIN=~/.local/bin
addToPATH $MYBIN

if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  TERM=xterm-256color exec tmux new-session -A -s main
fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$($MYBIN'/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$MYBIN/anaconda3/etc/profile.d/conda.sh" ]; then
        . "$MYBIN/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="$MYBIN/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export EDITOR=nvim
export N_NODE_MIRROR=https://npm.taobao.org/mirrors/node
export N_PREFIX=$MYBIN/nodejs
export LD_LIBRARY_PATH="$MYBIN/cuda-10.1/lib64"
# 1-May-2020: Fix for Keyring error with pip. Hopefully new pip will fix it
# soon https://github.com/pypa/pip/issues/7883
export PYTHON_KEYRING_BACKEND=keyring.backends.null.Keyring

export PATH="$N_PREFIX/bin:$PATH"
export PATH="$MYBIN/cuda-10.1/bin:$PATH"

alias :q='exit'
# https://github.com/ranger/ranger/wiki/Integration-with-other-programs#changing-directories
alias ranger='source ranger ranger'
