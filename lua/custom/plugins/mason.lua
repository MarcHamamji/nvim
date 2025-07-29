local settings = {
    rust_analyzer = {
        ["rust-analyzer"] = {
            checkOnSave = {
                command = "clippy",
            },
        },
    }
}

return {
    'mason-org/mason.nvim',
    dependencies = {
        'mason-org/mason-lspconfig.nvim',
        'neovim/nvim-lspconfig',
    },
    config = function()
        local mason = require('mason')
        local mason_lsp = require('mason-lspconfig')

        mason.setup {
            ui = {
                border = "rounded",
            }
        }
        mason_lsp.setup()

        mason_lsp.setup {
            automatic_enable = true,
            ensure_installed = {}
        }
    end,
}
