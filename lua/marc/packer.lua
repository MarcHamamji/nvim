require('packer').startup(function(use)

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
	use { 'nvim-telescope/telescope-symbols.nvim' }
	use { 'kyazdani42/nvim-web-devicons' }
	use {'nvim-telescope/telescope-ui-select.nvim' }

  -- Snippets
	use { 'L3MON4D3/LuaSnip' }
	use { 'rafamadriz/friendly-snippets' }

  -- LSP
  use { 'neovim/nvim-lspconfig' }
	use { 'williamboman/mason.nvim' }
	use { 'williamboman/mason-lspconfig.nvim' }
  use { 'j-hui/fidget.nvim' }

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

  -- Git
	use { 'tpope/vim-fugitive' }
	use { 'airblade/vim-gitgutter' }

  -- Commenting
  use { 'numToStr/Comment.nvim' }

end)
