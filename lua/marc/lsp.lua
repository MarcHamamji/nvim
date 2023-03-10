local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local mason = require('mason')
local mason_lsp = require('mason-lspconfig')
local navic = require('nvim-navic')

local on_attach = function(client, bufnr)
  if client.server_capabilities.documentSymbolProvider then
    navic.attach(client, bufnr)
  end
end

mason.setup()
mason_lsp.setup()

mason_lsp.setup_handlers {
  function(server_name)
    lspconfig[server_name].setup {
      on_attach = on_attach
    }
  end,
  lua_ls = function()
    lspconfig.lua_ls.setup {
      settings = {
        Lua = {
          runtime = {
            version = 'LuaJIT'
          },
          diagnostics = {
            globals = { 'vim' }
          }
        }
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file('', true),
      },
      capabilities = capabilities
    }
  end,
  cssls = function()
    lspconfig.cssls.setup {
      capabilities = capabilities
    }
  end
}
