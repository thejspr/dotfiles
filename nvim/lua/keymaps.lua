-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>t', builtin.find_files, {})
vim.keymap.set('n', '<leader>g', builtin.live_grep, {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})
vim.keymap.set('n', '<leader>h', builtin.help_tags, {})

-- Neotree
vim.keymap.set('n', 'tt', ':Neotree toggle<CR>', {})
vim.keymap.set('n', 'tr', ':Neotree toggle reveal<CR>', {})
