" disable indent lines in terminal mode
autocmd TermOpen * IndentLinesDisable

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

augroup BetterFocus
	autocmd!
	au VimEnter,WinEnter,BufEnter,BufNewFile,BufWinEnter,FocusGained * setlocal cursorline
	au WinLeave,FocusLost * setlocal cursorline!
augroup end

" set correct colors
augroup Colors
	autocmd!
	autocmd ColorScheme * call mirco#color#set()
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

augroup BetterFocus
	autocmd!
	au VimEnter,WinEnter,BufEnter,BufNewFile,BufWinEnter,FocusGained *
		\ let &l:colorcolumn=join(range(80, 254), ',')
	au WinLeave,FocusLost *
		\ let &l:colorcolumn=join(range(1, 254), ',')
augroup end
