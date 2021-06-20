# ===
# === OMZ plugins
# ===
# 先定义OMZ的镜像地址
# OMZ="hub.fastgit.org"
# 引用ohmyzsh的库
zinit snippet 'https://cdn.jsdelivr.net/gh/ohmyzsh/ohmyzsh/lib/completion.zsh'
zinit snippet 'https://cdn.jsdelivr.net/gh/ohmyzsh/ohmyzsh/lib/history.zsh'
zinit snippet 'https://cdn.jsdelivr.net/gh/ohmyzsh/ohmyzsh/lib/key-bindings.zsh'
zinit ice wait lucid
zinit snippet 'https://cdn.jsdelivr.net/gh/ohmyzsh/ohmyzsh/lib/git.zsh'
zinit ice wait lucid
zinit snippet 'https://cdn.jsdelivr.net/gh/ohmyzsh/ohmyzsh/lib/theme-and-appearance.zsh'

# ===
# === vi
# ===
zinit snippet 'https://cdn.jsdelivr.net/gh/ohmyzsh/ohmyzsh/plugins/vi-mode/vi-mode.plugin.zsh'


# ===
# === fzf
# ===
zinit ice wait lucid atinit"
export DISABLE_FZF_KEY_BINDINGS=true
"
zinit snippet 'https://cdn.jsdelivr.net/gh/ohmyzsh/ohmyzsh/plugins/fzf/fzf.plugin.zsh'

# zinit ice wait lucid from"hub.fastgit.org"
# zinit light Aloxaf/fzf-tab


# ===
# === git
# ===
zinit ice wait lucid atload$'unalias grv g 2>/dev/null'
zinit snippet 'https://cdn.jsdelivr.net/gh/ohmyzsh/ohmyzsh/plugins/git/git.plugin.zsh'


# ===
# === colored-man-pages
# ===
zinit ice wait'1' lucid
zinit snippet 'https://cdn.jsdelivr.net/gh/ohmyzsh/ohmyzsh/plugins/colored-man-pages/colored-man-pages.plugin.zsh'


# ===
# === autojump
# ===
zinit ice wait lucid
zinit snippet 'https://cdn.jsdelivr.net/gh/ohmyzsh/ohmyzsh/plugins/autojump/autojump.plugin.zsh'


# ===
# === command-not-found
# ===
zinit ice wait'1' lucid
zinit snippet 'https://cdn.jsdelivr.net/gh/ohmyzsh/ohmyzsh/plugins/command-not-found/command-not-found.plugin.zsh'


# ===
# === extract
# ===
# zinit ice svn lucid wait='1'
# zinit ice lucid wait='1'
# zinit snippet 'https://cdn.jsdelivr.net/gh/ohmyzsh/ohmyzsh/plugins/extract'
