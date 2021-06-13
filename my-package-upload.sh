#!/bin/bash

DE_WM=${DESKTOP_SESSION:-"default"}

mkdir -p .MY-PACKAGE-LIST
mkdir -p .MY-PACKAGE-LIST/${DE_WM}
cd .MY-PACKAGE-LIST/${DE_WM}

sh ../my-package-upload-specific.sh

# -----------------------------------------------------------------

pip3 list | awk '{print $1}' >my-pip-list.txt
pip3 freeze >my-pip-freeze.txt
npm list -g --depth=0 >my-npm-list.txt
docker images | awk '{print $1}' >my-docker-list.txt
brew list >my-brew-list.txt
# cargo install --list
ls ~/.cargo/bin >my-cargo-list.txt
ls ~/go/bin >my-go-list.txt
