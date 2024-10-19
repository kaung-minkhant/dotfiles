vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

opt.clipboard = 'unnamedplus'
opt.completeopt = {'menu', 'menuone', 'noselect'}
opt.mouse = 'a'

-- mouse
opt.mousemoveevent = true

-- Tabs
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

opt.wrap = false

-- UI config
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.splitbelow = true
opt.splitright = true
opt.showmode = true
opt.breakindent = true
opt.signcolumn = "yes"
opt.termguicolors = true
opt.background = "dark"
opt.scrolloff = 5
-- vim.cmd.colorscheme "catppuccin"

-- Searching
opt.incsearch = true
opt.hlsearch = true
opt.ignorecase = true
opt.smartcase = true

-- functionalities
opt.undofile = true
