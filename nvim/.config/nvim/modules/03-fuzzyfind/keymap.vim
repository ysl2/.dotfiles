" ===
" === fzf
" ===
" Reference: https://github.com/junegunn/fzf.vim/pull/628#issuecomment-766440334
inoremap <expr> <c-x><c-f> fzf#vim#complete("fd <Bar> xargs realpath --relative-to " . expand("%:h"))


" ====================
" === 03-fuzzyfind ===
" ====================

" " ===
" " === vim-clap
" " ===
" " used by dashboard
" nnoremap <silent> <Leader>fm :<C-u>Clap marks<CR>
" nnoremap <silent> <Leader>fc :<C-u>Clap colors<CR>
" nnoremap <silent> <Leader>ff :<C-u>Clap files ++finder=rg --ignore --hidden --files<cr>
" nnoremap <silent> <Leader>fh :<C-u>Clap history<CR>
" nnoremap <silent> <Leader>fa :<C-u>Clap grep2<CR>
" "like emacs counsel-find-file
" nnoremap <silent> <Leader>fB :<C-u>Clap buffers<CR>
" nnoremap <silent> <Leader>fC :<C-u>Clap personalconf<CR>
" nnoremap <silent> <Leader>fW :<C-u>Clap windows<CR>
" " nnoremap <silent> <Leader>fw :<C-u>Clap grep ++query=<cword><cr>
" nnoremap <silent> <leader>fi :<C-u>Clap filer<CR>
" nnoremap <silent> <Leader>fg :<C-u>Clap gfiles<CR>
" " nnoremap <silent> <Leader>fq :<C-u>Clap grep<CR>
" " nnoremap <silent> <Leader>fl :<C-u>Clap loclist<CR>
" " nnoremap <silent> <Leader>fu :<C-u>Clap git_diff_files<CR>
" " nnoremap <silent> <Leader>fv :<C-u>Clap grep ++query=@visual<CR>
"
"
" " ===
" " === coc-clap
" " ===
" " Show all diagnostics
" nnoremap <silent> <Leader>ce  :Clap coc_diagnostics<CR>
" " Manage extensions
" nnoremap <silent> <Leader>;   :Clap coc_extensions<CR>
" " Show commands
" nnoremap <silent> <Leader>,   :Clap coc_commands<CR>
" " Search workspace symbols
" nnoremap <silent> <Leader>cs  :Clap coc_symbols<CR>
" nnoremap <silent> <Leader>cS  :Clap coc_services<CR>
" nnoremap <silent> <leader>ct  :Clap coc_outline<CR>

