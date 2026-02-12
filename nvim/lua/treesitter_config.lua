require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  endwise = {
    enable = true
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<CR>',
      scope_incremental = '<CR>',
      node_incremental = '<TAB>',
      node_decremental = '<S-TAB>',
    },
  },
  ensure_installed = {
    "bash",
    "css",
    "go",
    "gotmpl",
    "html",
    "javascript",
    "json",
    "markdown",
    "python",
    "ruby",
    "scss",
    "sql",
    "yaml",
    "csv",
    "elixir",
    "terraform",
    "rst",
  },
}
