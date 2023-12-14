#!/bin/bash

~/.scripts/window-manager/natural_scrolling.sh
~/.scripts/window-manager/xset.sh
picom -b

[ -f ~/.scripts/window-manager/autostart.localhost.sh ] && ~/.scripts/window-manager/autostart.localhost.sh
