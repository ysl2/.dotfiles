#/usr/bin/bash

THIS=$(pwd)
cd ~/.config
git clone https://hub.fastgit.org/catsout/wallpaper-engine-kde-plugin.git
cd wallpaper-engine-kde-plugin
mkdir -p build && cd build
cmake -DCMAKE_BUILD_TYPE=Release ..
make
sudo make install
cd ../..
plasmapkg2 -i wallpaper-engine-kde-plugin/plugin
killall plasmashell && kstart5 plasmashell
cd "${THIS}"

clear
echo '''YuSoLi: Almost finished. You need to do last two things:
1. Open KDE wallpaper settings and choose the correct Steam folder. e.g: `~/.local/share/Steam`
2. Update and Launch Steam, turn on 'Steam Play' checkbox in Steam settings.

If any error occurs, follow the steps below to rollback.

1. print `ctrl alt T` to open terminal, then input these commands:

    ```bash
    nvim ~/.config/plasma-org.kde.plasma.desktop-appletsrc
    ```

2. Find `WallpaperFilePath`, and delete the whole line.

3. Reboot KDE:

    ```bash
    killall plasmashell && kstart5 plasmashell
    ```

'''

