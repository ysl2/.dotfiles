# 启动所有omz和git的设置
# 这条必须优先执行
source $ZSH/oh-my-zsh.sh

# 启用所有yay的间接设置（如果有）
YAY_ZSH="/usr/share/zsh"
if [[ -e ${YAY_ZSH}/plugins ]]; then
  for item in $(find ${YAY_ZSH}/plugins -maxdepth 2 -name "*.plugin.zsh"); do
    source $item
  done
fi

