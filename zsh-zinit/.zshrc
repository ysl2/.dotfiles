# set the affix .zsh files can be sourced
unsetopt nomatch


# ===
# === start
# ===
source "${MYZSH}"/start.zsh


# ===
# === machine specific
# ===
if [[ -e ~/.zshrc_spec ]]; then
  source ~/.zshrc_spec
fi
