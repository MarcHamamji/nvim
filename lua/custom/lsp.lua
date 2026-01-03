vim.pack.add {
    "https://github.com/neovim/nvim-lspconfig"
}

vim.lsp.enable {
    "lua_ls",
    "clangd",
    "clojure_lsp",
    "pyright",
    "ansiblels"
}

vim.lsp.config("ansiblels", {
    filetypes = { 'yaml' },
})

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, { desc = '[F]ormat buffer (LSP)', buffer = args.buf })

        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = '[R]e[n]ame', buffer = args.buf })

        vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action, { desc = 'Code [a]ction', buffer = args.buf })
        vim.keymap.set('v', '<leader>a', vim.lsp.buf.code_action, { desc = 'Code [a]ction', buffer = args.buf })

        vim.keymap.set('n', '<leader>dd', vim.diagnostic.open_float,
            { desc = 'Open floating [d]iagnostics', buffer = args.buf })

        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = '[G]o to LSP [d]efinition', buffer = args.buf })
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, { desc = '[G]o to LSP [r]eferences', buffer = args.buf })
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { desc = '[G]o to LSP [i]mplementation', buffer = args.buf })

        vim.keymap.set('n', '<leader>dj', function() vim.diagnostic.goto_next({ float = { border = 'rounded' } }) end,
            { desc = '[G]o to next diagnostic', buffer = args.buf })
        vim.keymap.set('n', '<leader>dk', function() vim.diagnostic.goto_prev({ float = { border = 'rounded' } }) end,
            { desc = '[G]o to previous diagnostic', buffer = args.buf })
    end
})
