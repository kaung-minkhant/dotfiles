-- common options
local opts = {
  noremap = true,
  silent = true,
}

local keyset = vim.keymap.set


-------------------
--- Normal Mode ---
-------------------

-- window movement
keyset('n', '<C-h>', '<C-w>h', opts)
keyset('n', '<C-j>', '<C-w>j', opts)
keyset('n', '<C-k>', '<C-w>k', opts)
keyset('n', '<C-l>', '<C-w>l', opts)

-- window resize
keyset('n', '<C-Up>', ':resize -2<CR>', opts)
keyset('n', '<C-Down>', ':resize +2<CR>', opts)
keyset('n', '<C-Left>', ':vertical resize -2<CR>', opts)
keyset('n', '<C-Right>', ':vertical resize +2<CR>', opts)

-- turnoff highlight
keyset('n', '<space><space>', "<cmd>set nohlsearch<CR>", opts)

-- quick close
keyset('n', "<leader>qq", ":q<CR>", opts)
-- quick save
keyset('n', "<C-s>", ":w<CR>", opts)

-------------------
--- Insert Mode ---
-------------------
keyset('i', 'jj', '<Esc>')


-------------------
--- Visual Mode ---
-------------------

keyset('v', '<', '<gv', opts)
keyset('v', '>', '>gv', opts)


-- no op
keyset({ 'n', 'v' }, '<Space>', '<Nop>', opts)
