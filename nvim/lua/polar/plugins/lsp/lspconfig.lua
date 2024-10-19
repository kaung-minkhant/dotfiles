return {
  'neovim/nvim-lspconfig',
  event = { 'bufReadPre', 'BufNewFile' },
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    { 'antosha417/nvim-lsp-file-operations', config = true },
    { 'folke/neodev.nvim', ops = {} },
  },
  config = function()
    local lspconfig = require('lspconfig')
    local mason_lspconfig = require("mason-lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(env)
        local opts = { buffer = env.buf, silent = true }

        local keyset = function(mode, l, r, additionalOpts)
          local opt = opts
          for k, v in pairs(additionalOpts) do
            opt[k] = v
          end
          vim.keymap.set(mode, l, r, opt)
        end

        keyset('n', 'gR', '<cmd>Telescope lsp_references<CR>', { desc = "Show LSP references" })
        keyset('n', 'gD', vim.lsp.buf.declaration, { desc = "Go to declaration" })
        keyset('n', 'gd', '<cmd>Telescope lsp_definitions<CR>', { desc = "Show LSP definitions" })
        keyset('n', 'gi', '<cmd>Telescope lsp_implementations<CR>', { desc = "Go to implementations" })
        keyset('n', 'gt', '<cmd>Telescope lsp_type_definitions<CR>', { desc = "Show LSP type definitions" })

        keyset({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, { desc = "See available code acitons" })
        keyset('n', '<leader>rn', vim.lsp.buf.rename, { desc = "Smart rename" })
        keyset('n', '<leader>D', '<cmd>Telescope diagnostics bufnr=0<CR>', { desc = "Show buffer diagnostics" })
        keyset('n', '<leader>d', vim.diagnostic.open_float, { desc = "Show line diagnostics" })
        keyset('n', '[d', vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
        keyset('n', ']d', vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })
        keyset('n', 'K', vim.lsp.buf.hover, { desc = "Show documentation for what is under cursor" })
        keyset('n', '<leader>rs', ":LspRestart<CR>", { desc = "Restart LSP" })

      end,
    })

    local capabilities = cmp_nvim_lsp.default_capabilities()

    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }

    for type, icon in pairs(signs) do
      local hl = "DiagnoticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    mason_lspconfig.setup_handlers({
      function(server_name)
        lspconfig[server_name].setup({
          capabilities = capabilities,
        })
      end,
      ["emmet_ls"] = function()
        -- configure emmet language server
        lspconfig["emmet_ls"].setup({
          capabilities = capabilities,
          filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
        })
      end,
      ["lua_ls"] = function()
        -- configure lua server (with special settings)
        lspconfig["lua_ls"].setup({
          capabilities = capabilities,
          settings = {
            Lua = {
              -- make the language server recognize "vim" global
              diagnostics = {
                globals = { "vim" },
              },
              completion = {
                callSnippet = "Replace",
              },
            },
          },
        })
      end,
    })
  end,
}
