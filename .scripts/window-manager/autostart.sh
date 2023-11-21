#!/bin/bash

~/.scripts/window-manager/natural-scrolling.sh
~/.scripts/window-manager/keyboard.sh
picom -b

[ -f ~/.scripts/window-manager/autostart.localhost.sh ] && ~/.scripts/window-manager/autostart.localhost.sh
