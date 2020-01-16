if exists('$TMUX')
	packadd vim-tmux-navigator
	packadd vim-tmux-clipboard
	packadd tmux-complete.vim
else
	noremap <C-d> <C-w>h
	noremap <C-h> <C-w>j
	noremap <C-t> <C-w>k
	noremap <C-n> <C-w>l
endif
