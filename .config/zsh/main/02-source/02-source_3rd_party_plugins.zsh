# =========================
# === 3rd party plugins ===
# =========================


# ===
# === 第三方vi，对于p10k主题有bug。弃用
# ===
# zinit ice lucid from"hub.fastgit.org" atinit"
# function zvm_config() {
# # ZVM_READKEY_ENGINE=$ZVM_READKEY_ENGINE_ZLE
#   ZVM_INIT_MODE=sourcing
#   ZVM_VI_ESCAPE_BINDKEY='^C'
# }
# "
# zinit light jeffreytse/zsh-vi-mode

# ===
# === fzf-tab
# ===
# 按前缀键不显示光标的bug：
# https://github.com/Aloxaf/fzf-tab/commit/168cd530ba3c511cd9dd6e2932a995f262453994
# zinit ice wait lucid from"hub.fastgit.org"
# zinit light Aloxaf/fzf-tab


# ===
# === ls
# ===
# If shell output error: `compdef: unknown command or service`,
# please execute command: `rm -f ~/.zcompdump*`
zinit wait lucid light-mode from"hub.fastgit.org" for \
  zpm-zsh/material-colors \
  atinit"alias ls='ls'" \
  zpm-zsh/ls


# ===
# === other useful stuff
# ===
# zsh-users/zsh-syntax-highlighting \
zinit wait lucid light-mode from'hub.fastgit.org' for \
  blockf \
  zsh-users/zsh-completions \
  atload"!_zsh_autosuggest_start" \
  zsh-users/zsh-autosuggestions


# ===
# === auto change env
# ===
zinit wait lucid light-mode from"hub.fastgit.org" for \
  zpm-zsh/colors \
  zpm-zsh/autoenv


# ===
# === search history
# ===
zinit ice wait lucid from"hub.fastgit.org"
zinit light zdharma-continuum/history-search-multi-word


# zinit ice lucid wait atinit='zpcompinit' from"hub.fastgit.org"
# zinit light zdharma-continuum/fast-syntax-highlighting
# # zinit light zsh-users/zsh-syntax-highlighting
#
# zinit ice lucid wait blockf atpull'zinit creinstall -q .' from"hub.fastgit.org"
# zinit light zsh-users/zsh-completions
#
# zinit ice lucid wait atload='_zsh_autosuggest_start' from"hub.fastgit.org"
# zinit light zsh-users/zsh-autosuggestions

zinit ice lucid wait'1' from"hub.fastgit.org"
zinit light kutsan/zsh-system-clipboard

# zinit ice lucid wait='1' from"hub.fastgit.org"
# zinit light romkatv/zsh-defer
