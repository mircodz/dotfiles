if !exists('g:vscode')
	call arpeggio#map('i', '', 0, 'eu', '<Esc>')
	call arpeggio#map('t', '', 0, 'eu', '<C-\><C-n>')
endif

" remap tpope/vim-speeddating conflicting mappings
nmap <localleader>dn <Plug>SpeedDatingNowUTC
unmap d<c-x>
unmap d<c-a>

map <localleader>ds <Plug>Dsurround
unmap ds
