let $FZF_DEFAULT_OPTS .= ' --inline-info'

let g:fzf_action = {
	\ 'ctrl-t': 'tab split',
	\ 'ctrl-s': 'split',
	\ 'ctrl-v': 'vsplit' }

map <silent> <C-p> :call mirco#fzf#numless()<CR>
map <silent> <C-y> :call mirco#fzf#icons()<CR>
