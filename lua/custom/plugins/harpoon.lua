local utils = require('custom.utils')

return {
    'ThePrimeagen/harpoon',
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    init = function()
        local ui = require('harpoon.ui')
        local mark = require('harpoon.mark')

        utils.map('n', '<leader>h', ui.toggle_quick_menu, { desc = 'Toggle [h]arpoon menu' })
        utils.map('n', '<leader>j', function()
            ui.nav_file(1)
        end, { desc = 'Navigate to harpoon file 1' })
        utils.map('n', '<leader>k', function()
            ui.nav_file(2)
        end, { desc = 'Navigate to harpoon file 2' })
        utils.map('n', '<leader>l', function()
            ui.nav_file(3)
        end, { desc = 'Navigate to harpoon file 3' })
        utils.map('n', '<leader>;', mark.add_file, { desc = 'Add file to harpoon' })
    end
}
