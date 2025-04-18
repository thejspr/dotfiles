local map = vim.keymap.set

-- Fzf-lua
map('n', '<leader>t', ':FzfLua files<CR>', {})
map('n', '<leader>r', ':FzfLua oldfiles<CR>', {})
map('n', '<leader>g', ':FzfLua live_grep resume=true<CR>', {})
map('n', '<leader>b', ':FzfLua buffers<CR>', {})

map('n', '<leader>e', ':NvimTreeFindFileToggle<CR>', {})

map('n', '<leader>l', ':LazyGit<CR>', {})

map('n', '<leader>E', ':FzfLua files cwd=~/.config/nvim<CR>', {})

map('n', '<c-x>', function() Snacks.bufdelete() end, { desc = 'Close buffer' })
map('n', '<leader>b', function() Snacks.gitbrowse() end, { desc = 'Browse GitHub' })
