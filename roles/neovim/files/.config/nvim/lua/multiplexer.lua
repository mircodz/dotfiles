local exists = function(var) return vim.api.nvim_eval('exists("' .. var .. '")') end

if exists('$TMUX') == 1 then
	require'tmux'.setup {
		copy_sync = {
			enable = true,
		},
		navigation = {
			enable_default_keybindings = true,
		},
		resize = {
			enable_default_keybindings = true,
		}
	}
else
	local defaults = {noremap = true, silent = true}
	local nmap = function(from, to) vim.api.nvim_set_keymap('n', from, to, defaults) end

	nmap('<C-d>', '<C-w>h')
	nmap('<C-h>', '<C-w>j')
	nmap('<C-t>', '<C-w>k')
	nmap('<C-n>', '<C-w>l')
end
