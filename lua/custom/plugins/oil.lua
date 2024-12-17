local utils = require('custom.utils')

return {
    'stevearc/oil.nvim',
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = { { '<leader>o' } },
    config = function()
        local oil = require('oil')

        oil.setup {
            default_file_explorer = false,
            skip_confirm_for_simple_edits = true,
            float = {
                padding = 10,
                border = "rounded",
            },
        }

        utils.map('n', '<leader>o', oil.toggle_float, { desc = '[O]il toggle float' })
    end,
}
