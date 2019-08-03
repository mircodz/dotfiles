colorscheme default

" vim highlithing
hi VertSplit ctermbg=7 ctermfg=8
hi Folded ctermbg=8 ctermfg=7
hi LineNR ctermbg=8 ctermfg=7
hi Visual ctermbg=9

" code highlithing
hi cIncluded ctermbg=8
hi Comment cterm=italic

highlight clear CursorLine
highlight CursorLine   ctermbg=8
highlight CursorLineNR ctermbg=8
set cursorline

" Enable folds and remove fold background
set foldenable

" Highlight all columns beyond 80th
let &colorcolumn=join(range(81,999),",")
highlight ColorColumn ctermbg=8

" Highlight tabs and trailing spaces
let &showbreak='↳ '
set listchars=tab:›\ ,trail:·,nbsp:~
set list
