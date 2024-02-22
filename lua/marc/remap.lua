local builtins = require('telescope.builtin')
local ui = require('harpoon.ui')
local mark = require('harpoon.mark')

local options = {
  noremap = true,
  silent = true,
}

local map = function(mode, lhs, rhs, opts)
  opts = opts or {}

  for key, value in pairs(options) do
    if opts[key] == nil then
      opts[key] = value
    end
  end

  vim.keymap.set(mode, lhs, rhs, opts)
end

map('n', '<leader>p', function()
  if not pcall(builtins.git_files) then
    builtins.find_files()
  end
end, { desc = 'Find git files / files' })
map('n', '<leader>,', function()
  builtins.find_files { cwd = '$HOME/.config/nvim' }
end, { desc = 'Find nvim config files' })
map('n', '<leader>g', builtins.live_grep, { desc = 'Live grep' })

map('n', '<leader>H', builtins.help_tags, { desc = 'Find help tags' })
map('n', '<leader>t', builtins.builtin, { desc = 'Telescope builtins' })
map('n', '<leader>o', builtins.oldfiles, { desc = 'Find old files' })
map('n', '<leader>s', builtins.lsp_document_symbols, { desc = 'Find document symbols' })
map('n', '<leader>S', builtins.lsp_workspace_symbols, { desc = 'Find workspace symbols' })

map('n', '<leader>h', ui.toggle_quick_menu, { desc = 'Toggle harpoon menu' })
map('n', '<leader>j', function()
  ui.nav_file(1)
end, { desc = 'Navigate to harpoon file 1' })
map('n', '<leader>k', function()
  ui.nav_file(2)
end, { desc = 'Navigate to harpoon file 2' })
map('n', '<leader>l', function()
  ui.nav_file(3)
end, { desc = 'Navigate to harpoon file 3' })
map('n', '<leader>;', mark.add_file, { desc = 'Add file to harpoon' })

map('n', '<S-k>', vim.lsp.buf.hover, { desc = 'Hover' })

map('n', '<leader>r', vim.lsp.buf.rename, { desc = 'Rename' })
map('n', '<leader>a', vim.lsp.buf.code_action, { desc = 'Code action' })
map('v', '<leader>a', vim.lsp.buf.code_action, { desc = 'Code action' })
map('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Open floating diagnostics' })
map('n', '<leader>D', builtins.diagnostics, { desc = 'Find diagnostics' })

map('n', '<leader>f', vim.lsp.buf.format, { desc = 'Format' })

map('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to definition' })
map('n', 'gr', builtins.lsp_references, { desc = 'Find references' })
map('n', '<leader>dj', function() vim.diagnostic.goto_next({ float = { border = 'rounded' } }) end,
  { desc = 'Go to next diagnostic' })
map('n', '<leader>dk', function() vim.diagnostic.goto_prev({ float = { border = 'rounded' } }) end,
  { desc = 'Go to previous diagnostic' })

map('n', 'gh', function()
  require('gitsigns').preview_hunk()
end, { desc = 'Preview hunk' })

map('n', '<C-j>', ':cnext<CR>', { desc = 'Next quickfix item' })
map('n', '<C-k>', ':cprevious<CR>', { desc = 'Previous quickfix item' })

map('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move line down' })
map('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move line up' })

map('n', '<C-u>', '<C-u>zz')
map('n', '<C-d>', '<C-d>zz')
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')

map('n', '<leader><space>', require('runner').run, { desc = 'Runner' })
