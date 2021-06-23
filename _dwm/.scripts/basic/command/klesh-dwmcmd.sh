#!/bin/sh

toggleapp() {
    if pgrep -u "$USER" -x "$1"; then
        killall "$1"
    else
        "$@" &
    fi
}

volume() {
    case $1 in
        up)
            amixer -q sset Master 5%+ unmute
            ;;
        down)
            amixer -q sset Master 5%- unmute
            ;;
        toggle)
            amixer -q sset Master toggle
            amixer get Master | grep -F ' [on]' && \
                amixer -q sset Headphone unmute && \
                amixer -q sset Front unmute
            ;;
    esac
}

case $1 in
    trayer)
        toggleapp trayer --edge top --align right --distance 24 --margin 10 --padding 5 --widthtype request
        ;;
    scrkey)
        toggleapp screenkey
        ;;
    music)
        mpc "$2"
        ;;
    volume)
        volume "$2"
        ;;
    dmenu)
        dmenu_run $DMENU_DEFAULT_OPTS -p 'Run'
        ;;
    launch)
        dmenu_launcher
        ;;
    dict)
        d "$(xsel -o)"
        ;;
    input)
        dmenu $DMENU_DEFAULT_OPTS -p "$2" || echo ''
        ;;
    bookmark)
        BOOKMARK_SEARCHER="dmenu $DMENU_DEFAULT_OPTS" bm
        ;;
esac
