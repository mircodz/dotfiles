if PlugLoaded('vim-airline')
  let g:airline_powerline_fonts = 1
  let g:airline_theme='powerlineish'

  " clear unicode symbals not displaying correctly
  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
    let g:airline_symbols.linenr = ''
    let g:airline_symbols.maxlinenr = ''
  endif
endif

if PlugLoaded('lightline.vim')
  let g:lightline = {
    \   'colorscheme': 'powerlineish',
    \   'active': {
    \     'left':[ [ 'mode', 'paste' ],
    \              [ 'gitbranch', 'readonly', 'filename', 'modified' ]
    \     ]
    \   },
    \   'component': {
    \     'lineinfo': ' %3l:%-2v',
    \   },
    \   'component_function': {
    \     'gitbranch': 'fugitive#head',
    \   }
    \ }
  let g:lightline.separator = {
    \   'left': '', 'right': ''
    \}
  let g:lightline.subseparator = {
    \   'left': '', 'right': ''
    \}
endif

" in case the plugins are not loaded
set statusline=
set statusline+=\ %F                             " full path to file
set statusline+=\ %m                             " modified flag
set statusline+=%r                               " read only flag
set statusline+=\ %{tagbar#currenttag('%s','')}  " current function
set statusline+=%=                               " split right from left group
set statusline+=\ line:%l/%L\ col:%c\            " line and column
set statusline+=\ %p%%\                          " file percentage
