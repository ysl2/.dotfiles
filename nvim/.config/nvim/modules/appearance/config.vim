
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
"             \ 'book_marks' : 'SPC f b',
"             \ 'change_colorscheme' : 'SPC t c',
"             \ 'find_file' : 'SPC f f',
"             \ 'find_history' : 'SPC f h',
"             \ 'find_word' : 'SPC f a',
"             \ 'last_session' : 'SPC s l',
"             \ 'new_file' : 'SPC c n',
"             \ }
" let g:dashboard_custom_header = [
"             \ '██████████████████  ████████',
"             \ '██████████████████  ████████',
"             \ '██████████████████  ████████',
"             \ '████████            ████████',
"             \ '████████  ████████  ████████',
"             \ '████████  ████████  ████████',
"             \ '████████  ████████  ████████',
"             \ '████████  ████████  ████████',
"             \ '████████  ████████  ████████',
"             \ '████████  ████████  ████████',
"             \ '████████  ████████  ████████',
"             \ '████████  ████████  ████████',
"             \ '████████  ████████  ████████'
"             \]
let g:dashboard_custom_header = [
            \'                                                                    ',
            \'      ███████████           █████      ██                     ',
            \'     ███████████             █████                             ',
            \'     ████████████████ ███████████ ███   ███████     ',
            \'    ████████████████ ████████████ █████ ██████████████   ',
            \'   █████████████████████████████ █████ █████ ████ █████   ',
            \' ██████████████████████████████████ █████ █████ ████ █████  ',
            \'██████  ███ █████████████████ ████ █████ █████ ████ ██████ ',
            \'██████   ██  ███████████████   ██ █████████████████ ',
            \'██████   ██  ███████████████   ██ █████████████████ ',
            \]
let g:dashboard_footer_icon = ' '

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
let g:lightline = {
            \    'colorscheme': 'nord',
            \    'active': {
                \        'left': [
                    \           ['mode', 'paste'],
                    \           ['filename'],
                    \           ['curfunction'],
                    \        ],
                    \        'right': [
                        \            ['lineinfo'],
                        \            ['fileencoding'],
                        \            ['battery'],
                        \            ['diagnostic'],
                        \        ]
                        \    },
                        \    'inactive': {
                            \        'left': [['mode'], ['filename']],
                            \        'right': [['lineinfo'], ['fileencoding'],],
                            \    },
                            \    'tabline': {
                                \        'left': [['buffers']],
                                \        'right': [['gitbranch', 'gitstatus'], ['cocstatus']],
                                \   },
                                \    'component_function': {
                                    \        'mode': 'LightlineModeOrPlugin',
                                    \        'filename': 'LightlineFilename',
                                    \        'filepath': 'LightLineFilepath',
                                    \        'fileencoding': 'LightlineFileencoding',
                                    \        'lineinfo': 'LightlineLineinfo',
                                    \        'cocstatus': 'coc#status',
                                    \        'curfunction': 'LightlineFunction',
                                    \    },
                                    \    'component_expand': {
                                        \        'diagnostic': 'LightlineDiagnostic',
                                        \        'buffers': 'lightline#bufferline#buffers',
                                        \        'gitbranch': 'LightlineGitBranch',
                                        \        'gitstatus': 'LightlineGitStatus',
                                        \	 },
                                        \    'component_type': {
                                            \        'diagnostic': 'error',
                                            \        'buffers': 'tabsel',
                                            \        'gitbranch': 'tabsel',
                                            \        'gitstatus': 'raw',
                                            \        'cocstatus': 'tabsel',
                                            \    },
                                            \    'component_raw': {'buffers': 1},
                                            \ }
" \    'separator': { 'left': '', 'right': '' },
" \    'subseparator': { 'left': '', 'right': '' },
" \    'tabline_separator': {'left': '', 'right': ''},
" \    'tabline_subseparator': {'left': '', 'right': ''},


let g:lightline#bufferline#show_number=2
let g:lightline#bufferline#enable_devicons=1
let g:lightline#bufferline#unicode_symbols = 1

let g:lightline#bufferline#number_map = {
            \ 0: '➓ ', 1: '❶ ', 2: '❷ ', 3: '❸ ', 4: '❹ ',
            \ 5: '❺ ', 6: '❻ ', 7: '❼ ', 8: '❽ ', 9: '❾ '}


let s:panel_ignore = {'coc-explorer': 'Explorer', 'list': '', 'dashboard': '', 'packager': 'Packager', 'vista': 'Vista'}

function! LightlineModeOrPlugin()
    return !has_key(s:panel_ignore, &ft) ? lightline#mode() : get(s:panel_ignore, &ft, '')
endfunction

function! LightlineGitBranch()
    let gstatus = FugitiveHead()
    return !has_key(s:panel_ignore, &ft) || gstatus ? ' '.gstatus : ''
endfunction

function! LightlineFunction()
    return get(b:, 'coc_current_function', '')
endfunction

function! LightlineFilename()
    let fname = expand('%:t')
    return !has_key(s:panel_ignore, &ft) ? (fname !=# '' ? fname . ' '.WebDevIconsGetFileTypeSymbol().' ' : '[No Name]')  : ''
endfunction

function! LightLineFilepath()
    return '' != expand('%:F') && !has_key(s:panel_ignore, &ft) ? expand('%:F') : ''
endfunction

function! LightlineFileencoding()
    return !has_key(s:panel_ignore, &ft) ?
                \(&fenc !=# '' ? &fenc . ' ' . WebDevIconsGetFileFormatSymbol() : &enc. ' ' . WebDevIconsGetFileFormatSymbol() ): ''
endfunction

function! LightlineLineinfo()
    return !has_key(s:panel_ignore, &ft) ? ' '.line('.').':'. col('.').'  ' . '☰ '.line('.') * 100 / line('$') . '%'	 : ''
endfunction

function! LightlineGitStatus() abort
    let status = get(b:, 'coc_git_status', '')
    return status
endfunction

function! LightlineDiagnostic() abort
    let info = get(b:, 'coc_diagnostic_info', {})
    if empty(info) | return '' | endif
    let msgs = []
    if get(info, 'error', 0)
        call add(msgs, g:coc_status_error_sign . info['error'])
    endif
    if get(info, 'warning', 0)
        call add(msgs, g:coc_status_warning_sign . info['warning'])
    endif
    return join(msgs, ' ')
endfunction
