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
