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
