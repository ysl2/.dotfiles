if [[ ! -e "${MYZSH}"/.lock/brew.lock ]]; then
  bash "${MYZSH}"/install/assets/install-brew.sh
  touch "${MYZSH}"/.lock/brew.lock
fi
