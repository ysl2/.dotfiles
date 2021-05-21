
"--------------------------"
"     vim-buffet Keymap    "
"--------------------------"

" function! g:BuffetSetCustomColors()
"   hi! BuffetCurrentBuffer    gui=NONE guibg=#50fa7b guifg=#282a36
"   hi! BuffetActiveBuffer     gui=NONE guibg=#bd93f9 guifg=#282a36
"   hi! BuffetBuffer           gui=NONE guibg=#282a36 guifg=#6272a4
"   hi! BuffetModCurrentBuffer gui=NONE guibg=#8be9fd guifg=#282a36
"   hi! BuffetModActiveBuffer  gui=NONE guibg=#ffb86c guifg=#282a36
"   hi! BuffetModBuffer        gui=NONE guibg=#ff5555 guifg=#282a36
"   hi! BuffetTrunc            gui=NONE guibg=#bd93f9 guifg=#282a36
"   hi! BuffetTab              gui=NONE guibg=#bd93f9 guifg=#282a36
" endfunction

" function! g:BuffetSetCustomColors()
"   hi! clear BuffetBuffer
"   hi! link BuffetCurrentBuffer DraculaSelection
"   hi! link BuffetTab DraculaCommentBold
" endfunction



" ===
" === dashboard-nvim
" ===
" let g:dashboard_custom_shortcut={
"             \ 'book_marks' : 'SPC f b',
"             \ 'change_colorscheme' : 'SPC t c',
"             \ 'find_file' : 'SPC f f',
"             \ 'find_history' : 'SPC f h',
"             \ 'find_word' : 'SPC f a',
"             \ 'last_session' : 'SPC s l',
"             \ 'new_file' : 'SPC c n',
"             \ }
let g:dashboard_custom_header = [
            \ '██████████████████  ████████',
            \ '██████████████████  ████████',
            \ '██████████████████  ████████',
            \ '████████            ████████',
            \ '████████  ████████  ████████',
            \ '████████  ████████  ████████',
            \ '████████  ████████  ████████',
            \ '████████  ████████  ████████',
            \ '████████  ████████  ████████',
            \ '████████  ████████  ████████',
            \ '████████  ████████  ████████',
            \ '████████  ████████  ████████',
            \ '████████  ████████  ████████'
            \]
" let g:dashboard_custom_footer = ["YuSoLi's neovim"]
let g:dashboard_footer_icon = ' '

" let g:dashboard_preview_command = 'cat'
" let g:dashboard_preview_file = '~/.dotfiles/nvim/.config/nvim/static/neovim.cat_'
" let g:dashboard_preview_pipeline = 'lolcat -F 0.3'
let g:dashboard_preview_file_height = 12
let g:dashboard_preview_file_width = 80

" ===
" === xtabline
" ===
let g:xtabline_settings = {}
let g:xtabline_settings.enable_mappings = 0
let g:xtabline_settings.tabline_modes = ['tabs', 'buffers']
let g:xtabline_settings.enable_persistance = 0
let g:xtabline_settings.last_open_first = 1


" ===
" === spaceline.vim
" ===
" let g:spaceline_seperate_style= 'slant'
" let g:spaceline_colorscheme = 'space'


" ===
" === lightline.vim
" ===
let g:lightline = {
            \ 'colorscheme': 'nord',
            \ }

