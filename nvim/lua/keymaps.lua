-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>t', builtin.find_files, {})
vim.keymap.set('n', '<leader>r', builtin.oldfiles, {})
vim.keymap.set('n', '<leader>g', builtin.live_grep, {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})
vim.keymap.set('n', '<leader>h', builtin.help_tags, {})

vim.keymap.set('n', '<leader>e', ':Neotree toggle reveal<CR>', {})

vim.keymap.set('n', '<c-x>', ':Bdelete<CR>', {})

vim.keymap.set('n', '<leader>E', ':e ~/.vimrc<CR>', {})
vim.keymap.set('n', '<leader>Ep', ':e ~/code/dotfiles/nvim/lua/plugins.lua<CR>', {})
vim.keymap.set('n', '<leader>Ek', ':e ~/code/dotfiles/nvim/lua/keymaps.lua<CR>', {})
