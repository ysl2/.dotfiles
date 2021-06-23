#!/bin/bash

# multi screen
/bin/bash ~/.scripts/basic/screen/big-and-small.sh

# statusbar loader
# /bin/bash ~/.scripts/basic/statusbar/autoloop.sh &

# wallpaper engine
/bin/bash ~/.scripts/basic/wallpaper/autoloop.sh &

# windows render
picom -b
#picom -o 0.95 -i 0.88 --detect-rounded-corners --vsync --blur-background-fixed -f -D 5 -c -b
# xcompmgr &

# laptop enhance
/bin/bash ~/.scripts/basic/laptop/tap-to-click.sh &
/bin/bash ~/.scripts/basic/laptop/inverse-scroll.sh &

# keyboard mapping
# /bin/bash ~/.scripts/setxmodmap-colemak.sh &

# basic components: network & power & voice & bluetooth
nm-applet &
xfce4-power-manager &
blueman-applet &  # YuSoLi: self flavor
switchhosts &  # YuSoLi: self flavor
#xfce4-volumed-pulse &

# mail sync
# /bin/bash ~/.scripts/run-mailsync.sh &

# lazy load others
# /bin/bash ~/.scripts/autostart_wait.sh &

