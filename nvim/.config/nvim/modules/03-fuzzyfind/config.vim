" ===
" === fzf.vim
" ===
let g:fzf_command_prefix = 'F'

" YuSoLi: this function below is copied from fzf.vim original code, it can add
" g:fzf_command_prefix in front of the command. I use this function to rewrite my
" self-flavor fzf command.
function! s:defs(commands)
  let prefix = get(g:, 'fzf_command_prefix', '')
  if prefix =~# '^[^A-Z]'
    echoerr 'g:fzf_command_prefix must start with an uppercase letter'
    return
  endif
  for command in a:commands
    let name = ':'.prefix.matchstr(command, '\C[A-Z]\S\+')
    if 2 != exists(name)
      execute substitute(command, '\ze\C[A-Z]', prefix, '')
    endif
  endfor
endfunction

" YuSoLi: rewrite default command with g:fzf_command_prefix
" e.g. I rewrite Rg command to show hidden files.
call s:defs([
      \ 'command! -bang -nargs=* Rg call fzf#vim#grep( "rg --hidden --ignore-file .git --column --line-number --no-heading --color=always --smart-case -- ".shellescape(<q-args>), 1, fzf#vim#with_preview(), <bang>0)'
      \])

