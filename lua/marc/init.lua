vim.g.mapleader = ' '

function P(...)
  print(vim.inspect(...))
end

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

local handlers = require('marc.code_runner.handlers')

require('marc.code_runner').setup({
  rust = handlers.shell_handler('cargo run examples/hello.marc'),
  lua = handlers.shell_handler('ls --color=always')
})
