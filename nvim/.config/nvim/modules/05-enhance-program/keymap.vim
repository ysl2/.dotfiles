" ===
" === vim-mundo
" ===
nnoremap <silent> \u :MundoToggle<CR>


" ===
" === codefmt
" ===
" noremap <leader>= :FormatCode<CR>

" ===
" === vim-autoformat
" ===
noremap <leader>= :Autoformat<CR>


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
