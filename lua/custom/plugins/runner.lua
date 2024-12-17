local utils = require('custom.utils')

return {
    'MarcHamamji/runner.nvim',
    keys = { { '<leader><Space>' } },
    config = function()
        local runner = require('runner')
        local helpers = require('runner.handlers.helpers')

        runner.setup {
            position = 'right',
            width = 60,
            height = 10,
        }

        runner.set_handler('java', function(buffer)
            local current_file = vim.fn.expand('%')

            local handlers = {
                ['Run current file'] = helpers.shell_handler('java ' .. current_file),
                ['Custom'] = helpers.shell_handler('java ' .. current_file, true),
            }

            helpers.choice(handlers)(buffer)
        end)

        utils.map('n', '<leader><Space>', runner.run, { desc = 'Runner' })
    end,
}
