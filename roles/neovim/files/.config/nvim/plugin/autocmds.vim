function! s:autocommands() abort

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
		au FileType haskell,html,css,sh,zsh,tex,yaml,json,markdown,cmake,cpp,c,python
			\ setlocal tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab
	augroup END

	let g:goyoed = 0

	augroup BetterFocus
		autocmd!
		au VimEnter,WinEnter,BufEnter,BufNewFile,BufWinEnter,FocusGained * 
			\ if &ft != "markdown" |
			\ 	setlocal cursorline |
			\ endif
		au WinLeave,FocusLost * 
			\ if &ft != "markdown" |
			\ 	setlocal cursorline! |
			\ endif
	augroup end

	" set correct colors
	function! s:colors() abort
		hi link EndOfBuffer ColorColumn
		hi Folded guibg=#282828
		hi Search gui=underline guibg=none guifg=#ab4642
		hi Substitute guibg=none guifg=#a1b56c

		hi Comment gui=italic
		hi NonText gui=none

		hi TabLineFill guibg=#282828
		hi TabLine     guibg=#282828
		hi TabLineSel  guibg=#181818 guifg=#787878
	endfunction

	augroup Colors
		autocmd!
		autocmd ColorScheme * call s:colors()
	augroup end

	" remove number line in terminal mode
	function! s:term() abort
		setlocal number!
		setlocal relativenumber!
	endfunction

	augroup Terminal
		autocmd!
		autocmd TermOpen * call s:term()
	augroup end

endfunction

call s:autocommands()
