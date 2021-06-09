# 用于开机进入CLI，在输入密码后自动进入图形界面
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
    exec startx
fi

