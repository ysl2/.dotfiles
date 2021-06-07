#/usr/bin/bash

yay -S steam-manjaro proton --needed --confirm
mkdir -p ~/.steam/skins
cd ~/.steam/skins
git clone https://hub.fastgit.org/MoriTanosuke/HiDPI-Steam-Skin.git
