vim.cmd [[ colorscheme retrobox ]]
vim.cmd [[ hi! link Pmenu Normal ]]
vim.cmd [[ hi! link PmenuKind Pmenu ]]
vim.cmd [[ hi! link PmenuExtra Pmenu ]]
vim.cmd [[ hi! link TreesitterContext CursorLine ]]
vim.cmd [[ hi! link NeogitDiffAdd DiffAdd ]]
vim.cmd [[ hi! link NeogitDiffAddHighlight DiffAdd ]]
vim.cmd [[ hi! link NeogitDiffDelete DiffDelete ]]
vim.cmd [[ hi! link NeogitDiffDeleteHighlight DiffDelete ]]
vim.cmd [[ hi! Title gui=bold guifg=Orange ]]

vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
      vim.highlight.on_yank({timeout = 50})
  end,
})


local signs = { Error = ' ', Warn = ' ', Hint = ' ', Info = ' ' }
for type, icon in pairs(signs) do
  local hl = 'DiagnosticSign' .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl })
end

vim.diagnostic.config {
    virtual_text = true
}
