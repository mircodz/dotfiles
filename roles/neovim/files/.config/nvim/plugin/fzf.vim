if executable('fzf')
	let g:fzf_action = {
		\ 'ctrl-t': 'tab split',
		\ 'ctrl-s': 'split',
		\ 'ctrl-v': 'vsplit'
		\ }

	let g:fzf_layout = { 'down': '40%' }

	let $FZF_DEFAULT_OPTS = '--info=inline --no-preview'
	let $FZF_DEFAULT_COMMAND="rg --files"

	map <silent> <C-p> :call mirco#fzf#numless()<CR>
endif
