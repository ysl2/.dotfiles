source "${HOME}"/.zshdebug.zsh
_start_debug
# ==============================================================


# ===
# === preset
# ===
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


# ==============================================================
_stop_debug
