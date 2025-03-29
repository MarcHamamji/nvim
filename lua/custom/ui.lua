vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
      vim.highlight.on_yank({timeout = 50})
  end,
})


local signs = { Error = ' ', Warn = ' ', Hint = ' ', Info = ' ' }
for type, icon in pairs(signs) do
  local hl = 'DiagnosticSign' .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl })
end


vim.cmd([[
    aunmenu PopUp
    anoremenu PopUp.Undo                        u
    anoremenu PopUp.Redo                        <C-r>
    anoremenu PopUp.Save                        :w<CR>
    anoremenu PopUp.-1-                         <Nop>
    vnoremenu PopUp.Cut                         "+x
    vnoremenu PopUp.Copy                        "+y
    anoremenu PopUp.Paste                       "+gP
    vnoremenu PopUp.Paste                       "+P
    vnoremenu PopUp.Delete                      "_x
    nnoremenu PopUp.Select\ All                 ggVG
    vnoremenu PopUp.Select\ All                 gg0oG$
    inoremenu PopUp.Select\ All                 <C-Home><C-O>VG
    anoremenu PopUp.-2-                         <Nop>
    anoremenu PopUp.Hover                       :lua vim.lsp.buf.hover()<CR>
    anoremenu PopUp.Defintion                   :lua vim.lsp.buf.definition()<CR>
    anoremenu PopUp.Type\ Defintion             :lua vim.lsp.buf.type_definition()<CR>
    anoremenu PopUp.References                  :lua vim.lsp.buf.references()<CR>
    anoremenu PopUp.-3-                         <Nop>
    anoremenu PopUp.Quit                        :q<CR>
]])


vim.api.nvim_set_hl(0, 'SpellBad', {})
vim.api.nvim_set_hl(0, 'SpellCap', {})
vim.api.nvim_set_hl(0, 'SpellRare', {})
vim.api.nvim_set_hl(0, 'SpellLocal', {})


vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "help", "man" },
    command = "wincmd L",
})
