# If not running interactively, don't do anything
[[ $- != *i* ]] && return

function addToPATH {
  case ":$PATH:" in
    *":$1:"*) :;; # already there
    *) PATH="$1:$PATH";; # or PATH="$PATH:$1"
  esac
}

export MYBIN=~/.bin
mkdir $MYBIN &> /dev/null
addToPATH $MYBIN

if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
    exec tmux new-session -A -s main
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
        addToPATH $MYBIN/anaconda3/bin
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

if command -v curl &> /dev/null && [[ ! -e $MYBIN/starship ]]; then
    curl -sS https://ghproxy.com/https://raw.githubusercontent.com/starship/starship/master/install/install.sh |
    sed 's/https\:\/\/github\.com/https\:\/\/ghproxy\.com\/https\:\/\/github\.com/g' |
    sed 's/BIN_DIR=\/usr\/local\/bin/BIN_DIR=$MYBIN/g' | sh
fi

if command -v nvim &> /dev/null; then
    export EDITOR=nvim
else
    export EDITOR=vim
fi
export N_NODE_MIRROR=https://npm.taobao.org/mirrors/node
export LD_LIBRARY_PATH="$MYBIN/cuda/lib64"
# 1-May-2020: Fix for Keyring error with pip. Hopefully new pip will fix it
# soon https://github.com/pypa/pip/issues/7883
export PYTHON_KEYRING_BACKEND=keyring.backends.null.Keyring
export DISPLAY=:0

addToPATH $MYBIN/cuda/bin

alias :q='exit'
# https://github.com/ranger/ranger/wiki/Integration-with-other-programs#changing-directories
ranger='source ranger ranger'
alias ranger=$ranger
alias ra=$ranger
alias lg='lazygit'
alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias py='python'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias pip='python3 -m pip'
alias ld='lazydocker'

if [[ -e $MYBIN/starship ]]; then
    eval "$(starship init bash)"
fi
