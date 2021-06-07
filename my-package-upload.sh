#!/bin/bash

DE_WM=${DESKTOP_SESSION:-"default"}

mkdir -p .MY-PACKAGE-LIST
mkdir -p .MY-PACKAGE-LIST/${DE_WM}
cd .MY-PACKAGE-LIST/${DE_WM}

sudo pacman -Qeq >my-pacman-list.txt
yay -Qeq >my-yay-list.txt
pip list | awk '{print $1}' >my-pip-list.txt
npm list -g --depth=0 >my-npm-list.txt
docker images | awk '{print $1}' >my-docker-list.txt
