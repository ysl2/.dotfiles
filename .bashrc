# If not running interactively, don't do anything
[[ $- != *i* ]] && return
# =============
# === Utils ===
# =============
export MYLOCAL="${HOME}/.vocal"
mkdir -p "$MYLOCAL" &> /dev/null
_MYLOCK="${MYLOCAL}/.lock"
mkdir -p "$_MYLOCK" &> /dev/null
MYBIN="${MYLOCAL}/bin"


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


# ======================================
# === Pre Load And Set Default Value ===
# ======================================
[ -f ~/.bashrc.localhost.pre ] && . ~/.bashrc.localhost.pre
# MYCONDA
# MYTMUX


# =========================
# === Boot Tmux If Need ===
# =========================
ontmux() {
    # Define local variables.
    local mytmux="$1"
    local LOCK="${_MYLOCK}/tmux"

    # Toggle on/off.
    if [ ! -e "$LOCK" ]; then
        return
    fi
    # Clear log.
    echo '' > "$LOCK"

    # Check if the value is legal.
    if [ ! -e "$mytmux" ] || [ ! -f "$mytmux" ] || [ ! -x "$mytmux" ]; then
        if command -v tmux &> /dev/null; then
            mytmux=tmux
            echo 'Fallback to default tmux in $PATH.' >> "$LOCK"
        else
            echo 'No tmux available.' >> "$LOCK"
            return
        fi
    fi
    echo "Current tmux value: ${mytmux}" >> "$LOCK"
    [ -z "$TMUX" ] && exec "$mytmux" new-session -A -s main
}
ontmux "$MYTMUX"


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
onconda() {
    # Define local variables.
    local myconda="$1"
    local LOCK="${_MYLOCK}/conda"

    # Toggle on/off.
    if [ ! -e "$LOCK" ]; then
        return
    fi
    # Clear log.
    echo '' > "$LOCK"

    # Check if the value is legal.
    if [ ! -e "$myconda" ] || [ ! -d "$myconda" ]; then
        if [ -e "${MYLOCAL}/anaconda3" ]; then
            myconda="${MYLOCAL}/anaconda3"
            echo 'Fallback to default anaconda3.' >> "$LOCK"
        elif [ -e "${MYLOCAL}/miniconda3" ]; then
            myconda="${MYLOCAL}/miniconda3"
            echo 'Fallback to default miniconda3.' >> "$LOCK"
        else
            echo 'No conda available.' >> "$LOCK"
            return
        fi
    fi
    echo "Current conda value: ${myconda}" >> "$LOCK"
    # >>> conda initialize >>>
    # !! Contents within this block are managed by 'conda init' !!
    __conda_setup="$("${myconda}/bin/conda" 'shell.bash' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "${myconda}/etc/profile.d/conda.sh" ]; then
            . "${myconda}/etc/profile.d/conda.sh"
        else
            addTo PATH "${myconda}/bin"
        fi
    fi
    unset __conda_setup
    # <<< conda initialize <<<
}
onconda "$MYCONDA"


# ==============
# === Others ===
# ==============

# ===
# === Beautify
# ===
if command -v curl &> /dev/null && [ ! -e "${MYLOCAL}/starship" ]; then
    curl -sS https://ghproxy.com/https://raw.githubusercontent.com/starship/starship/master/install/install.sh | \
    sed 's/https\:\/\/github\.com/https\:\/\/ghproxy\.com\/https\:\/\/github\.com/g' | \
    sed 's/BIN_DIR=\/usr\/local\/bin/BIN_DIR=$MYLOCAL/g' | sh
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
lfcd() {
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
_to() {
    if [ ! -e "$1" ]; then
        touch "$1"
    else
        rm "$1";
    fi
    . ~/.bashrc
}
totmux() {
    _to "${_MYLOCK}/tmux"
}
toconda() {
    _to "${_MYLOCK}/conda"
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
alias lD='lazydocker'
alias lg='lazygit'
cht() {
    curl cht.sh/"${1}"
}
jo() {
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
alias ge="google-chrome --proxy-server=localhost:7890 --simulate-outdated-no-au='Tue, 31 Dec 2099 23:59:59 GMT'"
alias gE="google-chrome --simulate-outdated-no-au='Tue, 31 Dec 2099 23:59:59 GMT'"
# alias clash="clash -d ~/.config/clash/ -f ~/.config/clash/glados.yaml"


# ===
# === Outside source
# ===
[ -f "${MYLOCAL}/starship" ] && eval "$(starship init bash)"
[ -f ~/.fzf.bash ] && . ~/.fzf.bash


# =================
# === Post Load ===
# =================
[ -f ~/.bashrc.localhost.post ] && . ~/.bashrc.localhost.post
