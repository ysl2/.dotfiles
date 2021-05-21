sudo rm /etc/pacman.conf
sudo ln -s ${HOME}/.dotfiles/.MY-GLOBAL-SETTINGS/etc/pacman.conf /etc/pacman.conf

sudo rm /etc/powerpill/powerpill.json
sudo ln -s ${HOME}/.dotfiles/.MY-GLOBAL-SETTINGS/etc/powerpill/powerpill.json /etc/powerpill/powerpill.json

sudo rm /etc/pacman.d/mirrorlist
sudo ln -s ${HOME}/.dotfiles/.MY-GLOBAL-SETTINGS/etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist

sudo mkdir -p /etc/docker/
sudo rm /etc/docker/daemon.json
sudo ln -s ${HOME}/.dotfiles/.MY-GLOBAL-SETTINGS/etc/docker/daemon.json /etc/docker/daemon.json

