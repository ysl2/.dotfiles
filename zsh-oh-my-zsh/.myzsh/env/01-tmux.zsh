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
  if [[ ! -e "$ZSH_CUSTOM"/plugins/tmux ]]; then
    git clone https://hub.fastgit.org/zpm-zsh/tmux.git "$ZSH_CUSTOM"/plugins/tmux
  fi
  export TMUX_MOTD=false
  source "$ZSH_CUSTOM"/plugins/tmux/tmux.plugin.zsh
fi

