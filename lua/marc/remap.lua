local builtins = require('telescope.builtin')
local themes = require('telescope.themes')
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
  builtins.find_files { cwd = vim.fn.stdpath('config')}
end, { desc = 'Find nvim config files' })

map('n', '<leader>b', function()
  builtins.current_buffer_fuzzy_find(themes.get_dropdown({ previewer = false }))
end, { desc = 'Current buffer fuzzy find' })

map('n', '<leader>sg', builtins.live_grep, { desc = '[S]earch [g]rep' })
map('n', '<leader>sk', builtins.keymaps, { desc = '[S]earch [k]eymaps' })
map('n', '<leader>sh', builtins.help_tags, { desc = '[S]earch [h]elp tags' })
map('n', '<leader>st', builtins.builtin, { desc = '[S]earch [t]elescope builtins' })
map('n', '<leader>so', builtins.oldfiles, { desc = '[S]earch [o]ld files' })
map('n', '<leader>ss', builtins.lsp_document_symbols, { desc = '[S]earch document [s]ymbols' })
map('n', '<leader>sw', builtins.lsp_workspace_symbols, { desc = '[S]earch [w]orkspace symbols' })

map('n', '<leader>h', ui.toggle_quick_menu, { desc = 'Toggle [h]arpoon menu' })
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

map('n', '<leader>r', vim.lsp.buf.rename, { desc = '[R]ename' })
map('n', '<leader>a', vim.lsp.buf.code_action, { desc = 'Code [a]ction' })
map('v', '<leader>a', vim.lsp.buf.code_action, { desc = 'Code [a]ction' })
map('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Open floating [d]iagnostics' })
map('n', '<leader>D', builtins.diagnostics, { desc = 'Search [d]iagnostics' })

map('n', '<leader>f', vim.lsp.buf.format, { desc = '[F]ormat' })

map('n', 'gd', vim.lsp.buf.definition, { desc = '[G]o to [d]efinition' })
map('n', 'gi', vim.lsp.buf.implementation, { desc = '[G]o to [i]mplementation' })
map('n', 'gr', builtins.lsp_references, { desc = '[G]o to [r]eferences' })
map('n', '<leader>dj', function() vim.diagnostic.goto_next({ float = { border = 'rounded' } }) end,
  { desc = 'Go to next diagnostic' })
map('n', '<leader>dk', function() vim.diagnostic.goto_prev({ float = { border = 'rounded' } }) end,
  { desc = 'Go to previous diagnostic' })

map('n', 'gh', function()
  require('gitsigns').preview_hunk()
end, { desc = '[G]it [h]unk' })

map('n', '<C-j>', ':cnext<CR>', { desc = 'Next quickfix item' })
map('n', '<C-k>', ':cprevious<CR>', { desc = 'Previous quickfix item' })

map('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move line down' })
map('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move line up' })

map('n', '<C-u>', '<C-u>zz')
map('n', '<C-d>', '<C-d>zz')
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')

map('n', '<leader><space>', require('runner').run, { desc = 'Runner' })
