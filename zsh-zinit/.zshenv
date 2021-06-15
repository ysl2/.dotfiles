export MYZSH="${HOME}"/.myzsh
export PATH=$PATH:"${MYZSH}"/bin


# ===
# === machine specific
# ===
if [[ -e ~/.zshenv_spec ]]; then
  source ~/.zshenv_spec
fi

