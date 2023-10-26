# If not running interactively, don't do anything
[[ $- != *i* ]] && return
# =============
# === Utils ===
# =============
MYLOCAL="${HOME}/.vocal"
mkdir -p "$MYLOCAL" &> /dev/null
_MYLOCK="${MYLOCAL}/.lock"
mkdir -p "$_MYLOCK" &> /dev/null
MYBIN="${MYLOCAL}/bin"


# ======================================
# === Pre Load And Set Default Value ===
# ======================================
[[ -f ~/.bashrc.localhost.pre ]] && . ~/.bashrc.localhost.pre

if [[ -z "${MYCONDA}" ]]; then
    MYCONDA=$([[ -e "${MYLOCAL}/anaconda3" ]] && echo "${MYLOCAL}/anaconda3" || echo "${MYLOCAL}/miniconda3")
fi


# =================================
# === Define addToPATH Function ===
# =================================
addToPATH() {
    case ":${PATH:=$1}:" in
        *:"$1":*)
            ;;
        *)
            PATH="$1:$PATH"
            ;;
    esac
}


# ============
# === PATH ===
# ============

# ===
# === No sequences, for system default.
# ===
addToPATH $HOME/bin
addToPATH $HOME/.local/bin

# ===
# === No sequences, but put them last.
# ===
addToPATH "$MYBIN"/ANTs/install/bin
addToPATH $HOME/.local/kitty.app/bin
addToPATH $HOME/.cargo/bin


# ===
# === In sequences, last in first out.
# ===

# {{{ Will be removed in the future
for folder in "$MYBIN"/*/; do
    if [ -d "${folder}bin" ]; then
        addToPATH "${folder}bin"
    fi
done
addToPATH "$MYBIN"
# }}}

for folder in "$MYLOCAL"/*/; do
    if [ -d "${folder}bin" ]; then
        addToPATH "${folder}bin"
    fi
done
addToPATH "$MYLOCAL"
addToPATH "$MYLOCAL/_"


# ===========================
# === For Desktop Manager ===
# ===========================
if [ -n "$DISPLAY" ] && [ -z "$BASH_VERSION" ]; then
    return
fi


# ===========================
# === For Manually Startx ===
# ===========================
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
    # rm -rf ~/.Xauthority-*
    exec startx
fi
# # No need: The $DISPLAY will be auto set after startx.
# # For safety consideration, we still give it a default value.
[ -z "$DISPLAY" ] && export DISPLAY=:0


# =========================
# === Boot Tmux If Need ===
# =========================
if [[ -z "$TMUX" ]]; then
    if [[ -e "${MYLOCAL}/tmux/bin/tmux" ]]; then
        _MYTMUX="${MYLOCAL}/tmux/bin/tmux"
    elif [[ -e "${MYCONDA}"/bin/tmux ]]; then
        _MYTMUX="${MYCONDA}"/bin/tmux
    elif command -v tmux &> /dev/null; then
        _MYTMUX=tmux
    fi
    if [[ ! -z $_MYTMUX ]]; then
        [[ -f $_MYLOCK/tmux ]] && exec "$_MYTMUX" new-session -A -s main
    fi
fi


# =============================
# === Define addTo Function ===
# =============================
# Ref:
# - https://blog.csdn.net/whatday/article/details/105466009
# - https://unix.stackexchange.com/a/282433
addTo() {
    [ -z "${!1}" ] && eval "$1='$2'"
    case ":${!1}:" in
      *":$2:"*) :;;  # What does the colon `:` mean?
      *) eval "$1='$2:${!1}'";;
    esac
}


# ==========================
# === Boot Conda If Need ===
# ==========================
function onconda (){
    if [[ -f $_MYLOCK/conda ]] && [[ -e $1 ]]; then
        # >>> conda initialize >>>
        # !! Contents within this block are managed by 'conda init' !!
        __conda_setup="$($1'/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
        if [ $? -eq 0 ]; then
            eval "$__conda_setup"
        else
            if [ -f "$1/etc/profile.d/conda.sh" ]; then
                . "$1/etc/profile.d/conda.sh"
            else
                addTo PATH $1/bin
            fi
        fi
        unset __conda_setup
        # <<< conda initialize <<<
    fi
}
onconda "$MYCONDA"


# ==============
# === Others ===
# ==============

# ===
# === Beautify
# ===
if command -v curl &> /dev/null && [[ ! -e $MYBIN/starship ]]; then
    curl -sS https://ghproxy.com/https://raw.githubusercontent.com/starship/starship/master/install/install.sh | \
    sed 's/https\:\/\/github\.com/https\:\/\/ghproxy\.com\/https\:\/\/github\.com/g' | \
    sed 's/BIN_DIR=\/usr\/local\/bin/BIN_DIR=$MYBIN/g' | sh
fi

# ===
# === Environment Variable
# ===
export EDITOR
EDITOR=$(command -v nvim &> /dev/null && echo nvim || echo vim)
export N_NODE_MIRROR=https://npm.taobao.org/mirrors/node
export LD_LIBRARY_PATH=
addTo LD_LIBRARY_PATH "${MYLOCAL}/lib"
addTo LD_LIBRARY_PATH "${MYLOCAL}/lib64"
addTo LD_LIBRARY_PATH "${MYBIN}/cuda/lib64"
# 1-May-2020: Fix for Keyring error with pip. Hopefully new pip will fix it
# soon https://github.com/pypa/pip/issues/7883
export PYTHON_KEYRING_BACKEND=keyring.backends.null.Keyring
export STARSHIP_LOG=error

# ===
# === Functions
# ===
function lfcd () {
# Ref: https://github.com/gokcehan/lf/blob/master/etc/lfcd.sh
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
function _to () {
    [[ ! -e $1 ]] && touch $1 || rm $1; . ~/.bashrc
}
function totmux () {
    _to $_MYLOCK/tmux
}
function toconda () {
    _to $_MYLOCK/conda
}

# ===
# === Alias
# ===
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
function cht () {
    curl cht.sh/"${1}"
}
function jo() {
	ID="$$"
	mkdir -p /tmp/$USER
	OUTPUT_FILE="/tmp/$USER/joshuto-cwd-$ID"
	env joshuto --output-file "$OUTPUT_FILE" $@
	exit_code=$?

	case "$exit_code" in
		# regular exit
		0)
			;;
		# output contains current directory
		101)
			JOSHUTO_CWD=$(cat "$OUTPUT_FILE")
			cd "$JOSHUTO_CWD"
			;;
		# output selected files
		102)
			;;
		*)
			echo "Exit code: $exit_code"
			;;
	esac
}
# https://github.com/TheZoraiz/ascii-image-converter
alias ass='ascii-image-converter --color --braille --dither --complex'
alias xterm='xterm -ti vt340'


# ===
# === Outside source
# ===
[ -f $MYBIN/starship ] && eval "$(starship init bash)"
[ -f ~/.fzf.bash ] && . ~/.fzf.bash


# =================
# === Post Load ===
# =================
[ -f ~/.bashrc.localhost.post ] && . ~/.bashrc.localhost.post

echo 'post' >> ~/temp"$XDG_VTNR"
