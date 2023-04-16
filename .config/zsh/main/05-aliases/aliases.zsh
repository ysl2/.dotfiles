# ===============
# === Aliases ===
# ===============


# ===
# === goto alias
# ===
alias gh="cd"
alias up="cd .."
alias g.="cd ~/.dotfiles"
alias g,="cd ~/.dotlib"


# ===
# === functional alias
# ===
alias ':q'='exit'


# ===
# === third-party software
# ===
alias t='tmux'
alias ta='tmux attach'
alias ra="ranger"
alias lg='lazygit'
alias ld='lazydocker'
alias lp='lazynpm'
alias py='python'
alias ipy='ipython'
# pip install httpie
alias https='http --default-scheme=https'
alias wttr="curl zh.wttr.in\/"$MYLOCATION"\?2Fq"
alias yd="ydcv"
alias s="pfetch"
alias lf='lfcd'


# ===
# === arch package manager
# ===
alias rls='ls --color=always'
alias rless='less -r'
alias rgrep='grep --color=always'
# alias pacman='sudo powerpill'
# alias rpacman='sudo powerpill --color=always'
alias ryay='yay --color=always'
# 拉取更新用的
alias sss='sudo pacman -Syyu --needed --noconfirm'
alias yyy='yay -Syyu --needed --noconfirm'


# ===
# === desktop mamager
# ===
alias shutup='systemctl suspend'
alias K='kquitapp5 plasmashell && kstart5 plasmashell'


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
