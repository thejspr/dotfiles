return require('lazy').setup({

  -- Essentials
  'tpope/vim-repeat',
  -- 'tpope/vim-obsession', -- sessions mgmt
  '907th/vim-auto-save',
  'mhinz/vim-grepper',

  'benmills/vimux',
  'vim-test/vim-test',
  -- 'voldikss/vim-floaterm',
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
      explorer = { enabled = true },
      gitbrowser = { enabled = true },
      indent = { enabled = true },
      input = { enabled = true },
      notifier = { enabled = true },
      picker = { enabled = true },
      quickfile = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = true },
    }
  },

  -- Text
  {
    'numToStr/Comment.nvim',
    opts = {
      basic = true
    }
  },
  'tpope/vim-surround',
  'mg979/vim-visual-multi',
  -- 'godlygeek/tabular',
  -- 'AndrewRadev/splitjoin.vim',

  -- File management & Git
  'tpope/vim-eunuch', -- File command helpers: Rename, Delete etc.
  -- 'tpope/vim-git',
  -- 'tpope/vim-fugitive',
  -- 'tpope/vim-rhubarb', -- Gbrowse handlers for github
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
  'github/copilot.vim',
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    opts = {
      -- See Configuration section for options
    },
    -- See Commands section for default commands if you want to lazy load on them
  },

  -- Ruby
  'vim-ruby/vim-ruby',
  'tpope/vim-rails',
  -- 'sickill/vim-pasta',

  -- Msc. languages
  'dense-analysis/ale',
  'preservim/vim-markdown',
  -- 'Vimjas/vim-python-pep8-indent',
  -- 'pangloss/vim-javascript',
  'mattn/emmet-vim',
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
    config = function(_, opts)
      local lspconfig = require('lspconfig')
      for server, config in pairs(opts.servers or {}) do
        config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
        lspconfig[server].setup(config)
      end
    end
  },

  -- Treesitter
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
  { 'RRethy/nvim-treesitter-endwise', event = 'VeryLazy' },

  -- UI & Themes

  'itchyny/lightline.vim',
  -- 'projekt0n/github-nvim-theme',
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
        always_show_bufferline = false,
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
