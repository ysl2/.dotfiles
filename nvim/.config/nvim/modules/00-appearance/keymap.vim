" =====================
" === 01-appearance ===
" =====================


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


" ===
" === indent-blankline.vim
" ===
nnoremap <silent> <Leader>\ :IndentBlanklineToggle<CR>
