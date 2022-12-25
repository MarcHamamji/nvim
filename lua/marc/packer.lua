require('packer').startup(function(use)
  use { 'wbthomason/packer.nvim' }


  -- Theme
  use { 'projekt0n/github-nvim-theme' }
  use {
    'nvim-lualine/lualine.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons',
      opt = true
    }
  }


  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    }
  }

  use { 'nvim-telescope/telescope-fzf-native.nvim',
    run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }

  use { 'nvim-telescope/telescope-symbols.nvim' }
  use { 'kyazdani42/nvim-web-devicons' }
  use { 'nvim-telescope/telescope-ui-select.nvim' }


  -- Snippets
  use { 'L3MON4D3/LuaSnip' }
  use { 'rafamadriz/friendly-snippets' }


  -- LSP
  use { 'neovim/nvim-lspconfig' }

  use {
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup()
    end
  }

  use {
    'williamboman/mason-lspconfig.nvim',
    config = function()
      require('mason-lspconfig').setup()
    end
  }

  use {
    'j-hui/fidget.nvim',
    config = function()
      require('fidget').setup()
    end
  }

  use {
    'ray-x/lsp_signature.nvim',
    config = function()
      require('lsp_signature').setup {
        hint_enable = false,
      }
    end
  }


  -- Completion
  use { 'hrsh7th/nvim-cmp' }
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'hrsh7th/cmp-buffer' }
  use { 'hrsh7th/cmp-path' }
  use { 'hrsh7th/cmp-nvim-lua' }
  use { 'f3fora/cmp-spell' }
  use { 'saadparwaiz1/cmp_luasnip' }
  use { 'onsails/lspkind.nvim' }


  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use { 'nvim-treesitter/playground' }


  -- Git
  use { 'tpope/vim-fugitive' }
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup {
        signcolumn = true,
        current_line_blame = true,
      }
    end
  }


  -- Commenting
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }

end)
