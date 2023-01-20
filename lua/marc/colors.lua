vim.opt.background = 'dark'
require('onedark').setup({
  style = 'deep'
})
require('onedark').load()

vim.api.nvim_create_autocmd('BufEnter', {
  pattern = { '*.vue' },
  callback = function()
    vim.cmd [[syntax on]]
  end
})

vim.api.nvim_set_hl(0, 'SpellBad', {})
vim.api.nvim_set_hl(0, 'SpellCap', {})
vim.api.nvim_set_hl(0, 'SpellRare', {})
vim.api.nvim_set_hl(0, 'SpellLocal', {})
