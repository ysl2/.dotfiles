# ===
# === Aliases
# ===
alias gh="cd"
alias up="cd .."
alias g.="cd ~/.dotfiles"
alias g,="cd ~/.dotfiles-main"
alias gv='cd ~/.config/nvim/'
alias gV='cd ~/.dotfiles-main/nvim/.config/nvim/'
alias gc='cd ~/.config/coc/'
# 下面这个需要根据不同的电脑进行更改
alias oo='cd ~/Documents/00-Github/; code ./00-my-notes; cd -'

# 功能性别名
alias ex="extract"
alias cht="cht.sh"
alias t='tmux'
alias ta='tmux attach'
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
alias btop='bashtop'
alias ctop='ctop'
alias diff='delta'
alias hack='btm'
alias traceroute='mtr'
alias df='pydf'
alias ftp='lftp'
alias cd='z'
alias cdi='zi'
alias wireshark='tcpdump'

alias rls='exa --color=always'
alias rless='less -r'
alias rgrep='rg --color=always'
alias pacman='sudo powerpill'
alias rpacman='sudo powerpill --color=always'
alias ryay='yay --color=always'

# 拉取更新用的
alias sss='sudo pacman -Syu --noconfirm'
alias yyy='yay -Syu --noconfirm'
alias goodbye='systemctl suspend'

# 刷新tmux的快捷键
alias TS='tmux source-file ~/.tmux.conf'
alias TL='rm ~/.tmux/.tmux.lock'

# 重置zsh用的快捷键
alias S='source ~/.zshrc'
alias L='rm "${MYZSH}"/.lock/omz.lock'
alias K='kquitapp5 plasmashell && kstart5 plasmashell'

# 把`ctrl c`改为zle进入normal mode
bindkey '^c' vi-cmd-mode
# 把中断信号改为`ctrl e`
stty intr ^E


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


