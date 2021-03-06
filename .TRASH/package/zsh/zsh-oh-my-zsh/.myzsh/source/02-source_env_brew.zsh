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

if [[ -e ${HOMEBREW_REPOSITORY}/bin/brew ]]; then
  #HomeBrew 下载源 install
  if [[ -z "${HOMEBREW_ON_LINUX-}" ]]; then
    export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles/bottles #ckbrew
  else
    export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/linuxbrew-bottles/bottles #ckbrew
  fi
  eval $("${HOMEBREW_REPOSITORY}"/bin/brew shellenv) #ckbrew
fi



