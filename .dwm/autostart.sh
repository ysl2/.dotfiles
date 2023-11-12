#!/bin/bash

~/.wm/autostart.sh

single_instance() {
    result=$(ps aux | grep -v grep | grep "$1")
    if [ "$result" != '' ]; then
        killall "$1"
    fi
    "$1" &
}

single_instance slstatus

[ -f ~/.dwm/autostart.localhost.sh ] && ~/.dwm/autostart.localhost.sh
