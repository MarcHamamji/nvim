local utils = require('custom.utils')

return {
    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "sindrets/diffview.nvim",
            "nvim-telescope/telescope.nvim",
        },
        config = function()
            local neogit = require('neogit')

            neogit.setup {}

            utils.map('n', '<leader>n', neogit.open, { desc = 'Open [N]eogit' })
        end,
    },
    {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup {
                signcolumn = true,
                current_line_blame = true,
            }

            utils.map('n', 'gh', function()
                require('gitsigns').preview_hunk()
            end, { desc = '[G]it [h]unk' })
        end,

    },
}
