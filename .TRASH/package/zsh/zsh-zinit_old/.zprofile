# 用于开机进入CLI，有两种方式可供选择
#
# 方式1. 在输入密码后自动进入图形界面
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx
fi
#
# 方式2. 在输入密码后，再输入startx进入图形界面
# [ -z "$DISPLAY" ] && [ $XDG_VTNR -eq 1 ] && exec startx
