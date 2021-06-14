# ===
# === 3rd party plugins
# ===

# If shell output error: `compdef: unknown command or service`,
# please execute command: `rm -f ~/.zcompdump*`
alias ls='ls'
zinit from"hub.fastgit.org" for \
  zpm-zsh/material-colors \
  zpm-zsh/ls


zinit wait lucid from'hub.fastgit.org' for \
  atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
  zdharma/fast-syntax-highlighting \
  blockf \
  zsh-users/zsh-completions \
  atload"!_zsh_autosuggest_start" \
  zsh-users/zsh-autosuggestions


zinit wait lucid from"hub.fastgit.org" for \
  zpm-zsh/colors \
  zpm-zsh/autoenv


zinit ice wait'1' lucid from"hub.fastgit.org"
zinit light zdharma/history-search-multi-word


# zinit ice lucid wait atinit='zpcompinit' from"hub.fastgit.org"
# zinit light zdharma/fast-syntax-highlighting
# # zinit light zsh-users/zsh-syntax-highlighting
#
# zinit ice lucid wait blockf atpull'zinit creinstall -q .' from"hub.fastgit.org"
# zinit light zsh-users/zsh-completions
#
# zinit ice lucid wait atload='_zsh_autosuggest_start' from"hub.fastgit.org"
# zinit light zsh-users/zsh-autosuggestions

# zinit ice lucid wait'1' from"hub.fastgit.org"
# zinit light kutsan/zsh-system-clipboard

# zinit ice lucid wait='1' from"hub.fastgit.org"
# zinit light romkatv/zsh-defer

