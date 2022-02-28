local lsp = require'lspconfig'

local on_attach = function(client, bufnr)
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

lsp.ccls.setup  { on_attach = on_attach, } -- C/C++
lsp.gopls.setup { on_attach = on_attach, } -- Golang
lsp.pylsp.setup { on_attach = on_attach, } -- Python
