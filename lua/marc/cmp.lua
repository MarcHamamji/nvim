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
    {
      name = "codeium",
      max_item_count = 1,
    },
    { name = 'git' },
    { name = 'nvim_lsp' },
    {
      name = 'luasnip',
      max_item_count = 1,
    },
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
        copilot = "[]",
        codeium = "[]",
        luasnip = '[✂]',
        nvim_lsp = '[]',
        path = '[]',
        buffer = '[]',
        spell = '[]',
      },
    },
  },
  experimental = {
    ghost_text = true,
  },
}

require('cmp_git').setup()
