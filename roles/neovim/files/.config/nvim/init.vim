" Author: Mirco De Zorzi

let use_coc = 1                         " either use integrated lsp or coc.nvim

if !exists('g:vscode')                  " disable plugins for daemon mode
	if has('packages')
		" Languages
		if use_coc
			packadd! coc.nvim                 " language server support
		endif
		packadd! grayout.vim                " clang grayout for inactive macros
		packadd! vim-markdown
		packadd! markdown-preview.nvim

		" Snippets
		packadd! UltiSnips
		packadd! vim-snippets

		" File Management
		packadd! ack.vim
		if executable('fzf')
			packadd! fzf.vim
		else
			packadd! ctrlp.vim
		endif
		packadd! vim-arpeggio               " key chores
		packadd! vim-eunuch

		" Project Management
		packadd! vim-projectionist          " switch between file alternatives
		packadd! vim-surround
		packadd! vim-textobj-comment
		packadd! vim-textobj-user

		" Editing
		packadd! nerdcommenter
		packadd! undotree
		packadd! vim-lion

		" Version Control
		packadd! vim-fugitive
		packadd! vim-gitgutter

		" Theme
		packadd! base16-vim

		" Zen Mode
		packadd! goyo.vim
		packadd! limelight.vim
	endif
endif
