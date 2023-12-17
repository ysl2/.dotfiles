#!/bin/sh

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
