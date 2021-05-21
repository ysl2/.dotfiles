" =======================
" === Dress up my vim ===
" =======================


" ===
" === global theme settings
" ===

colorscheme nord

" enable true colors support
set termguicolors
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" 设置背景透明（不起效果）
"hi Normal ctermfg=250 ctermbg=none


" ---------------------------------------------------------------------------------------------------------------------------------


" ===
" === theme: gruvbox
" ===

let g:gruvbox_contrast_dark = 'soft'


" ===
" === theme: nord
" ===

let g:nord_cursor_line_number_background = 1
" let g:nord_uniform_status_lines = 1
" let g:nord_bold_vertical_split_line = 1
" let g:nord_uniform_diff_background = 1

" 设置字体（1表示启用字体样式）
let g:nord_bold = 1
let g:nord_italic = 1
let g:nord_italic_comments = 1  " 斜体注释
