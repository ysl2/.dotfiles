#!/bin/bash

sed_tool() {
  local flag=0
  if [[ -x "$1" ]]; then
    flag=1
  fi
  sed 's/github\.com/hub\.fastgit\.org/g' $(pwd)/"$1" > $(pwd)/"$1"tmp
  mv $(pwd)/"$1"tmp $(pwd)/"$1"
  sed "s/[\s]*Plug[^']*'\([^']*\)'/Plug\ 'https\:\/\/hub\.fastgit\.org\/\1\.git'/g" $(pwd)/"$1" > $(pwd)/"$1"tmp
  mv $(pwd)/"$1"tmp $(pwd)/"$1"
  # sed "s/[\s]*repo[^']*'\([^']*\)'/repo\ =\ 'https\:\/\/hub\.fastgit\.org\/\1\.git'/g" $(pwd)/"$1" > $(pwd)/"$1"tmp
  # mv $(pwd)/"$1"tmp $(pwd)/"$1"
  if [[ ${flag} == 1 ]]; then
    chmod 777 $(pwd)/"$1"
  fi
}

sed_replace_all() {
  if [[ -f "$1" ]]; then
    sed_tool "$1"
    exit 0
  fi
  cd "$1"
  if [[ $(pwd) == "${HOME}/.config/nvim/plugin" ]]; then
    exit 0
  fi
  for item in $(ls .); do
    if [[ -f "${item}" ]]; then
      echo "sed $(pwd)/${item}"
      sed_tool "${item}"
    fi
    if [[ -d "${item}" ]]; then
      sed_replace_all ${item}
    fi
  done
  cd ..
}

start_replace() {
  # if [[ ! -d "$1" ]]; then
  # 	echo 'please specify a folder(nvim) to use this tool.'
  #	exit 0
  # fi
  if [[ ! -d "$1" ]]; then
    echo 'the variable is not a folder (or the variable is not exist).'
    exit 0
  fi
  cd "$1"
  sed_replace_all "$1"
}

# start_replace "$1"
start_replace ~/.config/nvim
