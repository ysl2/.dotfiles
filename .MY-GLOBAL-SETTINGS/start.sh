#!/bin/bash

# RESTORE GLOBAL SETTINGS
# ========================
#
# This script is used for linking `~/.dotfiles/${some_hidden_folder}/*` to root
# ('/') folder
#
# NOTE: The script position must be `~/.dotfiles/${some_hidden_folder}/start.sh`
# All the folders and it's files under the ${some_hidden_folder} will be relinked to root

my_traverse() {
  if [[ -f "$1" ]]; then
    dot_file=$(pwd)/"$1"
    target_file=${dot_file##${CUR_DIR}/}
    target_dir=${target_file%/*}
    my_link ${dot_file} /${target_file} /${target_dir}
  elif [[ -d "$1" ]]; then
    cd "$1"
    for item in $(ls -A); do
      my_traverse "${item}"
    done
    cd ..
  fi
}

# $1: dot_file
# $2: target_file
# $3: target_dir
my_link() {
  echo sudo mkdir -p "$3"
  if [[ -L "$2" ]]; then
    echo sudo rm "$2"
    sudo rm "$2"
  elif [[ -e "$2" ]]; then
    echo sudo mv "$2" "$2"_bak
    sudo mv "$2" "$2"_bak
  fi
  echo sudo ln -s "$1" "$2"
  sudo ln -s "$1" "$2"
}

CUR_DIR=$(pwd)
for item in $(ls -A ${CUR_DIR}); do
  if [[ -d ${item} ]]; then
    my_traverse ${item}
  fi
done
