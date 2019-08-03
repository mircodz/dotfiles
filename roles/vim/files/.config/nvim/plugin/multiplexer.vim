if exists('$TMUX')
  packadd vim-tmux-navigator
  packadd vim-tmux-clipboard
  packadd tmux-complete.vim
else
  noremap <C-D> <C-W>h
  noremap <C-H> <C-W>j
  noremap <C-T> <C-W>k
  noremap <C-N> <C-W>l
endif
