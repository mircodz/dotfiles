local defaults = { noremap = true, silent = true }
local nmap = function(from, to) vim.api.nvim_set_keymap('n', from, to, defaults) end

nmap('<C-p>', [[<cmd>lua require('telescope.builtin').find_files()<CR>]])
nmap('<leader>b', [[<cmd>lua require('telescope.builtin').buffers()<CR>]])
nmap('<leader>s', [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]])
nmap('<leader>a', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]])
