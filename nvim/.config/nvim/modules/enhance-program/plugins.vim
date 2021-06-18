" ===
" === database
" ===
" jarvim new
Plug 'https://hub.fastgit.org/tpope/vim-dadbod.git'
" jarvim new
Plug 'https://hub.fastgit.org/kristijanhusak/vim-dadbod-ui.git',{'on':['DBUIToggle', 'DBUIAddConnection', 'DBUI', 'DBUIFindBuffer', 'DBUIRenameBuffer']}


" ===
" === jump between functions
" ===
Plug 'https://hub.fastgit.org/liuchengxu/vista.vim.git',{'on': ['Vista', 'Vista!', 'Vista!!']}

if executable('ctags')
	Plug 'https://hub.fastgit.org/ludovicchabant/vim-gutentags.git'
endif


" ===
" === undo tree
" ===
" jarvim new
Plug 'https://hub.fastgit.org/simnalamburt/vim-mundo.git'


" ===
" === run & debug code
" ===
Plug 'https://hub.fastgit.org/D0n9X1n/quickrun.vim.git',{'on': 'QuickRun'}

" vim 调试器
Plug 'https://hub.fastgit.org/puremourning/vimspector.git'


" ===
" === file & code format
" ===
Plug 'https://hub.fastgit.org/vim-autoformat/vim-autoformat.git'
" jarvim new
Plug 'https://hub.fastgit.org/editorconfig/editorconfig-vim.git'


" ===
" === snippet
" ===
" jarvim new
Plug 'https://hub.fastgit.org/honza/vim-snippets.git'

" Plug 'https://hub.fastgit.org/tyru/caw.vim.git'
" Plug 'https://hub.fastgit.org/google/vim-maktaba.git'
" Plug 'https://hub.fastgit.org/google/vim-codefmt.git'
" Plug 'https://hub.fastgit.org/thinca/vim-quickrun.git',{'on': 'QuickRun'}
" Plug 'https://hub.fastgit.org/statiolake/vim-quickrun-runner-nvimterm.git'
