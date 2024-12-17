local utils = require('custom.utils')

return {
    'neovim/nvim-lspconfig',
    dependencies = {
        {
            'ray-x/lsp_signature.nvim',
            opts = {
                hint_enable = false,
            },
        },
        {
            "j-hui/fidget.nvim",
            opts = {},
        },
    },
    config = function()
        vim.api.nvim_create_autocmd('LspAttach', {
            callback = function()
                utils.map('n', '<leader>f', vim.lsp.buf.format, { desc = 'Format buffer (LSP)' })
            end
        })

        local builtins = require('telescope.builtin')

        utils.map('n', '<leader>rn', vim.lsp.buf.rename, { desc = '[R]ename' })
        utils.map('n', '<leader>a', vim.lsp.buf.code_action, { desc = 'Code [a]ction' })
        utils.map('v', '<leader>a', vim.lsp.buf.code_action, { desc = 'Code [a]ction' })
        utils.map('n', '<leader>dd', vim.diagnostic.open_float, { desc = 'Open floating [d]iagnostics' })
        utils.map('n', '<leader>D', builtins.diagnostics, { desc = 'Search [d]iagnostics' })

        utils.map('n', 'gd', vim.lsp.buf.definition, { desc = '[G]o to [d]efinition' })
        utils.map('n', 'gi', vim.lsp.buf.implementation, { desc = '[G]o to [i]mplementation' })
        utils.map('n', 'gr', builtins.lsp_references, { desc = '[G]o to [r]eferences' })
        utils.map('n', '<leader>dj', function() vim.diagnostic.goto_next({ float = { border = 'rounded' } }) end,
            { desc = 'Go to next diagnostic' })
        utils.map('n', '<leader>dk', function() vim.diagnostic.goto_prev({ float = { border = 'rounded' } }) end,
            { desc = 'Go to previous diagnostic' })
    end
}
