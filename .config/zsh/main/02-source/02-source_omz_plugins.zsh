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
zinit ice lucid atinit"
VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true
VI_MODE_SET_CURSOR=true
"
zinit snippet 'https://cdn.jsdelivr.net/gh/ohmyzsh/ohmyzsh/plugins/vi-mode/vi-mode.plugin.zsh'
# 这条必须放在下面，如果放在上面会失效。必须先source vi-mode，然后再改键位
bindkey '^c' vi-cmd-mode


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
# Fix bug: if use autojump, tmux will cannot open. They are in conflict. Fuck!!!!!!!!!!
# zinit ice wait lucid
# zinit snippet 'https://cdn.jsdelivr.net/gh/ohmyzsh/ohmyzsh/plugins/autojump/autojump.plugin.zsh'


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
