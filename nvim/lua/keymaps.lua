-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>t', builtin.find_files, {})
vim.keymap.set('n', '<leader>r', builtin.oldfiles, {})
vim.keymap.set('n', '<leader>g', builtin.live_grep, {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})
-- vim.keymap.set('n', '<leader>h', builtin.help_tags, {})

vim.keymap.set('n', '<leader>e', ':NvimTreeFindFileToggle<CR>', {})

vim.keymap.set('n', '<c-x>', ':Bdelete<CR>', {})

vim.keymap.set('n', '<leader>l', ':LazyGit<CR>', {})

vim.keymap.set('n', '<leader>E', ':Telescope find_files search_dirs=~/.config/nvim<CR>', {})
