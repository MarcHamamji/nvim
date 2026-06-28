vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.shiftround = true
vim.opt.expandtab = true
vim.opt.signcolumn = "yes"
vim.opt.foldcolumn = "auto"
vim.opt.inccommand = "split"
vim.opt.termguicolors = true

vim.opt.splitright = true
vim.opt.winborder = "rounded"

vim.opt.gdefault = true
vim.opt.showmode = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.nu = true
vim.opt.rnu = true
vim.opt.cursorline = true
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.wrap = false
vim.opt.breakindent = true
vim.opt.linebreak = true

vim.opt.clipboard = "unnamedplus"

vim.opt.undofile = true

vim.opt.completeopt = { "menu", "menuone", "noselect", "noinsert", "fuzzy", "popup" }

vim.opt.spell = false
vim.opt.spelllang = { "en_us" }

vim.opt.mousescroll = "ver:1,hor:2"

vim.g.BASH_Ctrl_j = false

vim.cmd [[ colorscheme sorbet ]]
vim.cmd [[ hi! link Pmenu Normal ]]
vim.cmd [[ hi! link PmenuKind Pmenu ]]
