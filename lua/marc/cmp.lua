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
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-Space>'] = cmp.mapping.complete {},
    ['<CR>'] = cmp.mapping.confirm { select = false },
    ['<C-j>'] = cmp.mapping(function(fallback)
      if luasnip.jumpable() then
        luasnip.jump(1)
      else
        fallback()
      end
    end),
    ['<C-k>'] = cmp.mapping(function(fallback)
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end),
  },
  sources = cmp.config.sources {
    { name = 'nvim_lsp' },
    {
      name = 'luasnip',
      max_item_count = 3,
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
    format = lspkind.cmp_format {
      mode = 'symbol_text',
      maxwidth = 50,
      menu = {
        luasnip = '[snip]',
        nvim_lsp = '[lsp]',
        path = '[path]',
        buffer = '[buf]',
        spell = '[spl]',
      },
    },
  },
  experimental = {
    ghost_text = true,
  },
}
