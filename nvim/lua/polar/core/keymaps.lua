vim.g.mapleader = " "
vim.g.maplocalleader = ' '

local opts = {
  noremap = true,
  silent = true,
}

local keyset = function(mode, l, r, additionalOpts)
  local opt = opts
  for k, v in pairs(additionalOpts) do
    opt[k] = v
  end
  vim.keymap.set(mode, l, r, opt)
end

-------------------
--- Normal Mode ---
-------------------

-- window movement
keyset('n', '<C-h>', '<C-w>h', { desc = 'Go to left split' })
keyset('n', '<C-j>', '<C-w>j', { desc = 'Go to bottom split' })
keyset('n', '<C-k>', '<C-w>k', { desc = 'Go to top split' })
keyset('n', '<C-l>', '<C-w>l', { desc = 'Go to right split' })

-- window spliting
keyset('n', '<leader>js', "<C-w>s", { desc = "Split window horizontally" }) 
keyset('n', '<leader>jv', "<C-w>v", { desc = "Split window vertically" })
keyset('n', '<leader>je', "<C-w>=", { desc = "Make splits equal size" }) 
keyset('n', '<leader>jx', "<cmd>close<CR>", { desc = "Close current split" }) 

-- window resiz
keyset('n', '<C-Up>', ':resize -2<CR>', { desc = "Resize splits" })
keyset('n', '<C-Down>', ':resize +2<CR>', { desc = "Resize splits" })
keyset('n', '<C-Left>', ':vertical resize -2<CR>', { desc = "Resize splits" })
keyset('n', '<C-Right>', ':vertical resize +2<CR>', { desc = "Resize splits" })

-- turnoff highlight
keyset('n', '<leader>nh', "<cmd>set nohlsearch<CR>", { desc = "Clear search highlights" })

-- numbers
keyset('n', "<leader>+", "<C-a>", { desc = "Increment number" })
keyset('n', "<leader>-", "<C-x>", { desc = "Increment number" })


-- tab management
keyset('n', '<leader>to', '<cmd>tabnew<CR>', { desc = "Open new tab" })
keyset('n', '<leader>tx', '<cmd>tabclose<CR>', { desc = "Close current tab" })
keyset('n', '<leader>tn', '<cmd>tabn<CR>', { desc = "Go to next tab" })
keyset('n', '<leader>tp', '<cmd>tabp<CR>', { desc = "Go to previous tab" })
keyset('n', '<leader>tf', '<cmd>tabnew %<CR>', { desc = "Open current buffer in new tab" })


-- quick close
-- keyset('n', "<leader>qq", ":q<CR>", opts)
-- quick save
-- keyset('n', "<C-s>", ":w<CR>", opts)

-------------------
--- Insert Mode ---
-------------------
keyset('i', 'jj', '<Esc>', { desc = "Exit insert mode with jj" })


-------------------
--- Visual Mode ---
-------------------

keyset('v', '<', '<gv', {})
keyset('v', '>', '>gv', {})


-- no op
keyset({ 'n', 'v' }, '<Space>', '<Nop>', {})

