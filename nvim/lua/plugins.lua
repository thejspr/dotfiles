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
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  }
end)
