#!/bin/bash

# This script is used for linking `~/.dotfiles/.MY-GLOBAL-SETTINGS/*` to root
# ('/') folder

# my_create_dir() {
#   if [[ -f "$1" ]]; then
#     return
#     # dot_file=$(pwd)/"$1"
#     # target_file=${dot_file##${CUR_DIR}/}
#     # target_dir=${target_file%/*}
#     # my_link "${dot_file}" /"${target_file}" /"${target_dir}"
#   elif [[ -d "$1" ]]; then
#     cd "$1"
#     for item in $(ls -A); do
#       my_create_dir "${item}"
#     done
#     cd ..
#   fi
# }

my_traverse() {
  if [[ -f "$1" ]]; then
    dot_file=$(pwd)/"$1"
    # echo "${dot_file}"
    target_file="${HOME}"/${dot_file##${CUR_DIR}/${TEMP_DIR}/}
    # echo "${target_file}"
    target_dir=${target_file%/*}
    # echo "${target_dir}"
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
  echo mkdir -p "$3"
  if [[ -L "$2" ]]; then
    echo rm "$2"
  elif [[ -e "$2" ]]; then
    if [[ -s "${CONFLICT_DIR}"/conflict.sh ]]; then
      rm "${CONFLICT_DIR}"/conflict.sh
    fi
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

# jump to `~/.dotfiles` dir
cd ..
CUR_DIR=$(pwd)
TEMP_DIR=''
for item in $(ls "${CUR_DIR}"); do
  if [[ -d "${item}" ]]; then
    TEMP_DIR="${item}"
    my_traverse "${item}"
  fi
done
if [[ -e "${CONFLICT_DIR}"/conflict.sh ]]; then
  echo 'Conflict detected. So I stopped normally. :-)'
  exit 0
fi
for item in $(ls "${CUR_DIR}"); do
  echo stow -R "${item}"
done
