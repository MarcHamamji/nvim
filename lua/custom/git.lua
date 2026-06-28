vim.pack.add {
    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/sindrets/diffview.nvim",
    "https://github.com/nvim-telescope/telescope.nvim",
    "https://github.com/NeogitOrg/neogit"
}

local neogit = require("neogit")

neogit.setup {}

vim.keymap.set("n", "<leader>n", function()
    neogit.open({ kind = "vsplit" })
end, { desc = "Open [N]eogit" })

vim.pack.add {
    "https://github.com/lewis6991/gitsigns.nvim"
}

local gitsigns = require("gitsigns")

gitsigns.setup {
    signcolumn = true,
    current_line_blame = true,
}

vim.keymap.set('n', 'gh', function()
    gitsigns.preview_hunk()
end, { desc = '[G]it [h]unk' })

vim.keymap.set('n', 'gb', function()
    gitsigns.blame_line()
end, { desc = '[G]it [b]lame' })

vim.keymap.set('n', 'gj', function()
    gitsigns.next_hunk()
end, { desc = '[G]it next hunk' })

vim.keymap.set('n', 'gk', function()
    gitsigns.prev_hunk()
end, { desc = '[G]it previous hunk' })
