---@diagnostic disable: different-requires
vim.g.mapleader = ' '

function P(...)
  print(vim.inspect(...))
end

require('marc.lazy')
require('marc.opts')
require('marc.colors')
require('marc.remap')
require('marc.luasnip')
require('marc.lines')
require('marc.cmp')
require('marc.lsp')
require('marc.telescope')
require('marc.treesitter')
require('marc.tweaks')
require('marc.mouse')
