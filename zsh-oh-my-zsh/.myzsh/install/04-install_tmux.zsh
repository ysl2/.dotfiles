# init tmux
# if [[ ! -f "${MYZSH}"/.lock/tmux.lock ]]; then
if [[ ! -d ~/.tmux ]]; then
  git clone https://hub.fastgit.org/gpakosz/.tmux.git ~/.tmux
  ln -s -f ~/.tmux/.tmux.conf ~/.tmux.conf
fi

