vim.api.nvim_create_autocmd("TermOpen", {
    group = vim.api.nvim_create_augroup("custom-terminal-opts", { clear = true }),
    callback = function()
        vim.opt_local.nu = false
        vim.opt_local.rnu = false
        vim.opt_local.signcolumn = "no"
        vim.opt_local.scrolloff = 0

        vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal insert mode" })
    end
})

