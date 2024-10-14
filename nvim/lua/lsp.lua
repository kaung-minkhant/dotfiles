require('mason').setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})

require('mason-lspconfig').setup({
  ensure_installed = { 'pyright', 'lua_ls' },
})

local lspconfig = require('lspconfig')

local opts = { noremap = true, silent=true}
local keyset = vim.keymap.set

keyset('n', '<leader>e', vim.diagnostic.open_float, opts)
keyset('n', '[d', vim.diagnostic.goto_prev, opts)
keyset('n', ']d', vim.diagnostic.goto_next, opts)
keyset('n', '<leader>q', vim.diagnostic.setloclist, opts)

local on_attach = function (client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omifnc', 'v:lua.vim.lsp.omnifunc')

  local bufopts = { noremap = true, slent = true, buffr = bufnr }
  keyset('n', 'gD', vim.lsp.buf.declaration, bufopts)
  keyset('n', 'gd', vim.lsp.buf.definitio, bufopts)
  keyset('n', 'K', vim.lsp.buf.hover, bufopts)
  keyset('n', 'gi', vim.lsp.buf.implementation, bufopts)
  keyset('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  keyset('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  keyset('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  keyset('n', '<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  keyset('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
  keyset('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
  keyset('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
  keyset('n', 'gr', vim.lsp.buf.references, bufopts)
  keyset('n', '<leader>f', function()
    vim.lsp.buf.format({ async = true })
  end, bufopts)
end

lspconfig.pylsp.setup({
  on_attach = on_attach,
})
