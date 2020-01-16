let mapleader=";"

map <leader>e :CocCommand explorer<CR>
map <leader>s :Goyo<CR>

map <Tab> za

let maplocalleader=","

map <F2> :w<CR>:!make<CR><CR>
map <F3> :!zathura "%:r.pdf" &<CR>
map <F4> :!wc %<CR>

noremap d h
noremap h j
noremap t k
noremap n l

noremap D ^
noremap H 5<Down>
noremap T 5<Up>
noremap N $

noremap j d
noremap k t
noremap s :
noremap l n

noremap J D
noremap K T
noremap S ;
noremap L N

nnoremap <leader>t :tabp<CR>
nnoremap <leader>h :tabn<CR>
nnoremap <leader>d :tabclose<CR>
nnoremap <leader>n :tabnew<CR>

noremap <C-n> <C-b>
noremap <C-b> <C-n>
imap <silent> <C-w> <C-n>

let g:gitgutter_map_keys = 0
