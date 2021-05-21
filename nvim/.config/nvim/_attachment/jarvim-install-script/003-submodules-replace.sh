#!/bin/bash
cd ~/.cache/vim/plug/repos
for item in $(ls ~/.cache/vim/plug/repos/); do
  if [[ $(
    ls -a ${item} | grep '.gitmodules' >/dev/null
    echo $?
  ) == 0 ]]; then
    cd ${item}
    sed 's/github\.com/hub\.fastgit\.org/g' $(pwd)/.gitmodules >$(pwd)/.gitmodulestmp
    mv $(pwd)/.gitmodulestmp $(pwd)/.gitmodules
    cd ..
  fi
done
