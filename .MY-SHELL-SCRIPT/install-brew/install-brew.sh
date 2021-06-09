#/usr/bin/bash

THIS=$(pwd)
cd
rm Homebrew.sh
wget https://gitee.com/cunkai/HomebrewCN/raw/master/Homebrew.sh
bash Homebrew.sh
rm Homebrew.sh
cd "${THIS}"
