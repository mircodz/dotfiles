" Execute current buffer
nnoremap <C-c><C-r> :source %<cr>

" Execute current line
nnoremap <C-c><C-e> :execute getline(".")<cr>

" Execute current selected region
vnoremap <C-c><C-e> y:@"<cr>
