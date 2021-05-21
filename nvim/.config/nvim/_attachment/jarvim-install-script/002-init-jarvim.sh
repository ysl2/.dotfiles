#!/bin/sh
if [[ ! -d ~/.config/nvim ]]; then
  echo 'nvim folder not found.'
  exit 0
fi
if [[ ! -f ~/.config/nvim/install.sh ]]; then
  echo '"~/.config/nvim/install.sh" is not exist.'
  exit 0
fi
if [[ ! -x ~/.config/nvim/install.sh ]]; then
  chmod 777 ~/.config/nvim/install.sh
fi

cd ~/.config/nvim/
./install.sh

if [[ -e ~/jarvim ]]; then
  rm ~/jarvim
fi
