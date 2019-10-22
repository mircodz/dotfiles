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

let g:zoomed = 0

function! s:toogle_zoom()
  if exists('$TMUX')
    if g:zoomed == 1
      silent !tmux set status on
      silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
      let g:zoomed = 0
    else
      silent !tmux set status off
      silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
      let g:zoomed = 1
    endif
  endif
endfunction

map <leader>z :call <SID>toogle_zoom()<CR>
