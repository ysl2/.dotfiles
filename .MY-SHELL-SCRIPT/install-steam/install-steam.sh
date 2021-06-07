#/usr/bin/bash

echo "YuSoLi: This script is useless. Don't use this."
exit 0

yay -S steam-manjaro proton --needed --confirm
mkdir -p ~/.local/share/Steam/skins
cd ~/.local/share/Steam/skins
git clone https://hub.fastgit.org/MoriTanosuke/HiDPI-Steam-Skin.git
