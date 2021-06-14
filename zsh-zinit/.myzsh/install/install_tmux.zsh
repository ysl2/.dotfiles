if [[ ! -d ~/.tmux ]]; then
  git clone https://hub.fastgit.org/gpakosz/.tmux.git ~/.tmux
  ln -s -f ~/.tmux/.tmux.conf ~/.tmux.conf
fi
