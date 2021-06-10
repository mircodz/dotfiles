if has('packages')
	let g:markdown_enable_folding = 1
	let g:markdown_folding = 1
	let g:vim_markdown_folding_disabled = 1 " Disable vim-markdown folding as it's broken
endif

setlocal fillchars+=fold:\ "              " Don't display any fill characters
setlocal foldtext=mirco#fold#markdown()   " Change folding style to one inspired by Emacs

setlocal cursorline!
setlocal number!
setlocal relativenumber!
setlocal conceallevel=0
