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



