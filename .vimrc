" ===
" === Settings
" ===
set number
set relativenumber
set shortmess+=I
set ignorecase
set smartcase
set nowrap
" set noswapfile
set incsearch
" Ref: https://www.reddit.com/r/vim/comments/s9gqgr/smartindent_messing_with_comment_indents
" Ref: https://www.reddit.com/r/vim/wiki/vimrctips/#wiki_do_not_use_smartindent
" set smartindent
set splitright
set splitbelow
if has('nvim') || v:version >= 800
    set termguicolors
endif
set guicursor=
" set cursorline
if has('nvim')
    set exrc
endif
if has('win32') || has('win64') || (has('unix') && system('uname -s') !=# "Darwin\n")
    language en_US.UTF-8
endif
set scrolloff=1

" === Filetype settings.
set tabstop=4
set shiftwidth=4
set expandtab
autocmd BufWritePre * set ff=unix
autocmd FileType json,markdown,html,css,lua,yaml setlocal tabstop=2 shiftwidth=2
autocmd FileType c,cpp,go,gitconfig setlocal noexpandtab
autocmd BufRead,BufNewFile .gitconfig set filetype=gitconfig

" ===
" === Keymaps
" ===
inoremap <C-c> <C-[>
if has('nvim') || v:version >= 800
    tnoremap <A-[> <C-\><C-n>
endif
" Change <C-a> and <C-x> to <A-a> and <A-x> in normal and visual mode.
nnoremap <C-a> <Nop>
nnoremap <A-a> <C-a>
vnoremap <C-a> <Nop>
vnoremap <A-a> <C-a>
nnoremap <C-x> <Nop>
nnoremap <A-x> <C-x>
vnoremap <C-x> <Nop>
vnoremap <A-x> <C-x>
" Disable s key.
nnoremap s <Nop>
vnoremap s <Nop>
nnoremap S <Nop>
vnoremap S <Nop>

" === Emacs cmdline
" start of line
:cnoremap <C-A>		<Home>
" back one character
:cnoremap <C-B>		<Left>
" delete character under cursor
:cnoremap <C-D>		<Del>
" end of line
:cnoremap <C-E>		<End>
" forward one character
:cnoremap <C-F>		<Right>
" recall newer command-line
:cnoremap <C-N>		<Down>
" recall previous (older) command-line
:cnoremap <C-P>		<Up>
" back one word
:cnoremap <Esc><C-B>	<S-Left>
" forward one word
:cnoremap <Esc><C-F>	<S-Right>

" ===
" === Functions
" ===
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
