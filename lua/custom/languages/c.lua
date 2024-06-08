local utils = require('custom.utils')

vim.api.nvim_create_autocmd({ 'BufEnter' }, {
    pattern = { '*.c', '*.h' },
    callback = function()
        utils.map('n', '<leader>c', function()
            local file = vim.fn.expand('%')
            local other_file = nil
            if string.match(file, '%.h') then
                other_file = string.gsub(file, '%.h', '.c')
            elseif string.match(file, '%.c') then
                other_file = string.gsub(file, '%.c', '.h')
            end
            print(other_file)
            if other_file and vim.fn.filereadable(other_file) == 1 then
                vim.cmd('e ' .. other_file)
            else
                print('No corresponding file found')
            end
        end, { desc = 'Switch [C] and header file', buffer = 0 })
    end
})
