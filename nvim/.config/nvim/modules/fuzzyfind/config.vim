" ================
" === vim-clap ===
" ================


" ===
" === global
" ===
let g:clap_cache_directory = $DATA_PATH . '/clap'
let g:clap_disable_run_rooter = 'v:true'
let g:clap_theme = 'material_design_dark'
let g:clap_layout = { 'relative': 'editor' }
let g:clap_current_selection_sign= { 'text': '➤', 'texthl': "ClapCurrentSelectionSign", "linehl": "ClapCurrentSelection"}
let g:clap_enable_icon = 1
let g:clap_search_box_border_style = 'curve'
let g:clap_prompt_format = '%spinner%%forerunner_status% %provider_id%: '


" ===
" === grep options
" ===
let g:clap_provider_grep_enable_icon = 1
let g:clap_provider_grep_opts = '--hidden -g "!.git/"'
let g:clap_provider_grep2_enable_icon = 1
let g:clap_provider_grep2_opts = '--hidden -g "!.git/"'


" ===
" === personal files settings
" ===
let s:zshrc = expand($HOME . '/.zshrc')
let s:tmux_conf = expand($HOME . '/.tmux.conf')
let g:clap_provider_personalconf = {
      \ 'source': [s:zshrc,s:tmux_conf],
      \ 'sink': 'e',
      \ }


" ===
" === funtions
" ===
" A funtion to config highlight of ClapSymbol
" when the background color is opactiy
function! s:ClapSymbolHL() abort
    let s:current_bgcolor = synIDattr(hlID("Normal"), "bg")
    if s:current_bgcolor == ''
        hi ClapSymbol guibg=NONE ctermbg=NONE
    endif
endfunction

autocmd User ClapOnEnter call s:ClapSymbolHL()

