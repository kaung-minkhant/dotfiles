-- TODO: add text objects
require('nvim-treesitter.configs').setup({
  ensure_installed = {
    'go', 'lua', 'python', 'rust', 'typescript', 'regex', 
    'bash', 'markdown', 'markdown_inline', 'sql', 
    'html', 'css', 'javascript', 'yaml', 'json', 'toml', 'nix'
  },

  highlight = { enable = true },
  indent = { enable = true },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<c-space>',
      node_incremental = '<c-space>',
      scope_incremental = false,
      node_decremental = false,
    },
  },
})
