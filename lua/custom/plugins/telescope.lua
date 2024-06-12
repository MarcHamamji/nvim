local utils = require('custom.utils')

return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'kyazdani42/nvim-web-devicons',
    },
    init = function()
        local builtins = require('telescope.builtin')
        local themes = require('telescope.themes')

        utils.map('n', '<leader>p', function()
            if not pcall(function() builtins.git_files() end) then
                builtins.find_files()
            end
        end, { desc = 'Find git files / files' })

        utils.map('n', '<leader>,', function()
            builtins.find_files { cwd = vim.fn.stdpath('config') }
        end, { desc = 'Find nvim config files' })

        utils.map('n', '<leader>b', function()
            builtins.current_buffer_fuzzy_find(themes.get_dropdown({ previewer = false }))
        end, { desc = 'Current buffer fuzzy find' })

        utils.map('n', '<leader>sg', builtins.live_grep, { desc = '[S]earch [g]rep' })
        utils.map('n', '<leader>sk', builtins.keymaps, { desc = '[S]earch [k]eymaps' })
        utils.map('n', '<leader>sh', builtins.help_tags, { desc = '[S]earch [h]elp tags' })
        utils.map('n', '<leader>st', builtins.builtin, { desc = '[S]earch [t]elescope builtins' })
        utils.map('n', '<leader>so', builtins.oldfiles, { desc = '[S]earch [o]ld files' })
        utils.map('n', '<leader>ss', builtins.lsp_document_symbols, { desc = '[S]earch document [s]ymbols' })
        utils.map('n', '<leader>sw', builtins.lsp_workspace_symbols, { desc = '[S]earch [w]orkspace symbols' })
    end,
}
