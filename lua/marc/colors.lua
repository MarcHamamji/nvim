vim.g.tokyonight_style = 'night'
vim.g.tokyonight_enable_italic = 1

vim.cmd([[ colorscheme tokyonight ]])

vim.api.nvim_create_autocmd('BufEnter', {
  pattern = { '*.vue' },
  callback = function()
    vim.cmd([[syntax on]])
  end,
})

vim.api.nvim_set_hl(0, 'SpellBad', {})
vim.api.nvim_set_hl(0, 'SpellCap', {})
vim.api.nvim_set_hl(0, 'SpellRare', {})
vim.api.nvim_set_hl(0, 'SpellLocal', {})

