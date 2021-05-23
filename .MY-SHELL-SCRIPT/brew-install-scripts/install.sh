#!/bin/bash
# if [[ ! -e ~/.oh-my-zsh ]]; then
# 把github.com做一下处理，换成国内地址
result=$(curl -fsSL https://ghproxy.com/https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | sed 's/github\.com/hub\.fastgit\.org/g')
# 执行变量中的命令，用eval
eval "${result}"
# fi
# $(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
