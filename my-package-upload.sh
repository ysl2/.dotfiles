#!/bin/bash

DE_WM=${DESKTOP_SESSION:-"default"}

mkdir -p .MY-PACKAGE-LIST
mkdir -p .MY-PACKAGE-LIST/${DE_WM}
cd .MY-PACKAGE-LIST/${DE_WM}

if [[ ! -f "my-pacman-list.txt" ]]; then
	touch my-pacman-list.txt
	touch my-yay-list.txt
	touch my-pip-list.txt
    touch my-npm-list.txt
fi

sudo pacman -Qeq > my-pacman-list.txt
yay -Qeq > my-yay-list.txt
pip list | awk '{print $1}' > my-pip-list.txt
npm list -g --depth=0 > my-npm-list.txt

