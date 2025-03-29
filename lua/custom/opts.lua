vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.shiftround = true
vim.opt.expandtab = true
vim.opt.signcolumn = 'yes'
vim.opt.foldcolumn = 'auto'
vim.opt.inccommand = 'split'
vim.opt.termguicolors = true

vim.opt.splitright = true
vim.o.winborder = 'rounded'

vim.opt.gdefault = true
vim.opt.showmode = false
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.nu = true
vim.opt.rnu = true
vim.opt.cursorline = true
vim.opt.scrolloff = 8
vim.opt.wrap = false
vim.opt.breakindent = true

vim.opt.clipboard = 'unnamedplus'

vim.opt.undofile = true

vim.opt.spell = false
vim.opt.spelllang = { 'en_us' }

vim.g.BASH_Ctrl_j = false

vim.api.nvim_create_autocmd('TermOpen', {
    group = vim.api.nvim_create_augroup('custom-terminal-opts', { clear = true }),
    callback = function()
        vim.opt_local.nu = false
        vim.opt_local.rnu = false
        vim.opt.signcolumn = 'no'
    end
})
