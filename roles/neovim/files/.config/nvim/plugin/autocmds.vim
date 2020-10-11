function! s:autocommands() abort

	" removes trailing spaces when saving
	autocmd BufWritePre * call mirco#autocmds#zap()

	" remember folds between vim sessions
	augroup Folds
		autocmd!
		au BufWinLeave ?* silent! mkview 1
		au BufWinEnter ?* silent! loadview 1
	augroup END

	" remember cursor position between vim sessions
	autocmd BufReadPost *
		\ if line("'\"") > 0 && line("'\"") <= line("$") |
		\   exe "normal! g'\""|
		\ endif

	" indent settings based on filetype
	augroup Indent
		autocmd!
		au FileType haskell,html,css,sh,zsh,tex,yaml,json,markdown,cmake
			\ setlocal tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab
	augroup END

	let g:goyoed = 0

	augroup BetterFocus
		autocmd!
		au VimEnter,WinEnter,BufEnter,BufNewFile,BufWinEnter,FocusGained *
			\ if g:goyoed == 0 |
			\   let &l:colorcolumn=join(range(80, 254), ',') |
			\ endif
		au WinLeave,FocusLost *
			\ if g:goyoed == 0 |
			\   let &l:colorcolumn=join(range(1, 254), ',') |
			\ endif
		au InsertLeave,VimEnter,WinEnter *
			\ if g:goyoed == 0 |
			\   setlocal cursorline |
			\ endif
		au InsertEnter,VimLeave,WinLeave *
			\ if g:goyoed == 0 |
			\   setlocal nocursorline |
			\ endif
	augroup end

	function! s:mycolors() abort
		hi Comment gui=italic
		hi NonText gui=none
		hi link EndOfBuffer ColorColumn

		hi User1 guibg=#ab4642 guifg=#383838
		hi User2 guibg=#383838 guifg=#ab4642
		hi User3 guibg=#383838 guifg=#ffffff
		hi User4 guibg=#ffffff guifg=#181818
	endfunction

	augroup Colors
    autocmd!
    autocmd ColorScheme * call s:mycolors()
	augroup end

endfunction

call s:autocommands()
