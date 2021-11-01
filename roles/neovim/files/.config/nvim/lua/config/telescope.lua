local srequire = require'config.utils'.srequire
local telescope = srequire'telescope'

telescope.setup {
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
  extensions = {
    frecency = { },
  },
  pickers = {
    lsp_references = { theme = 'dropdown' },
    lsp_code_actions = { theme = 'dropdown' },
    lsp_definitions = { theme = 'dropdown' },
    lsp_implementations = { theme = 'dropdown' },
    buffers = {
      sort_lastused = true,
      previewer = false,
    },
  },
}

if not telescope.stud then
  telescope.load_extension 'frecency'
end
