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
  au FileType *         setlocal tabstop=4 softtabstop=0 noexpandtab shiftwidth=4 smarttab
  au FileType c         setlocal tabstop=8 softtabstop=0 noexpandtab shiftwidth=8 smarttab
  au FileType cpp       setlocal tabstop=4 softtabstop=0 noexpandtab shiftwidth=4 smarttab

  au FileType python    setlocal tabstop=4 softtabstop=0 expandtab   shiftwidth=4 smarttab
  au FileType sh,zsh    setlocal tabstop=2 softtabstop=0 expandtab   shiftwidth=2 smarttab
  au FileType tex,md    setlocal tabstop=2 softtabstop=0 expandtab   shiftwidth=2 smarttab
  au FileType vim       setlocal tabstop=2 softtabstop=0 expandtab   shiftwidth=2 smarttab
  au FileType yaml,json setlocal tabstop=2 softtabstop=0 expandtab   shiftwidth=2 smarttab
augroup END

" fold settings based on filetype
augroup Folds
  autocmd!
  au FileType * setlocal foldmethod=marker foldlevel=0
  au FileType * setlocal foldmethod=syntax foldlevel=999
augroup END

" org mode syntax highlight for vim
augroup OrgMode
  autocmd!
  au BufNewFile,BufRead *.org source ~/.nvim/syn_org.vim
  au BufNewFile,BufRead *.org source ~/.nvim/syn_todo.vim
augroup END

