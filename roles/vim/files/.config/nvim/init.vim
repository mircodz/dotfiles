" Author: Mirco De Zorzi


let g:goyoed = 0

set encoding=utf-8

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
    packadd! base16-vim
    packadd! coc.nvim
    packadd! fzf.vim
    packadd! goyo.vim
    packadd! grayout.vim
    packadd! haskell-vim
    packadd! limelight.vim
    packadd! nerdcommenter
    packadd! nerdtree
    packadd! undotree
    packadd! vim-arpeggio
    packadd! vim-markdown
    packadd! vim-projectionist
    packadd! vim-snippets
    packadd! vim-speeddating
    packadd! vim-textobj-comment
    packadd! vim-textobj-user
  endif
endif

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }

let loaded_matchparen = 1
let mapleader=";"
let maplocalleader=","

set foldmethod=manual
set shortmess=I

set mouse=a

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

filetype indent plugin on
syntax on

"set termguicolors
"let base16colorspace=256
colorscheme base16-default-dark


set noautochdir
set foldenable
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
set swapfile

let g:clang_format#style_options = {
            \ "BasedOnStyle" : "LLVM",
            \ "IndentWidth" : 4,
            \ "AccessModifierOffset" : -4,
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "Standard" : "C++11",
            \ "BreakBeforeBraces" : "Stroustrup"
            \ }

if has('nvim')
  let $FZF_DEFAULT_OPTS .= ' --inline-info'
endif


