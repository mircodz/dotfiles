" Author: Mirco De Zorzi

if !exists('g:vscode') " disable plugins for daemon mode
	if has('packages')
		packadd! UltiSnips
		packadd! ack.vim
		packadd! base16-vim
		packadd! coc.nvim
		packadd! fzf.vim
		packadd! goyo.vim
		packadd! grayout.vim
		packadd! limelight.vim
		packadd! nerdcommenter
		packadd! undotree
		packadd! vim-arpeggio
		packadd! vim-devicons
		packadd! vim-eunuch
		packadd! vim-fugitive
		packadd! vim-gitgutter
		packadd! vim-lion
		packadd! vim-markdown
		packadd! vim-projectionist
		packadd! vim-snippets
		packadd! vim-surround
		packadd! vim-textobj-comment
		packadd! vim-textobj-user
	endif
endif
