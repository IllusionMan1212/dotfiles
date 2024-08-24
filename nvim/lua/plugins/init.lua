local packer = require'packer'

local util = require'packer.util'

packer.init({
    package_root = util.join_paths(vim.fn.stdpath('data'), 'site', 'pack')
  })

packer.startup(function(use)
  -- PACKER
  use 'wbthomason/packer.nvim'

  -- GENERAL
  use 'nvim-treesitter/nvim-treesitter'
  use 'sheerun/vim-polyglot'
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-lua/telescope.nvim'
  use 'jremmen/vim-ripgrep'

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'anott03/nvim-lspinstall'
  use 'glepnir/lspsaga.nvim'
  use {
    'weilbith/nvim-code-action-menu',
    cmd = 'CodeActionMenu',
  }
  use 'ray-x/go.nvim'
  use {
    'creativenull/diagnosticls-configs-nvim',
    requires = { 'neovim/nvim-lspconfig' }
  }

  -- UNDO
  use 'mbbill/undotree'

  -- AUTOCOMPLETE
  use {
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      {
        -- Snippets
        "L3MON4D3/LuaSnip",
        requires = {
          "saadparwaiz1/cmp_luasnip",
          "rafamadriz/friendly-snippets",
        },
      },
    },
  }

  -- THEMES
  use 'sainnhe/edge'
  use 'folke/tokyonight.nvim'
  -- use 'codicocodes/tokyonight.nvim'

  -- GIT
  use 'tpope/vim-fugitive'
  use 'itchyny/vim-gitbranch'
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },

    config = function()
      require'plugins.gitsigns'
    end
  }

  -- EDITING
  use 'jiangmiao/auto-pairs'
  use 'tpope/vim-surround'
  use 'tpope/vim-commentary'
  use 'tpope/vim-abolish'

  -- EDITOR
  use {
    'kyazdani42/nvim-tree.lua',
    config = function() require'plugins.nvimtree' end,
  }
  use {
    'akinsho/nvim-bufferline.lua',
    config = require'plugins.bufferline',
  }
end
)

require 'lspsaga'.setup()
