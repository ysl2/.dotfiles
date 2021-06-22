#!/bin/bash

# multi screen
/bin/bash ~/.screenlayout/big_and_small.sh

/bin/bash ~/.scripts/dwm-status.sh &
/bin/bash ~/.scripts/wp-autochange.sh &
#picom -o 0.95 -i 0.88 --detect-rounded-corners --vsync --blur-background-fixed -f -D 5 -c -b
picom -b
/bin/bash ~/.scripts/tap-to-click.sh &
/bin/bash ~/.scripts/inverse-scroll.sh &
# /bin/bash ~/.scripts/setxmodmap-colemak.sh &
nm-applet &
xfce4-power-manager &
#xfce4-volumed-pulse &
# /bin/bash ~/.scripts/run-mailsync.sh &

# YuSoLi: self flavor
blueman-applet &
switchhosts &
# xcompmgr &

/bin/bash ~/.scripts/autostart_wait.sh &

