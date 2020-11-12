if has('statusline')
	if version >= 700
		set statusline =
		set statusline+=%{fugitive#statusline()}      " display branch name
		set statusline+=\ [%{strlen(&ft)?&ft:'none'}] " file type
		set statusline+=\ %f                          " filename
		set statusline+=\ %m                          " modified flag
		set statusline+=%=                            " indent right
		set statusline+=ℓ:%l/%L\ c:%c                 " line and column
	endif
endif
