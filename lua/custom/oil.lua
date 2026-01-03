vim.pack.add {
    "https://github.com/nvim-tree/nvim-web-devicons",
    "https://github.com/stevearc/oil.nvim",
}

local oil = require("oil")

oil.setup {
    default_file_explorer = false,
    skip_confirm_for_simple_edits = true,
    delete_to_trash = true,
    float = {
        padding = 10,
        border = "rounded",
    },
    view_options = {
        show_hidden = true,
    }
}

vim.keymap.set("n", "<Space>o", oil.toggle_float, { desc = "Toggle [O]il" })

