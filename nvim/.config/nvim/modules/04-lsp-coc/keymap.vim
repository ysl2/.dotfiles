" ===
" === coc: The core coc Keymap locates in completion/config.vim
" ===
noremap <C-p> :CocList vimcommands<CR>
noremap <C-[> :CocList maps<CR>
" noremap <C-p> :CocCommand<CR>


" ===
" === coc-explorer
" ===
nmap <silent> \e :CocCommand explorer --toggle --root-strategies cwd<CR>


