local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

  -- Theme
  { 'ghifarit53/tokyonight-vim' },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'kyazdani42/nvim-web-devicons',
      opt = true
    }
  },
  {
    'lewis6991/impatient.nvim',
    config = function()
      require('impatient')
    end
  },


  -- Telescope
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'kyazdani42/nvim-web-devicons'
    }
  },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build =
    'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
  },

  { 'nvim-telescope/telescope-symbols.nvim' },
  { 'nvim-telescope/telescope-ui-select.nvim' },


  -- Snippets
  { 'L3MON4D3/LuaSnip' },
  { 'rafamadriz/friendly-snippets' },


  -- LSP
  { 'neovim/nvim-lspconfig' },

  {
    'williamboman/mason.nvim',
    config = true
  },

  {
    'williamboman/mason-lspconfig.nvim',
    config = true
  },

  {
    'j-hui/fidget.nvim',
    config = true
  },

  {
    'ray-x/lsp_signature.nvim',
    config = {
      hint_enable = false,
    }
  },

  {
    'folke/neodev.nvim',
    config = true,
  },


  -- Completion
  { 'hrsh7th/nvim-cmp' },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/cmp-buffer' },
  { 'hrsh7th/cmp-path' },
  -- { 'hrsh7th/cmp-nvim-lua' },
  { 'f3fora/cmp-spell' },
  { 'saadparwaiz1/cmp_luasnip' },
  { 'onsails/lspkind.nvim' },


  -- Treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate'
  },
  { 'nvim-treesitter/playground' },


  -- Git
  { 'tpope/vim-fugitive' },
  {
    'lewis6991/gitsigns.nvim',
    config = {
      signcolumn = true,
      current_line_blame = true,
    }
  },


  -- Commenting
  {
    'numToStr/Comment.nvim',
    config = true
  },


  -- Miscellaneous
  {
    'MarcHamamji/ascii-text.nvim',
    config = {
      spacing = 'kerning'
    },
    dependencies = {
      'nvim-telescope/telescope.nvim',
    }
  },

  { 'MarcHamamji/runner.nvim' }
})
