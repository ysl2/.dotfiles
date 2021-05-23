if [[ ! -e $MYLOCK/brew.lock ]]; then
  # result=$(curl -fsSL https://ghproxy.com/https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | sed 's/github\.com/hub\.fastgit\.org/g')
  # eval "${result}"
  git -C "$(/home/linuxbrew/.linuxbrew/bin/brew --repo)" remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git
  git -C "$(/home/linuxbrew/.linuxbrew/bin/brew --repo homebrew/core)" remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/linuxbrew-core.git
  brew update
  /home/linuxbrew/.linuxbrew/bin/brew install gcc
  touch ${MYLOCK}/brew.lock
fi
