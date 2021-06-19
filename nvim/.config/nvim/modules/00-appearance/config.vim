" ===
" === xtabline
" ===
let g:xtabline_settings = {}
let g:xtabline_settings.enable_mappings = 0
let g:xtabline_settings.tabline_modes = ['tabs', 'buffers']
let g:xtabline_settings.enable_persistance = 0
let g:xtabline_settings.last_open_first = 1


" ===
" === lightline.vim
" ===
let g:lightline = get(g:, 'lightline', {})
let g:lightline.active = get(g:, 'lightline.active', {})

let g:lightline.active.left =  [
            \   [ 'mode', 'paste' ],
            \   [ 'gitstatus', 'readonly', 'filename', 'modified' ]
            \ ]

" NOTE: Default is the theme name. check `autoload/theme.vim`, the variable `g:colors_name` is defined in this file.
let g:lightline.colorscheme = colors_name

" let g:lightline.mode_map = {
" \   'n' : 'Normal',
" \   'i' : 'Insert',
" \   'R' : 'Replace',
" \   'v' : 'Visual',
" \   'V' : 'V-Line',
" \   "\<C-v>": 'V-Block',
" \   'c' : 'Command',
" \   's' : 'Select',
" \   'S' : 'S-Line',
" \   "\<C-s>": 'S-Block',
" \   't': 'Terminal',
" \ }
let g:lightline.mode_map = {
            \   'n' : ' Mute',
            \   'i' : ' Talk',
            \   'R' : '﯒ Swap',
            \   'v' : ' Pick',
            \   'V' : ' Pick',
            \   "\<C-v>": ' Pick',
            \   'c' : ' Call',
            \   's' : 'Select',
            \   'S' : 'S-Line',
            \   "\<C-s>": 'S-Block',
            \   't': ' Term',
            \ }

let g:lightline.component = get(g:, 'lightline.component', {})

" %3l is right aligned padding for 3 digits for current row. -2v is left
" aligned padding for current column
let g:lightline.component.lineinfo = " %3l 並%-2v"
" let g:lightline.component.lineinfo = " %3l הּ %-2v"

let g:lightline.component_function = get(g:, 'lightline.component_function', {})

let LightlineReadonly = {-> &readonly ? "" : ''}
let g:lightline.component_function.readonly = 'LightlineReadonly'

let LightlineFiletype = {->
            \   winwidth(0) <= 70   ? '' :
            \   !strlen(&filetype)  ? '' :
            \
            \   &filetype . (exists('*WebDevIconsGetFileTypeSymbol')
            \       ? ' ' . WebDevIconsGetFileTypeSymbol() : ''
            \   )
            \ }
let g:lightline.component_function.filetype = 'LightlineFiletype'

let LightlineFileformat = {->
            \   winwidth(0) <= 70   ? '' :
            \
            \   &fileformat . (exists('*WebDevIconsGetFileFormatSymbol')
            \       ? ' ' . WebDevIconsGetFileFormatSymbol() : ''
            \   )
            \ }
let g:lightline.component_function.fileformat = 'LightlineFileformat'

" function! MyFilename()
"     return (&ft == 'vimfiler' ? vimfiler#get_status_string() :
"         \  &ft == 'unite' ? unite#get_status_string() :
"         \  &ft == 'vimshell' ? substitute(b:vimshell.current_dir,expand('~'),'~','') :
"         \ '' != expand('%:p') ? expand('%:p') : '[No Name]')
" endfunction
" let g:lightline.component_function.filename = 'MyFilename'


" =============================
" === indent-blankline.nvim ===
" =============================
let g:indent_blankline_char = "│"
" let g:indent_blankline_show_first_indent_level = v:true
let g:indent_blankline_filetype_exclude = [
            \"startify",
            \"dashboard",
            \"dotooagenda",
            \"log",
            \"fugitive",
            \"gitcommit",
            \"packer",
            \"vimwiki",
            \"markdown",
            \"json",
            \"txt",
            \"vista",
            \"help",
            \"todoist",
            \"NvimTree",
            \"peekaboo",
            \"git",
            \"TelescopePrompt",
            \"undotree",
            \"flutterToolsOutline"
            \]
let g:indent_blankline_buftype_exclude = ["terminal", "nofile"]
" let g:indent_blankline_show_trailing_blankline_indent = v:false
" let g:indent_blankline_show_current_context = v:true
" let g:indent_blankline_context_patterns = [
"             \"class",
"             \"function",
"             \"method",
"             \"block",
"             \"list_literal",
"             \"selector",
"             \"^if",
"             \"^table",
"             \"if_statement",
"             \"while",
"             \"for"
"             \]
autocmd CursorMoved * :IndentBlanklineRefresh



" ===============
" === rainbow ===
" ===============
" ((((((()))))))
let g:rainbow_active = 1
let g:rainbow_conf = {
            \   'guifgs': ['#FFE66F', '#00FFFF', '#46A3FF', '#AAAAFF', '#FFB5B5'],
            \   'ctermfgs': ['lightyellow', 'lightcyan','lightblue', 'lightmagenta'],
            \   'operators': '_,_',
            \   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
            \}



" ==================
" === indentLine ===
" ==================
" let g:indentLine_enabled = 1
" let g:indentLine_char='┆'
" let g:indentLine_fileTypeExclude = ['defx', 'denite','startify','tagbar','vista_kind','vista','coc-explorer','dashboard' ]
" let g:indentLine_concealcursor = 'niv'
" let g:indentLine_showFirstIndentLevel =1
" let g:indentLine_conceallevel = 1



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
"             \ 'book_marks' : 'SPC f m',
"             \ 'change_colorscheme' : 'SPC f c',
"             \ 'find_file' : 'SPC f f',
"             \ 'find_history' : 'SPC f h',
"             \ 'find_word' : 'SPC f a',
"             \ 'last_session' : 'SPC s l',
"             \ 'new_file' : 'SPC c n',
"             \ }
" " let g:dashboard_custom_header = [
" "             \ '██████████████████  ████████',
" "             \ '██████████████████  ████████',
" "             \ '██████████████████  ████████',
" "             \ '████████            ████████',
" "             \ '████████  ████████  ████████',
" "             \ '████████  ████████  ████████',
" "             \ '████████  ████████  ████████',
" "             \ '████████  ████████  ████████',
" "             \ '████████  ████████  ████████',
" "             \ '████████  ████████  ████████',
" "             \ '████████  ████████  ████████',
" "             \ '████████  ████████  ████████',
" "             \ '████████  ████████  ████████'
" "             \]
" let g:dashboard_custom_header = [
"             \'                                                                    ',
"             \'      ███████████           █████      ██                     ',
"             \'     ███████████             █████                             ',
"             \'     ████████████████ ███████████ ███   ███████     ',
"             \'    ████████████████ ████████████ █████ ██████████████   ',
"             \'   █████████████████████████████ █████ █████ ████ █████   ',
"             \' ██████████████████████████████████ █████ █████ ████ █████  ',
"             \'██████  ███ █████████████████ ████ █████ █████ ████ ██████ ',
"             \'██████   ██  ███████████████   ██ █████████████████ ',
"             \'██████   ██  ███████████████   ██ █████████████████ ',
"             \]
" let g:dashboard_footer_icon = ' '

" let g:dashboard_preview_command = 'cat'
" let g:dashboard_preview_file = '~/.dotfiles/nvim/.config/nvim/static/neovim.cat_'
" let g:dashboard_preview_pipeline = 'lolcat -F 0.3'
" let g:dashboard_preview_file_height = 11
" let g:dashboard_preview_file_width = 80


" ===
" === spaceline.vim
" ===
" let g:spaceline_seperate_style= 'slant'
" let g:spaceline_colorscheme = 'space'


