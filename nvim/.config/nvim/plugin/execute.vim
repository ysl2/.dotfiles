" ===============
" === compile ===
" ===============

func! CompileRunGcc()
  exec "w"
  if &filetype == 'c'
    exec "!g++ % -o %<"
    exec "!time ./%<"
  elseif &filetype == 'cpp'
    set splitbelow
    exec "!g++ -std=c++11 % -Wall -o %<"
    :sp
    :res -15
    :term ./%<
  elseif &filetype == 'java'
    set splitbelow
    :sp
    :res -5
    term javac % && time java %<
  elseif &filetype == 'sh'
    :!time bash %
  elseif &filetype == 'python'
    set splitbelow
    :sp
    :term python3 %
  elseif &filetype == 'html'
    silent! exec "!".g:mkdp_browser." % &"
  elseif &filetype == 'markdown'
    exec "InstantMarkdownPreview"
  elseif &filetype == 'tex'
    silent! exec "VimtexStop"
    silent! exec "VimtexCompile"
  elseif &filetype == 'dart'
    exec "CocCommand flutter.run -d ".g:flutter_default_device." ".g:flutter_run_args
    silent! exec "CocCommand flutter.dev.openDevLog"
  elseif &filetype == 'javascript'
    set splitbelow
    :sp
    :term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
  elseif &filetype == 'typescript'
    set splitbelow
    :sp
    :res -10
    :term node %<.js
  elseif &filetype == 'go'
    set splitbelow
    :sp
    :term go run .
  elseif &filetype == 'rust'
    set splitbelow
    :sp
    :res -5
    :term cargo run
  endif
endfunc

" func! CompileRunGcc()
"     exec "w"
"     if &filetype == 'c'
"         set splitbelow
"         silent exec "!gcc % -o ./.tmp"
"         :sp
"         :term ./.tmp && rm ./.tmp
"     elseif &filetype == 'cpp'
"         set splitbelow
"         silent exec "!g++ -std=c++11 % -Wall -o ./.tmp"
"         :sp
"         :term ./.tmp && rm ./.tmp
"     elseif &filetype == 'sh'
"         :!time bash %
"     elseif &filetype == 'python'
"         set splitbelow
"         :sp
"         :res -10
"         :term python %
"     elseif &filetype == 'javascript'
"         set splitbelow
"         :sp
"         :res -10
"         :term node %
"     elseif &filetype == 'typescript'
"         set splitbelow
"         :sp
"         :res -10
"         :term node %<.js
"     elseif &filetype == 'go'
"         set splitbelow
"         :sp
"         :res -10
"         :term go run %
"     elseif &filetype == 'rust'
"         set splitbelow
"         :sp
"         :res -5
"         :term cargo run
"     elseif &filetype == 'html'
"         silent exec "!reload -b vimb -p 4444&"
"     elseif &filetype == 'markdown'
"         exec "MarkdownPreview"
"     endif
" endfunc

