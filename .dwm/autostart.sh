#!/bin/bash

~/.scripts/window-manager/autostart.sh

killall slstatus 2> /dev/null
slstatus &

[ -f ~/.dwm/autostart.localhost.sh ] && ~/.dwm/autostart.localhost.sh
