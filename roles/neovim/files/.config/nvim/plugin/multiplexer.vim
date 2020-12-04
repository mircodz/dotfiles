if exists('$TMUX')
	if has('packages')
		packadd vim-tmux-navigator
		packadd vim-tmux-clipboard
		packadd tmux-complete.vim
		packadd vim-tmux-focus-events
	endif
else
	noremap <C-d> <C-w>h
	noremap <C-h> <C-w>j
	noremap <C-t> <C-w>k
	noremap <C-n> <C-w>l
endif
