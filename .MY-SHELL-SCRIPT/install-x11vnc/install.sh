#!/bin/bash
su -c "pacman -S x11vnc"
mkdir -p ~/.local/share/systemd/user/
cp x11vnc_user.service ~/.local/share/systemd/user/x11vnc_user.service
systemctl --user daemon-reload
systemctl enable --user x11vnc_user && systemctl start --user x11vnc_user
chmod +x deactivate_compositor.sh
sh ./deactivate_compositor.sh