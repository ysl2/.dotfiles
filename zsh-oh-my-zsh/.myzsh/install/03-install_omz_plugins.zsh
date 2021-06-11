# 下载上面提到的所有包（omz的包除外。omz的包本身就有，直接调用即可）
# 通过"${MYZSH}"/.lock/omz.lock文件来锁住更新。如果更改了yay列表或者git列表，就删掉此文件，就会重新自动yay获取更新和git拉取仓库了
# 快捷键L解锁
if [[ ! -e "${MYZSH}"/.lock/omz.lock ]]; then
  # git下载包
  for item in $git_packages; do
    # 如果目标位置已经有相应的包，就不下载了。否则就下载。并且从镜像站下载
    # ${item##*/}用于裁剪路径格式，从`作者/仓库名`格式中获取到`仓库名`
    # 参考：https://blog.csdn.net/victoria_hong/article/details/79444339
    if [[ ! -e ${ZSH_CUSTOM}/plugins/${item##*/} ]]; then
      git clone git@git.zhlh6.cn:${item}.git ${ZSH_CUSTOM}/plugins/${item##*/}
    fi
  done
fi

plugins=($omz_plugins)

# 把git的包添加到omz
# 这条必须在锁文件外面
for ((i = 0; i <= ${#git_packages[*]}; ++i)); do
  plugins+=${git_packages[$i]##*/}
done

if [[ ! -e "${MYZSH}"/.lock/omz.lock ]]; then
  # 检查冗余的git下载包，并删除
  for item in $(ls ${ZSH_CUSTOM}/plugins); do
    # 查看一个变量是否在数组中
    if ! echo "${plugins[@]}" | grep -w "${item}" &>/dev/null; then
      rm -rf ${ZSH_CUSTOM}/plugins/${item}
    fi
  done
  # 创建锁文件，下次打开zsh就不检测包了。
  touch "${MYZSH}"/.lock/omz.lock
fi

