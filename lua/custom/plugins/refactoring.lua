local utils = require('custom.utils')

return {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
    config = function()
        local refactoring = require("refactoring")
        refactoring.setup()

        utils.map({ 'n', 'v' }, '<leader>rf', function()
            refactoring.select_refactor()
        end, { desc = '[R]e[f]actor' })
    end,
}
