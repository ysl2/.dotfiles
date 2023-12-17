#!/bin/sh

# =============
# === Utils ===
# =============
# single_instance() {
#     args="$*"
#     while [ -n "$1" ]; do
#         pid="$(ps aux | grep -v grep | grep -v "$0" | grep "$1" | awk '{print $2}')"
#         [ -n "$pid" ] && kill -9 "$pid"
#         shift
#     done
#     for item in $args; do
#         $item &
#     done
# }


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


# ==============
# === Screen ===
# ==============
# Disable bell
xset b 0 0 0
# Disable screen blanking and screen saver
keep_screen() {
    while true; do
        sleep 60
        # Disable screen blanking
        xset s 0 0
        xset s noblank
        xset s off
        # Disable screen saver
        xset dpms 0 0 0
        xset -dpms
    done
}
keep_screen &


# ================
# === Programs ===
# ================
picom -b


# =============================
# === Load localhost config ===
# =============================
[ -f ~/.scripts/window-manager/autostart.localhost.sh ] && ~/.scripts/window-manager/autostart.localhost.sh
