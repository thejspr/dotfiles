local ts = require('nvim-treesitter')

ts.setup({
  install_dir = vim.fn.stdpath('data') .. '/site',
})

ts.install({
  'bash',
  'css',
  'go',
  'gotmpl',
  'html',
  'javascript',
  'json',
  'markdown',
  'python',
  'ruby',
  'scss',
  'sql',
  'yaml',
  'csv',
  'elixir',
  'terraform',
  'rst',
})

vim.api.nvim_create_autocmd('FileType', {
  callback = function(args)
    local buf = args.buf
    if pcall(vim.treesitter.start, buf) then
      vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
  end,
})
