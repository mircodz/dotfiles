syntax on

set mouse=a

set tabstop=4 shiftwidth=4 expandtab

set list listchars=nbsp:¬,tab:»·,trail:·,extends:>
set completeopt=menu,menuone,noselect

set scrolloff=12
set relativenumber
set number
set showmode
set showcmd
set wildmenu
set wildoptions=pum
set ruler
set nowrap
set noexpandtab

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

" Statusline
set laststatus=3
highlight VertSplit cterm=NONE

" Color column
hi Bang ctermfg=red
match Bang /\%>79v.*\%<81v/

lua << EOF
local use = require'packer'.use

require'packer'.startup(function()
  use 'wbthomason/packer.nvim'                         -- Package manager
  use 'kana/vim-arpeggio'                              -- Key combos
  use 'preservim/nerdcommenter'                        -- Commenting
  use 'tommcdo/vim-lion'                               -- Alignment
  use 'tpope/vim-eunuch'                               -- Better commands

  -- Search
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim',
      'kyazdani42/nvim-web-devicons',
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
    requires = {
      'RishabhRD/popfix',
      'RishabhRD/nvim-lsputils',
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    }
  }

  -- Better syntax highligthing
  use {
    'nvim-treesitter/nvim-treesitter',
    config = [[require('config.treesitter')]],
  }

  -- Completion framework
  use {
    'hrsh7th/nvim-cmp',
    config = [[require('config.cmp')]],
    requires = {
      'onsails/lspkind-nvim',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-vsnip',
      'hrsh7th/vim-vsnip',
    },
  }

  -- Undo tree
  use {
    'mbbill/undotree',
    cmd = 'UndotreeToggle',
    config = [[vim.g.undotree_SetFocusWhenToggle = 1]],
  }

  -- Live command previews
  use {
    "smjonas/live-command.nvim",
    config = function()
      require("live-command").setup {
        commands = {
          Norm = { cmd = "norm" },
        },
      }
    end,
  }

  -- Better folds
  use {
    'kevinhwang91/nvim-ufo',
    requires = 'kevinhwang91/promise-async'
  }

  use "nvim-tree/nvim-tree.lua"
  use "nvim-tree/nvim-web-devicons"

  use 'eandrju/cellular-automaton.nvim' 

  -- Tmux integration
  use {
    "aserowy/tmux.nvim",
    config = function()
      require("tmux").setup({
        navigation = {
          enable_default_keybindings = false,
          cycle_navigation = true,
        },
      })
    end
  }

  use {
    'navarasu/onedark.nvim',
    config = function()
      require('onedark').setup({ })

      vim.cmd('colorscheme onedark')
    end
  }
end)

vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
vim.o.foldcolumn = '1'
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true

require('ufo').setup()

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})


local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map("n", "<C-d>", '<cmd>lua require("tmux").move_left()<cr>')
map("n", "<C-h>", '<cmd>lua require("tmux").move_bottom()<cr>')
map("n", "<C-t>", '<cmd>lua require("tmux").move_top()<cr>')
map("n", "<C-n>", '<cmd>lua require("tmux").move_right()<cr>')

local A = vim.api
function on(events, command, options)
  options = vim.F.if_nil(options, {})
  if type(options) == "string" then options = { desc = options } end
  local autocmd_options = {}
  autocmd_options[type(command) == "string" and "command" or "callback"] = command
  if not options.buffer then
    autocmd_options.pattern = options.patterns
  else
    autocmd_options.buffer = options.buffer or options.bufnr
  end
  if options.group then autocmd_options.group = options.group end
  return options.group, A.nvim_create_autocmd(events, autocmd_options)
end

on("TextYankPost", function() vim.highlight.on_yank({ higroup = "Search", on_visual = true }) end, "Provide a visual color feedback on yanking.")

EOF
