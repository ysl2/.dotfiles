# 启动所有omz和git的设置
# 这条必须优先执行
source $ZSH/oh-my-zsh.sh

if [[ ! -e "${MYZSH}"/.lock/omz.lock ]]; then
  # 每次解除锁之后，都会输出一次自己加载了哪些插件。然后再加上锁，下次就不会输出了。
  # 这个输出的作用是为了debug。
  echo ''
  echo "YSL: Plugin list"
  echo "================"
  for item in $plugins; do
    echo $item
  done
  echo "================"

  # 创建锁文件，下次打开zsh就不检测包了。
  touch "${MYZSH}"/.lock/omz.lock
fi
