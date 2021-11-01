silent! call arpeggio#map('i', '', 0, 'eu', '<Esc>')
silent! call arpeggio#map('t', '', 0, 'eu', '<C-\><C-n>')

" remove Dsurround conflict
silent! unmap ds
