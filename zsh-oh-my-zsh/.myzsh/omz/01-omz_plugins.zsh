# 下载上面提到的所有包（omz的包除外。omz的包本身就有，直接调用即可）
# 通过"${MYZSH}"/.lock/omz.lock文件来锁住更新。如果更改了yay列表或者git列表，就删掉此文件，就会重新自动yay获取更新和git拉取仓库了
# 快捷键L解锁
if [[ ! -e "${MYZSH}"/.lock/omz.lock ]]; then
    # 先pip下载包
    pip install $pip_outer
    # 然后yay下载包
    yay -S $yay_packages $yay_outer --needed --noconfirm
    # 再git下载包
    # 通过普通用户的ssh链接下载。因此如果没有设置ssh,就报错退出。
    if [[ ! -e ~/.ssh ]]; then
        echo "YSL: no github ssh key found." >&2
        exit 1
    fi
    for item in $git_packages; do
        # 如果目标位置已经有相应的包，就不下载了。否则就下载。并且从镜像站下载
        # ${item##*/}用于裁剪路径格式，从`作者/仓库名`格式中获取到`仓库名`
        # 参考：https://blog.csdn.net/victoria_hong/article/details/79444339
        if [[ ! -e ${ZSH_CUSTOM}/plugins/${item##*/} ]]; then
            git clone git@git.zhlh6.cn:${item}.git ${ZSH_CUSTOM}/plugins/${item##*/}
        fi
    done
    # 此时先不要创建锁文件。因为后面还要判断是否有冗余的包。
fi

# 把git的包添加到omz
for (( i = 0; i <= ${#git_packages[*]}; ++i )); do
    plugins+=${git_packages[$i]##*/}
done

# 检查冗余的git下载包，并删除
if [[ ! -e "${MYZSH}"/.lock/omz.lock ]]; then
    for item in $(ls ${ZSH_CUSTOM}/plugins); do
        # 查看一个变量是否在数组中
        if ! echo "${plugins[@]}" | grep -w "${item}" &>/dev/null; then
            rm -rf ${ZSH_CUSTOM}/plugins/${item}
        fi
    done
fi

# 每次解除锁之后，都会输出一次自己加载了哪些插件。然后再加上锁，下次就不会输出了。
# 这个输出的作用是为了debug。
if [[ ! -e "${MYZSH}"/.lock/omz.lock ]]; then
    echo ''
    echo "YSL: Plugin list"
    echo "================"
    for item in $plugins; do
        echo $item
    done
    echo "================"
fi

# 创建锁文件，下次打开zsh就不检测包了。
if [[ ! -e "${MYZSH}"/.lock/omz.lock ]]; then
    touch "${MYZSH}"/.lock/omz.lock
fi

#zoxide的内容
eval "$(zoxide init zsh)"

# 启动所有omz和git的设置
source $ZSH/oh-my-zsh.sh
# 启用所有yay的间接设置（如果有）
YAY_ZSH="/usr/share/zsh"
if [[ -e ${YAY_ZSH}/plugins ]]; then
    for item in $(find ${YAY_ZSH}/plugins -maxdepth 2 -name "*.plugin.zsh"); do
        source $item
    done
fi

# p10k或者starship自动配置的内容。这部分需要在omz初始化完成后再进行
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
if [[ "$ZSH_THEME" == "powerlevel10k/powerlevel10k" ]]; then
    [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
else
    # starship配置的内容
    eval "$(starship init zsh)"
fi


