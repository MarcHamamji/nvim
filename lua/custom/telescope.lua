vim.pack.add {
    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/nvim-tree/nvim-web-devicons",
    "https://github.com/nvim-telescope/telescope.nvim",
    "https://github.com/nvim-telescope/telescope-ui-select.nvim"
}

local telescope = require("telescope")
local builtins = require("telescope.builtin")
local themes = require("telescope.themes")

telescope.setup {
    extensions = {
        ["ui-select"] = {
            require("telescope.themes").get_dropdown {
                width = 0.7,
                height = 25,
                previewer = false,
            }
        }
    },
    pickers = {
        colorscheme = {
            enable_preview = true
        }
    }
}

require("telescope").load_extension("ui-select")

vim.keymap.set('n', '<leader>p', function()
    if not pcall(function()
            builtins.git_files {
                recurse_submodules = true,
            }
        end) then
        builtins.find_files()
    end
end, { desc = 'Search git files / files' })

vim.keymap.set("n", "<leader>,", function()
    builtins.find_files {
        cwd = vim.fn.stdpath("config")
    }
end, { desc = "Search config files" })

vim.keymap.set("n", "<leader>st", builtins.builtin, { desc = "[S]earch [t]elescope builtins" })
vim.keymap.set("n", "<leader>sh", builtins.help_tags, { desc = "[S]earch [h]elp tags" })
vim.keymap.set('n', '<leader>sm', builtins.man_pages, { desc = '[S]earch [m]an pages' })
vim.keymap.set('n', '<leader>sk', builtins.keymaps, { desc = '[S]earch [k]eymaps' })
vim.keymap.set('n', '<leader>so', builtins.oldfiles, { desc = '[S]earch [o]ld files' })
vim.keymap.set('n', '<leader>sq', builtins.quickfix, { desc = '[S]earch [q]uickfix list' })
vim.keymap.set('n', '<leader>sr', builtins.resume, { desc = '[S]earch [r]esume' })

vim.keymap.set("n", "<leader>sg", builtins.live_grep, { desc = "[S]earch [g]rep" })
vim.keymap.set('v', '<leader>sg', builtins.grep_string, { desc = '[S]earch [g]rep' })

vim.keymap.set("n", "<leader>sb", builtins.current_buffer_fuzzy_find, { desc = "[S]earch current [b]uffer" })
vim.keymap.set("n", "<leader>b", function()
    builtins.current_buffer_fuzzy_find(themes.get_dropdown({ previewer = false }))
end, { desc = "Search current [b]uffer" })

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        vim.keymap.set('n', '<leader>sd', builtins.diagnostics, { desc = '[S]earch [d]iagnostics', buffer = args.buf })
        vim.keymap.set('n', '<leader>ss', builtins.lsp_document_symbols,
            { desc = '[S]earch document [s]ymbols', buffer = args.buf })
        vim.keymap.set('n', '<leader>sw', builtins.lsp_dynamic_workspace_symbols,
            { desc = '[S]earch [w]orkspace symbols', buffer = args.buf })
    end
})
