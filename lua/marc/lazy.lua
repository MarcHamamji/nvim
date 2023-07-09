local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup {

  -- Theme
  { 'ghifarit53/tokyonight-vim' },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'kyazdani42/nvim-web-devicons',
      opt = true,
    },
  },

  -- Telescope
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

  { 'nvim-telescope/telescope-symbols.nvim' },
  { 'nvim-telescope/telescope-ui-select.nvim' },

  -- Snippets
  { 'L3MON4D3/LuaSnip' },
  { 'rafamadriz/friendly-snippets' },

  -- LSP
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
    -- lazy = true,
    -- event = 'BufEnter *.lua',
  },
  {
    'jose-elias-alvarez/null-ls.nvim',
    config = function()
      local null_ls = require('null-ls')
      null_ls.setup {
        sources = {
          null_ls.builtins.formatting.stylua,
          -- null_ls.builtins.formatting.eslint,
        },
      }
    end,
  },

  -- Completion
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

  -- Treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
  },
  {
    'nvim-treesitter/playground',
    lazy = true,
    cmd = 'TSPlaygroundToggle',
  },

  -- Git
  { 'tpope/vim-fugitive' },
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signcolumn = true,
      current_line_blame = true,
    },
  },

  -- Harpoon
  {
    'ThePrimeagen/harpoon',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
  },

  -- Commenting
  {
    'numToStr/Comment.nvim',
    config = true,
  },

  -- Miscellaneous
  {
    'MarcHamamji/ascii-text.nvim',
    opts = {
      spacing = 'kerning',
    },
    dependencies = {
      'nvim-telescope/telescope.nvim',
    },
    -- lazy = true,
  },

  {
    'MarcHamamji/runner.nvim',
    config = function()
      local runner = require('runner')
      local helpers = require('runner.handlers.helpers')

      runner.setup {
        position = 'right', -- options: top, left, right, bottom
        width = 60,         -- width of window when position is left or right
        height = 10,        -- height of window when position is top or bottom
      }

      runner.set_handler('markdown', helpers.command_handler('MarkdownPreviewToggle'))
    end,
  },

  {
    'iamcco/markdown-preview.nvim',
    build = 'cd app && npm install',
  },
}
