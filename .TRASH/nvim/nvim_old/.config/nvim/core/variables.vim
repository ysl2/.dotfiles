" ====================
" === Editor Setup ===
" ====================


" ===
" === System
" ===
let &t_ut=''
let mapleader = ' '


" ===
" === Edit
" ===

" 设置行号
set number
set relativenumber

" 自动切换当前目录为当前文件所在的目录
set autochdir
" Auto change directory to current dir
autocmd BufEnter * silent! lcd %:p:h


" 设置允许行超过当前屏幕（wrap | nowrap）
set nowrap

" 突出显示当前行
set cursorline

" 光标上下的最少行数
set scrolloff=4

" 键盘代码超时时间
set ttimeoutlen=0
set notimeout

"永远显示状态栏
set laststatus=2

" 新窗口在当前窗口之右
set splitright

" 分割窗口时新窗口在当前窗口之下
set splitbelow

" 在状态行上是否显示当前模式的消息（showmode | noshowmode）
set showmode

" 显示操作提示,右下角命令提示
set showcmd

" 设置编码
set encoding=utf8

" 设置字体
"set guifont=DroidSansMono\ Nerd\ Font\ 11

" 使用鼠标
set mouse=a

" 设置帮助为中文
set helplang=cn

" 设置空白字符的视觉提示
" set list listchars=extends:❯,precedes:❮,tab:▸\ ,trail:˽
set list
set listchars=tab:\|\ ,trail:▫

" 设置floaterm
" let g:floaterm_keymap_new    = '<F5>'
let g:floaterm_keymap_new    = '<M-n>'

" 搜索内容高亮
set hlsearch
" 清除上一次的搜索，不清除上次搜索的高亮还会显示
exec "nohlsearch"

" 搜索忽略大小写
set ignorecase
" 智能大小写，搜索时不区分大小写
set smartcase

" 设置BackSpace正常处理inden, eol, start等
set backspace=2

" 允许backspace和光标键跨越行边界
set whichwrap+=<,>,h,l

" 不要使用vi的键盘模式，而是vim自己的
set nocompatible

" 使用可视铃声而不是响铃
set visualbell
" 取消警告声音
set noerrorbells
set report=0


set exrc
set secure


" ===
" === Files
" ===

" 打开文件时光标在上次退出的位置
au BufReadPost * if line("'\"") > 1|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" 自动排版完成的方式
set formatoptions-=tc

" 缩短消息长度的标志位列表
set shortmess+=c

" 折叠的类型
set foldmethod=indent

" 当折叠级别高于此值时关闭折叠
set foldlevel=99

" 设置为显示所用打开的折叠
set foldenable


" 边输入边高亮
set incsearch

" 命令行自动补全所使用的菜单
set wildmenu


" 高亮指定列
set colorcolumn=100

" 刷新交换文件所需的毫秒数
set updatetime=100
" 使用虚拟编辑
set virtualedit=block

" inccommand能够实时显示ex命令会造成的改变
set inccommand=split

" 插入模式补全使用的选项
set completeopt=longest,noinsert,menuone,noselect,preview

"should vlmake scrolling faster
set ttyfast

" 不要在宏的执行过程中重绘屏幕,可以让宏更快一些
set lazyredraw


" 允许在有未保存的修改时切换缓冲区，此时的修改由 vim 负责保存
set hidden

" 指定 :mkview 保存的内容
set viewoptions=cursor,folds,slash,unix

" 取消自动折行
set textwidth=0
" 设置关闭折行的80字符线
set colorcolumn=0

" 得到一行的缩进位置的表达式
set indentexpr=

" 设置json的引号是否隐藏
" set conceallevel=0


" ===
" === Terminal Behaviors
" ===
let g:neoterm_autoscroll = 1
autocmd TermOpen term://* startinsert
" tnoremap <C-N> <C-\><C-N>
" tnoremap <C-O> <C-\><C-N><C-O>
let g:terminal_color_0  = '#000000'
let g:terminal_color_1  = '#FF5555'
let g:terminal_color_2  = '#50FA7B'
let g:terminal_color_3  = '#F1FA8C'
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

" 是否将tab键替换成空格（是：expandtab | 否：noexpandtab）
set expandtab

" 设置TAB键长度为4
set tabstop=4

" 设定 << 和 >> 命令移动时的宽度为 4
set shiftwidth=4

" 使得按退格键时可以一次删掉 4 个空格
set softtabstop=4

" 自动缩进
set autoindent
" set cindent
set smartindent

