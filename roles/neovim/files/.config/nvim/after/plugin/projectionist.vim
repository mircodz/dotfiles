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
	\   },
	\   'code/hort/daemon/*': {
	\     'src/hort/*.cpp': {
	\       'alternate': '../../include/hort/{}.hpp',
	\       'type': 'source'
	\     },
	\     'include/hort/*.hpp': {
	\       'alternate': '../../src/hort/{}.cpp',
	\       'type': 'header'
	\     },
	\     'src/interfaces/*.cpp': {
	\       'alternate': '../../include/interfaces/{}.hpp',
	\       'type': 'source'
	\     },
	\     'include/interfaces/*.hpp': {
	\       'alternate': '../../src/interfaces/{}.cpp',
	\       'type': 'header'
	\     }
	\   },
	\ }
