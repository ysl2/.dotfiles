if [[ ! -e "${MYZSH}"/.lock/brew.lock ]]; then
  sh "${MYZSH}"/install/assets/install-brew.sh
  touch "${MYZSH}"/.lock/brew.lock
fi
