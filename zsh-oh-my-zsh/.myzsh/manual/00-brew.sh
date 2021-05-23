#!/bin/bash
# if [[ ! -e "${MYZSH}"/.lock/brew.lock ]]; then
#   result=$(curl -fsSL https://ghproxy.com/https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | sed 's/github\.com/hub\.fastgit\.org/g')
#   eval "${result}"
#   git -C "$(/home/linuxbrew/.linuxbrew/bin/brew --repo)" remote set-url origin https://mirrors.ustc.edu.cn/brew.git
#   git -C "$(/home/linuxbrew/.linuxbrew/bin/brew --repo homebrew/core)" remote set-url origin https://mirrors.ustc.edu.cn/linuxbrew-core.git
#   brew update
#   /home/linuxbrew/.linuxbrew/bin/brew install gcc
#   touch "${MYZSH}"/.lock/brew.lock
# fi

# # 从本镜像下载安装脚本并安装 Homebrew / Linuxbrew
# git clone --depth=1 https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/install.git brew-install
# /bin/bash brew-install/install.sh
# rm -rf brew-install

# test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
# test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
# test -r ~/.bash_profile && echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> ~/.bash_profile
# test -r ~/.profile && echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> ~/.profile
# test -r ~/.zprofile && echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> ~/.zprofile

# git -C "$(brew --repo)" remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git
# git -C "$(brew --repo homebrew/core)" remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/linuxbrew-core.git
# brew update-reset
