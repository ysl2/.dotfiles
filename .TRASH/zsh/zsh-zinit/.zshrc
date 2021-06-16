# set the affix .zsh files can be sourced
unsetopt nomatch


# ===
# === start
# ===
source "${MYZSH}"/start.zsh


# ===
# === machine specific
# ===
if [[ -e ~/.zshspecific ]]; then
  source ~/.zshspecific
fi
