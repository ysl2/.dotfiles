export MYZSH="${HOME}"/.myzsh
export PATH="${MYZSH}"/bin:$PATH
export NOTICE="YuSoLi"


# ===
# === machine specific
# ===
if [[ -e ~/.zshenv_spec ]]; then
  source ~/.zshenv_spec
fi

