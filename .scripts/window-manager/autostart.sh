#!/bin/sh

# =============
# === Utils ===
# =============
single_instance() {
    args="$*"
    while [ -n "$1" ]; do
        # Explain of the `grep -v "$0"`:
        # If we put this functino into another single file, and use this file as an executable,
        # Then the `ps aux | grep -v grep` will also find the executable file itself.
        # So we need to exclude the executable file itself.
        # But if we directly use this as a function in current file (autostart.sh), then we don't need to use `grep -v "$0"`.
        # However, we still use `grep -v "$0"` here for preventing the case that we use this function in another file.
        pids="$(ps aux | grep -v grep | grep -v "$0" | grep "$1" | awk '{print $2}')"
        if [ -n "$pids" ]; then
            for pid in $pids; do
                kill -9 "$pid"
            done
        fi
        shift
    done
    for item in $args; do
        $item &
    done
}


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
single_instance ~/.scripts/window-manager/screen.sh


# =============
# === Sound ===
# =============
# Restore sound settings from file when login.
[ -f ~/.asound.state ] && alsactl restore -f ~/.asound.state
# Keep tracking current sound settings into file.
# In fact, we don't need single_instance here, because the `sound.sh` defines a hook to kill itself when logout.
# We use single_instance here only for preventing the accidental case.
single_instance ~/.scripts/window-manager/sound.sh


# ================
# === Programs ===
# ================
picom -b


# =============================
# === Load localhost config ===
# =============================
[ -f ~/.scripts/window-manager/autostart.localhost.sh ] && ~/.scripts/window-manager/autostart.localhost.sh
