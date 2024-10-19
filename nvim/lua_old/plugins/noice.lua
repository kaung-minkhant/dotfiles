require('noice').setup({
  cmdline = {
    enabled = true,
    view = "cmdline_popup", -- cmdline
    opts = {},
    format = {
    },
  },
  messages = {
    view_search = 'mini', -- virtualtext
  },
  routes = {
    {
      filter = {
        event = 'msg_show',
        any = {
          { find = '%d+L, %d+B' },
          { find = '; after #%d+' },
          { find = '; before #%d+' },
          { find = '%d fewer lines' },
          { find = '%d more lines' },
        },
      },
      opts = { skip = true },
    }
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  }
})
