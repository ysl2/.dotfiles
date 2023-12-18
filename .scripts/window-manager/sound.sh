#!/bin/sh

hook_main() {
    # If we logout, kill the main process, then exit hook process.
    kill -9 "$1"
    exit
}

hook() {
    while true; do
        # If we logout, kill the main process, then do something defined in hook_main().
        who | grep -q "^$(whoami) " || hook_main "$@"
        # This sleep time should be small enough to detect logout in time.
        sleep 1
    done
}

main() {
    # Once we logout, stop writing alsa config
    # Beacuse if we logout and turn to the display manager,
    # The volume will be reset to default value.
    # If we keep writing alsa config, the defaule value will be dumped.
    # So all we need to do is to stop writing alsa config when we logout,
    # and re-login to boot this script to start writing alsa config again.
    while true; do
        alsactl store -f ~/.asound.state
        # Any sleep time here is welcome, can be large enough.
        # But here we want it to be a small value to record sound settings in time.
        sleep 1
    done
}

main &
# Get the pid of the last background process.
main_pid="$!"
# Register a hook to kill the main process when logout.
hook "$main_pid"
