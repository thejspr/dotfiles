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
  ensure_installed = {
    "bash",
    "css",
    "go",
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
    "terraform"
  },
}
-- local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
-- parser_config.tsx.used_by = { "javascript", "typescript.tsx" }
