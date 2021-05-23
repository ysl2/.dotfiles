# =====================
# === self settings ===
# =====================
export MYZSH="${HOME}"/.myzsh
# export MYLOCK="${MYZSH}"/.lock
# export MYSCRIPT="${MYZSH}"/script



# =================
# === OH-MY-ZSH ===
# =================


# ===
# === OMZ
# ===
export ZSH="${HOME}/.oh-my-zsh"
export ZSH_CUSTOM="${ZSH}/custom"


# ===
# === OMZ: Theme
# ===
# 设置自己想要的主题。如果想直接使用默认的，这一项可以空着
# 注意$ZSH_THEME和$MY_THEME是不一样的！！！
# 如果有p10k，那么默认就是p10k。但是注意：p10k不能显示conda的base
export MY_THEME="ys"


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

export EDITOR=nvim
# Go语言开启go module
export GO111MODULE=on
# Go语言切换国内软件源
export GOPROXY=https://mirrors.aliyun.com/goproxy/
# rust加入环境变量，参考: https://www.cnblogs.com/ilovewindy/p/13625948.html
export CARGO_HTTP_MULTIPLEXING=false

# ===
# === OMZ: Plugin List
# ===
# 注意：如果更改了包，必须按L解锁，然后再按S刷新配置。否则会因为锁文件的存在而无法同步包。

# 0. pip: 这是通过pip下载的包
export pip_outer=(
    ipython \
)

# 1. yay: 这是外部的包，但是属于间接依赖。这一部分不会被添加到omz插件中。
export yay_outer=(
    starship \
        powerpill \
        alacritty-ligatures-git \
        nerd-fonts-fira-code \
        fd \
        cht.sh \
        ranger \
        tig \
        lazygit \
        lazydocker \
        python \
        bat \
        ncdu \
        exa \
        ripgrep \
        peco \
        htop \
        git-delta-git \
        bottom \
        mtr \
        pydf \
        lftp \
        zoxide \
    )

# 2. yay: 这是外部的包，并且这部分会被加到omz中。
export yay_packages=(
    git \
        fzf \
        autojump \
        tmux \
    )

# 3. git: 这是需要git下载的包
export git_packages=(
    zsh-users/zsh-autosuggestions \
        zsh-users/zsh-syntax-highlighting \
        zsh-users/zsh-completions \
        zdharma/history-search-multi-word \
    )

# 4. omz: 启用omz自带的插件，包括$yay_packages和$git_packages。注意$git_packages并没有在这里加入，而是在下面加入了。
export plugins=(
    vi-mode \
        extract \
        colored-man-pages \
        $yay_packages
    )

