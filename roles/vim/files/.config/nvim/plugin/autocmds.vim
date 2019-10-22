" removes trailing spaces when saving
autocmd BufWritePre * call autocmds#zap()

function! autocmds#zap()
  let cur = getcurpos()
  %s/\s\+$//e
  call cursor(cur[1], cur[2])
endfunction

" remember folds between vim sessions
augroup RememberFolds
  autocmd!
  au BufWinLeave ?* mkview 1
  au BufWinEnter ?* silent! loadview 1
augroup END

" remember cursor position between vim sessions
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \     exe "normal! g'\""|
    \ endif
autocmd BufRead * normal zz

" indent settings based on filetype
augroup Indent
  autocmd!
  au FileType *,c,cpp,python
    \ setlocal tabstop=4 softtabstop=0 noexpandtab shiftwidth=4 smarttab
  au FileType haskell,html,css,sh,zsh,tex,md,vim,yaml,json
    \ setlocal tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab
augroup END

" fold settings based on filetype
augroup Folds
  autocmd!
  au FileType * setlocal foldmethod=marker foldlevel=0
  au FileType * setlocal foldmethod=syntax foldlevel=999
augroup END

augroup BetterFocus
  autocmd!

  au VimEnter,WinEnter,BufEnter,BufNewFile,BufWinEnter,FocusGained *
    \ if g:goyoed == 0 |
    \   let &l:colorcolumn=join(range(81, 255), ',') |
    \ endif

  au WinLeave,FocusLost *
    \ if g:goyoed == 0 |
    \   let &l:colorcolumn=join(range(1, 255), ',') |
    \ endif

  au InsertLeave,VimEnter,WinEnter *
    \ if g:goyoed == 0 |
    \   setlocal cursorline |
    \ endif

  au InsertEnter,VimLeave,WinLeave *
    \ if g:goyoed == 0 |
    \   setlocal nocursorline |
    \ endif

augroup end
