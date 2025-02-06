-- Fzf-lua
vim.keymap.set('n', '<leader>t', ':FzfLua files<CR>', {})
vim.keymap.set('n', '<leader>r', ':FzfLua oldfiles<CR>', {})
vim.keymap.set('n', '<leader>g', ':FzfLua live_grep<CR>', {})
vim.keymap.set('n', '<leader>b', ':FzfLua buffers<CR>', {})

vim.keymap.set('n', '<leader>e', ':NvimTreeFindFileToggle<CR>', {})

vim.keymap.set('n', '<c-x>', ':Bdelete<CR>', {})

vim.keymap.set('n', '<leader>l', ':LazyGit<CR>', {})

vim.keymap.set('n', '<leader>E', ':FzfLua files cwd=~/.config/nvim<CR>', {})
