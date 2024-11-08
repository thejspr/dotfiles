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
    'hrsh7th/nvim-cmp',
    dependencies = {
      'neovim/nvim-lspconfig',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      -- 'hrsh7th/cmp-cmdline',
      -- 'octaltree/cmp-look',
      -- 'hrsh7th/cmp-path',
      -- 'hrsh7th/cmp-calc',
      -- 'hrsh7th/cmp-emoji'
    }
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
