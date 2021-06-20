" ===================
" === plugin list ===
" ===================


" ===
" === vimplug plugins
" ===

call plug#begin('~/.config/nvim/plugged')
" 括号自动匹配
Plug 'https://hub.fastgit.org/jiangmiao/auto-pairs.git'

" vim-surround
Plug 'https://hub.fastgit.org/tpope/vim-surround.git'

" vim-sneak
Plug 'https://hub.fastgit.org/justinmk/vim-sneak.git'

" vim-easymotion
Plug 'https://hub.fastgit.org/easymotion/vim-easymotion.git'

" vim-commentary
Plug 'https://hub.fastgit.org/tpope/vim-commentary.git'

" 主题
Plug 'https://hub.fastgit.org/arcticicestudio/nord-vim.git'

" 彩色括号
Plug 'https://hub.fastgit.org/luochen1990/rainbow.git'

" 中英文切换
Plug 'https://hub.fastgit.org/rlue/vim-barbaric.git'
" Plug 'https://hub.fastgit.org/lilydjwg/fcitx.vim'

" ranger
Plug 'https://hub.fastgit.org/kevinhwang91/rnvimr.git'
" Plug 'https://hub.fastgit.org/francoiscabrol/ranger.vim.git'
" Plug 'https://hub.fastgit.org/rbgrouleff/bclose.vim.git'

" coc
Plug 'https://hub.fastgit.org/neoclide/coc.nvim.git'

" vim-startify
Plug 'https://hub.fastgit.org/mhinz/vim-startify.git'

" lazygit
Plug 'https://hub.fastgit.org/kdheepak/lazygit.nvim.git', { 'branch': 'nvim-v0.4.3' }

" vim 调试器
Plug 'https://hub.fastgit.org/puremourning/vimspector.git'

" 高亮与光标下相同的单词
Plug 'https://hub.fastgit.org/rrethy/vim-illuminate.git'

" 高亮复制
" Plug 'https://hub.fastgit.org/machakann/vim-highlightedyank.git'

" 格式化代码（不限语言）
" Plug 'https://hub.fastgit.org/chiel92/vim-autoformat.git'
Plug 'https://hub.fastgit.org/google/vim-maktaba.git'
Plug 'https://hub.fastgit.org/google/vim-codefmt.git'

" indentline
Plug 'https://hub.fastgit.org/yggdroot/indentline.git'

" 精致的顶栏
Plug 'https://hub.fastgit.org/mg979/vim-xtabline.git'
" 底下的状态栏及其主题
Plug 'https://hub.fastgit.org/vim-airline/vim-airline.git'

" vim-nerd图标
Plug 'https://hub.fastgit.org/ryanoasis/vim-devicons.git'

" 不知道干嘛的。与美化相关
Plug 'https://hub.fastgit.org/wincent/terminus.git'

" git
Plug 'https://hub.fastgit.org/airblade/vim-gitgutter.git'

call plug#end()


" ===
" === coc plugins list
" ===

let g:coc_global_extensions = [
            \'coc-marketplace',
            \'coc-explorer',
            \'coc-clangd',
            \'coc-cmake',
            \'coc-emmet',
            \'coc-java',
            \'coc-highlight',
            \'coc-json',
            \'coc-pyright',
            \'coc-sh',
            \'coc-snippets',
            \'coc-vimlsp',
            \'coc-yaml',
            \'coc-syntax',
            \'coc-tabnine',
            \'coc-html',
            \'coc-yank',
            \]

