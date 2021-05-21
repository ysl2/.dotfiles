"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++
" __   __     ____        _     _ _
" \ \ / /   _/ ___|  ___ | |   (_| )___
"  \ V / | | \___ \ / _ \| |   | |// __|
"   | || |_| |___) | (_) | |___| | \__ \
"   |_| \__,_|____/ \___/|_____|_| |___/
"
"  _   ___     _____ __  __ ____   ____
" | \ | \ \   / /_ _|  \/  |  _ \ / ___|
" |  \| |\ \ / / | || |\/| | |_) | |
" | |\  | \ V /  | || |  | |  _ <| |___
" |_| \_|  \_/  |___|_|  |_|_| \_\\____|
"
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++

" =====================================
" === Auto load for first time uses ===
" =====================================

if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !mkdir -p ~/.config/nvim/autoload
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \  https://cdn.jsdelivr.net/gh/junegunn/vim-plug@master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
endif

" set backupdir
silent !mkdir -p ~/.config/nvim/tmp/backup
silent !mkdir -p ~/.config/nvim/tmp/undo
"silent !mkdir -p ~/.config/nvim/tmp/sessions
set backupdir=~/.config/nvim/tmp/backup,.
set directory=~/.config/nvim/tmp/backup,.
if has('persistent_undo')
	set undofile
	set undodir=~/.config/nvim/tmp/undo,.
endif



" ====================
" === source files ===
" ====================

let $root = fnamemodify(expand('<sfile>'), ':h')


" ===
" === source core/*
" ===

for file in split(glob("$root/core/*.vim"), '\n')
    execute 'source' file
endfor


" ===
" === source functions/*
" ===

for file in split(glob("$root/functions/*.vim"), '\n')
    execute 'source' file
endfor

" ===
" === source plugconfig/*
" ===

for file in split(glob("$root/plugconfig/[[:alnum:]]*.vim"), '\n')
    execute 'source' file
endfor



" ===
" === source themes/themes.vim
" ===

source $root/themes/themes.vim


" ===
" === source mappings/mappings.vim
" ===

source $root/mappings/mappings.vim


" ===
" === load project vim configuration.
" ===

if filereadable("./project.vim")
  source ./project.vim
endif

