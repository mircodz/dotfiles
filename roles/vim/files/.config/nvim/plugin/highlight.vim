" vim highlithing
hi VertSplit ctermfg=8 ctermbg=18
hi Folded    ctermfg=8 ctermbg=18
hi LineNR    ctermfg=8 ctermbg=18
hi Pmenu     ctermbg=8 ctermfg=15
hi Normal    ctermbg=none

hi CursorLine   ctermbg=18 cterm=none
hi CursorLineNR ctermbg=18
set cursorline

" Highlight all columns beyond 80th
let &colorcolumn=join(range(81,254),",")
hi ColorColumn ctermbg=18
hi link EndOfBuffer ColorColumn

" Highlight tabs and trailing spaces
let &showbreak='↳ '
set listchars=tab:›\ ,trail:·,nbsp:~
set list

" code highlithing
hi Comment cterm=italic

" c/c++
hi Include                         cterm=bold
hi cIncluded ctermbg=8
