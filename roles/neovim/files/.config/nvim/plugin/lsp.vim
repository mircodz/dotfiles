if !use_coc
	let g:coc_global_extensions = [
		\ 'coc-python',
		\ 'coc-tsserver', 'coc-vetur',
		\ 'coc-snippets', 'coc-explorer',
		\ 'coc-json', 'coc-yaml' ]

	let g:coc_snippet_next = '<c-h>'
	let g:coc_snippet_prev = '<c-t>'

	nmap <silent> gd <Plug>(coc-definition)
	nmap <silent> gy <Plug>(coc-type-definition)
	nmap <silent> gi <Plug>(coc-implementation)
	nmap <silent> gr <Plug>(coc-references)
	nmap <silent> rn <Plug>(coc-rename)

	imap <silent> <Tab> <Plug>(coc-snippets-expand)

	vmap <leader>f <Plug>(coc-format-selected)
	nmap <leader>f <Plug>(coc-format-selected)
else
lua <<EOF
	vim.cmd('packadd nvim-lspconfig')
	require'nvim_lsp'.ccls.setup{}
	require'nvim_lsp'.sqlls.setup{
		cmd = {"/home/mirco/go/bin/sqls", "up", "--method", "stdio"};
	}
	require'nvim_lsp'.pyls.setup{}
EOF

	nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
	nnoremap <silent> gs <cmd>lua vim.lsp.buf.hover()<CR>
	nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
	nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
endif
