# 用于开机进入CLI，有两种方式可供选择
#
# 方式1. 在输入密码后自动进入图形界面
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
    exec startx
fi

if [[ -e /home/linuxbrew/.linuxbrew/bin/brew ]]; then
    export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.bfsu.edu.cn/linuxbrew-bottles/bottles #ckbrew
    eval $(/home/linuxbrew/.linuxbrew/Homebrew/bin/brew shellenv) #ckbrew
fi

