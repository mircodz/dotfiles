"if PlugLoaded('lightline.vim')
  "let g:lightline = {
    "\   'colorscheme': 'powerlineish',
    "\   'active': {
    "\     'left':[ [ 'mode', 'paste' ],
    "\              [ 'gitbranch', 'readonly', 'filename', 'modified' ]
    "\     ]
    "\   },
    "\   'component': {
    "\     'lineinfo': ' %3l:%-2v',
    "\   },
    "\   'component_function': {
    "\     'gitbranch': 'fugitive#head',
    "\   }
    "\ }
  "let g:lightline.separator = {
    "\   'left': '', 'right': ''
    "\}
  "let g:lightline.subseparator = {
    "\   'left': '', 'right': ''
    "\}
"endif

"if PlugLoaded('vim-airline')
  "let g:airline_powerline_fonts = 1
  "let g:airline_theme='powerlineish'

  "" clear unicode symbals not displaying correctly
  "if !exists('g:airline_symbols')
    "let g:airline_symbols = {}
    "let g:airline_symbols.linenr = ''
    "let g:airline_symbols.maxlinenr = ''
  "endif
"endif

set statusline=
set statusline+=%{StatusColor()}
set statusline+=%1*                              " a
set statusline+=\ \ \ \ \                        " a
set statusline+=%2*                              " a
set statusline+=                                " a
set statusline+=%0*                              " a
set statusline+=\ %F                             " full path to file
set statusline+=\ %m                             " modified flag
set statusline+=%r                               " read only flag
set statusline+=%=                               " split right from left group
set statusline+=\ ℓ:%l/%L\ c:%c\                 " line and column
set statusline+=\ %p%%\                          " file percentage

hi StatusLine   ctermbg=8  ctermfg=7
hi StatusLineNC ctermbg=18 ctermfg=7

function! StatusColor()
  if mode() == 'n'
    hi User1 ctermbg=4 ctermfg=8
    hi User2 ctermbg=8 ctermfg=4
  elseif mode() == 'i'
    hi User1 ctermbg=10 ctermfg=8
    hi User2 ctermbg=8  ctermfg=10
  elseif mode() == 'R'
    hi User1 ctermbg=1 ctermfg=8
    hi User2 ctermbg=8 ctermfg=1
  elseif mode() == 'v' || mode() == 'V' || mode() == '^V'
    hi User1 ctermbg=3 ctermfg=8
    hi User2 ctermbg=8 ctermfg=3
  endif
  redrawstatus!
  return ''
endfunction
