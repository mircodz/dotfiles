map <silent> <C-o> :w<CR>
map <silent> <C-p> :FZF<CR>
map <silent> <C-s> :Tagbar<CR>
map <silent> <C-u> :NERDTreeToggle<CR>

map <leader>ll :setlocal spell!<CR>
map <leader>ss :Goyo<CR>
map <leader>nn :e $HOME/.config/nvim/init.vim<CR>

map <F2> :w<CR>:!make "%:r"<CR><CR>
map <F3> :!zathura "%:r.pdf" &<CR>
map <F4> :!wc %<CR>

map <F6> "+yy:!xdg-open <C-R>+&<CR><CR>

noremap d h
noremap h j
noremap t k
noremap n l

noremap D 0
noremap H 5<Down>
noremap T 5<Up>
noremap N $

noremap j d
noremap k t
noremap s :
noremap l n

noremap <C-n> <C-b>
noremap <C-b> <C-n>

noremap J D
noremap K T
noremap S ;
noremap L N

nnoremap <leader>t :tabp<CR>
nnoremap <leader>h :tabn<CR>
nnoremap <leader>d :tabclose<CR>
nnoremap <leader>n :tabnew<CR>

