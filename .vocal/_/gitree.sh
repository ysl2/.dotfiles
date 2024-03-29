#!/bin/bash
# TODO:
# https://stackoverflow.com/a/77058378

case $1 in
    --ls)
        shift
        ls --color=auto -ld $(git ls-tree -rt $(git branch | grep \* | cut -d " " -f2) --name-only)
        ;;
    *)
        shift
        /usr/bin/git ls-tree --full-tree --name-only -r HEAD "$@" | tree -C --fromfile .
        ;;
esac
