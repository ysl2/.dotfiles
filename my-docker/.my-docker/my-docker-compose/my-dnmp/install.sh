#/bin/bash
THIS=$(pwd)
DATA=~/my-docker/my-docker-volumes/

cd $DATA
git clone https://hub.fastgit.org/yeszao/dnmp.git
mv -n dnmp/* my-dnmp/
mv -n dnmp/.* my-dnmp/
rm -rf dnmp
cd my-dnmp
docker-compose up -d
