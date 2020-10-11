function! mirco#fzf#numless() abort
	execute 'Files'
	setlocal nonumber norelativenumber
endfunction

function! mirco#fzf#icons() abort
	let l:fzf_files_options = '--preview "bat --color always --style numbers {2..} | head -'.&lines.'"'
	function! s:edit_devicon_prepended_file(item)
		let l:file_path = a:item[4:-1]
		execute 'silent e' l:file_path
	endfunction
	call fzf#run({
		\ 'source': $FZF_DEFAULT_COMMAND .' | devicon-lookup',
		\ 'sink':   function('s:edit_devicon_prepended_file'),
		\ 'options': '-m ' . l:fzf_files_options,
		\ 'down':    '40%' })
	setlocal nonumber norelativenumber
endfunction
