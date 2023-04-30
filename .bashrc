# If not running interactively, don't do anything
[[ $- != *i* ]] && return

_MYLOCAL=$HOME/.Local
mkdir -p $_MYLOCAL &> /dev/null
export MYBIN=$_MYLOCAL/bin
mkdir -p $MYBIN &> /dev/null

if [[ -z "$TMUX" ]]; then
    if [[ -e $MYBIN/tmux ]]; then
        _MYTMUX=$MYBIN/tmux
    elif command -v tmux &> /dev/null; then
        _MYTMUX=tmux
    fi
    if [[ ! -z $_MYTMUX ]]; then
        exec $_MYTMUX new-session -A -s main
    fi
fi

if command -v curl &> /dev/null && [[ ! -e $MYBIN/starship ]]; then
    curl -sS https://ghproxy.com/https://raw.githubusercontent.com/starship/starship/master/install/install.sh | \
    sed 's/https\:\/\/github\.com/https\:\/\/ghproxy\.com\/https\:\/\/github\.com/g' | \
    sed 's/BIN_DIR=\/usr\/local\/bin/BIN_DIR=$MYBIN/g' | sh
fi

# Ref:
# - https://blog.csdn.net/whatday/article/details/105466009
# - https://unix.stackexchange.com/a/282433
function addTo () {
    [[ -z "${!1}" ]] && eval "$1='$2'"
    case ":${!1}:" in
      *":$2:"*) :;;
      *) eval "$1='$2:${!1}'";;
    esac
}

_MYCONDA=$([[ -e $MYBIN/anaconda3 ]] && echo $MYBIN/anaconda3 || echo $MYBIN/miniconda3)
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$($_MYCONDA'/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$_MYCONDA/etc/profile.d/conda.sh" ]; then
        . "$_MYCONDA/etc/profile.d/conda.sh"
    else
        addTo PATH $_MYCONDA/bin
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

addTo PATH $MYBIN
addTo PATH $MYBIN/cuda/bin
addTo PATH $MYBIN/my

export EDITOR=$(command -v nvim &> /dev/null && echo nvim || echo vim)
export N_NODE_MIRROR=https://npm.taobao.org/mirrors/node
export LD_LIBRARY_PATH=
addTo LD_LIBRARY_PATH $_MYLOCAL/lib
addTo LD_LIBRARY_PATH $_MYLOCAL/lib64
addTo LD_LIBRARY_PATH $MYBIN/cuda/lib64
# 1-May-2020: Fix for Keyring error with pip. Hopefully new pip will fix it
# soon https://github.com/pypa/pip/issues/7883
export PYTHON_KEYRING_BACKEND=keyring.backends.null.Keyring
export DISPLAY=:0
export STARSHIP_LOG=error

# Ref: https://github.com/gokcehan/lf/blob/master/etc/lfcd.sh
function lfcd () {
    tmp="$(mktemp)"
    # `command` is needed in case `lfcd` is aliased to `lf`
    command lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        if [ -d "$dir" ]; then
            if [ "$dir" != "$(pwd)" ]; then
                cd "$dir"
            fi
        fi
    fi
}

alias :q='exit'
# https://github.com/ranger/ranger/wiki/Integration-with-other-programs#changing-directories
ranger='source ranger ranger'
alias ranger=$ranger
alias ra=$ranger
alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias py='python3'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias pip='python3 -m pip'
alias ipy='ipython'
alias lf='lfcd'
alias ld='lazydocker'
alias lg='lazygit'

[[ -f $MYBIN/starship ]] && eval "$(starship init bash)"
[[ -f ~/.fzf.bash ]] && source ~/.fzf.bash
[[ -f ~/.bashrc.localhost ]] && source ~/.bashrc.localhost
