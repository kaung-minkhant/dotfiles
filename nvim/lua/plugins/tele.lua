-- TODO: integrate git tree module


require('telescope').setup({
  defaults = {
    layout_strategy = "horizontal",
    layout_config = {
      preview_width = 0.65,
      width = 0.99,
      height = 0.99,
    },
    pickers = {
      theme = "dropdown",
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

-- TODO: integrate fzf module
--
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
