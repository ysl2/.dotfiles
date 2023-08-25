set number
set relativenumber
set shortmess+=I
set ignorecase
set smartcase
let &tabstop=4
set expandtab
set nowrap
set noswapfile
set incsearch
set autoindent
set splitright
set splitbelow
if has('nvim') || v:version >= 800
    set termguicolors
endif
set guicursor=
colorscheme default
set cursorline
if has('nvim')
    set exrc
endif
language en_US.utf8

inoremap <C-c> <C-[>

autocmd FileType json,markdown,html,css let &tabstop=2
autocmd FileType * let &shiftwidth=&tabstop
autocmd VimEnter * silent! NoMatchParen
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
autocmd BufWritePre * silent! :call TrimWhitespace()
autocmd BufWritePre * set ff=unix
