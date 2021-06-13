# ===
# === Check Oh-My-Zsh
# ===

# 如果没有oh-my-zsh，就先下载
if [[ ! -e ~/.oh-my-zsh ]]; then
  # 把github.com做一下处理，换成国内地址
  result=$(curl -fsSL https://ghproxy.com/https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | sed 's/github\.com/gitclone\.com\/github\.com/')
  # 执行变量中的命令，用eval
  eval "${result}" --keep-zshrc
fi


# ===
# === Check Oh-My-Zsh Theme
# ===
# 如果没下载主题，就下载主题
if [[ ! -e ${HOME}/.oh-my-zsh/custom/themes/powerlevel10k ]]; then
  git clone --depth=1 https://gitclone.com/github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
fi
