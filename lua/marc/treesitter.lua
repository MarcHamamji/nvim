require('nvim-treesitter.configs').setup {
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<c-space>',
      node_incremental = '<c-space>',
      node_decremental = '<c-H>',
    },
  },
  playground = {
    enable = true,
  },
}
