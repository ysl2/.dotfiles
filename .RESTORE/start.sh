#!/bin/bash

# RESTORE DOTFILES
# ================
#
# NOTE: This script is used for linking `~/.dotfiles/${stow_tags}/*` to home ('~/') folder
#
# NOTE: The script position must be `~/.dotfiles/${some_hidden_folder}/start.sh`
# e.g. `~/.dotfiles/.RESTORE-BY_JAVA/start.sh`
# The folder ${some_hidden_folder} must be a hidden folder!!!
#
# NOTE: All the unhidden folders in `~/.dotfiles/` will be considered as a stow tag
# folder, and will be restored by stow.

my_traverse() {
  if [[ -f "$1" ]]; then
    dot_file=$(pwd)/"$1"
    target_file="${HOME}"/${dot_file##${CUR_DIR}/${TEMP_DIR}/}
    target_dir=${target_file%/*}
    my_link "${dot_file}" "${target_file}" "${target_dir}"
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
  if [[ ! -e "$3" ]]; then
    echo "[create dir] "$3""
    mkdir -p "$3"
  fi
  if [[ -L "$2" ]]; then
    echo "[delete link] "$2""
    rm "$2"
  elif [[ -e "$2" ]]; then
    if [[ ! -e "${CONFLICT_DIR}"/conflict.sh ]]; then
      touch "${CONFLICT_DIR}"/conflict.sh
      chmod 777 "${CONFLICT_DIR}"/conflict.sh
    fi
    echo "rm -f "$2"" >>"${CONFLICT_DIR}"/conflict.sh
  fi
}

# Create conflict dir
CONFLICT_DIR=$(pwd)/assets
if [[ ! -e ${CONFLICT_DIR} ]]; then
  mkdir -p "${CONFLICT_DIR}"
fi
if [[ -e "${CONFLICT_DIR}"/conflict.sh ]]; then
  rm "${CONFLICT_DIR}"/conflict.sh
fi

# jump to `~/.dotfiles` dir
cd ..
CUR_DIR=$(pwd)
TEMP_DIR=''
# remove previous links by stow
for item in $(ls "${CUR_DIR}"); do
  if [[ -d "${item}" ]]; then
    echo "[stow clear] "${item}""
    stow -D "${item}"
  fi
done
for item in $(ls "${CUR_DIR}"); do
  if [[ -d "${item}" ]]; then
    TEMP_DIR="${item}"
    my_traverse "${item}"
  fi
done
if [[ -e "${CONFLICT_DIR}"/conflict.sh ]]; then
  echo 'Conflict detected. So I stopped normally. :-)'
  echo '# ---------------------------------------------' >>"${CONFLICT_DIR}"/conflict.sh
  echo "rm -f "${CONFLICT_DIR}"/conflict.sh" >>"${CONFLICT_DIR}"/conflict.sh
  echo "rm -rf "${CONFLICT_DIR}"" >>"${CONFLICT_DIR}"/conflict.sh
  exit 0
else
  rm -rf "${CONFLICT_DIR}"
fi
for item in $(ls "${CUR_DIR}"); do
  if [[ -d "${item}" ]]; then
    echo "[stow start] "${item}""
    stow -R "${item}"
  fi
done
