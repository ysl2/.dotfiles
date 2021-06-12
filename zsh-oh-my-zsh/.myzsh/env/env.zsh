# ============
# === PATH ===
# ============
function addToPATH {
  case ":$PATH:" in
    *":$1:"*) :;; # already there
    *) PATH="$1:$PATH";; # or PATH="$PATH:$1"
  esac
}
addToPATH ~/.cargo/bin
addToPATH /usr/local/go/bin
addToPATH ~/go/bin



# =====================
# === self settings ===
# =====================
export EDITOR=nvim
export DOTFILES_MAIN="${HOME}"/.dotfiles-main
export DOTFILES="${HOME}"/.dotfiles




# =========================
# === language specific ===
# =========================


# ===
# === go
# ===
# Go语言开启go module
export GO111MODULE=on
# Go语言切换国内软件源
export GOPROXY=https://mirrors.aliyun.com/goproxy/


# ===
# === rust
# ===
# rust加入环境变量，参考: https://www.cnblogs.com/ilovewindy/p/13625948.html
export CARGO_HTTP_MULTIPLEXING=false



# =================
# === OH-MY-ZSH ===
# =================


# ===
# === OMZ
# ===
export ZSH="${HOME}/.oh-my-zsh"
export ZSH_CUSTOM="${ZSH}/custom"
# 设置自己想要的主题。 如果有p10k，那么默认就是p10k。但是注意：p10k不能显示conda的base
export ZSH_THEME="ys"


# ===
# === OMZ: Plugin List
# ===
# 1. git: 这是需要git下载的包
git_packages=(
  zpm-zsh/colors \
    zpm-zsh/autoenv \
    zsh-users/zsh-autosuggestions \
    zsh-users/zsh-syntax-highlighting \
    zsh-users/zsh-completions \
    zdharma/history-search-multi-word \
    kutsan/zsh-system-clipboard
  )

# 2. omz: 启用omz自带的插件
omz_plugins=(
  vi-mode \
    extract \
    colored-man-pages \
    git \
    fzf \
    autojump \
    tmux
  )


# ===
# === OMZ: Plugin Specific
# ===
# OMZ: 设置复制粘帖的时候取消幻灯片效果
export DISABLE_MAGIC_FUNCTIONS=true
# OMZ: tmux
export ZSH_TMUX_AUTOSTART=true
export ZSH_TMUX_AUTOSTART_ONCE=true
export ZSH_TMUX_AUTOCONNECT=true
export ZSH_TMUX_AUTOQUIT=true
# OMZ: vi-mode
export VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true
export VI_MODE_SET_CURSOR=true
export MODE_INDICATOR="%F{yellow}+%f"
# OMZ: fzf
export FZF_DEFAULT_COMMAND='fd -uu'
export DISABLE_FZF_KEY_BINDINGS=true
