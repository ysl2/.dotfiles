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

# # tmux 配置字段参考这里：https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/tmux
# zinit ice lucid atinit"
# export ZSH_TMUX_AUTOSTART=true
# export ZSH_TMUX_AUTOSTART_ONCE=true
# export ZSH_TMUX_AUTOCONNECT=true
# export ZSH_TMUX_AUTOQUIT=true
# export ZSH_TMUX_FIXTERM=false
# "
# zinit snippet 'https://cdn.jsdelivr.net/gh/ohmyzsh/ohmyzsh/plugins/tmux/tmux.plugin.zsh'
