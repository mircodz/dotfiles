function! mirco#color#set() abort
	hi link EndOfBuffer ColorColumn
	hi link LspDiagnosticsError Comment

	hi CursorLineNr                             guifg=#81a2be
	hi Folded       gui=bold      guibg=none
	hi Search       gui=underline guibg=none    guifg=#cc6666
	hi Substitute                 guibg=none    guifg=#b5bd68
	hi Comment      gui=italic
	hi TabLineFill                guibg=#1d1f21
	hi TabLine                    guibg=#1d1f21
	hi TabLineSel                 guibg=#1d1f21 guifg=#81a2be
	hi NonText                                  guifg=Grey30
endfunction
