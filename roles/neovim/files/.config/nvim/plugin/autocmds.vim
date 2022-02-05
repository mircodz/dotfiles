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
