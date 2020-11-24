if !exists('g:vscode') && has('packages') " Disable plugins when running under vscode
	let g:markdown_enable_folding = 1
	let g:markdown_folding = 1
endif

setlocal cursorline!                      " Remove all possible distractions, a middleground between normal and "zen mode"
setlocal number!
setlocal relativenumber!
