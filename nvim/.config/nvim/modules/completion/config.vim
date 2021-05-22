let g:coc_global_extensions =[
            \'coc-marketplace',
            \ 'coc-snippets',
            \ 'coc-pairs',
            \ 'coc-json',
            \ 'coc-highlight',
            \ 'coc-emoji',
            \ 'coc-lists',
            \ 'coc-stylelint',
            \ 'coc-yaml',
            \ 'coc-gitignore',
            \ 'coc-yank',
            \ 'coc-actions',
            \ 'coc-db',
            \ 'coc-spell-checker',
            \ 'coc-vimlsp',
            \ 'coc-explorer',
            \ 'coc-tsserver',
            \ 'coc-eslint',
            \ 'coc-prettier',
            \ 'coc-tslint-plugin',
            \ 'coc-docthis',
            \ 'coc-html',
            \ 'coc-css',
            \ 'coc-pyright',
            \ 'coc-tabnine',
            \ 'coc-java',
            \]


" let g:coc_snippet_next = '<TAB>'
" let g:coc_snippet_prev = '<S-TAB>'
let g:coc_status_error_sign = '•'
let g:coc_status_warning_sign = '•'



"Use tab for trigger completion with characters ahead and navigate
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" " Use <c-space> to trigger completion.
" if has('nvim')
"   inoremap <silent><expr> <c-space> coc#refresh()
" else
"   inoremap <silent><expr> <c-@> coc#refresh()
" endif
" use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" NOTE: Anaconda
if $CONDA_PREFIX == ""
    let s:current_python_path=$CONDA_PYTHON_EXE
else
    let s:current_python_path=$CONDA_PREFIX.'/bin/python'
endif
call coc#config('python', {'pythonPath': s:current_python_path})


"-------------------------------"
"     Coc Core Keymap           "
"-------------------------------"

" Use [e and ]e for navigate diagnostics
nmap <silent> ]g <Plug>(coc-diagnostic-prev)
nmap <silent> [g <Plug>(coc-diagnostic-next)
" Remap keys for gotos
nmap <silent> gd :<C-u>call initself#definition_other_window()<CR>
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K for show documentation in float window
nnoremap <silent> K :call CocActionAsync('doHover')<CR>

" Remap for rename current word
nmap <Leader>cn <Plug>(coc-rename)

" Use :Format for format current buffer
command! -nargs=0 Format :call CocAction('format')
" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
" Add :OR command for organize imports of the current buffer.
command! -nargs=0 OR  :call CocAction('runCommand', 'editor.action.organizeImport')
" nnoremap <silent> <Leader>co :<C-u>OR<CR>

" Remap for format selected region
vmap <Leader>cf  <Plug>(coc-format-selected)
nmap <Leader>cf  <Plug>(coc-format-selected)

augroup coc_event
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" <========
" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
    execute 'CocCommand actions.open ' . a:type
endfunction
xmap <silent> <Leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <Leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@

" <========

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>A  <Plug>(coc-codeaction-selected)
nmap <leader>A  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <Leader>F  <Plug>(coc-fix-current)

" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)
nmap gcj :execute 'CocCommand docthis.documentThis'<CR>


" <========
" " float window scroll
" nnoremap <expr><C-f> coc#util#has_float() ? coc#util#float_scroll(1) : "\<C-f>"
" nnoremap <expr><C-b> coc#util#has_float() ? coc#util#float_scroll(1) : "\<C-b>"

" =========

"  Remap <C-f> and <C-b> for scroll float windows/popups.
"if has('nvim-0.4.0') || has('patch-8.2.0750')
"  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
"  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
"  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
"  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
"  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
"  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
"endif
" ========>

" " Use <CTRL-S> for selections ranges.
" " NOTE: Requires 'textDocument/selectionRange' support from the language server.
" " coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)


" nmap ]g <Plug>(coc-git-prevchunk)
" nmap [g <Plug>(coc-git-nextchunk)
" " show chunk diff at current position
" nmap <Leader>gi <Plug>(coc-git-chunkinfo)
" " show commit contains current position
" nmap <Leader>gm <Plug>(coc-git-commit)

" multiple cursors
" nmap <silent><M-s> <Plug>(coc-cursors-position)
" nmap <expr> <silent><M-d> initself#select_current_word()
" xmap <silent><M-d> <Plug>(coc-cursors-range)
" nmap <silent><M-c>  <Plug>(coc-cursors-operator)


" <========
" Mappings for CoCList
" Show all diagnostics.
" nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" " Manage extensions.
" nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" " Show commands.
" nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" " Find symbol of current document.
" nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" " Search workspace symbols.
" nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" " Do default action for next item.
" nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" " Do default action for previous item.
" nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" " Resume latest coc list.
" nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" =========

" Do default action for next item.
nmap <silent> [a  :<C-u>CocNext<CR>
" Do default action for previous item.
nmap <silent> ]a  :<C-u>CocPrev<CR>
nnoremap  <Leader>fz :<C-u>CocSearch -w<Space>
" ========>
