syntax on

set tabstop=4 shiftwidth=4 expandtab

set list listchars=nbsp:¬,tab:»·,trail:·,extends:>

set scrolloff=12
set relativenumber
set number
set showmode
set showcmd
set wildmenu
set ruler
set nowrap

" Search
set ignorecase
set hlsearch
set incsearch

" Mappings
let mapleader=' '

noremap d h
noremap h j
noremap t k
noremap n l

noremap D ^
noremap H 5<Down>
noremap T 5<Up>
noremap N $

noremap j d
noremap k t
noremap s :
noremap l n

noremap J D
noremap K T
noremap S ;
noremap L N

nnoremap <C-d> <C-w>h
nnoremap <C-h> <C-w>j
nnoremap <C-t> <C-w>k
nnoremap <C-n> <C-w>l

lua << EOF
local use = require('packer').use
require('packer').startup(function()
  use 'wbthomason/packer.nvim'                         -- Package manager

  use 'kana/vim-arpeggio'                              -- Key combos
  use 'mileszs/ack.vim'                                -- :Ag
  use 'preservim/nerdcommenter'                        -- Commenting
  use 'tommcdo/vim-lion'                               -- Alignment
  use 'tpope/vim-eunuch'                               -- Better commands

  -- Search
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim',
    },
    wants = {
      'popup.nvim',
      'plenary.nvim',
    },
    setup = [[require('config.telescope_setup')]],
    config = [[require('config.telescope')]],
    cmd = 'Telescope',
    module = 'telescope',
  }
  
  -- Better git support
  use {
    { 'tpope/vim-fugitive', cmd = { 'Git', 'Gstatus', 'Gblame', 'Gpush', 'Gpull' }, disable = true },
    {
      'lewis6991/gitsigns.nvim',
      requires = { 'nvim-lua/plenary.nvim' },
    },
    { 'TimUntersberger/neogit', cmd = 'Neogit' },
  }
  
  -- Collection of configurations for built-in LSP client
  use {
    'neovim/nvim-lspconfig',
    config = [[require('config.lsp')]],
  }
  
  -- Better completion framework
  use {
    'hrsh7th/nvim-compe',
    config = [[require('config.compe')]],
  }
  
  -- Undo tree
  use {
    'mbbill/undotree',
    cmd = 'UndotreeToggle',
    config = [[vim.g.undotree_SetFocusWhenToggle = 1]],
  }
end)
EOF
