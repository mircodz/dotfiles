local exists = function(var) return vim.api.nvim_eval('exists("' .. var .. '")') end

local use = require('packer').use
require('packer').startup(function()
  use 'wbthomason/packer.nvim'                         -- Package manager

	use 'kana/vim-arpeggio'                              -- Key combos
	use 'tommcdo/vim-lion'                               -- Easy alignment
	use 'tpope/vim-eunuch'                               -- Better commands
	use 'tpope/vim-surround'                             -- Easy parenthesis
	use 'mileszs/ack.vim'                                -- :Ag
	use 'preservim/nerdcommenter'                        -- Easy commenting
	use 'rhysd/vim-clang-format'                         -- `clang-format` integration

	if exists("g:vscode") == 0 then
		use {
			'nvim-telescope/telescope.nvim',
			requires = {
				{'nvim-lua/popup.nvim'},
				{'nvim-lua/plenary.nvim'}
			}
		}

		-- -- Add indentation guides even on blank lines
		use 'lukas-reineke/indent-blankline.nvim'

		-- Even better git integration
		use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }

		-- Snippet support
		use 'SirVer/ultisnips'
		use 'honza/vim-snippets'

		use 'chriskempson/base16-vim'  -- More colorschemes
		use 'glts/vim-textobj-comment'
		use 'junegunn/goyo.vim'
		use 'junegunn/limelight.vim'   -- Highlight current paragraph
		use 'kana/vim-textobj-user'
		use 'mbbill/undotree'          -- Better undo
		use 'mphe/grayout.vim'         -- Clang grayout for inactive macros
		use 'overcache/NeoSolarized'   -- Dark/light Solarized colorschemes
		use 'tpope/vim-fugitive'       -- Better git support
		use 'tpope/vim-projectionist'  -- Switch between file alternatives

		use 'neovim/nvim-lspconfig'    -- Collection of configurations for built-in LSP client
		use 'hrsh7th/nvim-compe'       -- Better completion framework

		-- Better syntax highlighting
		use 'nvim-treesitter/nvim-treesitter'
		-- Additional textobjects for treesitter
		use 'nvim-treesitter/nvim-treesitter-textobjects'


		if exists('$TMUX') then
			use 'aserowy/tmux.nvim'
		end
	end
end)

require('gitsigns').setup {
  signs = {
    add          = {hl = 'GitSignsAdd'   , text = '│', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
    change       = {hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    delete       = {hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
  },
}

require('indent_blankline').setup {
    char = '│',
    buftype_exclude = {'terminal'}
}

require'telescope-config'
require'multiplexer'
require'language-servers'
require'statusline'
