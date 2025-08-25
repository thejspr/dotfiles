return require('lazy').setup({

  -- Essentials
  'tpope/vim-repeat',
  '907th/vim-auto-save',
  'mhinz/vim-grepper',

  'benmills/vimux',
  'vim-test/vim-test',
  -- 'voldikss/vim-floaterm',
  'christoomey/vim-tmux-navigator',
  -- 'ludovicchabant/vim-gutentags',

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
      explorer = { enabled = true },
      git = { enabled = true },
      gitbrowse = { enabled = true },
      indent = {
        enabled = true,
        animate = {
          enabled = false
        }
      },
      input = { enabled = true },
      notifier = { enabled = false },
      picker = { enabled = true },
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
  {
    "f-person/git-blame.nvim",
    event = "VeryLazy",
    opts = {
        enabled = false,  -- if you want to enable the plugin
        message_template = " <summary> • <date> • <author> • <<sha>>", -- template for the blame message, check the Message template section for more options
        date_format = "%m-%d-%Y %H:%M:%S", -- template for the date, check Date format section for more options
        virtual_text_column = 1,  -- virtual text start column, check Start virtual text at column section for more options
        message_when_not_committed = "", -- message when the file is not committed
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
  -- {
  --   "CopilotC-Nvim/CopilotChat.nvim",
  --   dependencies = {
  --     { "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
  --     { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
  --   },
  --   build = "make tiktoken", -- Only on MacOS or Linux
  --   opts = {
  --     -- See Configuration section for options
  --   },
  --   -- See Commands section for default commands if you want to lazy load on them
  -- },
  -- {
  --   "olimorris/codecompanion.nvim",
  --   opts = {},
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-treesitter/nvim-treesitter",
  --   },
  -- },

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
  'preservim/vim-markdown',
  -- 'Vimjas/vim-python-pep8-indent',
  -- 'pangloss/vim-javascript',
  -- 'mattn/emmet-vim',
  'tpope/vim-ragtag',
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
    version = 'v0.*',
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

  {
    'neovim/nvim-lspconfig',
    dependencies = { 'saghen/blink.cmp' },
    opts = {
      servers = {
        ruby_lsp = {
          mason = false,
          cmd = { vim.fn.expand("~/.local/share/mise/installs/ruby/latest/bin/ruby-lsp") },
        },
      },
    },
    config = function(_, opts)
      -- local lspconfig = require('lspconfig')
      -- for server, config in pairs(opts.servers or {}) do
      --   config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
      --   lspconfig[server].setup(config)
      -- end
    end
  },
  -- {
  --   'adam12/ruby-lsp.nvim',
  --   dependencies = {
  --     'nvim-lua/plenary.nvim',
  --     'neovim/nvim-lspconfig',
  --   },
  --   config = true,
  -- },

  -- Treesitter
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
  { 'RRethy/nvim-treesitter-endwise', event = 'VeryLazy' },

  -- UI & Themes

  -- 'itchyny/lightline.vim',
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup()
    end
  },
  'catppuccin/nvim',

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
