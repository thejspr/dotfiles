require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = false,
    disable = {},
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
    "typescript",
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
    "hyprlang",
    "rst",
  },
}
vim.filetype.add({
  pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
})
-- local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
-- parser_config.tsx.used_by = { "javascript", "typescript.tsx" }
