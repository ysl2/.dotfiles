#!/bin/bash

# Switch capslock and escape
setxkbmap -option caps:swapescape
# Acclerate keyboard
xset r rate 250 30

# Disable bell
xset b off

# Disable screen blanking
xset s off

# Disable screen saver
xset -dpms
