# 启动所有omz和git的设置
# 这条必须优先执行
source $ZSH/oh-my-zsh.sh

function zplug () {
  echo ''
  echo "YuSoLi: Plugin list"
  echo "================"
  for item in $plugins; do
    echo $item
  done
  echo "================"
}

if [[ ! -e "${MYZSH}"/.lock/omz-echo.lock ]]; then
  zplug
  touch "${MYZSH}"/.lock/omz-echo.lock
fi

