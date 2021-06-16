source "${HOME}"/.zshdebug.zsh

# For debug mode
# function `ondebug` `nodebug` to control this
if [[ -e "${MYZSH}"/.lock/debug.flag ]]; then
  zmodload zsh/datetime
  setopt PROMPT_SUBST
  PS4='+$EPOCHREALTIME %N:%i> '

  logfile=$(mktemp zsh_profile.XXXXXXXX)
  echo "Logging to $logfile"
  exec 3>&2 2>$logfile

  setopt XTRACE
  # Another zsh debug helper
  # zmodload zsh/zprof
fi
# ==============================================================


# ===
# === preset
# ===
# set the affix .zsh files can be sourced
# unsetopt nomatch


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
if [[ -e "${MYZSH}"/.lock/debug.flag ]]; then
  # Another zsh debug helper
  # zprof
  unsetopt XTRACE
  exec 2>&3 3>&-
fi
