" ===============
" === compile ===
" ===============

func! CompileRunGcc()
  exec "w"
  " c
  if &filetype == 'c'
    exec "!g++ % -o %<"
    exec "!time ./%<"
  " cpp/c++
  elseif &filetype == 'cpp'
    set splitbelow
    exec "!g++ -std=c++11 % -Wall -o %<"
    :sp
    :res -10
    :term ./%<
  " java
  elseif &filetype == 'java'
    set splitbelow
    :sp
    :res -10
    term javac % && time java %<
  " shell
  elseif &filetype == 'sh'
    :!time bash %
  " python
  elseif &filetype == 'python'
    set splitbelow
    :sp
    :res -10
    :term python3 %
  " html
  elseif &filetype == 'html'
    silent! exec "!".g:mkdp_browser." % &"
  " markdown
  elseif &filetype == 'markdown'
    exec "InstantMarkdownPreview"
  " latex
  elseif &filetype == 'tex'
    silent! exec "VimtexStop"
    silent! exec "VimtexCompile"
  " dart
  elseif &filetype == 'dart'
    exec "CocCommand flutter.run -d ".g:flutter_default_device." ".g:flutter_run_args
    silent! exec "CocCommand flutter.dev.openDevLog"
  " javascript
  elseif &filetype == 'javascript'
    set splitbelow
    :sp
    :term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
  " typescript
  elseif &filetype == 'typescript'
    set splitbelow
    :sp
    :res -10
    :term node %<.js
  " go
  elseif &filetype == 'go'
    set splitbelow
    :sp
    :term go run .
  " rust
  elseif &filetype == 'rust'
    set splitbelow
    :sp
    :res -10
    :term cargo run
  " matlab
  elseif &filetype == 'matlab'
    exec "MatlabRun"
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

