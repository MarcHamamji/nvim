return {
    'hrsh7th/nvim-cmp',
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'f3fora/cmp-spell',
        'saadparwaiz1/cmp_luasnip',
        {
            'petertriho/cmp-git',
            dependencies = {
                'nvim-lua/plenary.nvim',
            },
        },
        {
            'folke/lazydev.nvim',
            opts = {
                debug = false,
                library = {
                    "nvim-cmp/lua/cmp/types",
                },
            },
        },

        'onsails/lspkind.nvim',
    },
    config = function()
        local cmp = require('cmp')
        local lspkind = require('lspkind')
        local luasnip = require('luasnip')

        cmp.setup {
            preselect = cmp.PreselectMode.None,
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            mapping = cmp.mapping.preset.insert {
                ['<C-Space>'] = cmp.mapping.complete {},
                ['<CR>'] = cmp.mapping.confirm { select = false },
                ['<C-J>'] = cmp.mapping(function(fallback)
                    if luasnip.jumpable() then
                        luasnip.jump(1)
                    else
                        fallback()
                    end
                end),
                ['<C-K>'] = cmp.mapping(function(fallback)
                    if luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end),
            },
            sources = cmp.config.sources {
                {
                    name = "copilot",
                    max_item_count = 1,
                },
                { name = 'nvim_lsp' },
                {
                    name = 'luasnip',
                    max_item_count = 1,
                },
                { name = 'lazydev' },
                {
                    name = 'path',
                    max_item_count = 3,
                    keyword_length = 3,
                },
                { name = 'buffer' },
                {
                    name = 'spell',
                    max_item_count = 1,
                    keyword_length = 3,
                },
            },
            formatting = {
                fields = { 'abbr', 'kind', 'menu' },
                expandable_indicator = false,
                format = lspkind.cmp_format {
                    mode = 'symbol_text',
                    maxwidth = 50,
                    menu = {
                        copilot = '[]',
                        luasnip = '[✂]',
                        nvim_lsp = '[]',
                        lazydev = '[]',
                        path = '[/]',
                        buffer = '[¶]',
                        spell = '[]',
                    },
                },
            },
            -- experimental = {
            --     ghost_text = true,
            -- },
        }
    end,
}
