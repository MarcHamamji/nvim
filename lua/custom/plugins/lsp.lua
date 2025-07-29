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
            config = true,
        },
    },
    config = function()
        vim.api.nvim_create_autocmd('LspAttach', {
            callback = function(args)
                utils.map('n', '<leader>f', vim.lsp.buf.format, { desc = 'Format buffer (LSP)', buffer = args.buf })
            end
        })

        local builtins = require('telescope.builtin')

        utils.map('n', '<leader>rn', vim.lsp.buf.rename, { desc = '[R]ename' })
        utils.map('n', '<leader>a', vim.lsp.buf.code_action, { desc = 'Code [a]ction' })
        utils.map('v', '<leader>a', vim.lsp.buf.code_action, { desc = 'Code [a]ction' })
        utils.map('n', '<leader>dd', vim.diagnostic.open_float, { desc = 'Open floating [d]iagnostics' })
        utils.map('n', '<leader>sd', builtins.diagnostics, { desc = '[S]earch [d]iagnostics' })

        utils.map('n', 'gd', 'gD', { desc = '[G]o to global [d]eclaration' })
        utils.map('n', '<leader>dj', function() vim.diagnostic.goto_next({ float = { border = 'rounded' } }) end,
            { desc = 'Go to next diagnostic' })
        utils.map('n', '<leader>dk', function() vim.diagnostic.goto_prev({ float = { border = 'rounded' } }) end,
            { desc = 'Go to previous diagnostic' })
    end
}
