if has('folding')
	let g:markdown_enable_folding = 1
	let g:markdown_folding = 1

	set foldcolumn=4

	let g:vim_markdown_folding_disabled = 1 " disable vim-markdown folding as it's broken
endif

setlocal cursorline!
setlocal number!
setlocal relativenumber!
