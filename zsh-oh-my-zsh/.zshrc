# set the affix .zsh files can be sourced
unsetopt nomatch

tmux_init () {
    if [[ ! -d ~/.tmux || ! -f ~/.tmux/.tmux.lock || ! -h ~/.tmux.conf ]]; then
        cd
        # Add tmux framework
        if [[ ! -d ~/.tmux ]]; then
            git clone https://hub.fastgit.org/gpakosz/.tmux.git ~/.tmux
            # git clone https://hub.fastgit.org/Johnny4Fun/.tmux.git ~/.tmux
        fi
        touch ~/.tmux/.tmux.lock
        if [[ $(yay -Qeq | grep stow) == 1 ]]; then
            yay -S stow
        fi
        ln -s -f .tmux/.tmux.conf ~/.tmux.conf
        cd ~/.dotfiles/
        stow -R tmux
        tmux source-file ~/.tmux.conf
    fi
}

# init tmux
if [[ ! -f ~/.tmux/.tmux.lock ]]; then
    tmux_init
fi

#---------------------------------------------------------------------------------



# ===
# === FQ
# ===
# 设置翻墙用的
# export http_proxy="socks5://127.0.0.1:7891"
# export https_proxy="socks5://127.0.0.1:7891"

# 启动代理
onproxy () {
    export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7891
    echo "HTTP Proxy on"
}

# 关闭代理
noproxy () {
    unset http_proxy
    unset https_proxy
    unset all_proxy
    echo "HTTP Proxy off"
}

# 如果终端输入onconda，则启用anaconda。否则则不启用。
# 如果启用CONDA，zsh启动将会非常慢。如果不是必须要用，建议别开CONDA
onconda () {
    if [[ ! -e ~/.conda.flag ]]; then
        touch ~/.conda.flag
    fi
    source ~/.zshrc
    echo "Anaconda on"
}

noconda () {
    if [[ -e ~/.conda.flag ]]; then
        rm ~/.conda.flag
    fi
    source ~/.zshrc
    echo "Anaconda off"
}

#---------------------------------------------------------------------------------



# ===
# === Set Temp Variables
# ===
# 这部分变量只在此文件中使用，因此不会加export关键字。

# 设置自己想要的主题。如果想直接使用默认的，这一项可以空着
# 注意$ZSH_THEME和$MY_THEME是不一样的！！！
# 如果有p10k，那么默认就是p10k。但是注意：p10k不能显示conda的base
MY_THEME="ys"

#---------------------------------------------------------------------------------



# ===
# === P10k Auto Config
# ===
# p10k自动配置的内容

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -n "$MY_THEME" && -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#---------------------------------------------------------------------------------



# ===
# === Check Oh-My-Zsh
# ===

# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"
export ZSH_CUSTOM="${ZSH}/custom"

# 如果没有oh-my-zsh，就先下载
if [[ ! -e ~/.oh-my-zsh ]]; then
    # 把github.com做一下处理，换成国内地址
    result=$(curl -fsSL https://ghproxy.com/https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | sed 's/github\.com/gitclone\.com\/github\.com/')
    # 执行变量中的命令，用eval
    eval "${result}" --keep-zshrc
fi

# 如果没下载主题，就下载主题
if [[ ! -e ${HOME}/.oh-my-zsh/custom/themes/powerlevel10k ]]; then
    git clone --depth=1 https://gitclone.com/github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
fi

# 设置主题。如果上面定义了MY_THEME就用上面的。否则就用默认的
if [[ -e ${HOME}/.oh-my-zsh/custom/themes/powerlevel10k ]]; then
    ZSH_THEME=${MY_THEME:-"powerlevel10k/powerlevel10k"}
else
    ZSH_THEME=${MY_THEME:-"robbyrussell"}
fi

#---------------------------------------------------------------------------------



# ===
# === Install Oh-My-Zsh Plugins
# ===

# 注意：如果更改了包，必须按L解锁，然后再按S刷新配置。否则会因为锁文件的存在而无法同步包。

# 0. pip: 这是通过pip下载的包
pip_outer=(
    ipython \
)

# 1. yay: 这是外部的包，但是属于间接依赖。这一部分不会被添加到omz插件中。
yay_outer=(
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
yay_packages=(
    git \
        fzf \
        autojump \
        tmux \
    )

# 3. git: 这是需要git下载的包
git_packages=(
    zsh-users/zsh-autosuggestions \
        zsh-users/zsh-syntax-highlighting \
        zsh-users/zsh-completions \
        zdharma/history-search-multi-word \
    )

# 4. omz: 启用omz自带的插件，包括$yay_packages和$git_packages。注意$git_packages并没有在这里加入，而是在下面加入了。
plugins=(
    vi-mode \
        extract \
        colored-man-pages \
        $yay_packages
    )

# 下载上面提到的所有包（omz的包除外。omz的包本身就有，直接调用即可）
# 通过~/.zsh.lock文件来锁住更新。如果更改了yay列表或者git列表，就删掉此文件，就会重新自动yay获取更新和git拉取仓库了
# 快捷键L解锁
if [[ ! -e ~/.zsh.lock ]]; then
    # 先pip下载包
    pip install $pip_outer
    # 然后yay下载包
    yay -S $yay_packages $yay_outer --needed --noconfirm
    # 再git下载包
    # 通过普通用户的ssh链接下载。因此如果没有设置ssh,就报错退出。
    if [[ ! -e ~/.ssh ]]; then
        echo "YSL: no github ssh key found." >&2
        exit 1
    fi
    for item in $git_packages; do
        # 如果目标位置已经有相应的包，就不下载了。否则就下载。并且从镜像站下载
        # ${item##*/}用于裁剪路径格式，从`作者/仓库名`格式中获取到`仓库名`
        # 参考：https://blog.csdn.net/victoria_hong/article/details/79444339
        if [[ ! -e ${ZSH_CUSTOM}/plugins/${item##*/} ]]; then
            git clone git@git.zhlh6.cn:${item}.git ${ZSH_CUSTOM}/plugins/${item##*/}
        fi
    done
    # 此时先不要创建锁文件。因为后面还要判断是否有冗余的包。
fi

# 把git的包添加到omz
for (( i = 0; i <= ${#git_packages[*]}; ++i )); do
    plugins+=${git_packages[$i]##*/}
done

# 检查冗余的git下载包，并删除
if [[ ! -e ~/.zsh.lock ]]; then
    for item in $(ls ${ZSH_CUSTOM}/plugins); do
        # 查看一个变量是否在数组中
        if ! echo "${plugins[@]}" | grep -w "${item}" &>/dev/null; then
            rm -rf ${ZSH_CUSTOM}/plugins/${item}
        fi
    done
fi

# 每次解除锁之后，都会输出一次自己加载了哪些插件。然后再加上锁，下次就不会输出了。
# 这个输出的作用是为了debug。
if [[ ! -e ~/.zsh.lock ]]; then
    echo ''
    echo "YSL: Plugin list"
    echo "================"
    for item in $plugins; do
        echo $item
    done
    echo "================"
fi

# 创建锁文件，下次打开zsh就不检测包了。
if [[ ! -e ~/.zsh.lock ]]; then
    touch ~/.zsh.lock
fi

#---------------------------------------------------------------------------------



# ===
# === Env Variables
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


#---------------------------------------------------------------------------------



# # ===
# # === Alacritty
# # ===
#
# #设置alacritty切换主题颜色。其他命令示例见原仓库链接：https://github.com/toggle-corp/alacritty-colorscheme
# COLOR_DIR="/usr/lib/node_modules/alacritty-themes/themes"
# LIGHT_COLOR='Dracula.yml'
# DARK_COLOR='Eighties.dark.yml'
# # 相应的切换主题的别名
# #
# # 原仓库的示例，可以同时切换vim颜色
# #alias day="alacritty-colorscheme -C $COLOR_DIR -a $LIGHT_COLOR -V && reload_nvim"
# #alias night="alacritty-colorscheme -C $COLOR_DIR -a $DARK_COLOR -V && reload_nvim"
# #
# # qwe在自己收藏的主题之间切换
# alias qwe="alacritty-colorscheme -C $COLOR_DIR -t $LIGHT_COLOR $DARK_COLOR"
# # asd随机切换一张
# alias asd="alacritty-colorscheme -C $COLOR_DIR -T"
# # zxc查看当前主题名字
# alias zxc="alacritty-colorscheme -s"

#---------------------------------------------------------------------------------



# ===
# === Self Settings
# ===

# ranger退出时跳转到在ranger里的目录
ranger () {
    local IFS=$'\t\n'
    local tempfile="$(mktemp -t tmp.XXXXXX)"
    local ranger_cmd=(
    command
    ranger
    --cmd="map q chain shell echo %d > "$tempfile"; quitall!"
)

${ranger_cmd[@]} "$@"
if [[ -f "$tempfile" ]] && [[ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]]; then
    cd -- "$(cat "$tempfile")" || return
fi
command rm -f -- "$tempfile" 2>/dev/null
}

# lazygit退出时跳转到在lazygit里的目录
# 如果不想跳转，可以用`shift + q`而不是`q`来退出
function lg () {
    export LAZYGIT_NEW_DIR_FILE=~/.lazygit/newdir

    lazygit "$@"

    if [ -f $LAZYGIT_NEW_DIR_FILE ]; then
        cd "$(cat $LAZYGIT_NEW_DIR_FILE)"
        rm -f $LAZYGIT_NEW_DIR_FILE > /dev/null
    fi
}

#---------------------------------------------------------------------------------



# ===
# === Source
# ===

#zoxide的内容
eval "$(zoxide init zsh)"

# 启动所有omz和git的设置
source $ZSH/oh-my-zsh.sh
# 启用所有yay的间接设置（如果有）
YAY_ZSH="/usr/share/zsh"
if [[ -e ${YAY_ZSH}/plugins ]]; then
    for item in $(find ${YAY_ZSH}/plugins -maxdepth 2 -name "*.plugin.zsh"); do
        source $item
    done
fi

# p10k或者starship自动配置的内容。这部分需要在omz初始化完成后再进行
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
if [ "$ZSH_THEME" == "powerlevel10k/powerlevel10k" ]; then
    [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
else
    # starship配置的内容
    eval "$(starship init zsh)"
fi

# 这个必须放在下面。否则会无法输出base
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if [[ -e ~/.conda.flag ]]; then
    if [[ $(yay -Qeq | grep anaconda) == 1 ]]; then
        yay -S anaconda
    fi
    __conda_setup="$('/opt/anaconda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "/opt/anaconda/etc/profile.d/conda.sh" ]; then
            . "/opt/anaconda/etc/profile.d/conda.sh"
        else
            export PATH="/opt/anaconda/bin:$PATH"
        fi
    fi
    unset __conda_setup
fi
# <<< conda initialize <<<

#---------------------------------------------------------------------------------



# ===
# === Aliases
# ===
alias g.="cd ~/.dotfiles"
alias gv='cd ~/.config/nvim/'
alias gV='cd ~/.dotfiles/nvim/.config/nvim/'
alias gc='cd ~/.config/coc/'
alias oo='cd ~/Documents/00-Github/; code ./00-my-notes; cd -'

alias gh="cd"
alias up="cd .."
# 下面这个需要根据不同的电脑进行更改

# 功能性别名
alias ex="extract"
alias cht="cht.sh"
alias ra="ranger"
alias gi='tig'
alias lg='lazygit'
alias ld='lazydocker'
alias pp='python'
alias ipp='ipython'
alias cat='bat'
alias du='ncdu'
alias dut='dutree'
alias ls='exa'
alias l='exa -lh'
alias ll='exa -lah'
alias lsa='exa -lah'
alias la='exa -la'
alias grep='rg'
alias igrep='peco'
alias top='htop'
alias diff='delta'
alias hack='btm'
alias traceroute='mtr'
alias df='pydf'
alias ftp='lftp'
alias cd='z'
alias cdi='zi'

alias rls='exa --color=always'
alias rless='less -r'
alias rgrep='rg --color=always'
alias pacman='sudo powerpill'
alias rpacman='sudo powerpill --color=always'
alias ryay='yay --color=always'

# 拉取更新用的
alias sss='sudo pacman -Syu --noconfirm'
alias yyy='yay -Syu --noconfirm'

# 刷新tmux的快捷键
alias TS='tmux source-file ~/.tmux.conf'
alias TL='rm ~/.tmux/.tmux.lock'

# 重置zsh用的快捷键
alias S='source ~/.zshrc'
alias L='rm ~/.zsh.lock'
alias K='kquitapp5 plasmashell && kstart5 plasmashell'

# 把`ctrl c`改为zle进入normal mode
bindkey '^c' vi-cmd-mode
# 把中断信号改为`ctrl e`
stty intr ^E
#---------------------------------------------------------------------------------
