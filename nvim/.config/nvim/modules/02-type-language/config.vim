" ==============
" === matlab ===
" ==============


" ============
" === html ===
" ============

let g:html5_event_handler_attributes_complete = 0
let g:html5_rdfa_attributes_complete = 0
let g:html5_microdata_attributes_complete = 0
let g:html5_aria_attributes_complete = 0

" let g:python_highlight_all = 1
" call coc#add_extension('coc-python')



" =============
" === shell ===
" =============

" ===
" === vim-shellcheck
" ===
let g:shellcheck_disable_mappings = 1
" autocmd! FileType sh :call HighLightOperator()
autocmd FileType sh silent! :ShellCheck<CR>



" ================
" === anaconda ===
" ================

" " NOTE: Anaconda
" if $CONDA_PREFIX == ""
"     let s:current_python_path=$CONDA_PYTHON_EXE
" else
"     let s:current_python_path=$CONDA_PREFIX.'/bin/python'
" endif
" call coc#config('python', {'pythonPath': s:current_python_path})

if $CONDA_PREFIX != ""
  let s:current_python_path = $CONDA_PREFIX. '/bin/python'
  call coc#config('python', {'pythonPath': s:current_python_path})
endif
