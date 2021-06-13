# 剩下的没有安装的插件：
# omz_plugins=(
#     extract \
#   )



# =========================================
# === Load Plugin Loading Speed Checker ===
# =========================================
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi



# ====================
# === Zinit Things ===
# ====================
# 国内镜像的解决方法：
# light或者load，表示下载整个仓库。此时在ice部分加上`from"hub.fastgit.org"`
# snippet，表示下载单文件，此时依然用hub.fastgit.org进行单文件加速，但是先创建别名


# ===
# === load first
# ===
# 让tmux先加载
zinit ice from"hub.fastgit.org" lucid atinit"
export TMUX_MOTD=false
"
zinit light zpm-zsh/tmux


# ===
# === zinit self plugins
# ===
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


# ===
# === OMZ plugins
# ===
# 先定义OMZ的镜像地址
# OMZ="hub.fastgit.org"
# 引用ohmyzsh的库
zinit snippet 'https://cdn.jsdelivr.net/gh/ohmyzsh/ohmyzsh/lib/completion.zsh'
zinit snippet 'https://cdn.jsdelivr.net/gh/ohmyzsh/ohmyzsh/lib/history.zsh'
zinit snippet 'https://cdn.jsdelivr.net/gh/ohmyzsh/ohmyzsh/lib/key-bindings.zsh'
zinit snippet 'https://cdn.jsdelivr.net/gh/ohmyzsh/ohmyzsh/lib/git.zsh'
zinit snippet 'https://cdn.jsdelivr.net/gh/ohmyzsh/ohmyzsh/lib/theme-and-appearance.zsh'
# vi
zinit snippet 'https://cdn.jsdelivr.net/gh/ohmyzsh/ohmyzsh/plugins/vi-mode/vi-mode.plugin.zsh'
# fzf
zinit ice lucid wait atinit"
export DISABLE_FZF_KEY_BINDINGS=true
"
zinit snippet 'https://cdn.jsdelivr.net/gh/ohmyzsh/ohmyzsh/plugins/fzf/fzf.plugin.zsh'
# git
zinit ice lucid wait='1'
zinit snippet 'https://cdn.jsdelivr.net/gh/ohmyzsh/ohmyzsh/plugins/git/git.plugin.zsh'
# colored-man-pages
zinit ice lucid wait='1'
zinit snippet 'https://cdn.jsdelivr.net/gh/ohmyzsh/ohmyzsh/plugins/colored-man-pages/colored-man-pages.plugin.zsh'
# autojump
zinit snippet 'https://cdn.jsdelivr.net/gh/ohmyzsh/ohmyzsh/plugins/autojump/autojump.plugin.zsh'
# extract
# zinit ice svn lucid wait='1'
# zinit ice lucid wait='1'
# zinit snippet 'https://cdn.jsdelivr.net/gh/ohmyzsh/ohmyzsh/plugins/extract'

# # tmux 配置字段参考这里：https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/tmux
# zinit ice lucid atinit"
# export ZSH_TMUX_AUTOSTART=true
# export ZSH_TMUX_AUTOSTART_ONCE=true
# export ZSH_TMUX_AUTOCONNECT=true
# export ZSH_TMUX_AUTOQUIT=true
# export ZSH_TMUX_FIXTERM=false
# "
# zinit snippet 'https://cdn.jsdelivr.net/gh/ohmyzsh/ohmyzsh/plugins/tmux/tmux.plugin.zsh'


# ===
# === 3rd party plugins
# ===
zinit ice lucid wait='1' from"hub.fastgit.org"
zinit light zdharma/history-search-multi-word

zinit ice lucid wait atinit='zpcompinit' from"hub.fastgit.org"
zinit light zdharma/fast-syntax-highlighting
# zinit light zsh-users/zsh-syntax-highlighting

zinit ice lucid wait blockf atpull'zinit creinstall -q .' from"hub.fastgit.org"
zinit light zsh-users/zsh-completions

zinit ice lucid wait atload='_zsh_autosuggest_start' from"hub.fastgit.org"
zinit light zsh-users/zsh-autosuggestions

zinit ice from"hub.fastgit.org"
zinit light zpm-zsh/colors

zinit ice lucid wait='1' from"hub.fastgit.org"
zinit light zpm-zsh/autoenv

zinit ice lucid wait='1' from"hub.fastgit.org"
zinit light kutsan/zsh-system-clipboard

# zinit ice lucid wait='1' from"hub.fastgit.org"
# zinit light romkatv/zsh-defer


# ===
# === Theme
# ===

: ${THEME:=p10k}

case $THEME in
  spaceship)
    zinit ice depth=1 from"hub.fastgit.org"
    zinit light spaceship-prompt/spaceship-prompt
    ;;
  p10k)
    [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
    zinit ice depth=1 from"hub.fastgit.org"
    zinit light romkatv/powerlevel10k
    ;;
esac

