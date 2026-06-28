vim.pack.add {
    "https://github.com/neovim/nvim-lspconfig"
}

vim.lsp.enable {
    "lua_ls",
    "clangd",
    "glsl_analyzer",
    "clojure_lsp",
    "pyright",
    -- "ansiblels",
    "autotools_ls",
    "vtsls",
    "vue_ls",
    "eslint",
    "denols",
    "jdtls",
    "neocmake",
    "tailwindcss",
    "rust_analyzer",
}

local tsserver_filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' }
local vue_language_server_path = '~/.local/share/pnpm/vue-language-server'
local vue_plugin = {
    name = '@vue/typescript-plugin',
    location = vue_language_server_path,
    languages = { 'vue' },
    configNamespace = 'typescript',
}

vim.lsp.config("ts_ls", {
    init_options = {
        plugins = {
            vue_plugin,
        },
    },
    filetypes = tsserver_filetypes,
})
vim.lsp.config("vtsls", {
    settings = {
        vtsls = {
            tsserver = {
                globalPlugins = {
                    vue_plugin,
                },
            },
        },
    },
    filetypes = tsserver_filetypes,
}
)

vim.lsp.config("ansiblels", {
    filetypes = { 'yaml' },
})

vim.lsp.config('jdtls', {
    cmd = {
        'jdtls'
    }
})

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        vim.keymap.set('n', '<leader>f', function()
            -- local eslint_client = vim.lsp.get_clients({
            --     bufnr = 0,
            --     name = "eslint"
            -- })
            -- if eslint_client then
            --     vim.lsp.buf.format {
            --         name = "eslint"
            --     }
            -- else
            vim.lsp.buf.format()
            -- end
        end, { desc = '[F]ormat buffer (LSP)', buffer = args.buf })

        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = '[R]e[n]ame', buffer = args.buf })

        vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action, { desc = 'Code [a]ction', buffer = args.buf })
        vim.keymap.set('v', '<leader>a', vim.lsp.buf.code_action, { desc = 'Code [a]ction', buffer = args.buf })

        vim.keymap.set('n', '<leader>dd', vim.diagnostic.open_float,
            { desc = 'Open floating [d]iagnostics', buffer = args.buf })

        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = '[G]o to LSP [d]efinition', buffer = args.buf })
        vim.keymap.set('n', 'gD', ':tab split | lua vim.lsp.buf.definition() <CR>',
            { desc = '[G]o to LSP [d]efinition in new tab', buffer = args.buf })

        vim.keymap.set('n', '<leader>dj', function() vim.diagnostic.goto_next({ float = { border = 'rounded' } }) end,
            { desc = '[G]o to next diagnostic', buffer = args.buf })
        vim.keymap.set('n', '<leader>dk', function() vim.diagnostic.goto_prev({ float = { border = 'rounded' } }) end,
            { desc = '[G]o to previous diagnostic', buffer = args.buf })
    end
})
