# If not running interactively, don't do anything
if [ -n "$-" ] && ! echo "$-" | grep -q "i"; then
   return
fi
# ===================================================
# === Utils and some global environment variables ===
# ===================================================
export MYLOCAL="$HOME"/.vocal
mkdir -p "$MYLOCAL" &> /dev/null
_MYLOCK="$MYLOCAL"/.lock
mkdir -p "$_MYLOCK" &> /dev/null
MYBIN="$MYLOCAL"/bin

# The fcitx things must be put here, because it should be sourced when system booting.
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export SDL_IM_MODULE=fcitx
export GLFW_IM_MODULE=ibus

HOMEBREW_PREFIX="/home/linuxbrew/.linuxbrew"

# Get value from localhost.
[ -f ~/.bashrc.localhost.pre ] && . ~/.bashrc.localhost.pre
# MYCONDA
# MYTMUX


# =================================
# === Define addToPATH Function ===
# =================================
export PATH
addToPATH() {
    PATH="$1:$PATH"
    # case ":${PATH:=$1}:" in
    #     *:"$1":*)
    #         ;;
    #     *)
    #         PATH="$1:$PATH"
    #         ;;
    # esac
}
backToPATH() {
    PATH="${PATH}:${1}"
}
searchToPATH() {
    # find "$1" -maxdepth 1 -type d ! -name "*conda*" -exec sh -c 'if [ -d "$1/bin" ]; then echo "PATH=\"$1/bin:\$PATH\"" >> /tmp/paths.sh; fi' sh {} \;
    # [ -f /tmp/paths.sh ] && . /tmp/paths.sh && rm /tmp/paths.sh
    [ -z "$(ls "$1")" ] && return
    for item in "$1"/*; do
        if [ -d "$item"/bin ] && echo "$item" | grep -qv 'conda'; then
            PATH="${item}/bin:${PATH}"
        fi
    done
}


# ============
# === PATH ===
# ============

# ===
# === For homebrew apps.
# ===
if [ -d "$HOMEBREW_PREFIX" ]; then
    addToPATH "$HOMEBREW_PREFIX"/sbin
    addToPATH "$HOMEBREW_PREFIX"/bin
fi

# ===
# === For conda apps.
# ===
[ -n "$MYCONDA" ] && [ -d "$MYCONDA/bin" ] && addToPATH "$MYCONDA/bin"

# ===
# === No sequences, for system default.
# ===
addToPATH /sbin
addToPATH /usr/sbin
addToPATH "$HOME"/bin
addToPATH "$HOME"/.local/bin

# ===
# === No sequences, but put them last.
# ===
addToPATH "$MYBIN"/ANTs/install/bin
addToPATH "$HOME"/.local/kitty.app/bin
addToPATH "$HOME"/.cargo/bin
addToPATH "$HOME"/.fzf/bin

# ===
# === In sequences, last in first out.
# ===
if [ -d "$MYBIN" ]; then
    searchToPATH "$MYBIN"
    addToPATH "$MYBIN"
fi

searchToPATH "$MYLOCAL"
addToPATH "$MYLOCAL"

addToPATH "$MYLOCAL/_"


# ===========================
# === For Display Manager ===
# ===========================
if [ -n "$DISPLAY" ] && [ -z "$ZSH_VERSION" ] && [ -z "$BASH_VERSION" ]; then
    return
fi


# ===========================
# === For Manually Startx ===
# ===========================
if [ -z "${DISPLAY}" ] && [ -n "${XDG_VTNR}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
    # rm -rf ~/.Xauthority-*
    exec startx
fi
# No need: The $DISPLAY will be auto set after startx.
# For safety consideration, we still give it a default value.
[ -z "$DISPLAY" ] && export DISPLAY=:0


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
# addTo() {
#     [ -z "${!1}" ] && eval "$1='$2'"
#     case ":${!1}:" in
#       *":$2:"*) :;;  # What does the colon `:` mean?
#       *) eval "$1='$2:${!1}'";;
#     esac
# }


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
    __conda_setup="$("${myconda}/bin/conda" "shell.$(basename $SHELL)" 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "${myconda}/etc/profile.d/conda.sh" ]; then
            . "${myconda}/etc/profile.d/conda.sh"
        else
            addToPATH "${myconda}/bin"
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
    curl -sS https://mirror.ghproxy.com/https://raw.githubusercontent.com/starship/starship/master/install/install.sh | \
    sed 's/https\:\/\/github\.com/https\:\/\/mirror\.ghproxy\.com\/https\:\/\/github\.com/g' | \
    sed 's/BIN_DIR=\/usr\/local\/bin/BIN_DIR=$MYLOCAL/g' | sh
fi

# ===
# === Environment Variable
# ===
export EDITOR
EDITOR=$(command -v nvim &> /dev/null && echo nvim || echo vim)
export N_NODE_MIRROR=https://npm.taobao.org/mirrors/node
# export LD_LIBRARY_PATH=
# addTo LD_LIBRARY_PATH "${MYLOCAL}/lib"
# addTo LD_LIBRARY_PATH "${MYLOCAL}/lib64"
# addTo LD_LIBRARY_PATH "${MYBIN}/cuda/lib64"
# 1-May-2020: Fix for Keyring error with pip. Hopefully new pip will fix it
# soon https://github.com/pypa/pip/issues/7883
export PYTHON_KEYRING_BACKEND=keyring.backends.null.Keyring
export STARSHIP_LOG=error
export CONDA_CHANGEPS1=no
export FZF_DEFAULT_COMMAND='rg --files --hidden --no-ignore -g !.git'
export FZF_COMPLETION_TRIGGER='\'
export GO111MODULE=on
export GOPROXY=https://goproxy.cn
_go=$(which go)
export GOPATH
GOPATH="${_go%/*/*}"/gopath
# export TESSDATA_PREFIX=/usr/share/tesseract-ocr/5/tessdata
export TESSDATA_PREFIX="$MYLOCAL"/tessdata_best
export HOMEBREW_API_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles/api"
export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles"
export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git"
export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git"
export HOMEBREW_PIP_INDEX_URL="https://pypi.tuna.tsinghua.edu.cn/simple"
if [ -d "$HOMEBREW_PREFIX" ]; then  # To simulate the brew shellenv command.
    export HOMEBREW_PREFIX
    export HOMEBREW_CELLAR="${HOMEBREW_PREFIX}/Cellar"
    export HOMEBREW_REPOSITORY="${HOMEBREW_PREFIX}/Homebrew"
    export MANPATH="${HOMEBREW_PREFIX}/share/man${MANPATH+:$MANPATH}:"
    export INFOPATH="${HOMEBREW_PREFIX}/share/info:${INFOPATH:-}"
fi

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
P() {
    http_proxy=127.0.0.1:7890 https_proxy=127.0.0.1:7890 "$@"
}

# ===
# === Aliases
# ===
alias :q='exit'
alias :qa='exit'
# https://github.com/ranger/ranger/wiki/Integration-with-other-programs#changing-directories
ranger='source ranger ranger'
alias ranger="$ranger"
alias ra="$ranger"
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
    curl cht.sh/"$1"
}
jo() {
	ID="$$"
	mkdir -p /tmp/"$USER"
	OUTPUT_FILE="/tmp/${USER}/joshuto-cwd-${ID}"
	env joshuto --output-file "$OUTPUT_FILE" "$@"
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
alias xterm='xterm -ti vt340'
# alias clash="clash -d ~/.config/clash/ -f ~/.config/clash/glados.yaml"
alias bfg="java -jar ${MYLOCAL}/bfg.jar"
alias fit='git --git-dir ~/.dotfiles.git --work-tree ~'
alias fat='lazygit --git-dir ~/.dotfiles.git --work-tree ~'


# ===
# === Outside sources
# ===
[ -f "$MYLOCAL"/starship ] && eval "$(starship init $(basename "$SHELL"))"
fzf_files_array=($(find ~/.fzf/shell -maxdepth 1 -name "*.$(basename $SHELL)" 2> /dev/null))
for f in "${fzf_files_array[@]}"; do
   . "$f"
done


# ===============
# === For zsh ===
# ===============
if [ -n "$ZSH_VERSION" ]; then
    [ -f ~/.bashrc.zsh ] && . ~/.bashrc.zsh
fi


# =================
# === Post Loads ===
# =================
[ -f ~/.bashrc.localhost.post ] && . ~/.bashrc.localhost.post


# ========================
# === Unique Varaibles ===
# ========================
uniqTo() {
    content=$(eval "echo \$$1")
    eval "$1=$(echo -n $content | tr ":" "\n" | awk '!x[$0]++' | tr "\n" ":")"
}

uniqTo PATH
