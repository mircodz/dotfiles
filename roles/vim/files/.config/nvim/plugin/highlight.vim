" vim highlithing
hi VertSplit ctermfg=8 ctermbg=18
hi Folded    ctermfg=8 ctermbg=18
hi LineNR    ctermfg=8 ctermbg=18
hi Visual              ctermbg=9

" code highlithing
hi cIncluded ctermbg=8
hi Comment cterm=italic

hi CursorLine   ctermbg=18 cterm=none
hi CursorLineNR ctermbg=18
set cursorline

" Enable folds and remove fold background
set foldenable

" Highlight all columns beyond 80th
let &colorcolumn=join(range(81,999),",")
hi ColorColumn ctermbg=18
hi link EndOfBuffer ColorColumn

" Highlight tabs and trailing spaces
let &showbreak='↳ '
set listchars=tab:›\ ,trail:·,nbsp:~
set list

hi Pmenu ctermbg=8 ctermfg=15

hi Normal ctermbg=none
