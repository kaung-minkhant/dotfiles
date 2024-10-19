-- TODO: integrate git tree module
-- TODO: integrate with harpoon

require('telescope').setup({
  defaults = {
    layout_strategy = "horizontal",
    layout_config = {
      scroll_speed = 2,
      horizontal = {
        preview_width = 0.65,
        width = 0.99,
        height = 0.99,
      },
    },
    pickers = {
      find_files = {
        theme = "dropdown",
      },
    },
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
        ["<C-j>"] = require('telescope.actions').preview_scrolling_down,
        ["<C-k>"] = require('telescope.actions').preview_scrolling_up,
        ["<C-q>"] = require('telescope.actions').close,
      },
    },
  },
})

-- fzf
pcall(require('telescope').load_extension, 'fzf')


-- custom dropdown
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader>/', function()
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({
    winblend = 10,
    previewer = true,
  }))
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sb', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })


vim.api.nvim_set_keymap('n', "<leader><tab>", "<Cmd>lua require('telescope.builtin').commands()<CR>", { noremap = false })
