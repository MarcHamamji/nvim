vim.cmd [[ colorscheme retrobox ]]

vim.cmd [[ hi! link Pmenu Normal ]]
vim.cmd [[ hi! link PmenuKind Pmenu ]]
vim.cmd [[ hi! link PmenuExtra Pmenu ]]

vim.cmd [[ hi! link TreesitterContext CursorLine ]]

vim.cmd [[ hi! link NeogitDiffAdd DiffAdd ]]
vim.cmd [[ hi! link NeogitDiffAddHighlight DiffAdd ]]
vim.cmd [[ hi! link NeogitDiffDelete DiffDelete ]]
vim.cmd [[ hi! link NeogitDiffDeleteHighlight DiffDelete ]]

vim.cmd [[ hi! Title gui=bold guifg=Orange ]]

vim.cmd [[ hi Search    guibg=#5a7a5a ctermbg=65 ]]
vim.cmd [[ hi IncSearch guibg=#8f6330 ctermbg=130 ]]

vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank({ timeout = 50 })
    end,
})

vim.diagnostic.config {
    virtual_text = true
}

vim.pack.add { {
    src = "https://github.com/saghen/blink.cmp",
} }

require("blink.cmp").setup {
    signature = {
        enabled = true
    },
    fuzzy = {
        prebuilt_binaries = {
            force_version = 'v1.9.1'
        }
    },
    completion = {
        list = {
            selection = {
                preselect = false,
                auto_insert = true
            }
        },
        menu = {
            draw = {
                treesitter = { 'lsp' }
            }
        },
        documentation = {
            auto_show = true,
            auto_show_delay_ms = 0,
        }
    }
}

