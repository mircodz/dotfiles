if PlugLoaded('coc.nvim')
  let g:coc_global_extensions = [
   \ 'coc-python', 'coc-tsserver',
   \ 'coc-snippets',
   \ 'coc-json', 'coc-yaml' ]

  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)

  imap <Tab> <Plug>(coc-snippets-expand)
  let g:coc_snippet_next = '<c-h>'
  let g:coc_snippet_prev = '<c-t>'

  set signcolumn=no
  set shortmess+=c
endif
