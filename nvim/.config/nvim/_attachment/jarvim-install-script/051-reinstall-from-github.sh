#!/bin/bash
# if [[ -e ~/.config/nvim-bak && -e ~/.config/nvim ]]; then
#     echo mv ~/.config/nvim-bak ~/.config/nvim-${USER}
#     mv ~/.config/nvim-bak ~/.config/nvim-${USER}
#     echo mv ~/.config/nvim ~/.config/nvim-bak
#     mv ~/.config/nvim ~/.config/nvim-bak
# elif [[ -e ~/.config/nvim && ! -e ~/.config/nvim-${USER} ]]; then
#     echo mv ~/.config/nvim ~/.config/nvim-${USER}
#     mv ~/.config/nvim ~/.config/nvim-${USER}
# elif [[ -e ~/.config/nvim-bak && ! -e ~/.config/nvim-${USER} ]]; then
#     echo mv ~/.config/nvim-bak ~/.config/nvim-${USER}
#     mv ~/.config/nvim-bak ~/.config/nvim-${USER}
# else
#     echo 'Conflict detected. autorename failed. Do nothing.'
#     exit 0
# fi
# git clone git@git.zhlh6.cn:ysl2/jarvim.git ~/.config/nvim
# if [[ ! -e ~/.env ]]; then
#     touch ~/.env
# fi
# cd ~/.config/nvim
# make
