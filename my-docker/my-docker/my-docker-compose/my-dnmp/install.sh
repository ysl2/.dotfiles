#/bin/bash
THIS=$(pwd)
DATA=~/my-docker/my-docker-volumes/

mkdir -p $DATA
cd $DATA
git clone https://hub.fastgit.org/yeszao/dnmp.git my-dnmp
cd my-dnmp
for item in $(ls -A ../../my-docker-compose/my-dnmp/ | grep -v install.sh); do
  ln -s ../../my-docker-compose/my-dnmp/"$item" .
done
docker-compose up -d
