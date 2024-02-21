local builtins = require('telescope.builtin')
local telescope = require('telescope')
local ui = require('harpoon.ui')
local mark = require('harpoon.mark')

local opts = {
  noremap = true,
  silent = true,
}

vim.keymap.set('n', '<leader>p', function()
  if not pcall(builtins.git_files) then
    builtins.find_files()
  end
end, opts)
vim.keymap.set('n', '<leader>,', function()
  builtins.find_files { cwd = '$HOME/.config/nvim' }
end, opts)
vim.keymap.set('n', '<leader>g', builtins.live_grep, opts)

vim.keymap.set('n', '<leader>H', builtins.help_tags, opts)
vim.keymap.set('n', '<leader>t', builtins.builtin, opts)
vim.keymap.set('n', '<leader>o', builtins.oldfiles, opts)
vim.keymap.set('n', '<leader>s', builtins.lsp_document_symbols, opts)
vim.keymap.set('n', '<leader>S', builtins.lsp_workspace_symbols, opts)

vim.keymap.set('n', '<leader>h', ui.toggle_quick_menu, opts)
vim.keymap.set('n', '<leader>j', function()
  ui.nav_file(1)
end, opts)
vim.keymap.set('n', '<leader>k', function()
  ui.nav_file(2)
end, opts)
vim.keymap.set('n', '<leader>l', function()
  ui.nav_file(3)
end, opts)
vim.keymap.set('n', '<leader>;', mark.add_file, opts)

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = 'rounded',
})
vim.keymap.set('n', '<S-k>', vim.lsp.buf.hover, opts)

vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, opts)
vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action, opts)
vim.keymap.set('v', '<leader>a', vim.lsp.buf.code_action, opts)
vim.keymap.set('n', '<leader>d', function()
  vim.diagnostic.open_float { border = 'rounded' }
end, opts)
vim.keymap.set('n', '<leader>D', builtins.diagnostics, opts)
vim.keymap.set('n', 'K', function()
  vim.lsp.buf.hover { border = 'rounded' }
end, opts)
vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, opts)
vim.keymap.set('n', '<leader>n', function()
  vim.lsp.buf.format { name = 'null-ls' }
end, opts)

vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
vim.keymap.set('n', 'gr', builtins.lsp_references, opts)
vim.keymap.set('n', '<leader>dj', function() vim.diagnostic.goto_next({ float = { border = 'rounded' } }) end, opts)
vim.keymap.set('n', '<leader>dk', function() vim.diagnostic.goto_prev({ float = { border = 'rounded' } }) end, opts)

vim.keymap.set('n', 'gh', function()
  require('gitsigns').preview_hunk()
end)

vim.keymap.set('n', '<C-j>', ':cnext<CR>', opts)
vim.keymap.set('n', '<C-k>', ':cprevious<CR>', opts)

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", opts)
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", opts)

vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)
vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)
vim.keymap.set('n', 'n', 'nzzzv', opts)
vim.keymap.set('n', 'N', 'Nzzzv', opts)

vim.keymap.set('n', '<leader>m', ':Mason<CR>', opts)
vim.keymap.set('n', '<leader>e', ':EslintFixAll<CR>', opts)

vim.keymap.set('n', '<leader><space>', require('runner').run, opts)
vim.keymap.set('n', '<leader><S-a>', require('ascii-text').open, opts)

for i = 1, 9 do
  vim.keymap.set('n', '<leader>' .. i, i .. 'gt', opts)
end
