#!/bin/bash
# 判断是Linux还是Mac os
OS="$(uname)"
if [[ "$OS" == "Linux" ]]; then
  HOMEBREW_ON_LINUX=1
elif [[ "$OS" != "Darwin" ]]; then
  echo "Homebrew 只运行在 Mac OS 或 Linux."
fi

#设置一些平台地址
if [[ -z "${HOMEBREW_ON_LINUX-}" ]]; then
  #Mac
  if [[ "$UNAME_MACHINE" == "arm64" ]]; then
    #M1
    HOMEBREW_PREFIX="/opt/homebrew"
    HOMEBREW_REPOSITORY="${HOMEBREW_PREFIX}"
  else
    #Inter
    HOMEBREW_PREFIX="/usr/local"
    HOMEBREW_REPOSITORY="${HOMEBREW_PREFIX}/Homebrew"
  fi
else
  HOMEBREW_PREFIX="/home/linuxbrew/.linuxbrew"
  HOMEBREW_REPOSITORY="${HOMEBREW_PREFIX}/Homebrew"
fi

if [[ ! -e ${HOMEBREW_REPOSITORY}/bin/brew ]]; then
  echo ""${NOTICE}": Start installing brew..."
  THIS=$(pwd)
  cd
  mv ~/.zprofile ~/.zprofile_bak
  rm Homebrew.sh
  wget https://gitee.com/cunkai/HomebrewCN/raw/master/Homebrew.sh
  sed -i 's/mirrors\.tuna\.tsinghua\.edu\.cn\\\/linuxbrew-bottles\\\/bottles-portable-ruby/mirrors.ustc.edu.cn\\\/linuxbrew-bottles\\\/bottles-portable-ruby/' Homebrew.sh
  sed -i 's/mirrors\.tuna\.tsinghua\.edu\.cn\\\/homebrew-bottles\\\/bottles-portable-ruby/mirrors.ustc.edu.cn\\\/homebrew-bottles\\\/bottles-portable-ruby/' Homebrew.sh
  bash Homebrew.sh
  rm Homebrew.sh
  if [[ -e ~/.zprofile && -e ~/.zprofile_bak ]]; then
    rm ~/.zprofile
    mv ~/.zprofile_bak ~/.zprofile
  fi
  cd "${THIS}"
fi
