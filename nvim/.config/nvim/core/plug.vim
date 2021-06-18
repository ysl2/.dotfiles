
" Set main configuration directory as parent directory
let $VIM_PATH =
	\ get(g:, 'etc_vim_path',
	\   exists('*stdpath') ? stdpath('config') :
	\   ! empty($MYVIMRC) ? fnamemodify(expand($MYVIMRC), ':h') :
	\   ! empty($VIMCONFIG) ? expand($VIMCONFIG) :
	\   ! empty($VIM_PATH) ? expand($VIM_PATH) :
	\   fnamemodify(resolve(expand('<sfile>:p')), ':h:h')
	\ )

" Set data/cache directory as $XDG_CACHE_HOME/vim
let $DATA_PATH =
	\ expand(($XDG_CACHE_HOME ? $XDG_CACHE_HOME : '~/.cache') . '/vim')

" Collection of  plugins list config file-paths
let s:plugin_paths = split(globpath('$VIM_PATH/modules/', '*'), '\n')

function! s:main()
	if has('vim_starting')
		" When using VIMINIT trick for exotic MYVIMRC locations, add path now.
		if &runtimepath !~# $VIM_PATH
			set runtimepath^=$VIM_PATH
		endif

		" Ensure data directories
		for s:path in [
				\ $DATA_PATH,
				\ $DATA_PATH . '/undo',
				\ $DATA_PATH . '/backup',
				\ $DATA_PATH . '/session']
			if ! isdirectory(s:path)
				call mkdir(s:path, 'p')
			endif
		endfor

		" Python interpreter settings
		if has('nvim')
			" Try using pyenv virtualenv called 'neovim'
			let l:virtualenv = ''
			if ! empty($PYENV_ROOT)
				let l:virtualenv = $PYENV_ROOT . '/versions/neovim/bin/python'
			endif
			if empty(l:virtualenv) || ! filereadable(l:virtualenv)
				" Fallback to old virtualenv location
				let l:virtualenv = $DATA_PATH . '/venv/neovim3/bin/python'
			endif
			if filereadable(l:virtualenv)
				let g:python3_host_prog = l:virtualenv
			endif

		elseif has('pythonx')
			if has('python3')
				set pyxversion=3
			elseif has('python')
				set pyxversion=2
			endif
		endif
	endif

	" Initializes chosen package manager
	call s:use_plug()
endfunction

function! s:use_plug() abort
	" vim-plug package-manager initialization
	let l:cache_root = $DATA_PATH . '/plug'
	let l:cache_init = l:cache_root . '/init.vimplug'
	let l:cache_repos = l:cache_root . '/repos'

	augroup user_plugin_vimplug
		autocmd!
	augroup END

	if &runtimepath !~# '/init.vimplug'

    if empty(glob(l:cache_init.'/autoload/plug.vim'))
      execute '!git clone --depth=1 https://hub.fastgit.org/junegunn/vim-plug' l:cache_init.'/autoload'
			if v:shell_error
				call s:error('vim-plug installation has failed! is git installed?')
        return
			endif
      autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif

		execute 'set runtimepath+='.substitute(
			\ fnamemodify(l:cache_init, ':p') , '/$', '', '')
	endif

	call plug#begin(l:cache_repos)

	" Automatically install missing plugins on startup
	if !empty(filter(copy(g:plugs), '!isdirectory(v:val.dir)'))
	  autocmd VimEnter * PlugInstall --sync | q
	endif

	for l:plugin in s:plugin_paths
		exec 'source'. l:plugin .'/plugins.vim'
	endfor

	call plug#end()
endfunction

function! s:str2list(expr)
	" Convert string to list
	return type(a:expr) ==# v:t_list ? a:expr : split(a:expr, '\n')
endfunction

function! s:error(msg)
	for l:mes in s:str2list(a:msg)
		echohl WarningMsg | echomsg '[config/init] ' . l:mes | echohl None
	endfor
endfunction

call s:main()
