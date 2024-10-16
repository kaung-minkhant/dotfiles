vim.g.mapleader = " "
vim.g.maplocalleader = ' '

vim.opt.clipboard = 'unnamedplus'
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}
vim.opt.mouse = 'a'

-- Tabs
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- UI config
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = false
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.showmode = true
vim.opt.breakindent = true
vim.opt.signcolumn = "yes"
-- vim.cmd.colorscheme "catppuccin"

-- Searching
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Key Timeout
vim.opt.timeoutlen = 500

-- functionalities
vim.opt.undofile = true
