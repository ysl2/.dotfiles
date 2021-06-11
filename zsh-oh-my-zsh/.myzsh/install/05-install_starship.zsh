if [[ ! -e "${MYZSH}"/.lock/starship.lock ]]; then
  touch "${MYZSH}"/.lock/starship.lock
  curl https://starship.rs/install.sh -o starship-install.sh
  chmod a+x starship-install.sh
  sudo ./starship-install.sh --yes --base-url=https://ghproxy.com/https://github.com/starship/starship/releases
  rm starship-install.sh
  # result=$(curl -fsSL https://starship.rs/install.sh)
  # eval "sudo ./${result} --yes --base-url=https://ghproxy.com/https://github.com/starship/starship/releases"
fi
