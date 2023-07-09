local lspconfig = require('lspconfig')
local root_pattern = require('lspconfig.util').root_pattern
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local mason = require('mason')
local mason_lsp = require('mason-lspconfig')

mason.setup()
mason_lsp.setup()

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    local function toSnakeCase(str)
      return string.gsub(str, '%s*[- ]%s*', '_')
    end

    if client.name == 'omnisharp' then
      local tokenModifiers = client.server_capabilities.semanticTokensProvider.legend.tokenModifiers
      for i, v in ipairs(tokenModifiers) do
        tokenModifiers[i] = toSnakeCase(v)
      end
      local tokenTypes = client.server_capabilities.semanticTokensProvider.legend.tokenTypes
      for i, v in ipairs(tokenTypes) do
        tokenTypes[i] = toSnakeCase(v)
      end
    end
  end,
})

mason_lsp.setup_handlers {
  function(server_name)
    lspconfig[server_name].setup {}
  end,
  omnisharp_mono = function()
    lspconfig.omnisharp.setup {
      use_modern_net = false,
      cmd = { '/home/marc/.local/share/nvim/mason/bin/omnisharp-mono' },
    }
  end,
  lua_ls = function()
    lspconfig.lua_ls.setup {
      settings = {
        Lua = {
          runtime = {
            version = 'LuaJIT',
          },
          diagnostics = {
            globals = { 'vim' },
          },
        },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file('', true),
      },
      capabilities = capabilities,
    }
  end,
  volar = function()
    lspconfig.volar.setup {
      -- filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' },
    }
  end,
  cssls = function()
    lspconfig.cssls.setup {
      capabilities = capabilities,
    }
  end,
  tsserver = function()
    lspconfig.tsserver.setup {
      filetypes = { 'javascript', 'typescript', 'javascriptreact', 'typescriptreact' },
    }
  end,
  denols = function()
    lspconfig.denols.setup {
      root_dir = root_pattern('deno.json', 'deno.jsonc'),
    }
  end,
}
