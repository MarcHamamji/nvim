return {
    'zbirenbaum/copilot-cmp',
    dependencies = {
        {
            'zbirenbaum/copilot.lua',
            config = function()
                require('copilot').setup {
                    suggestion = { enabled = false },
                    panel = { enabled = false },
                }
            end,
        },

    },
    cmd = 'Copilot',
    config = function()
        require('copilot_cmp').setup()
    end,
}
