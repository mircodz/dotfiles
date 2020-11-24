" Use integrated lps for SQL filetypes as it has better support than coc.nvim

execute "silent! CocDisable"

lua <<EOF
vim.cmd('packadd nvim-lspconfig')
require'nvim_lsp'.sqlls.setup{
	cmd = {"/home/mirco/go/bin/sqls", "up", "--method", "stdio"};
}
EOF
