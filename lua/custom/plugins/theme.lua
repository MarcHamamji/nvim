return {
    {
        'folke/tokyonight.nvim',
        config = function()
            vim.cmd.colorscheme('tokyonight')
        end,
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = {
            'kyazdani42/nvim-web-devicons',
        },
        config = function()
            local separators = {
                -- section = {
                --   left = '',
                --   right = '',
                -- },
                section = {
                  left = '🭀',
                  right = '🭋',
                },
                -- section = {
                --     left = '',
                --     right = '',
                -- },
                component = {
                    left = '',
                    right = '',
                },
            }

            require('lualine').setup {
                options = {
                    icons_enabled = true,
                    theme = 'auto',
                    section_separators = { left = separators.section.left, right = separators.section.right },
                    component_separators = { left = separators.component.left, right = separators.component.right },
                    disabled_filetypes = {
                        statusline = {},
                        winbar = {},
                    },
                    ignore_focus = {},
                    always_divide_middle = false,
                    globalstatus = false,
                    refresh = {
                        statusline = 1000,
                        tabline = 1000,
                        winbar = 1000,
                    },
                },
                sections = {
                    lualine_a = { 'mode' },
                    lualine_b = { 'branch', 'diagnostics' },
                    lualine_c = { '%f' },
                    lualine_x = { 'filetype' },
                    lualine_y = { 'progress' },
                    lualine_z = { 'location' },
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = { 'filename' },
                    lualine_x = { 'filetype' },
                    lualine_y = {},
                    lualine_z = {},
                },
                tabline = {
                    lualine_a = {
                        {
                            'tabs',
                            mode = 1,
                            max_length = vim.o.columns,
                            use_mode_colors = true,
                            tabs_color = {
                                active = 'lualine_a_normal',
                                inactive = 'BufTabLineHidden',
                            },
                        },
                    },
                    lualine_b = { '' },
                    lualine_c = { '' },
                    lualine_x = { '' },
                    lualine_y = { '' },
                    lualine_z = { '' },
                },
                winbar = {},
                inactive_winbar = {},
                extensions = {},
            }
        end
    },
}
