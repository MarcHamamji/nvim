local ls = require('luasnip')

ls.config.set_config {
  history = true,
  updateevents = 'TextChanged,TextChangedI',
}

require('luasnip.loaders.from_vscode').lazy_load()
