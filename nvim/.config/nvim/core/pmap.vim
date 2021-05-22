" ==============
" === global ===
" ==============

" TODO: No keymap yet.



" -------------------------------------------------



" ==================
" === appearance ===
" ==================


" ===
" === vim-buffet
" ===
" nnoremap ]b :<C-u>bp<CR>
" nnoremap [b :<C-u>bn<CR>
" nnoremap <silent> <Leader>bc :Bonly<CR>
" nnoremap <silent> <Leader>bx :Bw<CR>
" nmap <leader>1 <Plug>BuffetSwitch(1)
" nmap <leader>2 <Plug>BuffetSwitch(2)
" nmap <leader>3 <Plug>BuffetSwitch(3)
" nmap <leader>4 <Plug>BuffetSwitch(4)
" nmap <leader>5 <Plug>BuffetSwitch(5)
" nmap <leader>6 <Plug>BuffetSwitch(6)
" nmap <leader>7 <Plug>BuffetSwitch(7)
" nmap <leader>8 <Plug>BuffetSwitch(8)
" nmap <leader>9 <Plug>BuffetSwitch(9)
" nmap <leader>0 <Plug>BuffetSwitch(10)

" ===
" === dashboard-nvim
" ===
" NOTE: Don' t modify this.
nmap <Leader>cn :<C-u>DashboardNewFile<CR>


" ===
" === xtabline
" ===

noremap to :XTabCycleMode<CR>
noremap \p :echo expand('%:p')<CR>



" -------------------------------------------------



" ==================
" === completion ===
" ==================


" ===
" === coc: The core coc Keymap locates in completion/config.vim
" ===
" noremap <C-]> :CocList<CR>
" noremap <C-p> :CocCommand<CR>



" -------------------------------------------------



" ===============
" === enhance ===
" ===============


" ===
" === accelerated-jk
" ===
" nmap <silent>j <Plug>(accelerated_jk_gj)
" nmap <silent>k <Plug>(accelerated_jk_gk)


" ===
" === coc-explorer
" ===
nmap <silent>\e :CocCommand explorer<CR>


" ===
" === vim-mundo
" ===
nnoremap <silent> \u :MundoToggle<CR>




" ===
" === vim-floaterm
" ===
nnoremap <silent> \t :<C-u>FloatermToggle<CR>


" ===
" === indentLine
" ===
nnoremap <silent> <Leader>\ :IndentLinesToggle<CR>


" ===
" === rnvimr
" ===
nnoremap <silent> \r :RnvimrToggle<CR>


" ===
" === lazygit
" ===
nnoremap <silent> \g :LazyGit<CR>


" ===
" === codefmt
" ===
" noremap <leader>= :FormatCode<CR>

" ===
" === vim-autoformat
" ===
noremap <leader>= :Autoformat<CR>



" -------------------------------------------------



" ================
" === filetype ===
" ================


" TODO: No keymap yet.



" -------------------------------------------------



" =================
" === fuzzyfind ===
" =================


" ===
" === vim-clap
" ===
" used by dashboard
nnoremap <silent> <Leader>fb :<C-u>Clap marks<CR>
nnoremap <silent> <Leader>tc :<C-u>Clap colors<CR>
nnoremap <silent> <Leader>ff :<C-u>Clap files ++finder=rg --ignore --hidden --files<cr>
nnoremap <silent> <Leader>fh :<C-u>Clap history<CR>
nnoremap <silent> <Leader>fa :<C-u>Clap grep2<CR>
"like emacs counsel-find-file
nnoremap <silent> <Leader>bb :<C-u>Clap buffers<CR>
nnoremap <silent> <C-x><C-f> :<C-u>Clap filer<CR>
nnoremap <silent> <Leader>fg :<C-u>Clap gfiles<CR>
nnoremap <silent> <Leader>fw :<C-u>Clap grep ++query=<cword><cr>
nnoremap <silent> <Leader>fq :<C-u>Clap grep<CR>
nnoremap <silent> <Leader>fW :<C-u>Clap windows<CR>
nnoremap <silent> <Leader>fl :<C-u>Clap loclist<CR>
nnoremap <silent> <Leader>fu :<C-u>Clap git_diff_files<CR>
nnoremap <silent> <Leader>fv :<C-u>Clap grep ++query=@visual<CR>
nnoremap <silent> <Leader>oc :<C-u>Clap personalconf<CR>


" ===
" === coc-clap
" ===
" Show all diagnostics
nnoremap <silent> <Leader>ce  :Clap coc_diagnostics<CR>
" Manage extensions
nnoremap <silent> <Leader>;   :Clap coc_extensions<CR>
" Show commands
nnoremap <silent> <Leader>,   :Clap coc_commands<CR>
" Search workspace symbols
nnoremap <silent> <Leader>cs  :Clap coc_symbols<CR>
nnoremap <silent> <Leader>cS  :Clap coc_services<CR>
nnoremap <silent> <leader>ct  :Clap coc_outline<CR>



" -------------------------------------------------



" =================
" === languages ===
" =================


" TODO: No keymap yet.



" -------------------------------------------------



" ===============
" === program ===
" ===============


" ===
" === vim-dadbod & vim-dadbod-ui
" ===
nnoremap <silent> \d :DBUIToggle<CR>


" ===
" === vista.vim
" ===
nnoremap <silent> \v :<C-u>Vista!!<CR>


" ===
" === vim-quickrun
" ===
" TOTE: There are many modules use the keymap below
" Check the config.vim file
nnoremap <silent> <leader>r :w<CR>:QuickRun<CR>

" 使用quickrun插件，因此下面这个可以不用了
" 但是quickrun没法接收输入。因此这个还是留着备用吧
nnoremap <leader>R :call CompileRunGcc()<CR>


" ===
" === vim-spector
" ===
" 设置更新调试器的快捷键
noremap <leader>DI :VimspectorInstall<CR>
noremap <leader>DI :VimspectorUpdate<CR>

" 启动调试
nmap <A-t> <Plug>VimspectorContinue
" 终止调试
nmap <A-T> <Plug>VimspectorStop
" 当调试出问题时，重置调试器
nmap <A-U> <Plug>VimspectorRestart
" 切换断点
nmap <A-d> <Plug>VimspectorToggleBreakpoint
" step over
nmap <A-o> <Plug>VimspectorStepOver
" step into
nmap <A-i> <Plug>VimspectorStepInto
" step out
nmap <A-O> <Plug>VimspectorStepOut
" 执行到光标所在位置
nmap <A-I> <Plug>VimspectorRunToCursor
" move up stack
nmap <A-s> <Plug>VimspectorUpFrame
" move dowm call stack
nmap <A-S> <Plug>VimspectorDownFrame
" 计算光标下变量的值（normal模式和visual模式）
nmap <A-u> <Plug>VimspectorBalloonEval
xmap <A-u> <Plug>VimspectorBalloonEval



" -------------------------------------------------



" ===============
" === textobj ===
" ===============


" ===
" === vim-niceblock
" ===

" silent! xmap I  <Plug>(niceblock-I)
" silent! xmap gI <Plug>(niceblock-gI)
" silent! xmap A  <Plug>(niceblock-A)


" ===
" === vim-expand-region
" ===
" xmap v <Plug>(expand_region_expand)
" xmap V <Plug>(expand_region_shrink)


" ===
" === dsf.vim
" ===
" nmap dsf <Plug>DsfDelete
" nmap csf <Plug>DsfChange


" ===
" === splitjoin.vim
" ===
" nmap sj :SplitjoinJoin<CR>
" nmap sk :SplitjoinSplit<CR>


" ===
" === vim-operator-replace
" ===
" xmap p <Plug>(operator-replace)


" ===
" === vim-textobj-multiblock
" ===
" omap <silent> ab <Plug>(textobj-multiblock-a)
" omap <silent> ib <Plug>(textobj-multiblock-i)
" xmap <silent> ab <Plug>(textobj-multiblock-a)
" xmap <silent> ib <Plug>(textobj-multiblock-i)


" ===
" === vim-textobj-function
" ===
" omap <silent> af <Plug>(textobj-function-a)
" omap <silent> if <Plug>(textobj-function-i)
" xmap <silent> af <Plug>(textobj-function-a)
" xmap <silent> if <Plug>(textobj-function-i)


" ===
" === vim-easymotion
" ===
nmap <leader><leader>/ <Plug>(easymotion-sn)
" nmap gsj <Plug>(easymotion-w)
" nmap gsk <Plug>(easymotion-b)
" nmap gsf <Plug>(easymotion-overwin-f)



" -------------------------------------------------



" ===============
" === version ===
" ===============


" ===
" === vim-fugitive
" ===
nnoremap <silent> <Leader>ga :Git add %:p<CR>
nnoremap <silent> <Leader>gd :Gdiffsplit<CR>
nnoremap <silent> <Leader>gc :Git commit<CR>
nnoremap <silent> <Leader>gb :Git blame<CR>
nnoremap <silent> <Leader>gf :Gfetch<CR>
nnoremap <silent> <Leader>gs :Git<CR>
nnoremap <silent> <Leader>gp :Gpush<CR>


" ===
" === vim-gitgutter
" ===

" autocmd BufWritePost * GitGutter
" nnoremap <LEADER>gf :GitGutterFold<CR>
" nnoremap <LEADER>g- :GitGutterPrevHunk<CR>
" nnoremap <LEADER>g= :GitGutterNextHunk<CR>
