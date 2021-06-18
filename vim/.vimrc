" ===============
" === general ===
" ===============

" ===
" === ui settings
" ===
set nocompatible
syntax on
set number
set relativenumber
set splitright
set splitbelow
set showtabline=2
set showcmd
set hidden
set cursorline
set lazyredraw
" set termguicolors
set ttyfast
set wildmenu


" ===
" === search & replace
" ===
set incsearch
set hlsearch
exec "nohlsearch"
set ignorecase
set smartcase


" ===
" === indent
" ===
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=-1
set smarttab
set shiftwidth=4
set smartindent
set virtualedit=block
set whichwrap=b,h,l

" ===
" === backup & restore
" ===
set noswapfile



" ==============
" === keymap ===
" ==============

let mapleader=' '

inoremap <C-c> <ESC>

noremap <leader>M :w<CR>:source ~/.vimrc<CR>
noremap <leader>m :tabe ~/.vimrc<CR>

