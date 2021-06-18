" ==================
" === indentLine ===
" ==================
" let g:indentLine_enabled = 1
" let g:indentLine_char='┆'
" let g:indentLine_fileTypeExclude = ['defx', 'denite','startify','tagbar','vista_kind','vista','coc-explorer','dashboard' ]
" let g:indentLine_concealcursor = 'niv'
" let g:indentLine_showFirstIndentLevel =1
" let g:indentLine_conceallevel = 1



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



" ==============
" === rnvimr ===
" ==============
let g:rnvimr_ex_enable = 1
let g:rnvimr_pick_enable = 1
let g:rnvimr_draw_border = 1
highlight link RnvimrNormal CursorLine

let g:rnvimr_presets = [{'width': 1.0, 'height': 1.0}]
let g:rnvimr_layout = { 'relative': 'editor',
            \ 'width': &columns,
            \ 'height': &lines,
            \ 'col': 0,
            \ 'row': 0,
            \ 'style': 'minimal' }

let g:rnvimr_action = {
            \ '<C-t>': 'NvimEdit tabedit',
            \ '<C-b>': 'NvimEdit split',
            \ '<C-v>': 'NvimEdit vsplit',
            \ 'gw': 'JumpNvimCwd',
            \ 'yw': 'EmitRangerCwd'
            \ }



" ==================================
" === codefmt: 与ctags冲突，弃用 ===
" ==================================
" augroup autoformat_settings
"   autocmd FileType bzl AutoFormatBuffer buildifier
"   autocmd FileType c,cpp,proto,javascript,arduino AutoFormatBuffer clang-format
"   autocmd FileType dart AutoFormatBuffer dartfmt
"   autocmd FileType go AutoFormatBuffer gofmt
"   autocmd FileType gn AutoFormatBuffer gn
"   autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
"   autocmd FileType java AutoFormatBuffer google-java-format
"   autocmd FileType python AutoFormatBuffer autopep8
"   autocmd FileType shell AutoFormatBuffer shfmt
"   autocmd FileType rust AutoFormatBuffer rustfmt
"   autocmd FileType vue AutoFormatBuffer prettier
" augroup END
" autocmd FileType python let b:codefmt_formatter = 'autopep8'



" ======================
" === vim-autoformat ===
" ======================

" 用于格式化
let g:autoformat_verbosemode=0

" 自定义格式化工具举例
" expand('%:p')用于输出当前文件的绝对路径


" ===
" === java formatter
" ===
let g:formatdef_google_format_java = "'google-java-format '.expand('%:p')"
" let g:formatters_java = ['google_format_java']


" ===
" === sql formatter
" ===
let g:formatdef_sqlformat = '"sqlformat --indent_width ".shiftwidth()." --keywords upper --identifiers lower -"'
let g:formatters_sql = ['sqlformat']
