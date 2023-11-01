#!/bin/bash
feh --bg-scale ~/Pictures/Wallpapers/desktop.jpg
picom -b

~/.dwm/dwm-natural-scrolling.sh

single_instance() {
    pid=$(pgrep "$1")
    if [ ! "$pid" == '' ]; then
        kill -9 "$pid"
    fi
    ~/.dwm/"$1".sh &
}

single_instance dwm-statusbar
