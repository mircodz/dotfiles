function! s:enter()
  let g:goyoed = 1
  if exists('$TMUX')
    silent !tmux set status off
    silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  endif
  set noshowmode
  set noshowcmd
  set scrolloff=999
  set nocursorline
  set colorcolumn=0
  Limelight
endfunction

function! s:leave()
  let g:goyoed = 0
  if exists('$TMUX')
    silent !tmux set status on
    silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  endif
  set showmode
  set showcmd
  set scrolloff=5
  Limelight!
  let &l:colorcolumn=join(range(81, 255), ',')
  source ~/.config/nvim/plugin/highlight.vim
  source ~/.config/nvim/plugin/statusline.vim
endfunction

autocmd! User GoyoEnter nested call <SID>enter()
autocmd! User GoyoLeave nested call <SID>leave()

let g:limelight_conceal_ctermfg=8
