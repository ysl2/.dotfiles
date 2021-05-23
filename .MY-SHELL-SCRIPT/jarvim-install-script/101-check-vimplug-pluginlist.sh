#!/bin/bash
basepath=$(
  cd $(dirname $0)
  pwd
)
if [[ ! -e ${basepath}/assets/vimplug-list.txt ]]; then
  touch ${basepath}/assets/vimplug-all.txt
  touch ${basepath}/assets/vimplug-submodules.txt
fi
ls ~/.cache/vim/plug/repos/ > ${basepath}/assets/vimplug-all.txt
cd ~/.cache/vim/plug/repos/
if [[ -e ${basepath}/assets/vimplug-submodules.txt ]]; then
  rm ${basepath}/assets/vimplug-submodules.txt
  touch ${basepath}/assets/vimplug-submodules.txt
fi
for item in $(ls ~/.cache/vim/plug/repos/); do
  if [[ $(
    ls -a ${item} | grep '.gitmodules' > /dev/null
    echo $?
  ) == 0 ]]; then
    echo "${item}" >> ${basepath}/assets/vimplug-submodules.txt
  fi
done
