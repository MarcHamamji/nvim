local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup {

  { 'ghifarit53/tokyonight-vim' },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = 'kyazdani42/nvim-web-devicons',
  },

  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'kyazdani42/nvim-web-devicons',
    },
  },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build =
    'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
  },
  { 'nvim-telescope/telescope-ui-select.nvim' },

  { 'L3MON4D3/LuaSnip' },
  { 'rafamadriz/friendly-snippets' },

  { 'neovim/nvim-lspconfig' },

  {
    'williamboman/mason.nvim',
    config = true,
  },
  {
    'williamboman/mason-lspconfig.nvim',
    config = true,
  },

  {
    'j-hui/fidget.nvim',
    config = true,
  },

  {
    'ray-x/lsp_signature.nvim',
    opts = {
      hint_enable = false,
    },
  },
  {
    'folke/neodev.nvim',
    config = true,
  },

  { 'hrsh7th/nvim-cmp' },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/cmp-buffer' },
  { 'hrsh7th/cmp-path' },
  { 'f3fora/cmp-spell' },
  { 'saadparwaiz1/cmp_luasnip' },
  {
    'petertriho/cmp-git',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
  },
  { 'onsails/lspkind.nvim' },

  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
  },

  { 'tpope/vim-fugitive' },
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signcolumn = true,
      current_line_blame = true,
    },
  },

  {
    'ThePrimeagen/harpoon',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
  },

  {
    'numToStr/Comment.nvim',
    config = true,
  },

  {
    'MarcHamamji/runner.nvim',
    config = function()
      local runner = require('runner')

      runner.setup {
        position = 'right',
        width = 60,
        height = 10,
      }
    end,
  },

  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    config = function()
      require('copilot').setup {
        suggestion = { enabled = false },
        panel = { enabled = false },
      }
    end,
  },

  {
    'zbirenbaum/copilot-cmp',
    config = function()
      require('copilot_cmp').setup()
    end,
  },
  {
    'Exafunction/codeium.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'hrsh7th/nvim-cmp',
    },
    config = function()
      require('codeium').setup {}
    end,
  },
}
