" Author: Greg Hurrell
function! Padding() abort
	let l:signcolumn=0
	if exists('+signcolumn')
		if &signcolumn == 'yes'
			let l:signcolumn=2
		elseif &signcolumn == 'auto'
			if exists('*execute')
				let l:signs=execute('sign place buffer=' .bufnr('$'))
			else
				let l:signs=''
				silent! redir => l:signs
				silent execute 'sign place buffer=' . bufnr('$')
				redir END
			end
			if match(l:signs, 'line=') != -1
				let l:signcolumn=2
			endif
		endif
	endif

	let l:minwidth=2
	let l:gutterWidth=max([strlen(line('$')) + 1, &numberwidth, l:minwidth]) + l:signcolumn
	let l:padding=repeat(' ', l:gutterWidth + 1)
	return l:padding
endfunction

set statusline=
set statusline+=%1*
set statusline+=%{Padding()}
set statusline+=%2*
set statusline+=
set statusline+=%0*
set statusline+=\ %f              " Full path to file
set statusline+=\ %m              " Modified flag
set statusline+=%r                " Read only flag
set statusline+=%=                " Split right from left group
set statusline+=%3*
set statusline+=
set statusline+=%4*
set statusline+=\ ℓ:%l/%L\ c:%c\  " Line and column

hi StatusLine   ctermbg=8  ctermfg=7
hi StatusLineNC ctermbg=18 ctermfg=7
