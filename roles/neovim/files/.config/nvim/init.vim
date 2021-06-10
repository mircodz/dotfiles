" Author: Mirco De Zorzi

if !exists('g:vscode')
	call plug#begin()
		Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets' " Snippet support
		Plug 'Yggdroot/indentLine'                          " Indent guides
		Plug 'airblade/vim-gitgutter'
		Plug 'chriskempson/base16-vim'                      " More colorschemes
		Plug 'glts/vim-textobj-comment'
		Plug 'junegunn/fzf.vim'                             " Fuzzy matching
		Plug 'junegunn/goyo.vim'
		Plug 'junegunn/limelight.vim'                       " Highlight current paragraph
		Plug 'kana/vim-arpeggio'                            " Key combos
		Plug 'kana/vim-textobj-user'
		Plug 'mbbill/undotree'                              " Better undo
		Plug 'mileszs/ack.vim'                              " :Ag
		Plug 'mphe/grayout.vim'                             " Clang grayout for inactive macros
		" Plug 'neoclide/coc.nvim'                            " Language server protocol support
		Plug 'neovim/nvim-lspconfig'
		Plug 'overcache/NeoSolarized'                       " Solarized colorscheme
		Plug 'preservim/nerdcommenter'                      " Easy commenting
		Plug 'rhysd/vim-clang-format'                       " clang-format
		Plug 'tommcdo/vim-lion'                             " Easy alignment
		Plug 'tpope/vim-eunuch'                             " Better commands
		Plug 'tpope/vim-fugitive'                           " Better git support
		Plug 'tpope/vim-projectionist'                      " Switch between file alternatives
		Plug 'tpope/vim-surround'                           " Easy parenthesis
		Plug 'nvim-treesitter/nvim-treesitter'              " Better syntax highligthing
		Plug 'hrsh7th/nvim-compe'                           " Better completion engine

		if exists('$TMUX')
			Plug 'christoomey/vim-tmux-navigator'
			Plug 'roxma/vim-tmux-clipboard'
			Plug 'tmux-plugins/vim-tmux-focus-events'
			Plug 'wellle/tmux-complete.vim'
		endif
	call plug#end()
endif

lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true
  },
}

nvim_lsp = require('lspconfig')

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
end


-- C/C++
nvim_lsp.ccls.setup{
	on_attach = on_attach,
}

-- Go
nvim_lsp.gopls.setup{
	on_attach = on_attach,
}

-- Python
nvim_lsp.pyls.setup{
	on_attach = on_attach,
}

-- Terraform
nvim_lsp.terraformls.setup{
	on_attach = on_attach,
}

-- Typescript
nvim_lsp.tsserver.setup{
	on_attach = on_attach,
}

-- Vue
nvim_lsp.vuels.setup{
	on_attach = on_attach,
}

require'compe'.setup {
  enabled = true;
  autocomplete = true;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
    vsnip = true;
    ultisnips = true;
  };
}
EOF
