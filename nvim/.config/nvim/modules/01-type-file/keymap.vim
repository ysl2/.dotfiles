" ===
" === md-img-paste
" ===
autocmd FileType markdown nnoremap <silent> <leader>p :call mdip#MarkdownClipboardImage()<CR><ESC>
autocmd FileType markdown nnoremap <buffer> <leader>r !pandoc % --pdf-engine=xelatex -o %:r.pdf

" ===
" === vim-markdown-toc
" ===
" NOTE: generate toc
" :GenToc
" NOTE: update toc
" :UpdateToc
" NOTE: remove toc
" :RemoveToc
