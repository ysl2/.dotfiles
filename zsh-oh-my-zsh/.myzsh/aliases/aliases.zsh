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
# alias cd='z'
# alias cdi='zi'

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

