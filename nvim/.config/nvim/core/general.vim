" 设置帮助为中文
" set helplang=cn
" 设置字体
"set guifont=DroidSansMono\ Nerd\ Font\ 11


"General settins{{{
let &t_ut=''

" 使用鼠标
" set mouse=a
set mouse=nv                 " Disable mouse in command-line mode
set report=0                 " Don't report on line changes
set noerrorbells               " Trigger bell on error
set visualbell               " Use visual bell instead of beeping
set hidden                   " hide buffers when abandoned instead of unload
set fileformats=unix,dos,mac " Use Unix as the standard file type
set magic                    " For regular expressions turn magic on
set path+=**                 " Directories to search when using gf and friends
set isfname-==               " Remove =, detects filename in var=/foo/bar
set virtualedit=block        " Position cursor anywhere in visual block
set synmaxcol=2500           " Don't syntax highlight long lines
" 自动排版完成的方式
" set formatoptions-=tc
set formatoptions+=1         " Don't break lines after a one-letter word
set formatoptions-=t         " Don't auto-wrap text
set formatoptions-=o         " Disable comment-continuation (normal 'o'/'O')
if has('patch-7.3.541')
	set formatoptions+=j       " Remove comment leader when joining lines
endif

if has('vim_starting')
	set encoding=utf-8
	scriptencoding utf-8
endif

" What to save for views and sessions:
set viewoptions=folds,cursor,curdir,slash,unix
set sessionoptions=curdir,help,tabpages,winsize

if has('mac')
	let g:clipboard = {
				\   'name': 'macOS-clipboard',
				\   'copy': {
				\      '+': 'pbcopy',
				\      '*': 'pbcopy',
				\    },
				\   'paste': {
				\      '+': 'pbpaste',
				\      '*': 'pbpaste',
				\   },
				\   'cache_enabled': 0,
				\ }
endif

" if has('clipboard')
" 	set clipboard& clipboard+=unnamedplus
" endif

" Wildmenu {{{
" --------

" 命令行自动补全所使用的菜单
" set wildmenu

if has('wildmenu')
	if ! has('nvim')
		set wildmode=list:longest
	endif

	" if has('nvim')
	" 	set wildoptions=pum
	" else
	" 	set nowildmenu
	" 	set wildmode=list:longest,full
	" 	set wildoptions=tagfile
	" endif
	set wildignorecase
	set wildignore+=.git,.hg,.svn,.stversions,*.pyc,*.spl,*.o,*.out,*~,%*
	set wildignore+=*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store
	set wildignore+=**/node_modules/**,**/bower_modules/**,*/.sass-cache/*
	set wildignore+=application/vendor/**,**/vendor/ckeditor/**,media/vendor/**
	set wildignore+=__pycache__,*.egg-info,.pytest_cache,.mypy_cache/**
	set wildcharm=<C-z>  " substitue for 'wildchar' (<Tab>) in macros
endif
" }}}

" Vim Directories {{{
" ---------------

" 自动切换当前目录为当前文件所在的目录
set autochdir
" Auto change directory to current dir
autocmd BufEnter * silent! lcd %:p:h
" 打开文件时光标在上次退出的位置
au BufReadPost * if line("'\"") > 1|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

set nobackup
set nowritebackup
set undofile noswapfile
set directory=$DATA_PATH/swap//,$DATA_PATH,~/tmp,/var/tmp,/tmp
set undodir=$DATA_PATH/undo//,$DATA_PATH,~/tmp,/var/tmp,/tmp
set backupdir=$DATA_PATH/backup/,$DATA_PATH,~/tmp,/var/tmp,/tmp
set viewdir=$DATA_PATH/view/
" Use the coc-spell-checker to do this
set spellfile=~/.cache/vim/spell/en.utf-8.add

" History saving
set history=2000

if has('nvim') && ! has('win32') && ! has('win64')
	set shada=!,'300,<50,@100,s10,h
else
	set viminfo='300,<10,@50,h,n$DATA_PATH/viminfo
endif

augroup user_persistent_undo
	autocmd!
	au BufWritePre /tmp/*          setlocal noundofile
	au BufWritePre COMMIT_EDITMSG  setlocal noundofile
	au BufWritePre MERGE_MSG       setlocal noundofile
	au BufWritePre *.tmp           setlocal noundofile
	au BufWritePre *.bak           setlocal noundofile
augroup END

" If sudo, disable vim swap/backup/undo/shada/viminfo writing
if $SUDO_USER !=# '' && $USER !=# $SUDO_USER
			\ && $HOME !=# expand('~'.$USER)
			\ && $HOME ==# expand('~'.$SUDO_USER)

	set noswapfile
	set nobackup
	set noundofile
	if has('nvim')
		set shada="NONE"
	else
		set viminfo="NONE"
	endif
endif

" Secure sensitive information, disable backup files in temp directories
if exists('&backupskip')
	set backupskip+=/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*
	set backupskip+=.vault.vim
endif

" Disable swap/undo/viminfo/shada files in temp directories or shm
augroup user_secure
	autocmd!
	silent! autocmd BufNewFile,BufReadPre
				\ /tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*,.vault.vim
				\ setlocal noswapfile noundofile nobackup nowritebackup viminfo= shada=
augroup END

" }}}

" Tabs and Indents {{{
" ----------------

" 取消自动折行
" set textwidth=0
set textwidth=80    " Text width maximum chars before wrapping
" 是否将tab键替换成空格（是：expandtab | 否：noexpandtab）
set expandtab     " Don't expand tabs to spaces
" 设置TAB键长度为4
set tabstop=4       " The number of spaces a tab is
" 设定 << 和 >> 命令移动时的宽度为 4
set shiftwidth=4    " Number of spaces to use in auto(indent)
set softtabstop=-1  " Automatically keeps in sync with shiftwidth
set smarttab        " Tab insert blanks according to 'shiftwidth'
" 自动缩进
set autoindent      " Use same indenting on new lines
set smartindent     " Smart autoindenting on new lines
set shiftround      " Round indent to multiple of 'shiftwidth'
" 得到一行的缩进位置的表达式
" set indentexpr=

if exists('&breakindent')
	set breakindentopt=shift:2,min:20
endif

" }}}

" Timing {{{
" ------
" 键盘代码超时时间
" set ttimeoutlen=0
" set notimeout
set timeout ttimeout
set timeoutlen=1000   " Time out on mappings
set ttimeoutlen=10   " Time out on key codes
" 刷新交换文件所需的毫秒数
set updatetime=100   " Idle time to write swap and trigger CursorHold
set redrawtime=1500  " Time in milliseconds for stopping display redraw
" 不要在宏的执行过程中重绘屏幕,可以让宏更快一些
set lazyredraw
"should vlmake scrolling faster
set ttyfast


" }}}

" Searching {{{
" ---------
" 搜索忽略大小写
set ignorecase    " Search ignoring case
" 智能大小写，搜索时不区分大小写
set smartcase     " Keep case when searching with *
set infercase     " Adjust case in insert completion mode
" 边输入边高亮
set incsearch     " Incremental search
set wrapscan      " Searches wrap around the end of the file
" 搜索内容高亮
set hlsearch      " Highlight search results
" 清除上一次的搜索，不清除上次搜索的高亮还会显示
exec "nohlsearch"


set complete=.,w,b,k  " C-n completion: Scan buffers, windows and dictionary

" inccommand能够实时显示ex命令会造成的改变
set inccommand=split
" if exists('+inccommand')
" 	set inccommand=nosplit
" endif

if executable('rg')
	set grepformat=%f:%l:%m
	let &grepprg = 'rg --vimgrep' . (&smartcase ? ' --smart-case' : '')
elseif executable('ag')
	set grepformat=%f:%l:%m
	let &grepprg = 'ag --vimgrep' . (&smartcase ? ' --smart-case' : '')
endif

" }}}

" Behavior {{{
" --------
" 突出显示当前行
" set cursorline
set autoread                    " Auto readfile
" 设置允许行超过当前屏幕（wrap | nowrap）
" 这个不是格式化的时候自动折行，而是当行超过屏幕的时候。将此行分为多行显示
" 如果设置成nowrap，一整段话将不会折行，无限向右显示。这会导致一行非常长。因此建议设置此项为`wrap`
set wrap                      " No wrap by default
set linebreak                   " Break long lines at 'breakat'
" set breakat=\ \	;:,!?           " Long lines break chars
set nostartofline               " Cursor in same column for few commands
" 允许backspace和光标键跨越行边界
set whichwrap+=h,l,<,>,[,],~    " Move to following line on certain keys
set splitbelow splitright       " Splits open bottom right
set switchbuf=useopen,vsplit    " Jump to the first open window
" 设置BackSpace正常处理indent, eol, start等
" set backspace=2
set backspace=indent,eol,start  " Intuitive backspacing in insert mode
set diffopt=filler,iwhite       " Diff mode: show fillers, ignore whitespace
" 插入模式补全使用的选项
" set completeopt=longest,noinsert,menuone,noselect,preview
set completeopt=menu,menuone    " Always show menu, even for one item
set completeopt+=noselect,noinsert

if exists('+completepopup')
	set completeopt+=popup
	set completepopup=height:4,width:60,highlight:InfoPopup
endif

if has('patch-8.1.0360') || has('nvim-0.4')
	set diffopt+=internal,algorithm:patience
	" set diffopt=indent-heuristic,algorithm:patience
endif
" }}}

" Editor UI {{{
set termguicolors       " Enable true color
set number              " Show number
set relativenumber      " Show relative number
" 显示当前模式
set noshowmode          " Don't show mode on bottom
set noruler             " Disable default status ruler
" 缩短消息长度的标志位列表
" set shortmess+=c
set shortmess=aFc
" 光标上下的最少行数
set scrolloff=4         " Keep at least 2 lines above/below
set fillchars+=vert:\|  " add a bar for vertical splits
set fcs=eob:\           " hide ~ tila
" 设置空白字符的视觉提示
set list
set listchars=tab:\|\ ,trail:▫
" set listchars=tab:»·,nbsp:+,trail:·,extends:→,precedes:←

set title
" Title length.
set titlelen=95
" Title string.
let &g:titlestring="
			\ %{expand('%:p:~:.')}%(%m%r%w%)
			\ %<\[%{fnamemodify(getcwd(), ':~')}\] - Neovim"

set showmatch           " Jump to matching bracket
set matchpairs+=<:>     " Add HTML brackets to pair matching
set matchtime=1         " Tenths of a second to show the matching paren

set showtabline=2       " Always show the tabs line
set winwidth=30         " Minimum width for active window
set winminwidth=10      " Minimum width for inactive windows
" set winheight=4         " Minimum height for active window
set winminheight=1      " Minimum height for inactive window
set pumheight=15        " Pop-up menu's line height
set helpheight=12       " Minimum help window height
set previewheight=12    " Completion preview height

" 设置floaterm
" let g:floaterm_keymap_new    = '<F5>'
" let g:floaterm_keymap_new    = '\t'

set showcmd             " Show command in status line
set cmdheight=1         " Height of the command line
set cmdwinheight=5      " Command-line lines
" 设置是否自动在分屏时自动均分窗口
" set noequalalways       " Don't resize windows on split or close
"永远显示状态栏
set laststatus=2        " Always show a status line

" 高亮指定列
" set colorcolumn=100
" 设置关闭折行的80字符线
" set colorcolumn=0
" set colorcolumn=+0      " Column highlight at textwidth's max character-limit
set display=lastline

if has('folding') && has('vim_starting')
	" 设置为显示所用打开的折叠
	set foldenable
	" 折叠的类型
	set foldmethod=indent
	set foldlevelstart=99
	" 当折叠级别高于此值时关闭折叠
	" set foldlevel=99
endif

if has('nvim-0.4')
	set signcolumn=yes:1
else
	set signcolumn=yes           " Always show signs column
endif

if has('conceal') && v:version >= 703
	" For snippet_complete marker
	" 设置json的引号是否隐藏
	set conceallevel=0
	" set conceallevel=2 concealcursor=niv
endif

if exists('+previewpopup')
	set previewpopup=height:10,width:60
endif

" Pseudo-transparency for completion menu and floating windows
if &termguicolors
	if exists('&pumblend')
		set pumblend=10
	endif
	if exists('&winblend')
		set winblend=10
	endif
endif

" }}}

" set exrc
" set secure


" ===
" === Terminal Behaviors
" ===
" let g:neoterm_autoscroll = 1
" autocmd TermOpen term://* startinsert
" " tnoremap <C-N> <C-\><C-N>
" " tnoremap <C-O> <C-\><C-N><C-O>
let g:terminal_color_0  = '#000000'
let g:terminal_color_1  = '#FF5555'
let g:terminal_color_2  = '#50FA7B'
let g:terminal_color_4  = '#F1FA8C'
let g:terminal_color_4  = '#BD93F9'
let g:terminal_color_5  = '#FF79C6'
let g:terminal_color_6  = '#8BE9FD'
let g:terminal_color_7  = '#BFBFBF'
let g:terminal_color_8  = '#4D4D4D'
let g:terminal_color_9  = '#FF6E67'
let g:terminal_color_10 = '#5AF78E'
let g:terminal_color_11 = '#F4F99D'
let g:terminal_color_12 = '#CAA9FA'
let g:terminal_color_13 = '#FF92D0'
let g:terminal_color_14 = '#9AEDFE'


" ===
" === filetype
" ===

" 侦测文件类型
filetype on
" 载入文件类型插件
filetype plugin on
" 为特定文件类型载入相关缩进文件
filetype indent on



" vim: set foldmethod=marker ts=2 sw=2 tw=80 noet :
