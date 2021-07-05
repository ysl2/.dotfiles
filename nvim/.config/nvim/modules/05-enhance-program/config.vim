" ===
" === vim-dadbod & vim-dadbod-ui
" ===
let g:db_ui_show_help = 0
let g:db_ui_win_position = 'left'
let g:db_ui_use_nerd_fonts = 1
let g:db_ui_winwidth = 35
let g:db_ui_save_location = $DATA_PATH . '/db_ui_queries'
let g:dbs = initself#load_db_from_env()


" ===
" === vista
" ===
let g:vista#renderer#enable_icon = 1
let g:vista_disable_statusline = 1
let g:vista_default_executive = 'ctags'
let g:vista_echo_cursor_strategy = 'floating_win'
let g:vista_vimwiki_executive = 'markdown'
let g:vista_executive_for = {
      \ 'vimwiki': 'markdown',
      \ 'pandoc': 'markdown',
      \ 'markdown': 'toc',
      \ 'yaml': 'coc',
      \ 'typescript': 'coc',
      \ 'typescriptreact': 'coc',
      \ }


" ===
" === gutentags
" ===
let g:gutentags_cache_dir = $DATA_PATH . '/tags'
let g:gutentags_project_root = ['.root', '.git', '.svn', '.hg', '.project','go.mod','/usr/local', 'package.json',]
let g:gutentags_generate_on_write = 1
let g:gutentags_generate_on_missing = 1
" let g:gutentags_generate_on_new = 1
let g:gutentags_generate_on_new = 0
" let g:gutentags_generate_on_empty_buffer = 0
" let g:gutentags_ctags_extra_args = ['--tag-relative=yes', '--fields=+ailmnS']
let g:gutentags_ctags_extra_args = ['--output-format=e-ctags']
let g:gutentags_add_default_project_roots = 0
let g:gutentags_exclude_filetypes = [ 'defx', 'denite', 'vista', 'magit', 'gitcommit', 'gitconfig', 'gitrebase', 'gitsendemail', 'git' ]
" let g:gutentags_ctags_exclude = ['*.json', '*.js', '*.ts', '*.jsx', '*.css', '*.less', '*.sass', '*.go', '*.dart', 'node_modules', 'dist', 'vendor']
let g:gutentags_ctags_exclude = [
      \  '*.git', '*.svn', '*.hg',
      \  'cache', 'build', 'dist', 'bin', 'node_modules', 'bower_components',
      \  '*-lock.json',  '*.lock',
      \  '*.min.*',
      \  '*.bak',
      \  '*.zip',
      \  '*.pyc',
      \  '*.class',
      \  '*.sln',
      \  '*.csproj', '*.csproj.user',
      \  '*.tmp',
      \  '*.cache',
      \  '*.vscode',
      \  '*.pdb',
      \  '*.exe', '*.dll', '*.bin',
      \  '*.mp3', '*.ogg', '*.flac',
      \  '*.swp', '*.swo',
      \  '.DS_Store', '*.plist',
      \  '*.bmp', '*.gif', '*.ico', '*.jpg', '*.png', '*.svg',
      \  '*.rar', '*.zip', '*.tar', '*.tar.gz', '*.tar.xz', '*.tar.bz2',
      \  '*.pdf', '*.doc', '*.docx', '*.ppt', '*.pptx', '*.xls',
      \]


" ===
" === vim-quickrun
" ===
" let g:quickrun_config = {
"             \   "_" : {
"             \       "outputter" : "message",
"             \   },
"             \}
" let g:quickrun_no_default_key_mappings = 1


" ===
" === vim-quickrun-runner-nvimterm
" ===
" let g:quickrun_config._ = {
"             \"_" : {
"             \       "outputter" : "message",
"             \       "runner/nvimterm/into": 1
"             \}
"             \ }
" if has('nvim')
"     let g:quickrun_config._['runner'] = 'nvimterm'
" endif


" ===
" === quickrun.vim
" ===
" You can add .quickrun file into your project folder and write your shell there. The plugin will find that file and run commands there.
let g:quickrun_known_file_types = {
      \"cpp": ["!g++ %", "./a.out"],
      \"c": ["!gcc %", "./a.out"],
      \"php": ["!php %"],
      \"vim": ["source %"],
      \"py": ["!python %"],
      \"go": ["!go test"],
      \"sh": ["!time bash %"]
      \}


" ===
" === vimspector
" ===
" 此插件设置参考：https://www.5axxw.com/wiki/content/jifl0q
" 此插件需要在项目路径下写一个`.vimspector.json`
" `.vimspector.json`文件内置变量参考：https://puremourning.github.io/vimspector/configuration.html#predefined-variables
let g:vimspector_install_gadgets = [
      \'vscode-cpptools',
      \'debugpy',
      \'vscode-bash-debug',
      \'debugger-for-chrome',
      \'vscode-java-debug',
      \]


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



" ===
" === json formatter
" ===
let g:formatters_sql = ['fixjson']


" ===
" === markdown formatter
" ===
let g:formatters_markdown = ['prettier', 'stylelint']


" ===
" === pandoc formatter
" ===
let g:formatters_pandoc = ['prettier', 'stylelint']


" ===
" === latex formatter
" ===
let g:formatdef_latexindent = '"latexindent -"'


" =================
" === Ultisnips ===
" =================
" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
" let g:UltiSnipsExpandTrigger="<cr>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"
" let g:UltiSnipsExpandTrigger = '<nop>'



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



