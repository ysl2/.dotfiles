# 用于开机进入CLI，在输入密码后自动进入图形界面
# 1. 开机进入 CLI
#
#     ```text
#     systemctl set-default multi-user.target
#     ```
#
# 2. 要进入 GUI，只需要`startx`就可以。
#
# 3. 从 GUI 返回到 CLI，只需要“注销”，就回到了 CLI。
#
# 4. 想再次修改为默认进入 GUI 界面, 执行
#
#     ```text
#     systemctl set-default graphical.target
#     ```

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx
fi

# if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
#   DISPLAY=:0 exec dwm
# fi

