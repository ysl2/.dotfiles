# ============
# === PATH ===
# ============

# export PATH=$PATH:~/.cargo/bin
# export PATH=$PATH:/usr/local/go/bin
# export PATH=$PATH:~/go/bin


# # =============
# # === Color ===
# # =============
# if [ $TERM = 'alacritty' ]
# then
#   export TERM=xterm-256color
# fi

export LD_LIBRARY_PATH
addTo LD_LIBRARY_PATH $MYLOCAL/lib
addTo LD_LIBRARY_PATH $MYLOCAL/lib64
addTo LD_LIBRARY_PATH $MYBIN/cuda/lib64


# =====================
# === self settings ===
# =====================


# ===
# === Path
# ===
export EDITOR=nvim
export BROWSER=google-chrome-stable
# export THEME=spaceship


# ===
# === fzf
# ===
# export FZF_DEFAULT_COMMAND='fd --hidden'


# ===
# === pfetch
# ===
export PF_INFO="ascii title os host kernel uptime pkgs shell editor wm de memory palette"

export PF_ASCII="linux"


# ===
# === Weather
# ===
export MYLOCATION=WeiHai


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
export RUSTUP_DIST_SERVER="https://rsproxy.cn"
export RUSTUP_UPDATE_ROOT="https://rsproxy.cn/rustup"

# ===
# === perl
# ===
export PERL5LIB='/usr/lib/perl5'


# ===
# === n for Node.js
# ===
export N_NODE_MIRROR=https://npm.taobao.org/mirrors/node
