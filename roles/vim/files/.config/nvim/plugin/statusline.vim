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

function! Padding() abort
  let l:signcolumn=0
  if exists('+signcolumn')
    if &signcolumn == 'yes'
      let l:signcolumn=2
    elseif &signcolumn == 'auto'
      if exists('*execute')
        let l:signs=execute('sign place buffer=' .bufnr('$'))
      else
        let l:signs=''
        silent! redir => l:signs
        silent execute 'sign place buffer=' . bufnr('$')
        redir END
      end
      if match(l:signs, 'line=') != -1
        let l:signcolumn=2
      endif
    endif
  endif

  let l:minwidth=2
  let l:gutterWidth=max([strlen(line('$')) + 1, &numberwidth, l:minwidth]) + l:signcolumn
  let l:padding=repeat(' ', l:gutterWidth + 1)
  return l:padding
endfunction

set statusline=
set statusline+=%{StatusColor()}
set statusline+=%1*
set statusline+=%{Padding()}
set statusline+=%2*
set statusline+=
set statusline+=%0*
set statusline+=\ %f                             " full path to file
set statusline+=\ %m                             " modified flag
set statusline+=%r                               " read only flag
set statusline+=%=                               " split right from left group
set statusline+=%3*
set statusline+=
set statusline+=%4*
set statusline+=\ ℓ:%l/%L\ c:%c\                 " line and column

hi StatusLine   ctermbg=8  ctermfg=7
hi StatusLineNC ctermbg=18 ctermfg=7

hi User3 ctermbg=8  ctermfg=7
hi User4 ctermbg=7 ctermfg=8

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
