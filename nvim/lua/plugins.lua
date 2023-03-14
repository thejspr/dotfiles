return require('packer').startup(function(use)
  -- Packer https://github.com/wbthomason/packer.nvim
  use 'wbthomason/packer.nvim'

  -- Neo Tree https://github.com/nvim-neo-tree/neo-tree.nvim
  vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
  use {
  "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    }
  }

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons"
    }
  }

  -- Autopairs
  use {
    'windwp/nvim-autopairs',
    config = function() require("nvim-autopairs").setup {map_cr=false} end
  }

  --- CMP
  use {
    "hrsh7th/nvim-cmp",
    requires = {
      'neovim/nvim-lspconfig',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      -- 'SirVer/ultisnips',
      -- 'quangnguyen30192/cmp-nvim-ultisnips'
      -- 'hrsh7th/cmp-nvim-lua',
      -- 'octaltree/cmp-look',
      -- 'hrsh7th/cmp-path',
      -- 'hrsh7th/cmp-calc',
      -- 'f3fora/cmp-spell',
      -- 'hrsh7th/cmp-emoji'
    }
  }

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use 'tree-sitter/tree-sitter-ruby'

  use 'folke/tokyonight.nvim'
end)
