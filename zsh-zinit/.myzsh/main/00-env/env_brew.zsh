# ============
# === brew ===
# ============

# This code below will not check if `${HOMEBREW_REPOSITORY}` exists.
# So you should run the personal brew in "${MYZSH}"/bin to check the environment, instead of the offical brew.

# HOMEBREW_REPOSITORY
# HOMEBREW_PREFIX
# HOMEBREW_BOTTLE_DOMAIN

OS="$(uname)"
if [[ "$OS" == "Linux" ]]; then
  export HOMEBREW_ON_LINUX=1
elif [[ "$OS" != "Darwin" ]]; then
  echo "Homebrew 只运行在 Mac OS 或 Linux."
fi

#设置一些平台地址
if [[ -z "${HOMEBREW_ON_LINUX-}" ]]; then
  #Mac
  if [[ "$UNAME_MACHINE" == "arm64" ]]; then
    #M1
    export HOMEBREW_PREFIX="/opt/homebrew"
    export HOMEBREW_REPOSITORY="${HOMEBREW_PREFIX}"
  else
    #Inter
    export HOMEBREW_PREFIX="/usr/local"
    export HOMEBREW_REPOSITORY="${HOMEBREW_PREFIX}/Homebrew"
  fi
else
  export HOMEBREW_PREFIX="/home/linuxbrew/.linuxbrew"
  export HOMEBREW_REPOSITORY="${HOMEBREW_PREFIX}/Homebrew"
fi

if [[ -z "${HOMEBREW_ON_LINUX-}" ]]; then
  export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles/bottles #ckbrew
else
  export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/linuxbrew-bottles/bottles #ckbrew
fi

# NOTE: This below command is necessary.
# Don't delete the below command.
if [[ -e "${HOMEBREW_REPOSITORY}"/bin ]]; then
  export PATH=$PATH:"${HOMEBREW_REPOSITORY}"/bin
fi



# =============
# === FPATH ===
# =============

# export FPATH=$FPATH:/usr/share/zsh/site-functions
# export FPATH=$FPATH:/usr/share/zsh/functions/Calendar
# export FPATH=$FPATH:/usr/share/zsh/functions/Chpwd
# export FPATH=$FPATH:/usr/share/zsh/functions/Completion
# export FPATH=$FPATH:/usr/share/zsh/functions/Completion/Base
# export FPATH=$FPATH:/usr/share/zsh/functions/Completion/Linux
# export FPATH=$FPATH:/usr/share/zsh/functions/Completion/Unix
# export FPATH=$FPATH:/usr/share/zsh/functions/Completion/X
# export FPATH=$FPATH:/usr/share/zsh/functions/Completion/Zsh
# export FPATH=$FPATH:/usr/share/zsh/functions/Exceptions
# export FPATH=$FPATH:/usr/share/zsh/functions/Math
# export FPATH=$FPATH:/usr/share/zsh/functions/MIME
# export FPATH=$FPATH:/usr/share/zsh/functions/Misc
# export FPATH=$FPATH:/usr/share/zsh/functions/Newuser
# export FPATH=$FPATH:/usr/share/zsh/functions/Prompts
# export FPATH=$FPATH:/usr/share/zsh/functions/TCP
# export FPATH=$FPATH:/usr/share/zsh/functions/VCS_Info
# export FPATH=$FPATH:/usr/share/zsh/functions/VCS_Info/Backends
# export FPATH=$FPATH:/usr/share/zsh/functions/Zftp
# export FPATH=$FPATH:/usr/share/zsh/functions/Zle

# If brew not installed, it is no necessary to add the command below.
if [[ -e "${HOMEBREW_REPOSITORY}"/bin ]]; then
  export FPATH=/usr/share/zsh/site-functions:/usr/share/zsh/functions/Calendar:/usr/share/zsh/functions/Chpwd:/usr/share/zsh/functions/Completion:/usr/share/zsh/functions/Completion/Base:/usr/share/zsh/functions/Completion/Linux:/usr/share/zsh/functions/Completion/Unix:/usr/share/zsh/functions/Completion/X:/usr/share/zsh/functions/Completion/Zsh:/usr/share/zsh/functions/Exceptions:/usr/share/zsh/functions/Math:/usr/share/zsh/functions/MIME:/usr/share/zsh/functions/Misc:/usr/share/zsh/functions/Newuser:/usr/share/zsh/functions/Prompts:/usr/share/zsh/functions/TCP:/usr/share/zsh/functions/VCS_Info:/usr/share/zsh/functions/VCS_Info/Backends:/usr/share/zsh/functions/Zftp:/usr/share/zsh/functions/Zle:$FPATH
fi
