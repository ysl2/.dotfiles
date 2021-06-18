" ===
" === defx
" ===
call defx#custom#option('_', {
            \ 'resume': 1,
            \ 'winwidth': 30,
            \ 'split': 'vertical',
            \ 'direction': 'topleft',
            \ 'show_ignored_files': 0,
            \ 'columns': 'indent:git:icons:filename',
            \ 'root_marker': ' ',
            \ 'floating_preview': 1,
            \ 'vertical_preview': 1,
            \ 'preview_height': 50,
            \ })

call defx#custom#column('git', {
            \   'indicators': {
                \     'Modified'  : '•',
                \     'Staged'    : '✚',
                \     'Untracked' : 'ᵁ',
                \     'Renamed'   : '≫',
                \     'Unmerged'  : '≠',
                \     'Ignored'   : 'ⁱ',
                \     'Deleted'   : '✖',
                \     'Unknown'   : '⁇'
                \   }
                \ })

call defx#custom#column('mark', { 'readonly_icon': '', 'selected_icon': '' })

" Events
" ---

augroup user_plugin_defx
    autocmd!

    " Define defx window mappings
    autocmd FileType defx call <SID>defx_mappings()

    " Delete defx if it's the only buffer left in the window
    autocmd WinEnter * if &filetype == 'defx' && winnr('$') == 1 | bdel | endif

    " Move focus to the next window if current buffer is defx
    autocmd TabLeave * if &filetype == 'defx' | wincmd w | endif

augroup END

" Internal functions
" ---
function! s:jump_dirty(dir) abort
    " Jump to the next position with defx-git dirty symbols
    let l:icons = get(g:, 'defx_git_indicators', {})
    let l:icons_pattern = join(values(l:icons), '\|')

    if ! empty(l:icons_pattern)
        let l:direction = a:dir > 0 ? 'w' : 'bw'
        return search(printf('\(%s\)', l:icons_pattern), l:direction)
    endif
endfunction

function! s:defx_toggle_tree() abort
    " Open current file, or toggle directory expand/collapse
    if defx#is_directory()
        return defx#do_action('open_or_close_tree')
    endif
    return defx#do_action('multi', ['drop'])
endfunction

function! s:defx_mappings() abort
    " Defx window keyboard mappings
    setlocal signcolumn=no expandtab

    nnoremap <silent><buffer><expr> w  defx#do_action('drop')
    nnoremap <silent><buffer><expr> l     <sid>defx_toggle_tree()
    nnoremap <silent><buffer><expr> h     <sid>defx_toggle_tree()
    nnoremap <silent><buffer><expr> s     defx#do_action('open', 'botright vsplit')
    nnoremap <silent><buffer><expr> S     defx#do_action('open', 'botright split')
    nnoremap <silent><buffer><expr> <CR>     defx#do_action('preview')
    nnoremap <silent><buffer><expr> dD    defx#do_action('remove_trash')
    nnoremap <silent><buffer><expr> @     defx#do_action('execute_system')
    nnoremap <silent><buffer><expr> zh     defx#do_action('toggle_ignored_files')
    nnoremap <silent><buffer><expr> <BS> winnr('$') != 1 ?
                \ ':<C-u>wincmd w<CR>' :
                \ ':<C-u>Defx -buffer-name=temp -split=vertical<CR>'
    " Defx's buffer management
    nnoremap <silent><buffer><expr> q      defx#do_action('quit')
    " nnoremap <silent><buffer><expr> bs     defx#do_action('save_session')
    nnoremap <silent><buffer><expr> R    defx#do_action('multi', [['drop', 'tabnew'], 'quit'])
    nnoremap <silent><buffer><expr> <C-r>  defx#do_action('redraw')
    nnoremap <silent><buffer><expr> P  defx#do_action('print')
    " File/dir management
    nnoremap <silent><buffer><expr><nowait> yy  defx#do_action('copy')
    nnoremap <silent><buffer><expr> yp    defx#do_action('yank_path')
    nnoremap <silent><buffer><expr><nowait> dd  defx#do_action('move')
    nnoremap <silent><buffer><expr><nowait> pp  defx#do_action('paste')
    nnoremap <silent><buffer><expr><nowait> a  defx#do_action('rename')
    nnoremap <silent><buffer><expr> dd defx#do_action('remove_trash')
    nnoremap <silent><buffer><expr> M     defx#do_action('new_directory')
    nnoremap <silent><buffer><expr> T     defx#do_action('new_multiple_files')

    " Jump
    nnoremap <silent><buffer>  [g :<C-u>call <SID>jump_dirty(-1)<CR>
    nnoremap <silent><buffer>  ]g :<C-u>call <SID>jump_dirty(1)<CR>

    " Change directory
    nnoremap <silent><buffer><expr><nowait> \  defx#do_action('cd', getcwd())
    nnoremap <silent><buffer><expr><nowait> &  defx#do_action('cd', getcwd())
    nnoremap <silent><buffer><expr> ~     defx#async_action('cd')
    " nnoremap <silent><buffer><expr> cd     defx#async_action('cd')
    " nnoremap <silent><buffer><expr> <BS>  defx#async_action('cd', ['..'])
    nnoremap <silent><buffer><expr> u     defx#async_action('cd', ['..'])
    nnoremap <silent><buffer><expr> I   defx#do_action('cd', ['..'])
    nnoremap <silent><buffer><expr> 2I  defx#do_action('cd', ['../..'])
    nnoremap <silent><buffer><expr> 3I  defx#do_action('cd', ['../../..'])
    nnoremap <silent><buffer><expr> 4I  defx#do_action('cd', ['../../../..'])

    " Selection
    nnoremap <silent><buffer><expr> *  defx#do_action('toggle_select_all')
    nnoremap <silent><buffer><expr><nowait> <Tab>
                \ defx#do_action('toggle_select') . 'j'

    nnoremap <silent><buffer><expr> S  defx#do_action('toggle_sort', 'Time')
    nnoremap <silent><buffer><expr> C
                \ defx#do_action('toggle_columns', 'indent:mark:filename:type:size:time')
endfunction

let g:defx_git#indicators = {
            \ 'Modified'  : '•',
            \ 'Staged'    : '✚',
            \ 'Untracked' : 'ᵁ',
            \ 'Renamed'   : '≫',
            \ 'Unmerged'  : '≠',
            \ 'Ignored'   : 'ⁱ',
            \ 'Deleted'   : '✖',
            \ 'Unknown'   : '⁇'
            \ }

let g:defx_icons_column_length = 1
let g:defx_icons_mark_icon = ''

nnoremap <silent> <Leader>e
            \ :<C-u>Defx -resume -toggle -buffer-name=tab`tabpagenr()`<CR>
nnoremap <silent> <Leader>F
            \ :<C-u>Defx -resume -buffer-name=tabtabpagenr()` -search=`expand('%:p')`<CR>


"--------------------------"
"     vim-buffet Keymap    "
"--------------------------"

" function! g:BuffetSetCustomColors()
"   hi! BuffetCurrentBuffer    gui=NONE guibg=#50fa7b guifg=#282a36
"   hi! BuffetActiveBuffer     gui=NONE guibg=#bd93f9 guifg=#282a36
"   hi! BuffetBuffer           gui=NONE guibg=#282a36 guifg=#6272a4
"   hi! BuffetModCurrentBuffer gui=NONE guibg=#8be9fd guifg=#282a36
"   hi! BuffetModActiveBuffer  gui=NONE guibg=#ffb86c guifg=#282a36
"   hi! BuffetModBuffer        gui=NONE guibg=#ff5555 guifg=#282a36
"   hi! BuffetTrunc            gui=NONE guibg=#bd93f9 guifg=#282a36
"   hi! BuffetTab              gui=NONE guibg=#bd93f9 guifg=#282a36
" endfunction

" function! g:BuffetSetCustomColors()
"   hi! clear BuffetBuffer
"   hi! link BuffetCurrentBuffer DraculaSelection
"   hi! link BuffetTab DraculaCommentBold
" endfunction



" ===
" === dashboard-nvim
" ===
" let g:dashboard_custom_shortcut={
"             \ 'book_marks' : 'SPC f m',
"             \ 'change_colorscheme' : 'SPC f c',
"             \ 'find_file' : 'SPC f f',
"             \ 'find_history' : 'SPC f h',
"             \ 'find_word' : 'SPC f a',
"             \ 'last_session' : 'SPC s l',
"             \ 'new_file' : 'SPC c n',
"             \ }
" " let g:dashboard_custom_header = [
" "             \ '██████████████████  ████████',
" "             \ '██████████████████  ████████',
" "             \ '██████████████████  ████████',
" "             \ '████████            ████████',
" "             \ '████████  ████████  ████████',
" "             \ '████████  ████████  ████████',
" "             \ '████████  ████████  ████████',
" "             \ '████████  ████████  ████████',
" "             \ '████████  ████████  ████████',
" "             \ '████████  ████████  ████████',
" "             \ '████████  ████████  ████████',
" "             \ '████████  ████████  ████████',
" "             \ '████████  ████████  ████████'
" "             \]
" let g:dashboard_custom_header = [
"             \'                                                                    ',
"             \'      ███████████           █████      ██                     ',
"             \'     ███████████             █████                             ',
"             \'     ████████████████ ███████████ ███   ███████     ',
"             \'    ████████████████ ████████████ █████ ██████████████   ',
"             \'   █████████████████████████████ █████ █████ ████ █████   ',
"             \' ██████████████████████████████████ █████ █████ ████ █████  ',
"             \'██████  ███ █████████████████ ████ █████ █████ ████ ██████ ',
"             \'██████   ██  ███████████████   ██ █████████████████ ',
"             \'██████   ██  ███████████████   ██ █████████████████ ',
"             \]
" let g:dashboard_footer_icon = ' '

" let g:dashboard_preview_command = 'cat'
" let g:dashboard_preview_file = '~/.dotfiles/nvim/.config/nvim/static/neovim.cat_'
" let g:dashboard_preview_pipeline = 'lolcat -F 0.3'
" let g:dashboard_preview_file_height = 11
" let g:dashboard_preview_file_width = 80


" ===
" === xtabline
" ===
let g:xtabline_settings = {}
let g:xtabline_settings.enable_mappings = 0
let g:xtabline_settings.tabline_modes = ['tabs', 'buffers']
let g:xtabline_settings.enable_persistance = 0
let g:xtabline_settings.last_open_first = 1


" ===
" === spaceline.vim
" ===
" let g:spaceline_seperate_style= 'slant'
" let g:spaceline_colorscheme = 'space'


" ===
" === lightline.vim
" ===
let g:lightline = get(g:, 'lightline', {})
let g:lightline.active = get(g:, 'lightline.active', {})

let g:lightline.active.left =  [
            \   [ 'mode', 'paste' ],
            \   [ 'gitstatus', 'readonly', 'filename', 'modified' ]
            \ ]

" NOTE: Default is the theme name. check `autoload/theme.vim`, the variable `g:colors_name` is defined in this file.
let g:lightline.colorscheme = colors_name

" let g:lightline.mode_map = {
" \   'n' : 'Normal',
" \   'i' : 'Insert',
" \   'R' : 'Replace',
" \   'v' : 'Visual',
" \   'V' : 'V-Line',
" \   "\<C-v>": 'V-Block',
" \   'c' : 'Command',
" \   's' : 'Select',
" \   'S' : 'S-Line',
" \   "\<C-s>": 'S-Block',
" \   't': 'Terminal',
" \ }
let g:lightline.mode_map = {
            \   'n' : ' Mute',
            \   'i' : ' Talk',
            \   'R' : '﯒',
            \   'v' : ' Pick',
            \   'V' : ' Pick',
            \   "\<C-v>": ' Pick',
            \   'c' : ' Call',
            \   's' : 'Select',
            \   'S' : 'S-Line',
            \   "\<C-s>": 'S-Block',
            \   't': ' Term',
            \ }

let g:lightline.component = get(g:, 'lightline.component', {})

" %3l is right aligned padding for 3 digits for current row. -2v is left
" aligned padding for current column
let g:lightline.component.lineinfo = " %3l 並%-2v"
" let g:lightline.component.lineinfo = " %3l הּ %-2v"

let g:lightline.component_function = get(g:, 'lightline.component_function', {})

let LightlineReadonly = {-> &readonly ? "" : ''}
let g:lightline.component_function.readonly = 'LightlineReadonly'

let LightlineFiletype = {->
            \   winwidth(0) <= 70   ? '' :
            \   !strlen(&filetype)  ? '' :
            \
            \   &filetype . (exists('*WebDevIconsGetFileTypeSymbol')
            \       ? ' ' . WebDevIconsGetFileTypeSymbol() : ''
            \   )
            \ }
let g:lightline.component_function.filetype = 'LightlineFiletype'

let LightlineFileformat = {->
            \   winwidth(0) <= 70   ? '' :
            \
            \   &fileformat . (exists('*WebDevIconsGetFileFormatSymbol')
            \       ? ' ' . WebDevIconsGetFileFormatSymbol() : ''
            \   )
            \ }
let g:lightline.component_function.fileformat = 'LightlineFileformat'

" function! MyFilename()
"     return (&ft == 'vimfiler' ? vimfiler#get_status_string() :
"         \  &ft == 'unite' ? unite#get_status_string() :
"         \  &ft == 'vimshell' ? substitute(b:vimshell.current_dir,expand('~'),'~','') :
"         \ '' != expand('%:p') ? expand('%:p') : '[No Name]')
" endfunction
" let g:lightline.component_function.filename = 'MyFilename'

