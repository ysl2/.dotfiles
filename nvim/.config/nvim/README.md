# YuSoLi's Nvim Dotfiles

## Note

1. There are no load sequence in `modules`.

    Just for easier manage plugins.

2. The theme config file locates in `~/.cache/vim/theme.txt`

## Plugin Config (legacy)

```text
// dein -> vim-plug
// dashboard -> StartScreenPlugin -> startify
// spaceline -> statusline -> airline
// vim-buffet -> bufferline
// defx -> coc-explorer
// vim-clap -> fuzzyfind
editorconfig -> file format
// Caw.vin -> vim-commentary
// vista -> function navigation
// vim-gutentags -> generate ctags
// vim-quickrun -> run programs in vim
// vim-floterm -> float terminal
// vim-mundo -> vim undo tree
// vim-sandwich -> vim-surround
// vim-fugitive -> version control

" ===================
" === plugin list ===
" ===================

" ===
" === vimplug plugins
" ===

call plug#begin('~/.config/nvim/plugged')
" 括号自动匹配
Plug 'https://hub.fastgit.org/jiangmiao/auto-pairs.git'

" 格式化代码（不限语言）
" Plug 'https://hub.fastgit.org/chiel92/vim-autoformat.git'
Plug 'https://hub.fastgit.org/google/vim-maktaba.git'
Plug 'https://hub.fastgit.org/google/vim-codefmt.git'

" 不知道干嘛的。与美化相关
Plug 'https://hub.fastgit.org/wincent/terminus.git'

call plug#end()

" ===
" === coc plugins list
" ===

let g:coc_global_extensions = [
\'coc-clangd',
\'coc-cmake',
\'coc-emmet',
\'coc-java',
\'coc-json',
\'coc-sh',
\'coc-syntax',
\]
```
