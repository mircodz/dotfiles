local lsp = require'lspconfig'

local on_attach = function(client, bufnr)
  -- Auto-format on save
  -- vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.formatting()]]

  -- Mappings
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

require'mason'.setup()
require'mason-lspconfig'.setup({
  ensure_installed = { "clangd", "gopls", "pylsp", "yamlls", "jsonls" }
})

-- C/C++
lsp.clangd.setup {
  on_attach = on_attach,
}

-- Go
lsp.gopls.setup {
  on_attach = on_attach,
}

-- Python
lsp.pylsp.setup {
  on_attach = on_attach,
}

-- Yaml
lsp.yamlls.setup {
  on_attach = on_attach,
}

-- Json
lsp.jsonls.setup {
  on_attach = on_attach,
}

-- Typescript
lsp.tsserver.setup {
  on_attach = on_attach,
}
