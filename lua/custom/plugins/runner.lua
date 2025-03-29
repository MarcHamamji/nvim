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

        runner.set_handler('tex', function (bufnr)
            helpers.shell_handler('pdflatex --output-directory=out ' .. vim.fn.expand('%'))(bufnr)
        end)

        utils.map('n', '<leader><Space>', runner.run, { desc = 'Runner' })
    end,
}
