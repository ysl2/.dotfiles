#!/bin/bash

# /usr/bin/amixer -qM set Master 5%- umute
/usr/bin/pactl set-sink-volume 0 -5%
