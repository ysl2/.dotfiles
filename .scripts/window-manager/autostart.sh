#!/bin/sh

# =============
# === Utils ===
# =============
single_instance=~/.scripts/window-manager/utils/single_instance.sh


# ================
# === Touchpad ===
# ================
if [ "$XDG_SESSION_TYPE" = x11 ]; then
    # Get id of touchpad
    id="$(xinput list | grep 'Touchpad'  | cut -d'=' -f2 | awk '{print $1}')"
    # Get id of the field corresponding to natural scrolling
    id_natural_scrolling="$(xinput list-props "$id" | \
                          grep 'Natural Scrolling Enabled (' \
                          | cut -d'(' -f2 | cut -d')' -f1)"
    # Get id of the field corresponding to tapping
    id_tapping_enabled="$(xinput list-props "$id" | \
                          grep 'Tapping Enabled (' \
                          | cut -d'(' -f2 | cut -d')' -f1)"
    # Set the property to true
    xinput --set-prop "$id" "$id_natural_scrolling" 1
    xinput --set-prop "$id" "$id_tapping_enabled" 1
fi


# ================
# === Keyboard ===
# ================
if [ "$XDG_SESSION_TYPE" = x11 ]; then
    # Switch capslock and escape
    setxkbmap -option caps:swapescape
fi
# Acclerate keyboard
xset r rate 250 30
# Disable beep sound
xset b 0 0 0


# ==============
# === Screen ===
# ==============
# Disable screen blanking and screen saver
"$single_instance" ~/.scripts/window-manager/autostart/screen.sh


# =============
# === Sound ===
# =============
# Restore sound settings from file when login.
[ -f ~/.asound.state ] && alsactl restore -f ~/.asound.state
# Keep tracking current sound settings into file.
# In fact, we don't need single_instance here, because the `sound.sh` defines a condition to exit loop.
# We use single_instance here only for preventing the accidental case.
"$single_instance" ~/.scripts/window-manager/autostart/sound.sh


# ================
# === Programs ===
# ================
picom -b
# Clean dmenu cache
rm ~/.cache/dmenu_run 2> /dev/null


# =============================
# === Load localhost config ===
# =============================
[ -f ~/.scripts/window-manager/autostart.localhost.sh ] && ~/.scripts/window-manager/autostart.localhost.sh
