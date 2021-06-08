tmux_init () {
    cd
    # Add tmux framework
    if [[ ! -d ~/.tmux ]]; then
        git clone https://hub.fastgit.org/gpakosz/.tmux.git ~/.tmux
    fi
    touch "${MYZSH}"/.lock/tmux.lock
    ln -s -f .tmux/.tmux.conf ~/.tmux.conf
    tmux source-file ~/.tmux.conf
}

# init tmux
if [[ ! -f "${MYZSH}"/.lock/tmux.lock ]]; then
    tmux_init
fi

