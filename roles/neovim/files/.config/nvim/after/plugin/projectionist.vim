let g:projectionist_heuristics = {
	\   '*': {
	\     '*.cpp': {
	\       'alternate': '../include/{}.hpp',
	\       'type': 'source'
	\     },
	\     '*.hpp': {
	\       'alternate': '../src/{}.cpp',
	\       'type': 'header'
	\     }
	\   }
	\ }
