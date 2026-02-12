return require('lazy').setup({

  -- Essentials
  'tpope/vim-repeat',
  '907th/vim-auto-save',

  'benmills/vimux',
  'vim-test/vim-test',
  'christoomey/vim-tmux-navigator',

  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      bigfile = { enabled = true },
      dashboard = { enabled = true },
      explorer = { enabled = false },
      git = { enabled = true },
      gitbrowse = { enabled = true },
      indent = {
        enabled = false,
        animate = {
          enabled = false
        }
      },
      input = { enabled = true },
      notifier = { enabled = false },
      picker = { enabled = false },
      quickfile = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = false },
      statuscolumn = { enabled = true },
      words = { enabled = true },
    }
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      delay = 500,
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },

  -- Text
  'tpope/vim-surround',
  'mg979/vim-visual-multi',

  -- File management & Git
  'tpope/vim-eunuch', -- File command helpers: Rename, Delete etc.
  'pbrisbin/vim-mkdir', -- Automatically create new folders for files

  {
    'kdheepak/lazygit.nvim',
    cmd = {
      'LazyGit',
      'LazyGitConfig',
      'LazyGitCurrentFile',
      'LazyGitFilter',
      'LazyGitFilterCurrentFile',
    },
    -- optional for floating window border decoration
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
  },

  -- AI
  -- {
  --   "zbirenbaum/copilot.lua",
  --   lazy = false,
  --   event = "InsertEnter",
  --   cmd = "Copilot",
  --   build = ":Copilot auth",
  --   config = function()
  --     require("copilot").setup({})
  --   end,
  -- },
  'github/copilot.vim',
  {
    "olimorris/codecompanion.nvim",
    opts = {
      ignore_warnings = true,
      inline = {
        adapter = "anthropic",
      }
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
  },

  -- Ruby
  'vim-ruby/vim-ruby',
  'tpope/vim-rails',

  -- Msc. languages
  -- {
  --   'dense-analysis/ale',
  --   config = function()
  --     vim.g.ale_lint_on_enter = 0
  --     vim.g.ale_ruby_rubocop_auto_correct_all = 0
  --
  --     vim.g.ale_fixers = {
  --       all = { 'remove_trailing_lines', 'trim_whitespace' },
  --     }
  --
  --     vim.g.ale_linters = {
  --       ruby = {'rubocop', 'ruby'},
  --       json = {'jq'},
  --       lua = {'lua_language_server'}
  --     }
  --   end
  -- },
  -- 'preservim/vim-markdown',
  -- 'Vimjas/vim-python-pep8-indent',
  -- 'pangloss/vim-javascript',
  -- 'mattn/emmet-vim',
  -- 'tpope/vim-ragtag',
  { 'fatih/vim-go', build = ':GoUpdateBinaries' },

  {
    'nvim-tree/nvim-tree.lua',
    version = '*',
    lazy = false,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('nvim-tree').setup {
        disable_netrw = true,
        hijack_netrw = false,
      }
    end,
  },
  {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- or if using mini.icons/mini.nvim
    -- dependencies = { "echasnovski/mini.icons" },
    opts = {}
  },
  {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup {map_cr=false}
    end
  },
  {
    'saghen/blink.cmp',
    lazy = false, -- lazy loading handled internally
    dependencies = 'rafamadriz/friendly-snippets',
    version = 'v1.*',
    opts = {
      -- 'default' for mappings similar to built-in completion
      -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
      -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
      keymap = { preset = 'enter' },

      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono'
      },

      completion = {
        menu = {
          auto_show = function(ctx)
            return ctx.mode ~= "cmdline" or not vim.tbl_contains({ '/', '?' }, vim.fn.getcmdtype())
          end,
        },
      },

      cmdline = {
        enabled = false,
      },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      }
    },
    opts_extend = { "sources.default" }
  },

  -- Treesitter
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
  { 'RRethy/nvim-treesitter-endwise', event = 'VeryLazy' },

  -- UI & Themes

  -- 'itchyny/lightline.vim',
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup({
        sections = {
          lualine_a = {
            {
              'filename',
              file_status = true, -- displays file status (readonly status, modified status)
              path = 2 -- 0 = just filename, 1 = relative path, 2 = absolute path
            }
          }
        }
      })
    end
  },
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },

  {
    "f-person/git-blame.nvim",
    event = "VeryLazy",
    opts = {
      enabled = false,  -- if you want to enable the plugin
      message_template = " <summary> • <date> • <author> • <<sha>>", -- template for the blame message, check the Message template section for more options
      date_format = "%m-%d-%Y %H:%M:%S", -- template for the date, check Date format section for more options
      virtual_text_column = 1,  -- virtual text start column, check Start virtual text at column section for more options
      message_when_not_committed = "", -- message when the file is not committed
    } 
  },
  {
    'lewis6991/gitsigns.nvim',
    event = 'VeryLazy',
    config = function()
      require('gitsigns').setup()
    end
  },
  {
    'akinsho/bufferline.nvim',
    event = 'VeryLazy',
    dependencies = 'nvim-tree/nvim-web-devicons',
    opts = {
      options = {
        close_command = function(n)
          Snacks.bufdelete(n)
        end,
        always_show_bufferline = true,
        offsets = {
          {
            filetype = 'neo-tree',
            text = 'Neo-tree',
            highlight = 'Directory',
            text_align = 'left',
          },
        },
      },
    },
  }
})
