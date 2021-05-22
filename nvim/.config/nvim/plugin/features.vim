" ===
" === 删除行尾空格的function
" ===
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

"设置自动删除行尾空格
autocmd BufWritePre * silent! :call TrimWhitespace()


" ===
" === 自动清理缓冲区
" ===
function! CleanNoNameEmptyBuffers()
    let buffers = filter(range(1, bufnr('$')), 'buflisted(v:val) && empty(bufname(v:val)) && bufwinnr(v:val) < 0 && (getbufline(v:val, 1, "$") == [""])')
    if !empty(buffers)
        exe 'bd '.join(buffers, ' ')
    endif
endfunction

"设置自动清理缓冲区
autocmd BufLeave * silent! :call CleanNoNameEmptyBuffers()


