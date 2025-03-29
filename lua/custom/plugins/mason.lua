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
    'williamboman/mason.nvim',
    dependencies = {
        'williamboman/mason-lspconfig.nvim',
        'neovim/nvim-lspconfig',
    },
    config = function()
        local mason = require('mason')
        local mason_lsp = require('mason-lspconfig')

        local lspconfig = require('lspconfig')

        mason.setup {
            ui = {
                border = "rounded",
            }
        }
        mason_lsp.setup()

        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        mason_lsp.setup_handlers {
            function(server_name)
                lspconfig[server_name].setup {
                    capabilities = capabilities,
                    settings = settings[server_name],
                }
            end
        }
    end,
}
