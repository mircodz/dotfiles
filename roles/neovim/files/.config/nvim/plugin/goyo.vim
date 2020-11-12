function! s:enter()
	let g:goyoed = 1
	if exists('$TMUX')
		silent !tmux set status off
		silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
	endif
	set colorcolumn=0
	set scrolloff=999
	set nocursorline
	set noshowcmd
	set noshowmode
	Limelight
	hi NonText ctermfg=8
endfunction

function! s:leave()
	let g:goyoed = 0
	if exists('$TMUX')
		silent !tmux set status on
		silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
	endif
	let &l:colorcolumn=join(range(80, 255), ',')
	set scrolloff=5
	set cursorline
	set showcmd
	set showmode
	Limelight!
	source ~/.config/nvim/plugin/statusline.vim
endfunction

autocmd! User GoyoEnter nested call <SID>enter()
autocmd! User GoyoLeave nested call <SID>leave()

let g:limelight_conceal_ctermfg=8
