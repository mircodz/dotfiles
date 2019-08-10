" Author: Mirco De Zorzi

function! g:PlugLoaded(plugin)
  let l:paths = split(&packpath, ',')
  for path in l:paths
    if isdirectory(path . '/pack/bundle/opt/' . a:plugin)
      return 1
    endif
  endfor
  return 0
endfunction

if &loadplugins
  if has('packages')
    packadd! UltiSnips
    packadd! coc.nvim
    packadd! fzf.vim
    packadd! goyo.vim
    packadd! lightline.vim
    packadd! limelight.vim
    packadd! nerdcommenter
    packadd! nerdtree
    packadd! undotree
    packadd! vim-arpeggio
    packadd! vim-markdown
    packadd! vim-snippets
    packadd! vim-textobj-comment
    packadd! vim-textobj-user
  endif
endif


let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

let loaded_matchparen = 1
let mapleader=";"

set foldmethod=manual

" Author: Greg Hurrell
let s:middot='·'
let s:raquo='»'
let s:small_l='ℓ'
function! Foldtext()
  let l:lines='[' . (v:foldend - v:foldstart + 1) . s:small_l . ']'
  let l:first=substitute(getline(v:foldstart), '\v *', '', '')
  let l:dashes=substitute(v:folddashes, '-', s:middot, 'g')
  return s:raquo . s:middot . s:middot . l:lines . l:dashes . ': ' . l:first
endfunction

set foldtext=Foldtext()

" Undo tree with dvorak binds
function! g:Undotree_CustomMap()
    map <buffer> H 5<down>
    map <buffer> T 5<up>
    map <buffer> h <down>
    map <buffer> t <up>
endfunction
map <silent> <C-C> :UndotreeToggle<CR>

" File navigation
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeMapOpenInTab='\t'

set encoding=utf-8
filetype indent plugin on
syntax on

set number relativenumber
set ruler hidden wrap
set ignorecase incsearch
set splitright splitbelow
set wildmode=longest,full

set formatoptions-=c formatoptions-=r formatoptions-=o

" Set undo directory, if it doesn't exist create it
if !isdirectory($HOME."/.undo")
    call mkdir($HOME."/.undo", "", 0700)
endif
set undodir=$HOME/.undo
set undofile

