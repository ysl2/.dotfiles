#!/bin/bash


# ================
# === Touchpad ===
# ================
# Get id of touchpad
id=`xinput list | grep "Touchpad"  | cut -d'=' -f2 | awk '{print $1}'`
# Get id of the field corresponding to natural scrolling
id_natural_scrolling=`xinput list-props $id | \
                      grep "Natural Scrolling Enabled (" \
                      | cut -d'(' -f2 | cut -d')' -f1`
# Get id of the field corresponding to tapping
id_tapping_enabled=`xinput list-props $id | \
                      grep "Tapping Enabled (" \
                      | cut -d'(' -f2 | cut -d')' -f1`
# Set the property to true
xinput --set-prop $id $id_natural_scrolling 1
xinput --set-prop $id $id_tapping_enabled 1


# ================
# === Keyboard ===
# ================
# Switch capslock and escape
setxkbmap -option caps:swapescape
# Acclerate keyboard
xset r rate 250 30


# ==============
# === Screen ===
# ==============
# Disable bell
xset b off
# Disable screen blanking
xset s off
# Disable screen saver
xset -dpms


# ==================
# === Compositor ===
# ==================
picom -b


# =============================
# === Load localhost config ===
# =============================
[ -f ~/.scripts/window-manager/autostart.localhost.sh ] && ~/.scripts/window-manager/autostart.localhost.sh
