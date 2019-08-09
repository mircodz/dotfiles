function! s:enter()
  if exists('$TMUX')
    silent !tmux set status off
    silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  endif
  set noshowmode
  set noshowcmd
  set scrolloff=999
  set cursorline!
  Limelight
endfunction

function! s:leave()
  if exists('$TMUX')
    silent !tmux set status on
    silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  endif
  set showmode
  set showcmd
  set scrolloff=5
  Limelight!
  source ~/.config/nvim/plugin/highlight.vim
endfunction

autocmd! User GoyoEnter nested call <SID>enter()
autocmd! User GoyoLeave nested call <SID>leave()

let g:limelight_conceal_ctermfg=8
