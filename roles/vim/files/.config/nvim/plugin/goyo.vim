function! s:enter()
  set noshowmode
  set noshowcmd
  set scrolloff=999
  Limelight
endfunction

function! s:leave()
  set showmode
  set showcmd
  set scrolloff=5
  Limelight!
  source ~/.config/nvim/plugin/highlight.vim
endfunction

autocmd! User GoyoEnter nested call <SID>enter()
autocmd! User GoyoLeave nested call <SID>leave()

let g:limelight_conceal_ctermfg=8
