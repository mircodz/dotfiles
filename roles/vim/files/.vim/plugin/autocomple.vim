if PlugLoaded('coc.nvim')
  let g:coc_global_extensions = [
   \ 'coc-python', 'coc-snippets', 'coc-tsserver', 'coc-json', 'coc-yaml' ]

  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)

  set signcolumn=no
  set shortmess+=c
endif
