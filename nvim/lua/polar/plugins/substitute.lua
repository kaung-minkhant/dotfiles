return {
  'gbprod/substitute.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local substitute = require("substitute")
    substitute.setup({
      on_substitute = nil,
      yank_substituted_text = false,
      preserve_cursor_position = false,
      modifiers = nil,
      highlight_substituted_text = {
        enabled = true,
        timer = 500,
      },
      range = {
        prefix = "s",
        prompt_current_text = false,
        confirm = false,
        complete_word = false,
        subject = nil,
        range = nil,
        suffix = "",
        auto_apply = false,
        cursor_position = "end",
      },
      exchange = {
        motion = false,
        use_esc_to_cancel = true,
        preserve_cursor_position = false,
      },
    })

    local keymap = vim.keymap

    keymap.set('n', 's', substitute.operator, { desc = "Substitute with motion" })
    keymap.set('n', 'ss', substitute.line, { desc = "Substitute line" })
    keymap.set('n', 'S', substitute.eol, { desc = "Substitute to end of line" })
    keymap.set('x', 's', substitute.eol, { desc = "Substitute in visual mode" })
  end,
}
