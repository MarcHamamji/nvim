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
    anoremenu PopUp.Type\ Defintion              :lua vim.lsp.buf.type_definition()<CR>
    anoremenu PopUp.References                  :lua vim.lsp.buf.references()<CR>
]])
