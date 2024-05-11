#!/bin/sh

while true; do
    while [ -z "$(ps aux | grep -v grep | grep 'nautilus --gapplication-service')" ]; do
        nautilus --gapplication-service > /dev/null 2>&1 &
    done
    sleep 1
done
