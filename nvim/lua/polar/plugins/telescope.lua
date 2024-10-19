return {
  'nvim-telescope/telescope.nvim',
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    'folke/todo-comments.nvim',
  },
  config = function()
    local telescope = require('telescope')
    local actions = require('telescope.actions')

    telescope.setup({
      defaults = {
        path_display = { "smart" },
        mappings = {
          i = {
            ['<C-u>'] = false,
            ['<C-d>'] = false,
            ['<C-j>'] = actions.preview_scrolling_down,
            ['<C-k>'] = actions.preview_scrolling_up,
            ['<C-n>'] = actions.move_selection_next,
            ['<C-p>'] = actions.move_selection_previous,
            ['<C-q>'] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
      },
    })

    local keymap = vim.keymap

    keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { desc = "Fuzzy find files in cwd" })
    keymap.set('n', '<leader>fr', '<cmd>Telescope oldfiles<cr>', { desc = "Fuzzy find files recent files" })
    keymap.set('n', '<leader>fs', '<cmd>Telescope live_grep<cr>', { desc = "Find string in cwd" })
    keymap.set('n', '<leader>fc', '<cmd>Telescope grep_string<cr>', { desc = "Find string under cursor in cwd" })
    keymap.set('n', '<leader>ft', '<cmd>TodoTelescope<cr>', { desc = "Find todos" })
  end,
}
