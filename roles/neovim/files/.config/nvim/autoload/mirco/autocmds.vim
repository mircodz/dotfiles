" remove trailing whitespace without moving the cursor
function! mirco#autocmds#zap() abort
	let cur = getcurpos()
	%s/\s\+$//e
	call cursor(cur[1], cur[2])
endfunction
