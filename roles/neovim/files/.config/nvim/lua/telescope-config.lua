local defaults = {noremap = true, silent = true}
local nmap = function(from, to) vim.api.nvim_set_keymap('n', from, to, defaults) end

local actions = require 'telescope.actions'
local utils = require 'telescope.utils'

require('telescope').setup {
	defaults = {
		vimgrep_arguments = {
			'rg',
			'--color=never',
			'--no-heading',
			'--with-filename',
			'--line-number',
			'--column',
			'--smart-case',
			'--hidden',
		},
		borderchars = {'─', '│', '─', '│', '┌', '┐', '┘', '└'},
	},
}

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

nmap('<C-p>', [[<cmd>lua require('telescope.builtin').find_files()<CR>]])
nmap('<leader>b', [[<cmd>lua require('telescope.builtin').buffers()<CR>]])
nmap('<leader>s', [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]])
nmap('<leader>a', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]])
