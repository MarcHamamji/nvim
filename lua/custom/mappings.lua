vim.keymap.set("n", "<Esc>", ":nohl<CR>", { desc = "Clear search" })

vim.keymap.set("n", "<C-j>", ":cnext<CR>", { desc = "Go to next quickfix item" })
vim.keymap.set("n", "<C-k>", ":cprev<CR>", { desc = "Go to previous quickfix item" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

vim.keymap.set("n", "<C-j>", ":cnext<CR>", { desc = "Next quickfix item" })
vim.keymap.set("n", "<C-k>", ":cprevious<CR>", { desc = "Previous quickfix item" })

vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("i", "<C-Space>", "<C-x><C-o>")

vim.keymap.set("n", "<leader>t", function()
    vim.cmd[[vsplit]]
    vim.cmd[[term]]
end)
