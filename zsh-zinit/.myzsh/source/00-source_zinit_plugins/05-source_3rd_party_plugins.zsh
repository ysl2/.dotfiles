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

zinit ice lucid wait'1' from"hub.fastgit.org"
zinit light zpm-zsh/colors

zinit ice lucid wait='1' from"hub.fastgit.org"
zinit light zpm-zsh/autoenv

zinit ice lucid wait='1' from"hub.fastgit.org"
zinit light kutsan/zsh-system-clipboard

# zinit ice lucid wait='1' from"hub.fastgit.org"
# zinit light romkatv/zsh-defer

zinit ice from"hub.fastgit.org"
zinit light zpm-zsh/ls
