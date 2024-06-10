vim.g.mapleader = ' '

function P(...)
    print(vim.inspect(...))
end

require('custom.opts')

require('custom.lazy')

require('custom.mappings')
require('custom.ui')
require('custom.languages')
