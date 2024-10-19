return {
	"natecraddock/sessions.nvim",
	config = function()
		local session = require("sessions")

		session.setup({
			events = { "VimLeavePre" },
			absolute = true,
			session_filepath = vim.fn.stdpath("data") .. "/sessions",
		})

		vim.keymap.set("n", "<leader>ws", "<cmd>SessionsSave<CR>")
		vim.keymap.set("n", "<leader>wr", "<cmd>SessionsLoad<CR>")
	end,
}
