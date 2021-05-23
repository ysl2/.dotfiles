tmux_init () {
    if [[ ! -d ~/.tmux || ! -f ~/.tmux/.tmux.lock || ! -h ~/.tmux.conf ]]; then
        cd
        # Add tmux framework
        if [[ ! -d ~/.tmux ]]; then
            git clone https://hub.fastgit.org/gpakosz/.tmux.git ~/.tmux
            # git clone https://hub.fastgit.org/Johnny4Fun/.tmux.git ~/.tmux
        fi
        touch ~/.tmux/.tmux.lock
        if [[ $(yay -Qeq | grep stow) == 1 ]]; then
            yay -S stow
        fi
        ln -s -f .tmux/.tmux.conf ~/.tmux.conf
        cd ~/.dotfiles/
        stow -R tmux
        tmux source-file ~/.tmux.conf
    fi
}

# init tmux
if [[ ! -f ~/.tmux/.tmux.lock ]]; then
    tmux_init
fi

