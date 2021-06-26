" ================
" === Markdown ===
" ================


" ===
" === latex
" ===
set iskeyword+=:
let g:tex_flavor = 'latex'
let g:vimtex_view_method = 'zathura'
let g:vimtex_quickfix_mode = 0
let g:tex_conceal = 'abdmg'
let g:vimtex_compiler_latexmk_engines = { '_': '-xelatex' }


" ===
" === vim-markdown
" ===
let g:vim_markdown_math = 1
let g:vim_markdown_folding_disabled = 1
" let g:vim_markdown_folding_level = 1
" let g:vim_markdown_folding_style_pythonic = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_auto_insert_bullets = 1
let g:vim_markdown_new_list_item_indent = 0
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_follow_anchor = 1
let g:vim_markdown_strikethrough = 1
let g:vim_markdown_edit_url_in = 'vsplit'
let g:vim_markdown_fenced_languages = [
      \ 'c++=cpp',
      \ 'viml=vim',
      \ 'bash=sh',
      \ 'ini=dosini',
      \ 'js=javascript',
      \ 'json=javascript',
      \ 'jsx=javascriptreact',
      \ 'tsx=typescriptreact',
      \ 'docker=Dockerfile',
      \ 'makefile=make',
      \ 'py=python'
      \ ]
" if !exists('g:loaded_netrw')
"   runtime! autoload/netrw.vim
" endif

" ===
" === vim-instant-markdown
" ===
let g:instant_markdown_slow = 0
let g:instant_markdown_autostart = 0
let g:instant_markdown_open_to_the_world = 1
let g:instant_markdown_allow_unsafe_content = 1
let g:instant_markdown_allow_external_content = 1
let g:instant_markdown_mathjax = 1
let g:instant_markdown_mermaid = 1
" let g:instant_markdown_logfile = '/tmp/instant_markdown.log'
let g:instant_markdown_autoscroll = 1
let g:instant_markdown_port = 8090
" let g:instant_markdown_python = 1

" let g:instant_markdown_browser = "google-chrome-stable --new-window"


" ===
" === md-img-paste
" ===
let g:mdip_imgdir = 'assets' . "/" . expand('%:t:r')
" let g:mdip_imgname = 'image'


" ===
" === bullets
" ===
" Bullets.vim
let g:bullets_enable_in_empty_buffers = 0 " default = 1
let g:bullets_set_mappings = 0 " default = 1
let g:bullets_pad_right = 0
let g:bullets_renumber_on_change = 0
let g:bullets_enabled_file_types = [
      \ 'markdown',
      \ 'text',
      \ 'gitcommit',
      \ 'scratch'
      \]
inoremap <expr> <cr> :call s:add_local_mapping('inoremap', '<cr>', 'pumvisible() ? "<cr>" : "<C-]><C-R>=<SID>insert_new_bullet()<cr>"')
