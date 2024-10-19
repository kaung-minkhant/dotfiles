require('mason').setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})

local servers  = { 'pyright', 'lua_ls', 'gopls' }

require('mason-lspconfig').setup({
  ensure_installed = servers,
})

local lspconfig = require('lspconfig')

local opts = { noremap = true, silent=true}
local keyset = vim.keymap.set

-- diagnostic keymaps

keyset('n', '<leader>e', vim.diagnostic.open_float, opts)
keyset('n', '[d', vim.diagnostic.goto_prev, opts)
keyset('n', ']d', vim.diagnostic.goto_next, opts)
keyset('n', '<leader>q', vim.diagnostic.setloclist, opts)

local on_attach = function (client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omifnc', 'v:lua.vim.lsp.omnifunc')

  local bufopts = { noremap = true, slent = true, buffr = bufnr }
  keyset('n', 'gD', vim.lsp.buf.declaration, bufopts)
  keyset('n', 'gd', vim.lsp.buf.definition, bufopts)
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
  keyset('n', 'gr', require('telescope.builtin').lsp_references, bufopts)
  keyset('n', '<leader>f', function()
    vim.lsp.buf.format({ async = true })
  end, bufopts)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })
end

require('fidget').setup()

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

lspconfig.lua_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file('', true),
        checkThirdParty = false,
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = { enable = false },
    },
  },
}
