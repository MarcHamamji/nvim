vim.g.mapleader = ' '

require('marc.packer')
require('marc.colors')
require('marc.opts')
require('marc.remap')
require('marc.luasnip')
require('marc.lualine')
require('marc.cmp')
require('marc.lsp')
require('marc.telescope')
require('marc.treesitter')
require('marc.tweaks')

function P(...)
  print(vim.inspect(...))
end
