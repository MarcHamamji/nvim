local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local mason = require('mason')
local mason_lsp = require('mason-lspconfig')

mason.setup()
mason_lsp.setup()

mason_lsp.setup_handlers {
	function (server_name)
		lspconfig[server_name].setup {}
	end,
	sumneko_lua = function ()
		lspconfig.sumneko_lua.setup {
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
  cssls = function ()
    local c = vim.lsp.protocol.make_client_capabilities()
    lspconfig.cssls.setup {
      capabilities = capabilities
    }
  end
}

