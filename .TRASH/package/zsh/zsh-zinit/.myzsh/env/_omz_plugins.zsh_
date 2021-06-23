# ===
# === OMZ: Plugin List
# ===
# 1. git: 这是需要git下载的包
# 注意重名问题。有可能第三方包名与omz内置的包名相同。此时会发生意想不到的后果。
# 比如：第三方包并没有下载，而是直接使用的内置的包。（举例：tmux与zpm-zsh/tmux）
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

