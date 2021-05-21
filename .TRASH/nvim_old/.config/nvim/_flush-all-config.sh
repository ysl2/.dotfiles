#!/bin/bash

remove_recur () {
    if [[ -h "$1" ]]; then
        echo rm $(pwd)/"$1"
        rm $(pwd)/"$1"
    fi
    if [[ -f "$1" ]]; then
        exit 0
    fi
    cd $1
    for item in $(ls .); do
        if [[ -h ${item} ]]; then
            echo rm $(pwd)/${item}
            rm $(pwd)/${item}
        fi
        if [[ -d "${item}" ]]; then
            remove_recur ${item}
        fi
    done
    cd ..
}

remove_recur ~/.config/nvim/
cd ~/.dotfiles/
stow -R nvim --verbose

