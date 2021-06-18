" jarvim new
" 如果报错，就执行:Clap install-binary（需要cargo，cargo是rust的包管理器）
" 此插件依赖列表如下：
" ```
" rg 通过linux包管理器安装
" maple 通过此插件的内置命令安装：`:call clap#installer#build_maple()`
" 或者直接一次性安装maple和python dynamic两个（python这个是可选的，不用必须安装）`:call clap#installer#build_all()`
" ```
" Plug 'https://hub.fastgit.org/liuchengxu/vim-clap.git', { 'do': ':Clap install-binary!' }

" jarvim new
" Plug 'https://hub.fastgit.org/vn-ki/coc-clap.git'
