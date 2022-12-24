vim.g.mapleader = ' '

require('marc.packer')
require('marc.opts')
require('marc.remap')
require('marc.luasnip')
require('marc.lualine')
require('marc.cmp')
require('marc.lsp')
require('marc.treesitter')
require('marc.telescope')

require('mason').setup()
require('mason-lspconfig').setup()

vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end
})

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl })
end

vim.api.nvim_set_hl(0, 'SpellBad', {})
vim.api.nvim_set_hl(0, 'SpellCap', {})
vim.api.nvim_set_hl(0, 'SpellRare', {})
vim.api.nvim_set_hl(0, 'SpellLocal', {})

require('fidget').setup()

function P(arg)
	print(vim.inspect(arg))
end

vim.api.nvim_create_autocmd('BufEnter', {
	pattern = { '*.vue' },
	callback = function()
		vim.cmd [[syntax on]]
	end
})

require('Comment').setup {}
require('gitsigns').setup {
  signcolumn = true,
  current_line_blame = true,
}
