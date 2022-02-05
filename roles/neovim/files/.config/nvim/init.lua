local exists = function(var) return vim.api.nvim_eval('exists("' .. var .. '")') end

local use = require('packer').use
require('packer').startup(function()
  use 'wbthomason/packer.nvim'                         -- Package manager

	use 'kana/vim-arpeggio'                              -- Key combos
	use 'mileszs/ack.vim'                                -- :Ag
	use 'preservim/nerdcommenter'                        -- Easy commenting
	use 'rhysd/vim-clang-format'                         -- `clang-format` integration
	use 'tommcdo/vim-lion'                               -- Easy alignment
	use 'tpope/vim-eunuch'                               -- Better commands
	use 'tpope/vim-surround'                             -- Easy parenthesis

	if exists("g:vscode") == 0 then
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

		-- -- Add indentation guides even on blank lines
		use {
			'lukas-reineke/indent-blankline.nvim',
			config = [[require('config.indent')]],
		}

		-- Snippet support
		use 'SirVer/ultisnips'
		use 'honza/vim-snippets'

		-- Better git support
		use {
			{ 'tpope/vim-fugitive', cmd = { 'Git', 'Gstatus', 'Gblame', 'Gpush', 'Gpull' }, disable = true },
			{
				'lewis6991/gitsigns.nvim',
				requires = { 'nvim-lua/plenary.nvim' },
				config = [[require('config.gitsigns')]],
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

		-- Better syntax highlighting
		use {
			'nvim-treesitter/nvim-treesitter',
			requires = {
				'nvim-treesitter/nvim-treesitter-refactor',
				'nvim-treesitter/nvim-treesitter-textobjects',
			},
			config = [[require('config.treesitter')]],
			run = ':TSUpdate',
		}

		-- Undo tree
		use {
			'mbbill/undotree',
			cmd = 'UndotreeToggle',
			config = [[vim.g.undotree_SetFocusWhenToggle = 1]],
		}

		use 'kana/vim-textobj-user'
		use 'glts/vim-textobj-comment'

		use 'junegunn/goyo.vim'
		use 'junegunn/limelight.vim'   -- Highlight current paragraph
		use 'mphe/grayout.vim'         -- Clang grayout for inactive macros
		use 'overcache/NeoSolarized'   -- Dark/light Solarized colorschemes
		use 'tpope/vim-projectionist'  -- Switch between file alternatives
		use 'sheerun/vim-polyglot'

		if exists('$TMUX') then
			use 'aserowy/tmux.nvim'
		end
	end
end)

require'multiplexer'
require'statusline'
