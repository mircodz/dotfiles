local srequire = require'config.utils'.srequire
local lsp = srequire'lspconfig'

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

if not lsp.stud then
  lsp.ccls.setup { on_attach = on_attach, }        -- C/C++
  lsp.gopls.setup { on_attach = on_attach, }       -- Golang
  lsp.pylsp.setup { on_attach = on_attach, }       -- Python
  lsp.terraformls.setup { on_attach = on_attach, } -- Terraform
  lsp.tsserver.setup { on_attach = on_attach, }    -- Typescript
  lsp.vuels.setup { on_attach = on_attach, }       -- Vue
end
