local utils = require('custom.utils')

utils.map('n','<leader>f', 'ggVG=', { desc = 'Format buffer (Vim)' })

utils.map('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move line down' })
utils.map('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move line up' })

utils.map('n', '<C-j>', ':cnext<CR>', { desc = 'Next quickfix item' })
utils.map('n', '<C-k>', ':cprevious<CR>', { desc = 'Previous quickfix item' })

utils.map('n', '<C-u>', '<C-u>zz')
utils.map('n', '<C-d>', '<C-d>zz')
utils.map('n', 'n', 'nzzzv')
utils.map('n', 'N', 'Nzzzv')
