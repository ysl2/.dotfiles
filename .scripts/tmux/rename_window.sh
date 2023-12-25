#!/bin/sh

window_number=$1

if tmux list-windows | grep -q "^$window_number:"; then
    tmux swap-window -d -t $window_number
else
    tmux move-window -t $window_number
fi
