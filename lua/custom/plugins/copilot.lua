return {
    'zbirenbaum/copilot-cmp',
    dependencies = {
        {
            'zbirenbaum/copilot.lua',
            init = function()
                require('copilot').setup {
                    suggestion = { enabled = false },
                    panel = { enabled = false },
                }
            end,
        },

    },
    init = function()
        require('copilot_cmp').setup()
    end,


}
