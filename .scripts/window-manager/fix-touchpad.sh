#!/bin/bash
sudo mkdir -p /etc/X11/xorg.conf.d
sudo echo 'Section "InputClass"' > /etc/X11/xorg.conf.d/90-touchpad.conf
sudo echo 'Identifier "touchpad"' >> /etc/X11/xorg.conf.d/90-touchpad.conf
sudo echo 'MatchIsTouchpad "on"' >> /etc/X11/xorg.conf.d/90-touchpad.conf
sudo echo 'Driver "libinput"' >> /etc/X11/xorg.conf.d/90-touchpad.conf
sudo echo 'Option "Tapping" "on"' >> /etc/X11/xorg.conf.d/90-touchpad.conf
sudo echo 'EndSection' >> /etc/X11/xorg.conf.d/90-touchpad.conf
