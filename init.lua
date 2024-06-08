vim.g.mapleader = ' '

function P(...)
    print(vim.inspect(...))
end

require('custom.opts')
require('custom.mappings')
require('custom.ui')

require('custom.lazy')

require('custom.languages')
