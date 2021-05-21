#!/bin/bash
cd ~/.cache/vim/plug/repos
for item in $(ls ~/.cache/vim/plug/repos/); do
  if [[ $(
    ls -a ${item} | grep '.gitmodules' > /dev/null
    echo $?
  ) == 0 ]]; then
    cd ${item}
    git submodule update --init --recursive
    cd ..
  fi
done
