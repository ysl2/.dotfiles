#!/bin/sh

main() {
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

main "$@"
