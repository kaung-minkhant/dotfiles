require('lualine').setup({
  options = {
    icons_enable = true,
    component_seperators = '|',
    section_seperators = '',
  }, 
  sections = {
    lualine_a = {
      {
        'buffers',
      },
      {
        'mode'
      },
    },
    lualine_c = {},
    lualine_x = {
--      {
--        require('noice').api.statusline.mode.get,
--        cond = require('noice').api.statusline.mode.has,
--        color = { fg = "#ff9e64" },
--      },
      {
        require('noice').api.statusline.command.get,
        cond = require('noice').api.statusline.command.has,
        color = { fg = "#ff9e64" },
      },
    },
  },
})
