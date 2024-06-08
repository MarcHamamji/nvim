local utils = require('custom.utils')

return {
    'MarcHamamji/runner.nvim',
    config = function()
        local runner = require('runner')

        runner.setup {
            position = 'right',
            width = 60,
            height = 10,
        }

        utils.map('n', '<leader><space>', runner.run, { desc = 'Runner' })
    end,
}
