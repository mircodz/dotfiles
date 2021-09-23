require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true
  },
}

nvim_lsp = require('lspconfig')

-- See `:help vim.lsp.*` for documentation on any of the below functions
local on_attach = function(client, bufnr)
  -- Mappings.
	local defaults = {noremap = true, silent = true}
	local nmap = function(a, b) vim.api.nvim_buf_set_keymap(bufnr, 'n', a, b, defaults) end
	
	-- Navigation
  nmap('gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>')
  nmap('gd', '<Cmd>lua vim.lsp.buf.definition()<CR>')
  nmap('gr', '<cmd>lua vim.lsp.buf.references()<CR>')
  nmap('gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')

	-- Documentation
  nmap('K', '<Cmd>lua vim.lsp.buf.hover()<CR>')
  nmap('<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')

	-- Transformative actions
  nmap('<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
  nmap('<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>')
  nmap('<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>')
end

nvim_lsp.ccls.setup { on_attach = on_attach, }        -- C/C++
nvim_lsp.gopls.setup { on_attach = on_attach, }       -- Golang
nvim_lsp.pylsp.setup { on_attach = on_attach, }       -- Python
nvim_lsp.terraformls.setup { on_attach = on_attach, } -- Terraform
nvim_lsp.tsserver.setup { on_attach = on_attach, }    -- Typescript
nvim_lsp.vuels.setup{ on_attach = on_attach, }        -- Vue

-- Completion framework
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
