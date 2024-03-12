#!/bin/sh

# =============
# === Utils ===
# =============
# single_instance=~/.scripts/wm/utils/single_instance.sh


# ================
# === Touchpad ===
# ================
case "$XDG_SESSION_TYPE" in
    x11 | tty)
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
        ;;
esac


# ================
# === Keyboard ===
# ================
~/.scripts/wm/autostart/keyboard.sh


# ==============
# === Screen ===
# ==============
# Disable screen blanking and screen saver
# "$single_instance" ~/.scripts/wm/autostart/screen.sh

# Disable screen blanking
xset s 0 0
xset s noblank
xset s off
# Disable screen saver
xset dpms 0 0 0
xset -dpms


# =============
# === Sound ===
# =============
# Restore sound settings from file when login.
# [ -f ~/.asound.state ] && alsactl restore -f ~/.asound.state
# Keep tracking current sound settings into file.
# In fact, we don't need single_instance here, because the `sound.sh` defines a condition to exit loop.
# We use single_instance here only for preventing the accidental case.
# "$single_instance" ~/.scripts/wm/autostart/sound.sh

# Ref: https://wiki.archlinux.org/title/PulseAudio/Troubleshooting#Pulse_overwrites_ALSA_settings
restore_alsa() {
    while [ -z "$(pidof pulseaudio)" ]; do
        sleep 0.5
    done
    alsactl -f /var/lib/alsa/asound.state restore
}
restore_alsa &


# ================
# === Programs ===
# ================
killall picom 2> /dev/null; picom -D 5 -f -b --vsync
# Clean dmenu cache
rm ~/.cache/dmenu_run 2> /dev/null
killall unclutter 2> /dev/null; unclutter --timeout 1 &


# =============================
# === Load localhost config ===
# =============================
[ -f ~/.scripts/wm/autostart.localhost.sh ] && ~/.scripts/wm/autostart.localhost.sh
