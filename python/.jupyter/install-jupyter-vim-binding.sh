#!/bin/bash
# 在 jupyter 中使用 vim 快捷键
mkdir -p $(jupyter --data-dir)/nbextensions
cd $(jupyter --data-dir)/nbextensions
git clone https://hub.fastgit.org/ysl2/jupyter-vim-binding.git
jupyter nbextension enable jupyter-vim-binding/vim_binding

