" Execute current buffer
nnoremap <C-C><C-R> :source %

" Execute current line
nnoremap <C-C><C-E> :execute getline(".")<CR>

" Execute current selected region
vnoremap <C-C><C-E> :<C-u>for line in getline("'<", "'>") \| execute line \| endfor<CR>
