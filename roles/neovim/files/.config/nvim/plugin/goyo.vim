function! s:enter()
	if exists('$TMUX')
		silent !tmux set status off
		silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
	endif
	set scrolloff=999
	set cursorline!
	set showcmd!
	set showmode!
	set wrap
	Limelight
endfunction

function! s:leave()
	if exists('$TMUX')
		silent !tmux set status on
		silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
	endif
	set scrolloff=5
	set cursorline
	set showcmd
	set showmode
	set nowrap
	Limelight!
	call mirco#color#set()
endfunction

autocmd! User GoyoEnter nested call <SID>enter()
autocmd! User GoyoLeave nested call <SID>leave()

let g:limelight_conceal_ctermfg=8
