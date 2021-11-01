function! s:colorscheme(name) abort
    let pat = 'colors/'.a:name.'.vim'
    return !empty(globpath(&rtp, pat))
endfunction

if s:colorscheme('base16-gruvbox-dark-soft') 
	colorscheme base16-gruvbox-dark-soft
endif
if s:colorscheme('NeoSolarized')
	colorscheme NeoSolarized
endif

filetype indent plugin on
syntax on

set autoindent                        " Maintain indent of current line
set backspace=indent,start,eol        " Allow unrestricted backspacing in insert mode

if exists('+colorcolumn')             " Highlight all columns after the 254th
	let &l:colorcolumn='+' . join(range(80, 254), ',+')
endif

if has('folding')
	set foldenable                      " Enable folding
	set foldmethod=manual
	set foldlevel=999                   " Always start unfolded
	set foldtext=mirco#fold#text()      " Change folding style to one inspired by Emacs
endif

set cursorline                        " Highlight current line
set inccommand=nosplit                " Live preview in substitution comands

if has('termguicolors')
	set termguicolors                   " Use guifg/guibg instead of ctermfg/ctermbg in terminal
endif

if has('mouse')
	set mouse=a                         " Enable mounse
endif

if has('syntax')
	set synmaxcol=254                   " Don't bother syntax highlighting long lines
endif

set splitright splitbelow             " More intuitive splits

let &showbreak='↳ '                   " Line-break character
set listchars=tab:\▏\ ,trail:·,nbsp:~
set list

if !isdirectory($HOME . '/.undo')     " Enable better undo
	call mkdir($HOME . '/.undo', '', 0700)
endif
set undodir=$HOME/.undo
set undofile
set swapfile

set number                            " Show line numbers
if exists('+relativenumber')
	set relativenumber                  " Show relative numbers
endif

set formatoptions+=c                  " Auto-wrap comments using textwidth and insert comment header
set formatoptions-=r                  " Don't insert comment header after hitting 'enter'
set formatoptions-=o                  " Don't insert comment header after hitting 'o'
set formatoptions+=j                  " Remove leading comment when joining strings

set shortmess+=A                      " Hide most of the annoying messages cause by swapfiles
set shortmess+=I
set shortmess+=W

" Convert tabs to 2 spaces
set tabstop=2 softtabstop=0 noexpandtab shiftwidth=2 smarttab

" These options still have to be sorted
set hidden
set ignorecase incsearch
set noautochdir
set nowrap
set ruler
set signcolumn=yes
set wildmode=longest,full
