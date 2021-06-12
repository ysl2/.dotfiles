function mynotice () {
  echo "YuSoLi: The tmux settings will take effect after terminal reload."
}

function ontmux () {
  if [[ -e "${MYZSH}"/.lock/notmux.lock ]]; then
    rm "${MYZSH}"/.lock/notmux.lock
  fi
  mynotice
}

function notmux () {
  touch "${MYZSH}"/.lock/notmux.lock
  mynotice
}

if [[ -z "$TMUX" && ! -e "${MYZSH}"/.lock/notmux.lock ]]; then
  source "${ZSH}"/plugins/tmux/tmux.plugin.zsh
fi

