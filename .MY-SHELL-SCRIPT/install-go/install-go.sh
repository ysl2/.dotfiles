#/usr/bin/bash

mkdir -p assets
cd assets

curl https://mirrors.ustc.edu.cn/golang/go1.16.5.linux-amd64.tar.gz --remote-name
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf $(ls .)

cd -
rm -rf assets
