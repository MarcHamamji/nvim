local utils = require('custom.utils')

return {
    'MarcHamamji/runner.nvim',
    keys = { { '<leader><Space>' } },
    config = function()
        local runner = require('runner')

        runner.setup {
            position = 'right',
            width = 60,
            height = 10,
        }

        utils.map('n', '<leader><Space>', runner.run, { desc = 'Runner' })
    end,
}
