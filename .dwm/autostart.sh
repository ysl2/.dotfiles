#!/bin/bash
feh --bg-scale ~/Pictures/Wallpapers/desktop.jpg
picom -b

~/.dwm/dwm-natural-scrolling.sh

single_instance() {
    result=$(ps aux | grep -v grep | grep  "$1")
    if [ ! "$result" == '' ]; then
        killall "$1"
    fi
    ~/.dwm/"$1" &
}

single_instance dwm-statusbar.sh
