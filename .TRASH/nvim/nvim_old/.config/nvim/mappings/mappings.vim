" ===========================
" === global key bindings ===
" ===========================


" ===
" === normalmode keybindings
" ===

" 设置快捷键开始编译
noremap <leader>r :call CompileRunGcc()<CR>

" 个人资料与插件管理器的快捷键
noremap <leader><leader>1 :tabe ~/.dotfiles/nvim/.config/nvim/mappings/mappings.vim<CR>
noremap <leader><leader>2 :tabe ~/.dotfiles/nvim/.config/nvim/core/plugins.vim<CR>
noremap <leader><leader>3 :tabe ~/.dotfiles/nvim/.config/nvim/plugconfig/

noremap <leader><leader>- :tabe ~/.dotfiles/nvim/.config/nvim/coc-settings.json<CR>
noremap <leader><leader>= :tabe ~/.config/coc/extensions/package.json<CR>

noremap <leader><leader><TAB> :tabe ~/.dotfiles/nvim/.config/nvim/

" source $MYVIMRC
noremap <leader><leader>` :terminal ~/.dotfiles/nvim/.config/nvim/_flush-all-config.sh<CR>
noremap <leader><leader>m :w<CR>:source ~/.dotfiles/nvim/.config/nvim/init.vim<CR>
noremap <leader><leader>M :w<CR>:source ~/.dotfiles/nvim/.config/nvim/init.vim<CR>:PlugClean!<CR>:PlugInstall<CR>:CocUpdate<CR>

" vim-plug相关快捷键
" noremap <leader>PI :PlugInstall<CR>
" noremap <leader>PU :PlugUpdate<CR>
" noremap <leader>PC :PlugClean<CR>
" noremap <leader>PP :PlugUpgrade<CR>
" noremap <leader>PS :PlugStatus<CR>
" noremap <leader>PD :PlugDiff<CR>
" noremap <leader>PN :PlugSnapshot<CR>

" coc相关快捷键
noremap <leader>CI :CocInstall<CR>
noremap <leader>CU :CocUninstall<CR>
noremap <C-]> :CocList<CR>
noremap <C-p> :CocCommand<CR>


" 复制到系统剪贴板
"vnoremap fy :w !xclip -i -sel c<CR>

" sudo 写入
" noremap :w!! :w !sudo tee %<CR>
" noremap :wq!! :w !sudo tee %<CR>:q<CR>

" 设置退出当前的 buffer
" noremap <leader>q :bd<CR>
" noremap <leader>! :bd!<CR>

" 设置清除当前搜索的高亮
" noremap <leader>c :nohlsearch<CR>

"设置分屏：sd向右、sa向左、sw向上、sx向下
"map sd :set splitright<CR>:vsplit<CR>
"map sa :set nosplitright<CR>:vsplit<CR>
"map sw :set nosplitbelow<CR>:split<CR>
"map sx :set splitbelow<CR>:split<CR>

" 调整窗口大小
" noremap <C-w><C-h> :vertical resize-5<CR>
" noremap <C-w><C-j> :res -5<CR>
" noremap <C-w><C-k> :res +5<CR>
" noremap <C-w><C-l> :vertical resize+5<CR>

"设置ft为新建标签，fd跳转前一个(向左)标签，fg向后跳转
"map ft :tabe<CR>
"map fd :-tabnext<CR>
"map fg :+tabnext<CR>

" tagbar代码浏览
"noremap <F4> :TagbarToggle<CR>


" ===
" === insertmode keybindings
" ===

" 把ctrl c映射到esc
inoremap <C-c> <esc>


" ===
" === terminalmode keybindings
" ===

" 设置使用ESC关闭terminal输入
" tnoremap <silent> <C-\> <C-\><C-n>


" -----------------------------------------------------------------------------------------------------


" ===========================
" === plugin key bindings ===
" ===========================


" ===
" === coc settings
" ===

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')
" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" yusoli: 不使用coc的格式化。coc的格式化有问题。使用vim-autoformat插件
" Remap for format selected region
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f :Format<CR>

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>A  <Plug>(coc-codeaction-selected)
nmap <leader>A  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>F  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

"  Remap <C-f> and <C-b> for scroll float windows/popups.
"if has('nvim-0.4.0') || has('patch-8.2.0750')
"  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
"  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
"  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
"  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
"  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
"  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
"endif

"" Use CTRL-S for selections ranges.
"" Requires 'textDocument/selectionRange' support of language server.
"nmap <silent> <C-s> <Plug>(coc-range-select)
"xmap <silent> <C-s> <Plug>(coc-range-select)

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


" ===
" === nerdtree
" ===

" 打开nerdtree
" map \e :NERDTreeToggle<CR>


" ===
" === vim-airline
" ===

" 设置切换tab的快捷键 <\> + <i> 切换到第i个 tab
" nmap <leader>1 <Plug>AirlineSelectTab1
" nmap <leader>2 <Plug>AirlineSelectTab2
" nmap <leader>3 <Plug>AirlineSelectTab3
" nmap <leader>4 <Plug>AirlineSelectTab4
" nmap <leader>5 <Plug>AirlineSelectTab5
" nmap <leader>6 <Plug>AirlineSelectTab6
" nmap <leader>7 <Plug>AirlineSelectTab7
" nmap <leader>8 <Plug>AirlineSelectTab8
" nmap <leader>9 <Plug>AirlineSelectTab9
"
" " 设置切换tab的快捷键 <\> + <-> 切换到前一个 tab
" nmap <leader>- <Plug>AirlineSelectPrevTab
" nmap gT <Plug>AirlineSelectPrevTab
"
" " 设置切换tab的快捷键 <\> + <+> 切换到后一个 tab
" nmap <leader>= <Plug>AirlineSelectNextTab
" nmap gt <Plug>AirlineSelectNextTab


" ===
" === vim-easymotion
" ===

nmap <leader><leader>/ <Plug>(easymotion-sn)


" ===
" === xtabline
" ===

noremap to :XTabCycleMode<CR>
noremap \p :echo expand('%:p')<CR>


" ===
" === fzf.vim
" ===
noremap \f :Files<CR>


" ===
" === lazygit
" ===

" setup mapping to call :LazyGit
nnoremap <silent> \g :LazyGit<CR>


" ===
" === vimspector
" ===

" 设置更新调试器的快捷键
noremap <leader>DI :VimspectorInstall<CR>
noremap <leader>DI :VimspectorUpdate<CR>

" let g:vimspector_enable_mappings = 'HUMAN'

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


" ===
" === vim-autoformat
" ===

" noremap <leader>f :Autoformat<CR>


" ===
" === vim-codefmt
" ===

noremap <leader>f :FormatCode<CR>

" ===
" === coc-explorer
" ===
nnoremap \e :CocCommand explorer<CR>



" ===
" === indentLine
" ===
noremap <leader>i :IndentLinesToggle<CR>


" ===
" === vim-gitgutter
" ===

" autocmd BufWritePost * GitGutter
nnoremap <LEADER>gf :GitGutterFold<CR>
nnoremap <LEADER>g- :GitGutterPrevHunk<CR>
nnoremap <LEADER>g= :GitGutterNextHunk<CR>


" ===
" === rnvimr
" ===

" nnoremap <silent> \r :RnvimrToggle<CR><C-\><C-n>:RnvimrResize 0<CR>
nnoremap <silent> \r :RnvimrToggle<CR>
" noremap \r :Ranger<CR>
