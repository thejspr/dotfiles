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
  -- 'pteroctopus/faster.nvim', -- for big files

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
  'moll/vim-bbye', -- Close buffers without closing windows

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

  -- Ruby
  'vim-ruby/vim-ruby',
  'tpope/vim-rails',
  -- 'sickill/vim-pasta',

  -- Msc. languages
  'dense-analysis/ale',
  'preservim/vim-markdown',
  -- 'Vimjas/vim-python-pep8-indent',
  'pangloss/vim-javascript',
  'mattn/emmet-vim',
  'tpope/vim-ragtag',
  'github/copilot.vim',
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
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons'
    }
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
    -- dependencies = 'rafamadriz/friendly-snippets',
    version = 'v0.*',
    opts = {
      -- 'default' for mappings similar to built-in completion
      -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
      -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
      -- see the "default configuration" section below for full documentation on how to define
      -- your own keymap.
      keymap = { preset = 'enter' },

      highlight = {
        -- sets the fallback highlight groups to nvim-cmp's highlight groups
        -- useful for when your theme doesn't support blink.cmp
        -- will be removed in a future release, assuming themes add support
        use_nvim_cmp_as_default = true,
      },
      nerd_font_variant = 'mono',

      -- experimental auto-brackets support
      -- accept = { auto_brackets = { enabled = true } }

      -- experimental signature help support
      -- trigger = { signature_help = { enabled = true } }
    }
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
