set number
set relativenumber
set shortmess+=I
set ignorecase
set smartcase
let &tabstop=4
set expandtab
autocmd FileType json,markdown,html,css let &tabstop=2
autocmd FileType * let &shiftwidth=&tabstop
set nowrap
set noswapfile
set incsearch
set autoindent
set smartindent
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
autocmd BufWritePre * set ff=unix
language en_US.utf8

inoremap <C-c> <C-[>
tnoremap <A-[> <C-\><C-n>
nnoremap <C-a> <Nop>
nnoremap <C-i> <C-a>
vnoremap <C-a> <Nop>
vnoremap <C-i> <C-a>

autocmd VimEnter * silent! NoMatchParen
function! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
autocmd BufWritePre * silent! :call TrimWhitespace()
function! InsertOnTerminal()
    if &buftype ==# "terminal"
        normal i
    endif
endfunction
autocmd! BufEnter * call InsertOnTerminal()
if has('nvim')
    autocmd! TermOpen * call InsertOnTerminal()
endif
