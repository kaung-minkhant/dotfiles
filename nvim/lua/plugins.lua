local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- sessions
  "tpope/vim-obsession", 

  -- auto-save
  "pocco81/auto-save.nvim",
  
  -- colorschemes
  "tanvirtin/monokai.nvim",

  -- status line and ui
  'nvim-lualine/lualine.nvim',
  "folke/noice.nvim",

  -- debugger
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"}
  },
  'theHamsta/nvim-dap-virtual-text',
  'leoluz/nvim-dap-go',

  -- git
  'lewis6991/gitsigns.nvim',

  -- Fuzzy finders
  'nvim-telescope/telescope-symbols.nvim',
  { 
    'nvim-telescope/telescope.nvim', 
    branch = '0.1.x', 
    dependencies = { 
      'nvim-lua/plenary.nvim'
    },
  },

  -- lsp
  {
    "onsails/lspkind.nvim",
    event = { "VimEnter" },
  },

  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",

  -- completions
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "lspkind.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
    },
    config = function()
      require("plugins.nvim-cmp")
    end,
  },

  -- snippets
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
  },
})
