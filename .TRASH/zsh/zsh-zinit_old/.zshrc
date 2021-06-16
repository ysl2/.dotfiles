# ===
# === Start
# ===

# 将光标切换为插入模式
echo -ne '\e[5 q'

# 加载p10k-instant-prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# set the affix .zsh files can be sourced
unsetopt nomatch

# 直接通过脚本开启tmux。但这样会导致没有autosuggestion，也不能用vi模式
# if [[ "$TMUX" == "" && $- == *i* ]]; then
#     # 作为某些应用的内嵌终端时不需要 tmux
#     if [[ ! "$(</proc/$PPID/cmdline)" =~ "/usr/bin/(dolphin|emacs|kate)" ]]; then
#         if [[ $(tmux ls | wc -l) == 1 ]]; then
#             exec tmux attach
#         else
#             exec tmux -f "$HOME/.tmux.conf"
#         fi
#     fi
# fi



# ===
# === source other files
# ===

# source thefuck
#eval $(thefuck --alias)

# source fzf
#source ~/.fzf.zsh

# source incr
# 这个插件有点卡，而且光标乱跳
#source ~/.config/zsh/incr*.zsh

# source zinit
### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://gitclone.com/github.com/zdharma/zinit.git "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi
source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk





# ===
# === Environment Variable
# ===

# 用于指定一个自己存放脚本的位置：~/bin
# export PATH=~/bin:"$PATH"

export EDITOR=nvim

# Go语言开启go module
export GO111MODULE=on
# Go语言切换国内软件源
export GOPROXY=https://mirrors.aliyun.com/goproxy/

# 设置翻墙用的
# export http_proxy="socks5://127.0.0.1:7891"
# export https_proxy="socks5://127.0.0.1:7891"

## 设置复制粘帖的时候取消幻灯片效果
#DISABLE_MAGIC_FUNCTIONS=true





# ===
# === Aliases
# ===

# 功能性别名
alias cht="cht.sh"
alias ra="ranger"
alias g.="cd ~/.dotfiles"
alias gh="cd"
alias up="cd .."
alias ex="extract"
alias lg='lazygit'
alias ld='lazydocker'
alias rls='ls --color=always'
alias rless='less -r'
alias rgrep='grep --color=always'
alias pacman='sudo powerpill'
alias rpacman='sudo powerpill --color=always'
alias ryay='yay --color=always'
alias sss='sudo pacman -Syu --noconfirm'
alias yyy='yay -Syu --noconfirm'
# 下面这个需要根据不同的电脑进行更改
alias oo='cd ~/Documents/00-Github/; code ./00-my-notes; cd -'
# 刷新tmux的快捷键
alias tt='tmux source-file ~/.tmux.conf'



# ===
# === Alacritty
# ===

#设置alacritty切换主题颜色。其他命令示例见原仓库链接：https://github.com/toggle-corp/alacritty-colorscheme
COLOR_DIR="/usr/lib/node_modules/alacritty-themes/themes"
LIGHT_COLOR='Dracula.yml'
DARK_COLOR='Eighties.dark.yml'
# 相应的切换主题的别名：
#
# 原仓库的示例，可以同时切换vim颜色
#alias day="alacritty-colorscheme -C $COLOR_DIR -a $LIGHT_COLOR -V && reload_nvim"
#alias night="alacritty-colorscheme -C $COLOR_DIR -a $DARK_COLOR -V && reload_nvim"
#
# qwe在自己收藏的主题之间切换
alias qwe="alacritty-colorscheme -C $COLOR_DIR -t $LIGHT_COLOR $DARK_COLOR"
# asd随机切换一张
alias asd="alacritty-colorscheme -C $COLOR_DIR -T"
# zxc查看当前主题名字
alias zxc="alacritty-colorscheme -s"





# ===
# === Zinit Things
# ===

# 国内镜像的解决方法：
# light或者load，表示下载整个仓库。此时在ice部分加上`from"hub.fastgit.org"`
# snippet，表示下载单文件，此时依然用hub.fastgit.org进行单文件加速，但是先创建别名

# zinit自己的增强插件
zinit ice from"hub.fastgit.org"
zinit light zinit-zsh/z-a-bin-gem-node

zinit ice from"hub.fastgit.org"
zinit light zinit-zsh/z-a-patch-dl

    # 下面这个插件下载速度巨慢，因此关掉
#zinit ice from"hub.fastgit.org"
#zinit light zinit-zsh/z-a-man

zinit ice from"hub.fastgit.org"
zinit light zinit-zsh/z-a-test

zinit ice from"hub.fastgit.org"
zinit light zinit-zsh/z-a-submods

    # 下面这两个是一组的
zinit ice from"hub.fastgit.org"
zinit light zdharma/zui
zinit ice from"hub.fastgit.org"
zinit light zdharma/zplugin-crasis
# zinit自己的增强插件结束

# OMZ的插件
    # 先定义OMZ的镜像地址
OMZ="hub.fastgit.org"
    # 引用ohmyzsh的库
zinit snippet OMZ::lib/completion.zsh
zinit snippet OMZ::lib/history.zsh
zinit snippet OMZ::lib/key-bindings.zsh
zinit snippet OMZ::lib/theme-and-appearance.zsh
    # vi
zinit snippet OMZ::plugins/vi-mode/vi-mode.plugin.zsh
    # fzf
zinit ice lucid atinit"
export DISABLE_FZF_KEY_BINDINGS=true
"
zinit snippet OMZ::plugins/fzf/fzf.plugin.zsh
    # git
zinit ice lucid wait='1'
zinit snippet OMZ::plugins/git/git.plugin.zsh
zinit snippet OMZ::lib/git.zsh
    # extract
zinit ice svn lucid wait='1'
zinit snippet OMZ::plugins/extract
    # tmux 配置字段参考这里：https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/tmux
zinit ice svn lucid atinit"
export ZSH_TMUX_AUTOSTART=true
export ZSH_TMUX_AUTOSTART_ONCE=true
export ZSH_TMUX_AUTOCONNECT=true
export ZSH_TMUX_AUTOQUIT=true
export ZSH_TMUX_FIXTERM=false
"
zinit snippet OMZ::plugins/tmux
    # 强行刷新tmux的设置
# if [[ "$TMUX" != "" ]]; then
#     tmux source-file ~/.tmux.conf
# fi
# shopt -s histappend
# shopt -s histreedit
# shopt -s histverify
# HISTCONTROL='ignoreboth'
# PROMPT_COMMAND="history -a;history -c;history -r; $PROMPT_COMMAND"
## OMZ的插件结束

# 除了OMZ的其他插件
zinit ice lucid wait='1' from"hub.fastgit.org"
zinit light zdharma/history-search-multi-word

zinit ice lucid wait atinit='zpcompinit' from"hub.fastgit.org"
zinit light zdharma/fast-syntax-highlighting

zinit ice lucid wait blockf atpull'zinit creinstall -q .' from"hub.fastgit.org"
zinit light zsh-users/zsh-completions

zinit ice lucid wait atload='_zsh_autosuggest_start' from"hub.fastgit.org"
zinit light zsh-users/zsh-autosuggestions

zinit ice lucid wait='1' from"hub.fastgit.org"
zinit light romkatv/zsh-defer

zinit ice from"hub.fastgit.org"
zinit light ael-code/zsh-colored-man-pages
# 除了OMZ的其他插件结束

# 主题
    # powerlevel10k
zinit ice depth=1 from"hub.fastgit.org"
zinit light romkatv/powerlevel10k

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
### End of Zinit's installer chunk
# 主题结束





# ===
# === 自定义设置
# ===

# Vi-Mode
function zle-keymap-select {
    if [[ ${KEYMAP} == vicmd ]] || [[ $1 = 'block' ]]; then
        echo -ne '\e[1 q'
    elif [[ ${KEYMAP} == main ]] || [[ ${KEYMAP} == viins ]] || [[ ${KEYMAP} = '' ]] || [[ $1 = 'beam' ]]; then
        echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
preexec() {
    echo -ne '\e[5 q'
}
_fix_cursor() {
    echo -ne '\e[5 q'
}
precmd_functions+=(_fix_cursor)
zle -N zle-line-init
zle -N zle-keymap-select

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

