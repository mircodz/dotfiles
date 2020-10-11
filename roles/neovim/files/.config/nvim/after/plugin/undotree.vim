" remap navigatio keys to dvorak layout
function! g:Undotree_CustomMap() abort
		map <buffer> H 5<down>
		map <buffer> T 5<up>
		map <buffer> h <down>
		map <buffer> t <up>
endfunction

map <silent> <C-C> :UndotreeToggle<CR>
