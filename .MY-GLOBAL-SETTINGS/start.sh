#!/bin/bash

# RESTORE GLOBAL SETTINGS
# ========================
#
# This script is used for linking `~/.dotfiles/${some_hidden_folder}/*` to root
# ('/') folder
#
# NOTE: The script position must be `~/.dotfiles/${some_hidden_folder}/start.sh`
# All the folders and it's files under the ${some_hidden_folder} will be relinked to root

# if a folder matches a given pattern, then return false (1).
# if it doesn't match, return true (0).
# This is to prevent a pattern-matched folder to be linked.
source ./check_ok.sh

# Create conflict dir
CONFLICT_DIR=$(pwd)/assets
if [[ ! -e ${CONFLICT_DIR} ]]; then
  mkdir -p "${CONFLICT_DIR}"
fi
if [[ -e "${CONFLICT_DIR}"/conflict.sh ]]; then
  rm "${CONFLICT_DIR}"/conflict.sh
fi

my_traverse() {
  if [[ -f "$1" ]]; then
    dot_file=$(pwd)/"$1"
    target_file=${dot_file##${CUR_DIR}/}
    target_dir=${target_file%/*}
    my_link ${dot_file} /${target_file} /${target_dir}
  elif [[ -d "$1" ]]; then
    if $(check_ok "$1"); then
      cd "$1"
      for item in $(ls -A); do
        my_traverse "${item}"
      done
      cd ..
    else
      dot_file=$(pwd)/"$1"
      target_file=${dot_file##${CUR_DIR}/}
      target_dir=${target_file%/*}
      echo "sudo cp -r ${dot_file}/* /${target_file}/" >>"${CONFLICT_DIR}"/conflict.sh
    fi
  fi
}

# $1: dot_file
# $2: target_file
# $3: target_dir
my_link() {
  if [[ ! -e "$3" ]]; then
    echo "[create dir] "$3""
    sudo mkdir -p "$3"
  fi
  if [[ -L "$2" ]]; then
    echo "[delete link] "$2""
    sudo rm "$2"
  elif [[ -e "$2" ]]; then
    echo "[backup original] "$2""
    sudo mv "$2" "$2"_bak
  fi
  echo "[create link] "$2""
  sudo ln -s "$1" "$2"
}

CUR_DIR=$(pwd)
for item in $(ls -A ${CUR_DIR}); do
  if [[ -d ${item} ]]; then
    my_traverse ${item}
  fi
done

if [[ -e "${CONFLICT_DIR}"/conflict.sh ]]; then
  echo ''
  echo 'Conflict detected.'
  echo 'Please check 'conflict.sh' carefully, it will be a dangerous action.'
  echo '# ---------------------------------------------' >>"${CONFLICT_DIR}"/conflict.sh
  echo "rm -f "${CONFLICT_DIR}"/conflict.sh" >>"${CONFLICT_DIR}"/conflict.sh
  echo "rm -rf "${CONFLICT_DIR}"" >>"${CONFLICT_DIR}"/conflict.sh
  chmod 777 "${CONFLICT_DIR}"/conflict.sh
else
  rm -rf "${CONFLICT_DIR}"
fi
