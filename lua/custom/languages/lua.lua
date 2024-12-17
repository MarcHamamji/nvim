local utils = require('custom.utils')

vim.api.nvim_create_autocmd({ 'BufEnter' }, {
    pattern = '*.lua',
    callback = function()
        utils.map('v', '<leader>x', ":lua<CR>", { desc = 'E[x]ecute selection', buffer = 0 })
    end
})
